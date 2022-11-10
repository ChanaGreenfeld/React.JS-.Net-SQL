using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Models;

namespace DAL
{
    public interface IBuyingDetailsDal
    {
        public List<BuyingDetail> GetAll();
        public List<BuyingDetail> GetBuyingDetailstByProduct(short codeProduct);
        public List<BuyingDetail> AddBuyingDetails(BuyingDetail newBuying);
        public string DeleteBuyingDetails(short codeBuying);
    }
}
