using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Models;


namespace DAL
{
    public interface IProductsDal
    {
        public List<Product> GetAll();
        public Product GetProductByCode(short code);
        public string AddProduct(Product newProduct);
        public List<Product> GetProductByCategory(short category);
        public string UpdateProduct(short code, Product editProduct);
        public string DeleteProduct(short code);
    }
}
