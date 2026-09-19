using Avalonia;
using Avalonia.Controls;
using Avalonia.Controls.ApplicationLifetimes;
using Avalonia.Markup.Xaml;
using Avalonia.Themes.Fluent;

namespace Yrm100.App;

public partial class App : Avalonia.Application
{
    public override void Initialize() => Styles.Add(new FluentTheme());

    public override void OnFrameworkInitializationCompleted()
    {
        if (ApplicationLifetime is IClassicDesktopStyleApplicationLifetime desktop)
        {
            var reader = new MainWindow();
            var window = new Window
            {
                Width = 760,
                Height = 520,
                MinWidth = 600,
                MinHeight = 420,
                Title = "YRM100 Reader",
                Content = reader
            };
            window.Closed += (_, _) => reader.DisposeTransport();
            desktop.MainWindow = window;
        }
#if ANDROID
        else if (ApplicationLifetime is ISingleViewApplicationLifetime singleView)
            singleView.MainView = new MainWindow();
#endif
        base.OnFrameworkInitializationCompleted();
    }
}