#if ANDROID
using Android.App;
using Avalonia;
using Avalonia.Android;

namespace Yrm100.App;

[Activity(Label = "YRM100 Reader", Theme = "@style/MyTheme.NoActionBar", MainLauncher = true,
    ConfigurationChanges = Android.Content.PM.ConfigChanges.Orientation |
        Android.Content.PM.ConfigChanges.ScreenSize |
        Android.Content.PM.ConfigChanges.UiMode)]
public class MainActivity : AvaloniaMainActivity<App>
{
    protected override AppBuilder CustomizeAppBuilder(AppBuilder builder) => builder
        .UsePlatformDetect().LogToTrace();
}
#endif