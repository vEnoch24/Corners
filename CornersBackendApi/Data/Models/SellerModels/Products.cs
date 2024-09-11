using System.ComponentModel.DataAnnotations.Schema;

namespace CornersBackendApi.Data.Models.SellerModels
{
    public class Products
    {
        public string Id { get; set; } = Guid.NewGuid().ToString();
        public string Name { get; set; }
        public int Price { get; set; }
        public List<string> Categories { get; set; }
        public DateTime DateAdded { get; set; } = DateTime.Now;
        public DateTime DateModified { get; set; }
        [ForeignKey(nameof(Seller.Id))]
        public string SellerId { get; set; }

        //Image
        public string ImageName { get; set; }
        public byte[] ImageData { get; set; }
        public string ImageContentType { get; set; }

    }
}
