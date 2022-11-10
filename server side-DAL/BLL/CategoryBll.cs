using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DAL.Models;
using AutoMapper;
using DTO;

namespace BLL
{
    public class CategoryBll:ICategoryBll
    {
        ICategoryDal categoryDal;
        IMapper imapper;
        public CategoryBll(ICategoryDal _categoryDal)
        {
            categoryDal = _categoryDal;
            var config = new MapperConfiguration(c => c.AddProfile<Auto>());
            imapper = config.CreateMapper();
        }

        public string AddCategory(CategoryDTO newCategory)
        {
            Category c = imapper.Map<CategoryDTO, Category>(newCategory);
            return categoryDal.AddCategory(c);
        }

        public string DeleteCategory(string name)
        {
            return categoryDal.DeleteCategory(name);
        }

        public List<CategoryDTO> GetAll()
        {
            List<Category> list = categoryDal.GetAll();
            return imapper.Map<List<Category>, List<CategoryDTO>>(list);
        }

        public short GetIdByName(string name)
        {
            return categoryDal.GetIdByName(name);
        }

        public CategoryDTO GetNameByCode(short code)
        {
            Category c= categoryDal.GetNameByCode(code);
            return imapper.Map<Category, CategoryDTO>(c);
        }


        public string UpdateCategory(short id, CategoryDTO editCategory)
        {
            Category c = imapper.Map<CategoryDTO, Category>(editCategory);
            return categoryDal.UpdateCategory(id, c);
        }
    }
}
