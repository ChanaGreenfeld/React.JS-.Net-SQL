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
    public class ProductController : ControllerBase
    {

        IProductBLL ProductBLL;
        public ProductController(IProductBLL _ProductBLL)
        {
            ProductBLL = _ProductBLL;
        }

        [HttpGet("GetAll")]
        public ActionResult GetAllProduct()
        {
            return Ok(ProductBLL.GetAll());
        }

        [HttpGet("GetProductByCode/{code}")]
        public ActionResult GetProductByCode(short code)
        {
            return Ok(ProductBLL.GetProductByCode(code));
        }

        [HttpGet("GetProductByCategory/{category}")]
        public ActionResult GetProductByCategory(short category)
        {
            return Ok(ProductBLL.GetProductByCategory(category));
        }

        [HttpPost("AddProduct")]
        public ActionResult AddProduct(ProductDTO c)
        {
            return Ok(ProductBLL.AddProduct(c));
        }

        [HttpPut("UpdateProduct/{code}")]
        public ActionResult UpdateProduct(short code, ProductDTO c)
        {
            return Ok(ProductBLL.UpdateProduct(code, c));
        }


        [HttpDelete("DeleteProduct/{code}")]
        public ActionResult DeleteUser(short code)
        {
            return Ok(ProductBLL.DeleteProduct(code));
        }


    }
}
