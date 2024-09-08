using Microsoft.UI;
using Microsoft.UI.Windowing;
using Microsoft.UI.Xaml;
using Windows.Graphics;
using Microsoft.Maui.Controls.PlatformConfiguration.WindowsSpecific;

// To learn more about WinUI, the WinUI project structure,
// and more about our project templates, see: http://aka.ms/winui-project-info.

namespace ConersApp.WinUI
{
    /// <summary>
    /// Provides application-specific behavior to supplement the default Application class.
    /// </summary>
    public partial class App : MauiWinUIApplication
    {
        /// <summary>
        /// Initializes the singleton application object.  This is the first line of authored code
        /// executed, and as such is the logical equivalent of main() or WinMain().
        /// </summary>
        public App()
        {
            this.InitializeComponent();
        }

        protected override MauiApp CreateMauiApp() => MauiProgram.CreateMauiApp();

        //protected override void OnLaunched(LaunchActivatedEventArgs args)
        //{
            //base.OnLaunched(args);

            //var mauiWindow = Application.Windows[0].Handler.PlatformView as Microsoft.UI.Xaml.Window;

            //IntPtr hwnd = WinRT.Interop.WindowNative.GetWindowHandle(mauiWindow);
            //WindowId windowId = Microsoft.UI.Win32Interop.GetWindowIdFromWindow(hwnd);
            //AppWindow appWindow = AppWindow.GetFromWindowId(windowId);


             // Set custom title
            //appWindow.Title = "Custom Title Bar";

            // Hide the default title bar
            //var titleBar = appWindow.TitleBar;
            //titleBar.ExtendsContentIntoTitleBar = true;

            // Customize title bar colors
            //var titleBar = appWindow.TitleBar;
            //titleBar.ForegroundColor = Windows.UI.Color.FromArgb(10,5,3,3);
            //titleBar.BackgroundColor = Windows.UI.Color.FromArgb(10, 5, 8, 2);
            //titleBar.ButtonForegroundColor = Windows.UI.Color.FromArgb(10, 5, 5, 3);
            //titleBar.ButtonBackgroundColor = Windows.UI.Color.FromArgb(10, 2, 7, 5);
            //titleBar.ButtonHoverBackgroundColor = Windows.UI.Color.FromArgb(10, 8, 3, 3);
        //}
    }

}
