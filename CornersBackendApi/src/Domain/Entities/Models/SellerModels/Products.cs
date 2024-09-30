using System.ComponentModel.DataAnnotations.Schema;
using static System.Net.Mime.MediaTypeNames;

namespace CornersBackendApi.src.Domain.Entities.Models.SellerModels
{
    public class Products
    {
        public string Id { get; set; } = Guid.NewGuid().ToString();
        public string Name { get; set; }
        public double Price { get; set; }
        public string? Description { get; set; }
        public string? Categories { get; set; }
        public DateTime DateAdded { get; set; } = DateTime.Now;
        public DateTime DateModified { get; set; }

        //Seller
        [ForeignKey(nameof(Seller.Id))]
        public string SellerId { get; set; }
        public Seller Seller { get; set; }
         
        //Image
        public List<byte[]>? Images { get; set; }
        public List<string>? ImageContentTypes { get; set; }


        public ICollection<OrderProduct> OrderProducts { get; set; }
    }
}
