using CornersBackendApi.src.Domain.Entities.Models.BuyerModels;
using CornersBackendApi.src.Domain.Entities.Models.SellerModels;
using CornersBackendApi.src.Domain.Enum;
using System.ComponentModel.DataAnnotations.Schema;

namespace CornersBackendApi.src.Domain.Entities.Models
{
    public class Order
    {
        public string Id { get; set; } = Guid.NewGuid().ToString();
        public OrderFufillment Fufillment { get; set; } = OrderFufillment.Pending;
        public DateTime DateOrdered { get; set; }

        [ForeignKey(nameof(User.Id))]
        public string UserId { get; set; }
        public User User { get; set; }

        public ICollection<OrderProduct> OrderProducts { get; set; }
    }
}
