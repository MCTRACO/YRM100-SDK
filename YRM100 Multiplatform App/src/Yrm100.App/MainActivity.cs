#if ANDROID
using Android.App;
using Android.Content.PM;
using Avalonia;
using Avalonia.Android;

[assembly: UsesFeature("android.hardware.usb.host", Required = true)]

namespace Yrm100.App;

[Activity(Label = "YRM100 Reader", Theme = "@style/Theme.AppCompat.Light.NoActionBar", MainLauncher = true,
    ConfigurationChanges = Android.Content.PM.ConfigChanges.Orientation |
        Android.Content.PM.ConfigChanges.ScreenSize |
        Android.Content.PM.ConfigChanges.UiMode)]
public class MainActivity : AvaloniaMainActivity<App>
{
    protected override AppBuilder CustomizeAppBuilder(AppBuilder builder) => base.CustomizeAppBuilder(builder)
        .LogToTrace();
}
#endif