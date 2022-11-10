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
    public class BuyingDetailBLL:IBuyingDetailBLL
    {
        IBuyingDetailsDal buyingDetailsDal;
        IMapper imapper;
        public BuyingDetailBLL(IBuyingDetailsDal _buingDetailsDal)
        {
            buyingDetailsDal = _buingDetailsDal;
            var config = new MapperConfiguration(c => c.AddProfile<Auto>());
            imapper = config.CreateMapper();
        }

        public List<BuyingDetailDTO> AddBuyingDetails(BuyingDetailDTO newBuyingD)
        {
            ////////////////////////////////////////////////////////////////////////////////////
            BuyingDetail b = imapper.Map<BuyingDetailDTO, BuyingDetail>(newBuyingD);
            List<BuyingDetail> bb= buyingDetailsDal.AddBuyingDetails(b);
            return imapper.Map<List<BuyingDetail>, List<BuyingDetailDTO>>(bb);
        }

        public string DeleteBuyingDetails(short codeBuying)
        {
            return buyingDetailsDal.DeleteBuyingDetails(codeBuying);
        }

        public List<BuyingDetailDTO> GetAll()
        {
            List<BuyingDetail> list = buyingDetailsDal.GetAll();
            return imapper.Map<List<BuyingDetail>, List<BuyingDetailDTO>>(list);
        }

        public List<BuyingDetailDTO> GetBuyingDetailstByProduct(short codeProduct)
        {
            List<BuyingDetail> c = buyingDetailsDal.GetBuyingDetailstByProduct(codeProduct);
            return imapper.Map<List<BuyingDetail>, List<BuyingDetailDTO>>(c);
        }
    }
}
