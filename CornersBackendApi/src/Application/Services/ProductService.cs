using CornersBackendApi.src.Application.RequestPayload;
using CornersBackendApi.src.Domain.Contracts;
using CornersBackendApi.src.Domain.Contracts.Services;
using CornersBackendApi.src.Domain.Entities.Models.SellerModels;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CornersBackendApi.src.Application.Services
{
    public class ProductService : IProductService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IProductRepository _productRepository;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public ProductService(IUnitOfWork unitOfWork, IProductRepository productRepository, IHttpContextAccessor httpContextAccessor) 
        {
            _unitOfWork = unitOfWork;
            _productRepository = productRepository;
            _httpContextAccessor = httpContextAccessor;
        }


        public async Task<Products> AddProduct([FromForm]AddProductRequest request)
        {
            // Access the HttpContext
            var httpContext = _httpContextAccessor.HttpContext;
            var files = httpContext.Request.Form.Files;

            // Ensure request.Images and request.ImageContentTypes are initialized
            //request.Images = new List<byte[]>();
            //request.ImageContentTypes = new List<string>();

            // Process each file and add its bytes and content type to the request
            foreach (var file in files)
            {
                using (var memoryStream = new MemoryStream())
                {
                    await file.CopyToAsync(memoryStream);  // Copy file to memory stream
                    request.Images.Add(memoryStream.ToArray());  // Add byte array to Images list
                    request.ImageContentTypes.Add(file.ContentType);  // Add content type to ImageContentTypes list
                }
            }

            var product = new Products
            {
                SellerId = request.SellerId,
                Name = request.Name,
                Price = request.Price,
                Description = request.Description,
                DateModified = DateTime.Now,
                Images = request.Images,
                ImageContentTypes = request.ImageContentTypes
            };

           

            await _unitOfWork.ProductRepository.Add(product);
            await _unitOfWork.ProductRepository.Save();
            return product;
        }

        public async Task<IEnumerable<Products>> GetProducts(string sellerId)
        {
            var result = await _unitOfWork.ProductRepository.GetAllAsQueryable().Where(p => p.SellerId == sellerId)
                .OrderByDescending(d => d.DateModified).ToListAsync();

            return result;
        }
    }
}
