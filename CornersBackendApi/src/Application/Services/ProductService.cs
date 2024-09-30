using CornersBackendApi.src.Application.RequestPayload;
using CornersBackendApi.src.Domain.Contracts;
using CornersBackendApi.src.Domain.Contracts.Services;
using CornersBackendApi.src.Domain.Entities.Models.SellerModels;
using Microsoft.EntityFrameworkCore;

namespace CornersBackendApi.src.Application.Services
{
    public class ProductService : IProductService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IProductRepository _productRepository;

        public ProductService(IUnitOfWork unitOfWork, IProductRepository productRepository) 
        {
            _unitOfWork = unitOfWork;
            _productRepository = productRepository;
            
        }


        public async Task<Products> AddProduct(AddProductRequest request)
        {
            var product = new Products
            {
                SellerId = request.SellerId,
                Name = request.Name,
                Price = request.Price,
                Description = request.Description,
                Images = new List<byte[]>(),
                ImageContentTypes = new List<string>()
            };

            if (request.Images != null && request.Images.Any())
            {
                foreach (var image in request.Images)
                {
                    using (var memoryStream = new MemoryStream())
                    {
                        await image.CopyToAsync(memoryStream);
                        var imageByte = memoryStream.ToArray();

                        product.Images.Add(imageByte);
                        product.ImageContentTypes.Add(image.ContentType);
                    }
                }
            }

            await _unitOfWork.ProductRepository.Add(product);
            await _unitOfWork.ProductRepository.Save();
            return product;
        }

        public async Task<IEnumerable<Products>> GetProducts(GetProductRequest request)
        {
            var result = await _unitOfWork.ProductRepository.GetAllAsQueryable().Where(p => p.SellerId == request.SellerId).ToListAsync();

            return result;
        }
    }
}
