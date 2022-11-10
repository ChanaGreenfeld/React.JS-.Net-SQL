using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;

namespace BLL
{
    public interface IBuyingDetailBLL
    {
        public List<BuyingDetailDTO> GetAll();
        public List<BuyingDetailDTO> GetBuyingDetailstByProduct(short codeProduct);
        public List<BuyingDetailDTO> AddBuyingDetails(BuyingDetailDTO newBuying);
        public string DeleteBuyingDetails(short codeBuying);
    }
}
