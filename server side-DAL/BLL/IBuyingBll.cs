using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
namespace BLL
{
    public interface IBuyingBll
    {
        public List<BuyingDTO> GetAll();
        public BuyingDTO GetBuyingtByIdDate(string id, DateTime d);
        public List<BuyingDTO> GetBuyingById(string id);
        public BuyingDTO AddBuying(BuyingDTO newBuying);
        public string DeleteBuying(string id, DateTime d);
    }
}
