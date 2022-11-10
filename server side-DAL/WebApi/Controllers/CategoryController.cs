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
    public class CategoryController : ControllerBase
    {
        ICategoryBll categoryBll;
        public CategoryController(ICategoryBll _categoryBll)
        {
            categoryBll = _categoryBll;
        }

        [HttpGet("GetAll")]
        public ActionResult GetAllCategory()
        {
            return Ok(categoryBll.GetAll());
        }

        [HttpGet("GetIdByName/{name}")]
        public ActionResult GetIdByName(string name)
        {
            return Ok(categoryBll.GetIdByName(name));
        }

        [HttpGet("GetNameBycode/{code}")]
        public ActionResult GetNameBycode(short code)
        {
            return Ok(categoryBll.GetNameByCode(code));
        }




        [HttpPost("AddCategory")]
        public ActionResult AddCategory(CategoryDTO c)
        {
            return Ok(categoryBll.AddCategory(c));
        }

        [HttpPut("UpdateCategory/{id}")]
        public ActionResult UpdateCategory(short id, CategoryDTO c)
        {
            return Ok(categoryBll.UpdateCategory(id, c));
        }


        [HttpDelete("DeleteCategory/{id}")]
        public ActionResult DeleteCategory(string id)
        {
            return Ok(categoryBll.DeleteCategory(id));
        }
    }
}
