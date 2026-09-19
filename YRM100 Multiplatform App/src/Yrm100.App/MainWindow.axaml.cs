using Avalonia.Controls;
using Avalonia.Controls.Shapes;
using Avalonia.Interactivity;
using Avalonia.Layout;
using Avalonia.Media;
using Avalonia.Threading;
using Yrm100.Protocol;
using AvaloniaButton = Avalonia.Controls.Button;
using AvaloniaOrientation = Avalonia.Layout.Orientation;
using AvaloniaThickness = Avalonia.Thickness;

namespace Yrm100.App;

public partial class MainWindow : UserControl
{
    private readonly ISerialTransport? transport;
    private readonly FrameParser parser = new(Yrm1002Protocol.Header, Yrm1002Protocol.Footer);
    private readonly Dictionary<string, RfidTag> tags = new(StringComparer.OrdinalIgnoreCase);
    private RfidTag? selectedTag;

    public MainWindow()
    {
#if ANDROID
        BuildAndroidView();
#else
        InitializeComponent();
#endif
        transport = CreateTransport();
        if (transport is not null) transport.DataReceived += ReceiveData;
        RefreshPorts(this, new RoutedEventArgs());
    }

#if ANDROID
    private void BuildAndroidView()
    {
        PortBox = new ComboBox { MinWidth = 120 };
        StatusText = new TextBlock { Text = "DISCONNECTED", FontSize = 11, FontWeight = FontWeight.Bold };
        EpcText = new TextBlock { Text = "No tag detected", FontFamily = "monospace", TextWrapping = TextWrapping.Wrap };
        CrcText = new TextBlock { Text = "CRC: -" };
        RssiText = new TextBlock { Text = "RSSI: -" };
        CountText = new TextBlock { Text = "0 tags in sweep" };
        AccessPasswordBox = new TextBox { Text = "00000000" };
        KillPasswordBox = new TextBox { Text = "0000FFFF" };
        LogText = new TextBlock { Text = "Connect a USB reader to begin.", TextWrapping = TextWrapping.Wrap };
        RadarCanvas = new Canvas { Width = 260, Height = 260 };
        TagDots = new Canvas();
        RadarCanvas.Children.Add(new Ellipse { Width = 260, Height = 260, Stroke = new SolidColorBrush(Color.Parse("#2A5360")), StrokeThickness = 1 });
        RadarCanvas.Children.Add(new Ellipse { Width = 190, Height = 190, Stroke = new SolidColorBrush(Color.Parse("#2A5360")), StrokeThickness = 1, [Canvas.LeftProperty] = 35, [Canvas.TopProperty] = 35 });
        RadarCanvas.Children.Add(new Ellipse { Width = 120, Height = 120, Stroke = new SolidColorBrush(Color.Parse("#2A5360")), StrokeThickness = 1, [Canvas.LeftProperty] = 70, [Canvas.TopProperty] = 70 });
        RadarCanvas.Children.Add(new Line { StartPoint = new Avalonia.Point(130, 0), EndPoint = new Avalonia.Point(130, 260), Stroke = new SolidColorBrush(Color.Parse("#1D3C46")) });
        RadarCanvas.Children.Add(new Line { StartPoint = new Avalonia.Point(0, 130), EndPoint = new Avalonia.Point(260, 130), Stroke = new SolidColorBrush(Color.Parse("#1D3C46")) });
        RadarCanvas.Children.Add(new Ellipse { Width = 8, Height = 8, Fill = new SolidColorBrush(Color.Parse("#78F2A5")), [Canvas.LeftProperty] = 126, [Canvas.TopProperty] = 126 });
        RadarCanvas.Children.Add(TagDots);

        var refresh = new AvaloniaButton { Content = "Refresh" };
        refresh.Click += RefreshPorts;
        var connect = new AvaloniaButton { Content = "Connect" };
        connect.Click += Connect;
        var scan = new AvaloniaButton { Content = "Scan" };
        scan.Click += StartInventory;
        var once = new AvaloniaButton { Content = "Read once" };
        once.Click += ReadOnce;
        var stop = new AvaloniaButton { Content = "Stop" };
        stop.Click += StopInventory;
        var blank = new AvaloniaButton { Content = "Write blank USER data" };
        blank.Click += WriteBlank;
        var kill = new AvaloniaButton { Content = "Kill selected tag", Background = new SolidColorBrush(Color.Parse("#B3261E")), Foreground = Brushes.White };
        kill.Click += KillTag;

        var top = new StackPanel { Spacing = 6, Children = { new TextBlock { Text = "YRM1002 FIELD SCAN", FontSize = 22, FontWeight = FontWeight.Bold }, new TextBlock { Text = "RFID tag radar" } } };
        var ports = new StackPanel { Orientation = AvaloniaOrientation.Horizontal, Spacing = 8, Children = { PortBox, refresh, connect } };
        var controls = new StackPanel { Spacing = 8, Children = { new TextBlock { Text = "SELECTED TAG", FontWeight = FontWeight.Bold }, EpcText, CrcText, RssiText, CountText, new StackPanel { Orientation = AvaloniaOrientation.Horizontal, Spacing = 6, Children = { scan, once, stop } }, new TextBlock { Text = "Access password (8 hex)" }, AccessPasswordBox, blank, new TextBlock { Text = "Kill password (8 hex)" }, KillPasswordBox, kill } };
        var body = new Grid { ColumnDefinitions = new ColumnDefinitions("1.2*,*") };
        body.Children.Add(new Border { Background = new SolidColorBrush(Color.Parse("#101820")), Padding = new AvaloniaThickness(12), Child = RadarCanvas });
        var right = new Border { Padding = new AvaloniaThickness(12), Child = controls };
        Grid.SetColumn(right, 1);
        body.Children.Add(right);
        Content = new ScrollViewer { Content = new StackPanel { Spacing = 14, Margin = new AvaloniaThickness(18), Children = { top, ports, body, LogText } } };
    }
#endif

