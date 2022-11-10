using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BLL;
using DTO;

namespace WebApi2.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BuyingDetailsController : ControllerBase
    {
        IBuyingDetailBLL buyingDetailBLL;
        public BuyingDetailsController(IBuyingDetailBLL _buyingDetailBLL)
        {
            buyingDetailBLL = _buyingDetailBLL;
        }

        [HttpGet("GetAllBuying")]
        public ActionResult GetAllBuying()
        {
            return Ok(buyingDetailBLL.GetAll());
        }

        [HttpGet("GetBuyingBycodeProduct")]
        public ActionResult GetBuyingBycodeProduct(short codeProduct)
        {
            return Ok(buyingDetailBLL.GetBuyingDetailstByProduct(codeProduct));
        }


        [HttpPost("AddBuyingDetail")]
        public ActionResult AddBuyingDetail(BuyingDetailDTO b)
        {
            return Ok(buyingDetailBLL.AddBuyingDetails(b));
        }


        [HttpDelete("DeleteBuingDetails/{codBuying}")]
        public ActionResult DeleteBuingDetails(short codBuying)
        {
            return Ok(buyingDetailBLL.DeleteBuyingDetails(codBuying));
        }
    }
}
