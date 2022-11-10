using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Models;

namespace DAL
{
    public class BuyingDetailsDal:IBuyingDetailsDal
    {
        STOREContext myStore;
        public BuyingDetailsDal(STOREContext _myStore)
        {
            myStore = _myStore;
        }
        public List<BuyingDetail> AddBuyingDetails(BuyingDetail newBuying)
        {
            try
            {
                myStore.BuyingDetails.Add(newBuying);
                myStore.SaveChanges();
                return myStore.BuyingDetails.ToList();
            }
            catch (Exception e)
            {

                return new List<BuyingDetail>();
            }
        }

       

        public string DeleteBuyingDetails(short codeBuying)
        {
            try
            {
                BuyingDetail c = null;
                for (int i = 0; i < myStore.BuyingDetails.Count(); i++)
                {
                    if (myStore.BuyingDetails.ToList()[i].CodeBuying == codeBuying)
                        c = myStore.BuyingDetails.ToList()[i];
                }
                myStore.BuyingDetails.Remove(c);
                myStore.SaveChanges();
                return "Succesful";
            }
            catch (Exception e)
            {

                return "Faild";
            }
        }

        public List<BuyingDetail> GetAll()
        {
            return myStore.BuyingDetails.ToList();
        }

        public List<BuyingDetail> GetBuyingDetailstByProduct(short codeProduct)
        {
            List<BuyingDetail> c = new List<BuyingDetail>();
            for (int i = 0; i < myStore.BuyingDetails.Count(); i++)
            {
                if (myStore.BuyingDetails.ToList()[i].CodeProduct == codeProduct)
                    c.Add(myStore.BuyingDetails.ToList()[i]);
            }
            return c;
        }
    }
}
