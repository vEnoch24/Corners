using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackendClassLibrary.Models.Seller
{
    public class BusinessLoginModel
    {
        [Required]
        [EmailAddress]
        public string BusinessEmail { get; set; }

        [Required, DataType(DataType.Password)]
        public string Password { get; set; }
    }
}
