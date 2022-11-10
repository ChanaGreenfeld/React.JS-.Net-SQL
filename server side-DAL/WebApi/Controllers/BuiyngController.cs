using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BLL;
using DTO;
using DAL;
using DAL.Models;

namespace WebApi2.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BuiyngController : ControllerBase
    {

        IBuyingBll buyingBll;
        public BuiyngController(IBuyingBll _buyingBll)
        {
            buyingBll = _buyingBll;
        }

        [HttpGet("GetAll")]
        public ActionResult GetAllBuying()
        {
            return Ok(buyingBll.GetAll());
        }

        [HttpGet("GetBuyingById")]
        public ActionResult GetBuyingById(string id)
        {
            return Ok(buyingBll.GetBuyingById(id));
        }

        [HttpGet("GetBuyingtByIdDate")]
        public ActionResult GetBuyingtByIdDate(string id,DateTime d)
        {
            return Ok(buyingBll.GetBuyingtByIdDate(id,d));
        }


        [HttpPost("AddBuying")]
        public ActionResult AddBuying(BuyingDTO b)
        {
            return Ok(buyingBll.AddBuying(b));
        }


        [HttpDelete("DeleteBuing/{id}")]
        public ActionResult DeleteBuing(string id,DateTime d)
        {
            return Ok(buyingBll.DeleteBuying(id,d));
        }
    }
}
