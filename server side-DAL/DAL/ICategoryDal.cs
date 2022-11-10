using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

using DAL.Models;
namespace DAL
{
    public interface ICategoryDal
    {
        public List<Category> GetAll();
        public short GetIdByName(string name);
        public Category GetNameByCode(short code);
        public string AddCategory(Category newCategory);
        public string UpdateCategory(short id, Category editCategory);
        public string DeleteCategory(string name);
    }
}
