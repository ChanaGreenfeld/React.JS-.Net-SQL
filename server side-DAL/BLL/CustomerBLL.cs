using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DAL.Models;
using AutoMapper;

namespace BLL
{
    public class CustomerBLL : ICustomerBLL
    {
        ICustomerDal customerDal;
        IMapper imapper;
        public CustomerBLL(ICustomerDal _customerDal)
        {
            customerDal = _customerDal;
            var config = new MapperConfiguration(c => c.AddProfile<Auto>());
            imapper = config.CreateMapper();
        }

        public List<CustomerDTO> AddCustomer(CustomerDTO newCustomer)
        {
            Customer c= imapper.Map<CustomerDTO, Customer>(newCustomer);
            List<Customer> l= customerDal.AddCustomer(c);
            return imapper.Map<List<Customer>, List<CustomerDTO>>(l);
        }

        public string DeleteCustomer(string id)
        {
            return customerDal.DeleteCustomer(id);
        }

        public List<CustomerDTO> GetAll()
        {
            List<Customer> list= customerDal.GetAll();
            return imapper.Map<List<Customer>, List<CustomerDTO>>(list); 
        }

        public CustomerDTO GetCustomerByPassword(string password)
        {
            Customer c= customerDal.GetCustomerByPassword(password);
            return imapper.Map<Customer, CustomerDTO>(c);
        }

        public string UpdateCustomer(string id, CustomerDTO editCustomer)
        {
            Customer c= imapper.Map<CustomerDTO, Customer>(editCustomer);
            return customerDal.UpdateCustomer(id, c);
        }
    }
}
