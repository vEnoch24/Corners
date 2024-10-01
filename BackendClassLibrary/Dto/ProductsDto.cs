using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackendClassLibrary.Dto
{
    public class ProductsDto
    {
        public string SellerId { get; set; }
        public string Name { get; set; }
        public double Price { get; set; }
        public string Description { get; set; }
      
    }
}
