using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using DAL;
using DAL.Models;

namespace BLL
{
    public interface IProductBLL
    {
        public List<ProductDTO> GetAll();
        public ProductDTO GetProductByCode(short code);
        public string AddProduct(ProductDTO newProduct);
        public List<ProductDTO> GetProductByCategory(short category);
        public string UpdateProduct(short code, ProductDTO editProduct);
        public string DeleteProduct(short code);
    }
}
