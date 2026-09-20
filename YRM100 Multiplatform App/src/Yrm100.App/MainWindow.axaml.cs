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
        var ink = new SolidColorBrush(Color.Parse("#E7F0F2"));
        var muted = new SolidColorBrush(Color.Parse("#94AEB4"));
        var panel = new SolidColorBrush(Color.Parse("#16252B"));
        var teal = new SolidColorBrush(Color.Parse("#72E0C0"));
        var red = new SolidColorBrush(Color.Parse("#D76565"));

        PortBox = new ComboBox { MinWidth = 120, Height = 48, HorizontalContentAlignment = HorizontalAlignment.Stretch };
        StatusText = new TextBlock { Text = "DISCONNECTED", FontSize = 11, FontWeight = FontWeight.Bold, Foreground = muted };
        EpcText = new TextBlock { Text = "No tag detected", FontFamily = "monospace", TextWrapping = TextWrapping.Wrap };
        CrcText = new TextBlock { Text = "CRC: -" };
        RssiText = new TextBlock { Text = "RSSI: -" };
        CountText = new TextBlock { Text = "0 tags in sweep" };
        AccessPasswordBox = new TextBox { Text = "00000000", Height = 48, Watermark = "8 hex characters" };
        KillPasswordBox = new TextBox { Text = "0000FFFF", Height = 48, Watermark = "8 hex characters" };
        LogText = new TextBlock { Text = "Connect a USB reader to begin.", TextWrapping = TextWrapping.Wrap, Foreground = muted };
        RadarCanvas = new Canvas { Width = 280, Height = 280, HorizontalAlignment = HorizontalAlignment.Center };
        TagDots = new Canvas();
        RadarCanvas.Children.Add(new Ellipse { Width = 280, Height = 280, Stroke = new SolidColorBrush(Color.Parse("#2C5960")), StrokeThickness = 1 });
        RadarCanvas.Children.Add(new Ellipse { Width = 210, Height = 210, Stroke = new SolidColorBrush(Color.Parse("#2C5960")), StrokeThickness = 1, [Canvas.LeftProperty] = 35, [Canvas.TopProperty] = 35 });
        RadarCanvas.Children.Add(new Ellipse { Width = 140, Height = 140, Stroke = new SolidColorBrush(Color.Parse("#2C5960")), StrokeThickness = 1, [Canvas.LeftProperty] = 70, [Canvas.TopProperty] = 70 });
        RadarCanvas.Children.Add(new Line { StartPoint = new Avalonia.Point(140, 0), EndPoint = new Avalonia.Point(140, 280), Stroke = new SolidColorBrush(Color.Parse("#1E3B42")) });
        RadarCanvas.Children.Add(new Line { StartPoint = new Avalonia.Point(0, 140), EndPoint = new Avalonia.Point(280, 140), Stroke = new SolidColorBrush(Color.Parse("#1E3B42")) });
        RadarCanvas.Children.Add(new Ellipse { Width = 10, Height = 10, Fill = teal, [Canvas.LeftProperty] = 135, [Canvas.TopProperty] = 135 });
        RadarCanvas.Children.Add(TagDots);

        var refresh = new AvaloniaButton { Content = "Refresh", Height = 48 };
        refresh.Click += RefreshPorts;
        var connect = new AvaloniaButton { Content = "Connect", Height = 48, Background = teal, Foreground = new SolidColorBrush(Color.Parse("#10252A")) };
        connect.Click += Connect;
        var scan = new AvaloniaButton { Content = "Start scan", Height = 48, Background = teal, Foreground = new SolidColorBrush(Color.Parse("#10252A")) };
        scan.Click += StartInventory;
        var once = new AvaloniaButton { Content = "Read once", Height = 48 };
        once.Click += ReadOnce;
        var stop = new AvaloniaButton { Content = "Stop", Height = 48 };
        stop.Click += StopInventory;
        var blank = new AvaloniaButton { Content = "Write blank USER data", Height = 48 };
        blank.Click += WriteBlank;
        var kill = new AvaloniaButton { Content = "Kill selected tag", Height = 48, Background = red, Foreground = Brushes.White };
        kill.Click += KillTag;

        var heading = new StackPanel { Spacing = 3, Children = { new TextBlock { Text = "YRM1003", FontSize = 28, FontWeight = FontWeight.Bold, Foreground = ink }, new TextBlock { Text = "FIELD SCAN  /  RFID RADAR", FontSize = 12, FontWeight = FontWeight.Bold, Foreground = teal } } };
        var status = new Border { Background = panel, CornerRadius = new Avalonia.CornerRadius(10), Padding = new AvaloniaThickness(12, 8), Child = StatusText };
        var header = new Grid { ColumnDefinitions = new ColumnDefinitions("*,Auto"), Children = { heading, status } };
        Grid.SetColumn(status, 1);

        var ports = new Grid { ColumnDefinitions = new ColumnDefinitions("*,Auto,Auto"), Children = { PortBox, refresh, connect } };
        Grid.SetColumn(refresh, 1);
        Grid.SetColumn(connect, 2);

        var rangeValue = new TextBlock { Text = "75 cm  /  estimated 10.0 dBm", FontSize = 18, FontWeight = FontWeight.Bold, Foreground = ink };
        var rangeSlider = new Slider { Minimum = 0, Maximum = 150, Value = 75, Height = 48, TickFrequency = 25, IsSnapToTickEnabled = true };
        rangeSlider.ValueChanged += (_, args) =>
        {
            var centimeters = Math.Round(args.NewValue);
            rangeValue.Text = $"{FormatDistance(centimeters)}  /  estimated {EstimatedPowerDbm(centimeters):0.0} dBm";
        };
        var applyRange = new AvaloniaButton { Content = "Apply antenna range", Height = 48, Background = teal, Foreground = new SolidColorBrush(Color.Parse("#10252A")) };
        applyRange.Click += (_, _) => ApplyRangePower(rangeSlider.Value);
        var rangePanel = new Border { Background = panel, CornerRadius = new Avalonia.CornerRadius(16), Padding = new AvaloniaThickness(14), Child = new StackPanel { Spacing = 7, Children = { new TextBlock { Text = "ANTENNA RANGE", FontSize = 11, FontWeight = FontWeight.Bold, Foreground = teal }, new TextBlock { Text = "Ceramic antenna 2 dBi  /  max rated range 1.5 m", FontSize = 12, Foreground = muted, TextWrapping = TextWrapping.Wrap }, rangeValue, rangeSlider, new Grid { ColumnDefinitions = new ColumnDefinitions("*,Auto"), Children = { new TextBlock { Text = "0 cm", Foreground = muted }, new TextBlock { Text = "1.5 m", Foreground = muted, [Grid.ColumnProperty] = 1 } } }, applyRange } } };

        var radarPanel = new Border { Background = panel, CornerRadius = new Avalonia.CornerRadius(16), Padding = new AvaloniaThickness(10), Child = new StackPanel { Spacing = 8, HorizontalAlignment = HorizontalAlignment.Stretch, Children = { new TextBlock { Text = "LIVE FIELD", FontSize = 11, FontWeight = FontWeight.Bold, Foreground = muted, HorizontalAlignment = HorizontalAlignment.Center }, RadarCanvas, CountText } } };
        var tagPanel = new Border { Background = panel, CornerRadius = new Avalonia.CornerRadius(16), Padding = new AvaloniaThickness(14), Child = new StackPanel { Spacing = 6, Children = { new TextBlock { Text = "SELECTED TAG", FontSize = 11, FontWeight = FontWeight.Bold, Foreground = teal }, EpcText, new StackPanel { Orientation = AvaloniaOrientation.Horizontal, Spacing = 18, Children = { CrcText, RssiText } } } } };
        var readerActions = new Border { Background = panel, CornerRadius = new Avalonia.CornerRadius(16), Padding = new AvaloniaThickness(14), Child = new StackPanel { Spacing = 8, Children = { new TextBlock { Text = "READER CONTROL", FontSize = 11, FontWeight = FontWeight.Bold, Foreground = teal }, scan, new StackPanel { Orientation = AvaloniaOrientation.Horizontal, Spacing = 8, Children = { once, stop } } } } };
        var writeActions = new Border { Background = panel, CornerRadius = new Avalonia.CornerRadius(16), Padding = new AvaloniaThickness(14), Child = new StackPanel { Spacing = 8, Children = { new TextBlock { Text = "TAG ACTIONS", FontSize = 11, FontWeight = FontWeight.Bold, Foreground = teal }, new TextBlock { Text = "Access password", Foreground = muted }, AccessPasswordBox, blank, new TextBlock { Text = "Kill password", Foreground = muted }, KillPasswordBox, kill } } };

        Content = new Border { Background = new SolidColorBrush(Color.Parse("#0C171B")), Child = new ScrollViewer { Content = new StackPanel { Spacing = 12, Margin = new AvaloniaThickness(14, 18), Children = { header, ports, radarPanel, rangePanel, tagPanel, readerActions, writeActions, LogText } } } };
    }
#endif

#if ANDROID
    private static double EstimatedPowerDbm(double centimeters) => Math.Clamp(centimeters / 150d * 20d, 0, 20);

    private static string FormatDistance(double centimeters) => centimeters >= 100
        ? $"{centimeters / 100:0.00} m"
        : $"{centimeters:0} cm";

    private void ApplyRangePower(double centimeters)
    {
        var powerDbm = EstimatedPowerDbm(centimeters);
        Send(Yrm1002Protocol.SetPower(powerDbm));
        LogText.Text = $"YRM1003 power set to {powerDbm:0.0} dBm for an estimated {FormatDistance(centimeters)} range.";
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
        const double center = 140;
        var index = 0;
        foreach (var tag in tags.Values)
        {
            var radius = Math.Clamp(96 - (tag.Rssi + 70) * 1.8, 16, 122);
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