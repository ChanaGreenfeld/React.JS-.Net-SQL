using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Models;

namespace DAL
{
    public class BuyingDal:IBuyingDal
    {

        STOREContext myStore;
        public BuyingDal(STOREContext _myStore)
        {
            myStore = _myStore;
        }

        public Buying AddBuying(Buying newBuying)
        {
            try
            {
                myStore.Buyings.Add(newBuying);
                myStore.SaveChanges();
                return myStore.Buyings.ToList()[myStore.Buyings.Count() - 1];
                

            }
            catch (Exception e)
            {
                return new Buying();
            }
        }

        public string DeleteBuying(string id, DateTime d)
        {
            try
            {
                Buying c = null;
                for (int i = 0; i < myStore.Buyings.Count(); i++)
                {
                    if (myStore.Buyings.ToList()[i].CustId == id && myStore.Buyings.ToList()[i].DateBuying==d)
                        c = myStore.Buyings.ToList()[i];
                }
                myStore.Buyings.Remove(c);
                myStore.SaveChanges();
                return "Succesful";
            }
            catch (Exception e)
            {

                return "Faild";
            }
        }

        public List<Buying> GetAll()
        {
            return myStore.Buyings.ToList();
        }

        public Buying GetBuyingtByIdDate(string id, DateTime d)
        {
            Buying c = null;
            for (int i = 0; i < myStore.Buyings.Count(); i++)
            {
                if (myStore.Buyings.ToList()[i].DateBuying == d && myStore.Buyings.ToList()[i].CustId.Equals(id))
                    c = myStore.Buyings.ToList()[i];
            }
            return c;
        }

        public List<Buying> GetBuyingById(string id)
        {
            List<Buying> c = new List<Buying>();
            for (int i = 0; i < myStore.Buyings.Count(); i++)
            {
                if (myStore.Buyings.ToList()[i].CustId.Equals(id))
                    c.Add(myStore.Buyings.ToList()[i]);
            }
            return c;
        }
    }
}
