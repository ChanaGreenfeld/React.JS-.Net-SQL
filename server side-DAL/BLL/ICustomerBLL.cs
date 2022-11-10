using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
namespace BLL
{
    public interface ICustomerBLL
    {
        public List<CustomerDTO> GetAll();
        public CustomerDTO GetCustomerByPassword(string password);
        public List<CustomerDTO> AddCustomer(CustomerDTO newCustomer);
        public string UpdateCustomer(string id, CustomerDTO editCustomer);
        public string DeleteCustomer(string id);
    }
}
