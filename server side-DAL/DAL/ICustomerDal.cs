using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Models;

namespace DAL
{
    public interface ICustomerDal
    {
        public List<Customer> GetAll();
        public Customer GetCustomerByPassword(string password);
        public List<Customer> AddCustomer(Customer newCustomer);
        public string UpdateCustomer(string id, Customer editCustomer);
        public string DeleteCustomer(string id);
    }
}
