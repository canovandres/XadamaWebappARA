using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lib.EN
{
    public class Product
    {
        public String cod { get; set; }
        public String name { get; set; }
        public String type { get; set; }

        public String description { get; set; }
        public float price { get; set; }
        public String image { get; set; }
        public int stock { get; set; }
        public Product(String cod="", String name = "", float price = 0, String image = "", int stock = 0, String type="", String description="")
        {
            this.cod = cod;
            this.name = name;
            this.price = price;
            this.image = image;
            this.stock = stock;
            this.type = type;
            this.description = description;
        }

        void Create()//calls the cadproduct method to create a new product in the database
        {
            CAD.CADProduct c = new CAD.CADProduct();
            c.Create(this);
        }

        void Read(String cod)//calls the cadproduct method to read a product with the same id as the actual one
        {
            CAD.CADProduct c = new CAD.CADProduct();
            Product p = c.Read(cod);
            cod = p.cod;
            name = p.name;
            price = p.price;
            image = p.image;
            stock = p.stock;
        }

        void Update()//updates the product with the same id as the actual one by calling the cadproduct's appropiate method
        {
            CAD.CADProduct c = new CAD.CADProduct();
            c.Update(this);
        }

        void Delete(String dbname, String cod)//deletes the product by calling cadproduct
        {
            CAD.CADProduct c = new CAD.CADProduct();
            c.Delete(cod);
        }

        public DataSet showTypeProducts(String type)
        {
            CAD.CADProduct c = new CAD.CADProduct();
            return c.showTypeProducts(type);
        }

        public DataSet searchProduct(String search)
        {
            CAD.CADProduct c = new CAD.CADProduct();
            return c.searchProduct(search);
        }

    }
}
