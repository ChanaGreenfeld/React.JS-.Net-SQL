using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Models;
namespace DAL
{
    public class CustomerDal : ICustomerDal
    {
        STOREContext myStore;
        public CustomerDal(STOREContext _myStore)
        {
            myStore = _myStore;
        }
        public List<Customer> AddCustomer(Customer newCustomer)
        {
            try
            {
                myStore.Customers.Add(newCustomer);
                myStore.SaveChanges();
                return myStore.Customers.ToList();
            }
            catch (Exception e)
            {

                return new List<Customer>();
            }
        }

        public string DeleteCustomer(string id)
        {  
            try
            {
                Customer c = null;
                for (int i = 0; i < myStore.Customers.Count(); i++)
                {
                    if (myStore.Customers.ToList()[i].CustId == id)
                        c = myStore.Customers.ToList()[i];
                }
                myStore.Customers.Remove(c);
                myStore.SaveChanges();
                return "Succesful";
            }
            catch (Exception e)
            {

                return "Faild";
            }
        }

        public List<Customer> GetAll()
        {
            return myStore.Customers.ToList();
        }

        public Customer GetCustomerByPassword(string password)
        {
            Customer c=null;
            for (int i = 0; i < myStore.Customers.Count(); i++)
            {
                if (myStore.Customers.ToList()[i].CustPassword == password)
                    c = myStore.Customers.ToList()[i];
            }
            return c;
        }

        public string UpdateCustomer(string id, Customer editCustomer)
        {
            try
            {
                for (int i = 0; i < myStore.Customers.Count(); i++)
                {
                    if (myStore.Customers.ToList()[i].CustId.Equals(id))
                    {
                        myStore.Customers.ToList()[i].CustPassword=editCustomer.CustPassword;
                        myStore.Customers.ToList()[i].CustPhone = editCustomer.CustPhone;
                        myStore.Customers.ToList()[i].CustCity = editCustomer.CustCity;
                        myStore.Customers.ToList()[i].CustAddress = editCustomer.CustAddress;
                        myStore.Customers.ToList()[i].LastName = editCustomer.LastName;
                        myStore.Customers.ToList()[i].FirsName = editCustomer.FirsName;
                    }
                }
                myStore.SaveChanges();
                return "Succesful";
            }
            catch (Exception)
            {

                return "Faild";
            }
        }
    }
}
