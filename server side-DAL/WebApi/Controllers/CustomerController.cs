using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DAL;
using DAL.Models;
using BLL;
using DTO;
namespace WebApi2.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CustomerController : ControllerBase
    {

        ICustomerBLL customerBLL;
        public CustomerController(ICustomerBLL _customerBLL)
        {
            customerBLL = _customerBLL;
        }

        [HttpGet("GetAll")]
        public ActionResult GetAllCustomer()
        {
            return Ok(customerBLL.GetAll());
        }

        [HttpGet("GetCustomerByPassword/{password}")]
        public ActionResult GetCustomerByPassword(string password)
        {
            return Ok(customerBLL.GetCustomerByPassword(password));
        }

        [HttpPost("AddCustomer")]
        public ActionResult AddCustomer(CustomerDTO c)
        {
            return Ok(customerBLL.AddCustomer(c));
        }

        [HttpPut("UpdateCustomer/{id}")]
        public ActionResult UpdateCustomer(string id, CustomerDTO c)
        {
            return Ok(customerBLL.UpdateCustomer(id, c));
        }


        [HttpDelete("DeleteUser/{id}")]
        public ActionResult DeleteUser(string id)
        {
            return Ok(customerBLL.DeleteCustomer(id));
        }

    }
}
