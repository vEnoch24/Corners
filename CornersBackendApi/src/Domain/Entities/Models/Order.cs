using CornersBackendApi.src.Domain.Entities.Models.BuyerModels;
using CornersBackendApi.src.Domain.Entities.Models.SellerModels;
using CornersBackendApi.src.Domain.Enum;
using System.ComponentModel.DataAnnotations.Schema;

namespace CornersBackendApi.src.Domain.Entities.Models
{
    public class Order
    {
        public string Id { get; set; } = Guid.NewGuid().ToString();
        public List<Products> Products { get; set; }
        public OrderFufillment Fufillment { get; set; } = OrderFufillment.Pending;
        public DateTime DateOrdered { get; set; }

        [ForeignKey(nameof(User.Id))]
        public string UserId { get; set; }
    }
}
