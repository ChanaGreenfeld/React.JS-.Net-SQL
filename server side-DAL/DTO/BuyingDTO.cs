using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class BuyingDTO
    {
        public short CodeBuying { get; set; }
        public string CustId { get; set; }
        public decimal? SumBuying { get; set; }
        public DateTime? DateBuying { get; set; }
    }
}
