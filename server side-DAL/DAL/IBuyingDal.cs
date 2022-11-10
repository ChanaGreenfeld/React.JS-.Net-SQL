using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Models;

namespace DAL
{
    public interface IBuyingDal
    {
        public List<Buying> GetAll();
        public Buying GetBuyingtByIdDate(string id,DateTime d);
        public List<Buying> GetBuyingById(string id);
        public Buying AddBuying(Buying newBuying);
        public string DeleteBuying(string id, DateTime d);
    }
}
