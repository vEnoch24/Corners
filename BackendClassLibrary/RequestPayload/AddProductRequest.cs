using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Components.Forms;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackendClassLibrary.RequestPayload
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
        //public List<string>? Categories { get; set; }
    }
}
