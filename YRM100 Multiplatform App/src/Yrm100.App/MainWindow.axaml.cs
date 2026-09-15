#if !ANDROID
using System.IO.Ports;
#endif
using Avalonia.Controls;
using Avalonia.Interactivity;
using Avalonia.Threading;
using Yrm100.Protocol;

namespace Yrm100.App;

public partial class MainWindow : Window
{
#if !ANDROID
    private SerialPort? serialPort;
#endif
    private readonly FrameParser parser = new();

    public MainWindow()
    {
        InitializeComponent();
        RefreshPorts(this, new RoutedEventArgs());
    }

    private void RefreshPorts(object? sender, RoutedEventArgs e)
    {
#if ANDROID
        PortBox.ItemsSource = Array.Empty<string>();
        LogText.Text = "Android transport is provided by a platform adapter.";
#else
        PortBox.ItemsSource = SerialPort.GetPortNames().OrderBy(name => name).ToArray();
        LogText.Text = "Ports refreshed.";
#endif
    }

    private void Connect(object? sender, RoutedEventArgs e)
    {
#if ANDROID
        LogText.Text = "Use the Android USB/Bluetooth transport adapter for this device.";
        return;
#else
        if (PortBox.SelectedItem is not string portName) { LogText.Text = "Select a serial port first."; return; }
        serialPort = new SerialPort(portName, 115200, Parity.None, 8, StopBits.One);
        serialPort.DataReceived += ReceiveData;
        serialPort.Open();
        StatusText.Text = $"Connected: {portName}";
#endif
    }

    private void Disconnect(object? sender, RoutedEventArgs e)
    {
#if ANDROID
        StatusText.Text = "Disconnected";
#else
        if (serialPort is null) return;
        serialPort.Close();
        serialPort.Dispose();
        serialPort = null;
        StatusText.Text = "Disconnected";
#endif
    }

    private void ReadOnce(object? sender, RoutedEventArgs e) => Send(R200Protocol.ReadSingle());
    private void StartInventory(object? sender, RoutedEventArgs e) => Send(R200Protocol.ReadMulti());
    private void StopInventory(object? sender, RoutedEventArgs e) => Send(R200Protocol.StopRead());

    private void Send(byte[] frame)
    {
#if ANDROID
        LogText.Text = "Android transport is not configured yet.";
#else
        if (serialPort is not { IsOpen: true }) { LogText.Text = "Connect a reader first."; return; }
        serialPort.Write(frame, 0, frame.Length);
        LogText.Text = $"Sent {Convert.ToHexString(frame)}";
#endif
    }

#if !ANDROID
    private void ReceiveData(object? sender, SerialDataReceivedEventArgs e)
    {
        var bytes = new byte[serialPort!.BytesToRead];
        serialPort.Read(bytes, 0, bytes.Length);
        foreach (var frame in parser.Push(bytes))
        {
            var tag = InventoryDecoder.TryDecode(frame);
            if (tag is null) continue;
            Dispatcher.UIThread.Post(() =>
            {
                EpcText.Text = $"EPC: {tag.EpcHex}";
                CrcText.Text = $"CRC: {tag.CrcHex}";
                RssiText.Text = $"RSSI: {tag.Rssi} dBm";
            });
        }
    }
#endif
}