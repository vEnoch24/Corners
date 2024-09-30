using CornersBackendApi.src.Application.RequestPayload;
using CornersBackendApi.src.Domain.Contracts.Services;
using CornersBackendApi.src.Domain.Entities.Models.SellerModels;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace CornersBackendApi.src.Presentation.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SellerController : ControllerBase
    {

        private readonly IProductService _productService;

        public SellerController(IProductService productService)
        {
            _productService = productService;
        }

        [HttpPost("add-product")]
        public async Task<IActionResult> AddProduct(AddProductRequest request)
        {
            var result = await _productService.AddProduct(request);

            return Ok(result);
        }

        [HttpGet("get-products")]
        public async Task<ActionResult<IEnumerable<Products>>> GetAllProducts([FromQuery]GetProductRequest request)
        {
            var result = await _productService.GetProducts(request);

            return Ok(result);
        }
    }
}
