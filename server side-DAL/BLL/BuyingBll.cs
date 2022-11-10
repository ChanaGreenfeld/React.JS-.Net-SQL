using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;
using AutoMapper;
using DAL.Models;


namespace BLL
{
    public class BuyingBll:IBuyingBll
    {

        IBuyingDal buingDal;
        IMapper imapper;
        public BuyingBll(IBuyingDal _buingDal)
        {
            buingDal = _buingDal;
            var config = new MapperConfiguration(c => c.AddProfile<Auto>());
            imapper = config.CreateMapper();
        }

        public BuyingDTO AddBuying(BuyingDTO newBuying)
        {
            Buying b = imapper.Map<BuyingDTO, Buying>(newBuying);
            Buying b1= buingDal.AddBuying(b);
           return imapper.Map<Buying, BuyingDTO>(b1);
        }

        public string DeleteBuying(string id, DateTime d)
        {
            return buingDal.DeleteBuying(id,d);
        }

        public List<BuyingDTO> GetAll()
        {
            List<Buying> list = buingDal.GetAll();
            return imapper.Map<List<Buying>, List<BuyingDTO>>(list);
        }

        public BuyingDTO GetBuyingtByIdDate(string id, DateTime d)
        {
            Buying c = buingDal.GetBuyingtByIdDate(id,d);
            return imapper.Map<Buying, BuyingDTO>(c);
        }

        public List<BuyingDTO> GetBuyingById(string id)
        {
            List<Buying> c = buingDal.GetBuyingById(id);
            return imapper.Map<List<Buying>, List<BuyingDTO>>(c);
        }
    }
}
