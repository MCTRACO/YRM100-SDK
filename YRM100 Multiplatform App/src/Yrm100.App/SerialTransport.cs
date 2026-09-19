#if ANDROID
using Android.Content;
using Android.Hardware.Usb;
using Android.OS;
using System.Threading;
#endif

namespace Yrm100.App;

/// <summary>Parity options understood by the cross-platform serial boundary.</summary>
public enum SerialParity { None, Odd, Even }

/// <summary>Stop-bit options understood by the cross-platform serial boundary.</summary>
public enum SerialStopBits { One, Two }

/// <summary>Serial connection settings shared by CH340 and CP210x USB-UART adapters.</summary>
public sealed record SerialSettings(int BaudRate = 115200, int DataBits = 8,
    SerialParity Parity = SerialParity.None, SerialStopBits StopBits = SerialStopBits.One);

/// <summary>Platform-neutral serial transport contract used by the reader UI.</summary>
public interface ISerialTransport : IDisposable
{
    bool IsOpen { get; }
    event EventHandler<byte[]>? DataReceived;
    IReadOnlyList<string> ListPorts();
    void Open(string portName, SerialSettings? settings = null);
    void Send(ReadOnlySpan<byte> data);
    void Close();
}

#if !ANDROID
/// <summary>Desktop transport for macOS, Windows, and Linux USB-UART adapters.</summary>
public sealed class DesktopSerialTransport : ISerialTransport
{
    private System.IO.Ports.SerialPort? serialPort;

    public bool IsOpen => serialPort?.IsOpen == true;
    public event EventHandler<byte[]>? DataReceived;

    public IReadOnlyList<string> ListPorts() => SerialPortCatalog.GetPorts();

    public void Open(string portName, SerialSettings? settings = null)
    {
        Close();
        settings ??= new SerialSettings();
        serialPort = new System.IO.Ports.SerialPort(portName, settings.BaudRate,
            settings.Parity switch
            {
                SerialParity.Odd => System.IO.Ports.Parity.Odd,
                SerialParity.Even => System.IO.Ports.Parity.Even,
                _ => System.IO.Ports.Parity.None
            }, settings.DataBits,
            settings.StopBits == SerialStopBits.Two ? System.IO.Ports.StopBits.Two : System.IO.Ports.StopBits.One)
        {
            Handshake = System.IO.Ports.Handshake.None,
            ReadTimeout = 500,
            WriteTimeout = 500
        };
        serialPort.DataReceived += OnDataReceived;
        serialPort.Open();
    }

    public void Send(ReadOnlySpan<byte> data)
    {
        if (!IsOpen) throw new InvalidOperationException("The serial transport is not open.");
        serialPort!.Write(data.ToArray(), 0, data.Length);
    }

    public void Close()
    {
        if (serialPort is null) return;
        serialPort.DataReceived -= OnDataReceived;
        serialPort.Close();
        serialPort.Dispose();
        serialPort = null;
    }

    public void Dispose() => Close();

    private void OnDataReceived(object? sender, System.IO.Ports.SerialDataReceivedEventArgs e)
    {
        if (serialPort is not { IsOpen: true }) return;
        var available = serialPort.BytesToRead;
        if (available == 0) return;
        var data = new byte[available];
        serialPort.Read(data, 0, data.Length);
        DataReceived?.Invoke(this, data);
    }
}

/// <summary>Recognizes common CH340 and CP210x device names and puts them first.</summary>
public static class SerialPortCatalog
{
    public static IReadOnlyList<string> GetPorts() =>
        System.IO.Ports.SerialPort.GetPortNames()
            .OrderByDescending(IsLikelyUsbUart)
            .ThenBy(name => name, StringComparer.OrdinalIgnoreCase)
            .ToArray();

    private static bool IsLikelyUsbUart(string name)
    {
        var value = name.ToLowerInvariant();
        return value.Contains("wchusbserial") || value.Contains("usbserial") ||
               value.Contains("slab_usb") || value.Contains("cp210") ||
               value.Contains("ttyusb") || value.Contains("com");
    }
}
#endif

#if ANDROID
/// <summary>
/// Android USB Host transport for CH340 and CP210x USB-UART adapters.
/// </summary>
public sealed class AndroidUsbSerialTransport : IAndroidUsbSerialTransport
{
    private const int Ch340VendorId = 0x1A86;
    private const int Cp210xVendorId = 0x10C4;
    private readonly UsbManager usbManager;
    private UsbDeviceConnection? connection;
    private UsbInterface? claimedInterface;
    private UsbEndpoint? readEndpoint;
    private UsbEndpoint? writeEndpoint;
    private CancellationTokenSource? cancellation;

    public AndroidUsbSerialTransport(Context context) =>
        usbManager = (UsbManager)context.GetSystemService(Context.UsbService)!;

    public bool IsOpen => connection is not null && readEndpoint is not null && writeEndpoint is not null;
    public event EventHandler<byte[]>? DataReceived;

    public IReadOnlyList<string> ListPorts() => ListUsbDevices();

    public IReadOnlyList<string> ListUsbDevices() => usbManager.DeviceList.Values
        .Where(IsSupported)
        .Select(device => device.DeviceName)
        .OrderBy(name => name, StringComparer.OrdinalIgnoreCase)
        .ToArray();

    public void Open(string portName, SerialSettings? settings = null) => OpenUsbDevice(portName, settings);