    private static ISerialTransport? CreateTransport()
    {
#if ANDROID
    return new AndroidUsbSerialTransport(Android.App.Application.Context);
#else
        return new DesktopSerialTransport();
#endif
    }

    private void RefreshPorts(object? sender, RoutedEventArgs e)
    {
#if ANDROID
    PortBox.ItemsSource = transport?.ListPorts() ?? Array.Empty<string>();
    LogText.Text = "Connect a CH340 or CP210x adapter through Android USB Host.";
#else
    PortBox.ItemsSource = transport?.ListPorts() ?? Array.Empty<string>();
        LogText.Text = "YRM1002 ports refreshed.";
#endif
    }

    private void Connect(object? sender, RoutedEventArgs e)
    {
#if ANDROID
        if (PortBox.SelectedItem is not string deviceId) { LogText.Text = "Connect a USB adapter first."; return; }
        try
        {
            transport!.Open(deviceId);
            StatusText.Text = $"Connected: {deviceId}";
        }
        catch (UnauthorizedAccessException)
        {
            LogText.Text = "Approve the Android USB permission dialog, then press Connect again.";
        }
        catch (Exception exception)
        {
            LogText.Text = $"USB connection failed: {exception.Message}";
        }
#else
        if (PortBox.SelectedItem is not string portName) { LogText.Text = "Select a serial port first."; return; }
    transport!.Open(portName);
        StatusText.Text = "CONNECTED";
        LogText.Text = $"Connected to {portName}.";
#endif
    }

    private void Disconnect(object? sender, RoutedEventArgs e)
    {
#if ANDROID
        StatusText.Text = "DISCONNECTED";
#else
    transport?.Close();
        StatusText.Text = "Disconnected";
#endif
    }

    private void ReadOnce(object? sender, RoutedEventArgs e) => Send(Yrm1002Protocol.ReadSingle());
    private void StartInventory(object? sender, RoutedEventArgs e) => Send(Yrm1002Protocol.ReadMulti());
    private void StopInventory(object? sender, RoutedEventArgs e) => Send(Yrm1002Protocol.StopRead());

    private void WriteBlank(object? sender, RoutedEventArgs e)
    {
        if (selectedTag is null) { LogText.Text = "Detect a tag before writing."; return; }
        if (!TryParsePassword(AccessPasswordBox.Text, out var password)) return;
        Send(Yrm1002Protocol.WriteData(password, 0x03, 0, new byte[8]));
        LogText.Text = $"Blank USER data sent to {selectedTag.EpcHex}.";
    }

    private void KillTag(object? sender, RoutedEventArgs e)
    {
        if (selectedTag is null) { LogText.Text = "Detect a tag before killing."; return; }
        if (!TryParsePassword(KillPasswordBox.Text, out var password)) return;
        if (password.All(value => value == 0)) { LogText.Text = "A zero kill password is rejected by the tag."; return; }
        Send(Yrm1002Protocol.Kill(password));
        LogText.Text = $"Kill command sent to {selectedTag.EpcHex}.";
    }

    private bool TryParsePassword(string? value, out byte[] password)
    {
        try
        {
            password = Convert.FromHexString((value ?? string.Empty).Replace(" ", string.Empty));
            if (password.Length == 4) return true;
        }
        catch (FormatException) { }
        password = [];
        LogText.Text = "Password must be exactly 8 hexadecimal characters.";
        return false;
    }

    private void Send(byte[] frame)
    {
    if (transport is not { IsOpen: true }) { LogText.Text = "Connect a reader first."; return; }
    transport.Send(frame);
        LogText.Text = $"Sent {Convert.ToHexString(frame)}";
    }

    private void ReceiveData(object? sender, byte[] bytes)
    {
        foreach (var frame in parser.Push(bytes))
        {
            var tag = InventoryDecoder.TryDecode(frame);
            if (tag is null) continue;
            Dispatcher.UIThread.Post(() => ShowTag(tag));
        }
    }

    private void ShowTag(RfidTag tag)
    {
        tags[tag.EpcHex] = tag;
        selectedTag = tag;
        EpcText.Text = $"EPC: {tag.EpcHex}";
        CrcText.Text = $"CRC: {tag.CrcHex}";
        RssiText.Text = $"RSSI: {tag.Rssi} dBm";
        CountText.Text = $"{tags.Count} tag{(tags.Count == 1 ? string.Empty : "s")} in sweep";
        RedrawRadar();
    }

    private void RedrawRadar()
    {
        TagDots.Children.Clear();
        const double center = 130;
        var index = 0;
        foreach (var tag in tags.Values)
        {
            var radius = Math.Clamp(82 - (tag.Rssi + 70) * 1.8, 16, 112);
            var angle = index++ * 2.399;
            var x = center + Math.Cos(angle) * radius - 7;
            var y = center + Math.Sin(angle) * radius - 7;
            var strength = Math.Clamp((tag.Rssi + 70) / 50.0, 0, 1);
            var dot = new Ellipse
            {
                Width = 14,
                Height = 14,
                Fill = new SolidColorBrush(Color.FromRgb((byte)(255 - strength * 150), (byte)(100 + strength * 130), 90))
            };
            ToolTip.SetTip(dot, $"{tag.EpcHex}  {tag.Rssi} dBm");
            Canvas.SetLeft(dot, x);
            Canvas.SetTop(dot, y);
            TagDots.Children.Add(dot);
        }
    }

    public void DisposeTransport()
    {
        transport?.Dispose();
    }
}