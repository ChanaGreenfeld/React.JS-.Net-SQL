using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DAL.Models;

namespace DTO
{
    public class Auto : AutoMapper.Profile
    {
        public Auto()
        {
            //Customer
            CreateMap<Customer, CustomerDTO>();
            CreateMap<CustomerDTO, Customer>();
            //Product
            CreateMap<Product, ProductDTO>();
            CreateMap<ProductDTO, Product>();
            //Category
            CreateMap<Category, CategoryDTO>();
            CreateMap<CategoryDTO, Category>();
            //Buying
            CreateMap<Buying, BuyingDTO>();
            CreateMap<BuyingDTO, Buying>();
            //BuyingDetail
            CreateMap<BuyingDetail, BuyingDetailDTO>();
            CreateMap<BuyingDetailDTO, BuyingDetail>();
        }
    }
}