    public void OpenUsbDevice(string deviceId, SerialSettings? settings = null)
    {
        Close();
        settings ??= new SerialSettings();
        var device = usbManager.DeviceList.Values.FirstOrDefault(item => item.DeviceName == deviceId);
        if (device is null || !IsSupported(device)) throw new InvalidOperationException("The CH340/CP210x device was not found.");
        if (!usbManager.HasPermission(device))
        {
            var intent = new Intent("Yrm100.App.USB_PERMISSION");
            var flags = Android.App.PendingIntentFlags.UpdateCurrent | Android.App.PendingIntentFlags.Immutable;
            usbManager.RequestPermission(device, Android.App.PendingIntent.GetBroadcast(
                Android.App.Application.Context, 0, intent, flags));
            throw new UnauthorizedAccessException("Approve the Android USB permission dialog, then press Connect again.");
        }

        connection = usbManager.OpenDevice(device) ?? throw new IOException("Android could not open the USB device.");
        var usbInterface = FindSerialInterface(device);
        if (usbInterface is null || !connection.ClaimInterface(usbInterface, true))
            throw new IOException("Could not claim the USB serial interface.");
        claimedInterface = usbInterface;

        readEndpoint = FindEndpoint(usbInterface, UsbAddressing.In);
        writeEndpoint = FindEndpoint(usbInterface, UsbAddressing.Out);
        if (readEndpoint is null || writeEndpoint is null) throw new IOException("USB bulk endpoints were not found.");

        if (device.VendorId == Cp210xVendorId) ConfigureCp210x(settings);
        else ConfigureCh340(settings);
        cancellation = new CancellationTokenSource();
        _ = Task.Run(() => ReadLoop(cancellation.Token), cancellation.Token);
    }

    public void Send(ReadOnlySpan<byte> data)
    {
        if (!IsOpen) throw new InvalidOperationException("The USB serial transport is not open.");
        var bytes = data.ToArray();
        var sent = connection!.BulkTransfer(writeEndpoint!, bytes, 0, bytes.Length, 1000);
        if (sent != bytes.Length) throw new IOException($"Only {sent} of {bytes.Length} bytes were sent.");
    }

    public void Close()
    {
        cancellation?.Cancel();
        cancellation?.Dispose();
        cancellation = null;
        if (claimedInterface is not null) connection?.ReleaseInterface(claimedInterface);
        claimedInterface = null;
        connection?.Close();
        connection = null;
        readEndpoint = null;
        writeEndpoint = null;
    }

    public void Dispose() => Close();

    private void ReadLoop(CancellationToken token)
    {
        var buffer = new byte[512];
        while (!token.IsCancellationRequested && IsOpen)
        {
            var count = connection!.BulkTransfer(readEndpoint!, buffer, 0, buffer.Length, 500);
            if (count > 0) DataReceived?.Invoke(this, buffer[..count]);
        }
    }

    private void ConfigureCp210x(SerialSettings settings)
    {
        ControlTransfer(0x41, 0x00, 0x0001, 0);
        var lineControl = (int)settings.DataBits | (settings.Parity switch
        {
            SerialParity.Odd => 0x0010,
            SerialParity.Even => 0x0020,
            _ => 0
        }) | (settings.StopBits == SerialStopBits.Two ? 0x0200 : 0);
        ControlTransfer(0x41, 0x07, lineControl, 0);
        var baud = BitConverter.GetBytes(settings.BaudRate);
        connection!.ControlTransfer((UsbAddressing)0x41, 0x1E, 0, 0, baud, baud.Length, 1000);
    }

    private void ConfigureCh340(SerialSettings settings)
    {
        ControlTransfer(0x40, 0x9A, 0x2518, 0x0050);
        ControlTransfer(0x40, 0x9A, 0x1312, 0x0000);
        ControlTransfer(0x40, 0x9A, 0x2518, 0x0050);
        var factor = 1532620800u / (uint)settings.BaudRate;
        var divisor = (int)(factor & 0xFF) | (int)((factor >> 8) & 0xFF) << 8;
        ControlTransfer(0x40, 0x9A, divisor, 0x0083);
        ControlTransfer(0x40, 0x9A, 0x501F, 0x0000);
    }

    private void ControlTransfer(int requestType, int request, int value, int index) =>
        connection!.ControlTransfer((UsbAddressing)requestType, request, value, index, null, 0, 1000);

    private static UsbInterface? FindSerialInterface(UsbDevice device) =>
        Enumerable.Range(0, device.InterfaceCount).Select(index => device.GetInterface(index))
            .FirstOrDefault(item => Enumerable.Range(0, item.EndpointCount)
            .Select(index => item.GetEndpoint(index)).Any(endpoint => endpoint.Type == UsbAddressing.XferBulk));

    private static UsbEndpoint? FindEndpoint(UsbInterface usbInterface, UsbAddressing direction) =>
        Enumerable.Range(0, usbInterface.EndpointCount).Select(index => usbInterface.GetEndpoint(index))
            .FirstOrDefault(endpoint => endpoint.Type == UsbAddressing.XferBulk && endpoint.Direction == direction);

    private static bool IsSupported(UsbDevice device) =>
        device.VendorId == Ch340VendorId || device.VendorId == Cp210xVendorId;
}

public interface IAndroidUsbSerialTransport : ISerialTransport
{
    IReadOnlyList<string> ListUsbDevices();
    void OpenUsbDevice(string deviceId, SerialSettings? settings = null);
}
#endif