using CornersBackendApi.Data.Models.SellerModels;
using CornersBackendApi.Enum;

namespace CornersBackendApi.Data.Models
{
    public class Order
    {
        public string Id { get; set; } = Guid.NewGuid().ToString();
        public List<Products> Products { get; set; }
        public OrderFufillment Fufillment { get; set; } = OrderFufillment.Pending;
        public DateTime DateOrdered { get; set; } 
    }
}
