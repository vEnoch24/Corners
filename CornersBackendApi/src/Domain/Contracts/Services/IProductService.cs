using CornersBackendApi.src.Application.RequestPayload;
using CornersBackendApi.src.Domain.Entities.Models.SellerModels;

namespace CornersBackendApi.src.Domain.Contracts.Services
{
    public interface IProductService
    {
        Task<Products> AddProduct(AddProductRequest request);
        Task<IEnumerable<Products>> GetProducts(GetProductRequest request);
    }
}
