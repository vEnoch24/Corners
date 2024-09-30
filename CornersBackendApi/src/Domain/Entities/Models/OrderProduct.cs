using CornersBackendApi.src.Domain.Entities.Models.SellerModels;

namespace CornersBackendApi.src.Domain.Entities.Models
{
    public class OrderProduct
    {
        public string OrderId { get; set; }
        public Order Order { get; set; }

        public string ProductId { get; set; }
        public Products Product { get; set; }
    }
}
