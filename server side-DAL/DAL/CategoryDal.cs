using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Models;

namespace DAL
{
    public class CategoryDal:ICategoryDal
    {
        STOREContext myStore;
        public CategoryDal(STOREContext _myStore)
        {
            myStore = _myStore;
        }
        public string AddCategory(Category newCategory)
        {
            try
            {
                myStore.Categories.Add(newCategory);
                myStore.SaveChanges();
                return "Succesful";
            }
            catch (Exception e)
            {

                return "Faild";
            }
        }

        public string DeleteCategory(string name)
        {
            try
            {
                Category c = null;
                for (int i = 0; i < myStore.Categories.Count(); i++)
                {
                    if (myStore.Categories.ToList()[i].NameCategory == name)
                        c = myStore.Categories.ToList()[i];
                }
                myStore.Categories.Remove(c);
                myStore.SaveChanges();
                return "Succesful";
            }
            catch (Exception e)
            {

                return "Faild";
            }
        }

        public List<Category> GetAll()
        {
            return myStore.Categories.ToList();
        }

        public short GetIdByName(string name)
        {
            try
            {
                for (int i = 0; i < myStore.Categories.Count(); i++)
                {
                    if (myStore.Categories.ToList()[i].NameCategory.Equals(name))
                    {
                       return myStore.Categories.ToList()[i].CodeCategory;
                    }
                }
                return 0;
            }
            catch (Exception)
            {

                return 0;
            }
        }

        public Category GetNameByCode(short code)
        {
            try
            {
                for (int i = 0; i < myStore.Categories.Count(); i++)
                {
                    if (myStore.Categories.ToList()[i].CodeCategory==code)
                    {
                        return myStore.Categories.ToList()[i];
                    }
                }
                return new Category();
            }
            catch (Exception)
            {
                return new Category();
            }
        }
        public string UpdateCategory(short id, Category editCategory)
        {
            try
            {
                for (int i = 0; i < myStore.Categories.Count(); i++)
                {
                    if (myStore.Categories.ToList()[i].CodeCategory.Equals(id))
                    {
                        myStore.Categories.ToList()[i].NameCategory = editCategory.NameCategory;
                    }
                }
                myStore.SaveChanges();
                return "Succesful";
            }
            catch (Exception)
            {

                return "Faild";
            }
        }
    }
}
