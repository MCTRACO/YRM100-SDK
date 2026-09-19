using Avalonia;

namespace Yrm100.App;

#if !ANDROID
internal static class Program
{
    [STAThread]
    public static void Main(string[] args) => BuildAvaloniaApp().StartWithClassicDesktopLifetime(args);

    public static AppBuilder BuildAvaloniaApp() => AppBuilder.Configure<App>()
        .UsePlatformDetect().LogToTrace();
}
#else
internal static class Program
{
    public static void Main(string[] args) { }
}
#endif