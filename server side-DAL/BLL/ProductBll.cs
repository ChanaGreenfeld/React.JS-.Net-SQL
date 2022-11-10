using DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;
using AutoMapper;

namespace BLL
{
    public class ProductBll : IProductBLL
    {

        IProductsDal productsDal;
        IMapper imapper;
        public ProductBll(IProductsDal _productsDal)
        {
            productsDal = _productsDal;
            var config = new MapperConfiguration(c => c.AddProfile<Auto>());
            imapper = config.CreateMapper();
        }

        public string AddProduct(ProductDTO newProduct)
        {
            Product p = imapper.Map<ProductDTO,Product > (newProduct);
            return productsDal.AddProduct(p);
        }

        public string DeleteProduct(short code)
        {
            return productsDal.DeleteProduct(code);
        }

        public List<ProductDTO> GetAll()
        {
            List<Product> list = productsDal.GetAll();
            return imapper.Map<List<Product>, List<ProductDTO>>(list);
        }

        public ProductDTO GetProductByCode(short code)
        {
            Product c = productsDal.GetProductByCode(code);
            return imapper.Map<Product, ProductDTO>(c);
        }

        public List<ProductDTO> GetProductByCategory(short category)
        {
            List<Product> c = productsDal.GetProductByCategory(category);
            return imapper.Map<List<Product>,List<ProductDTO>>(c);
        }
        public string UpdateProduct(short code, ProductDTO editProduct)
        {
            Product c = imapper.Map<ProductDTO, Product>(editProduct);
            return productsDal.UpdateProduct(code, c);
        }
    }
}
