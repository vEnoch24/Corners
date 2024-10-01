using CornersBackendApi.src.Application.RequestPayload;
using CornersBackendApi.src.Domain.Entities.Models.SellerModels;
using Microsoft.AspNetCore.Mvc;

namespace CornersBackendApi.src.Domain.Contracts.Services
{
    public interface IProductService
    {
        Task<Products> AddProduct([FromForm]AddProductRequest request);
        Task<IEnumerable<Products>> GetProducts(string sellerId);
    }
}
