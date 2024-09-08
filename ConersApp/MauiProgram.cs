﻿using Blazorise;
using Microsoft.Extensions.Logging;
using MudBlazor.Services;
using Syncfusion.Blazor;

namespace ConersApp
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                });

            builder.Services.AddMauiBlazorWebView();

#if DEBUG
    		builder.Services.AddBlazorWebViewDeveloperTools();
    		builder.Logging.AddDebug();
#endif

            builder.Services.AddSyncfusionBlazor();
            Syncfusion.Licensing.SyncfusionLicenseProvider.RegisterLicense(
                builder.Configuration.GetSection("SyncLicense:ApiKey").Value
            );

            builder.Services.AddMudServices(config =>
			{
				config.PopoverOptions.ThrowOnDuplicateProvider = false;
			});

			builder.Services.AddBlazorise(options =>
			{
				options.Immediate = true;
			});

            

            return builder.Build();
        }
    }
}
