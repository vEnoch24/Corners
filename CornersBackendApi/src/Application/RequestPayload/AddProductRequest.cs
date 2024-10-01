using Microsoft.AspNetCore.Components.Forms;
using System.ComponentModel.DataAnnotations;

namespace CornersBackendApi.src.Application.RequestPayload
{
    public class AddProductRequest
    {
        [Required]
        public string SellerId { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public double Price { get; set; }
        public string Description { get; set; }
        //public List<string> Categories { get; set; }

        public List<byte[]>? Images { get; set; } = new List<byte[]>();
        public List<string>? ImageContentTypes { get; set; } = new List<string>();
    }
}
