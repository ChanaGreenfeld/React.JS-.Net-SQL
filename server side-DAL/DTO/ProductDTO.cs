using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class ProductDTO
    {
        public short CodeProduct { get; set; }
        public string NameProduct { get; set; }
        public string DescriptionProduct { get; set; }
        public short? CodeCategory { get; set; }
        public decimal? Cost { get; set; }
        public string Picture { get; set; }

    }
}
