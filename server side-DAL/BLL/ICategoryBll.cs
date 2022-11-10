using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
namespace BLL
{
    public interface ICategoryBll
    {
        public List<CategoryDTO> GetAll();
        public short GetIdByName(string name);
        public CategoryDTO GetNameByCode(short code);
        public string AddCategory(CategoryDTO newCategory);
        public string UpdateCategory(short id, CategoryDTO editCategory);
        public string DeleteCategory(string name);
    }
}
