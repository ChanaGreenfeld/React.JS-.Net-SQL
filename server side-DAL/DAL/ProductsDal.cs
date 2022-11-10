using DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace DAL
{
    public class ProductsDal : IProductsDal
    {
        STOREContext myStore;
        public ProductsDal(STOREContext _myStore)
        {
            myStore = _myStore;
        }
        public string AddProduct(Product newProduct)
        {
            try
            {
                myStore.Products.Add(newProduct);
                myStore.SaveChanges();
                return "Succesful";
            }
            catch (Exception e)
            {

                return "Faild";
            }
        }

        public string DeleteProduct(short code)
        {
            try
            {
                Product c = null;
                for (int i = 0; i < myStore.Products.Count(); i++)
                {
                    if (myStore.Products.ToList()[i].CodeProduct == code)
                        c = myStore.Products.ToList()[i];
                }
                myStore.Products.Remove(c);
                myStore.SaveChanges();
                return "Succesful";
            }
            catch (Exception e)
            {

                return "Faild";
            }
        }

        public List<Product> GetAll()
        {
            return myStore.Products.ToList();
        }

        public Product GetProductByCode(short code)
        {
            Product c = null;
            for (int i = 0; i < myStore.Products.Count(); i++)
            {
                if (myStore.Products.ToList()[i].CodeProduct == code)
                    c = myStore.Products.ToList()[i];
            }
            return c;
        }

        public List<Product> GetProductByCategory(short category)
        {
            List<Product> c = new List<Product>();
            for (int i = 0; i < myStore.Products.Count(); i++)
            {
                if (myStore.Products.ToList()[i].CodeCategory == category)
                    c.Add(myStore.Products.ToList()[i]);
            }
            return c;
        }
        public string UpdateProduct(short code, Product editProduct)
        {
            try
            {
                for (int i = 0; i < myStore.Products.Count(); i++)
                {
                    if (myStore.Products.ToList()[i].CodeProduct==code)
                    {
                        
                        myStore.Products.ToList()[i].CodeCategory = editProduct.CodeCategory;
                        if (editProduct.Cost > 0)
                            myStore.Products.ToList()[i].Cost = editProduct.Cost;
                        if (editProduct.DescriptionProduct !="")
                            myStore.Products.ToList()[i].DescriptionProduct = editProduct.DescriptionProduct;
                        if (editProduct.NameProduct !="")
                            myStore.Products.ToList()[i].NameProduct = editProduct.NameProduct;
                        if (editProduct.Picture !="")
                            myStore.Products.ToList()[i].Picture = editProduct.Picture;
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
