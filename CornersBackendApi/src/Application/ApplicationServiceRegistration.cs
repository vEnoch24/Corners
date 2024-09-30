using CornersBackendApi.src.Application.Repository;
using CornersBackendApi.src.Application.Services;
using CornersBackendApi.src.Domain.Contracts;
using CornersBackendApi.src.Domain.Contracts.Services;

namespace CornersBackendApi.src.Application
{
    public static class ApplicationServiceRegistration
    {
        public static IServiceCollection ConfigureApplicationServices(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddScoped<IUnitOfWork, UnitOfWork>();
            services.AddScoped<IProductRepository, ProductRepository>();
            services.AddScoped<IProductService, ProductService>();


            return services;
        }
    }
}
