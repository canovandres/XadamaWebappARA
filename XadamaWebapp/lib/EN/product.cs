using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lib.EN
{
    class Product
    {
        public String id { get; set; }
        public String name { get; set; }
        public float price { get; set; }
        public String image { get; set; }
        public int stock { get; set; }
        public Product(String id,String name="",float price=0,String image="",int stock=0)
        {
            this.id = id;
            this.name = name;
            this.price = price;
            this.image = image;
            this.stock = stock;
        }

        void Create(String dbname)//calls the cadproduct method to create a new product in the database
        {
            CAD.CADProduct c = new CAD.CADProduct(dbname);
            c.Create(this);
        }

        void Read(String dbname)//calls the cadproduct method to read a product with the same id as the actual one
        {
            CAD.CADProduct c = new CAD.CADProduct(dbname);
            Product p = c.Read(id);
            id = p.id;
            name = p.name;
            price = p.price;
            image = p.image;
            stock = p.stock;
        }

        void Update(String dbname)//updates the product with the same id as the actual one by calling the cadproduct's appropiate method
        {
            CAD.CADProduct c = new CAD.CADProduct(dbname);
            c.Update(this);
        }

        void Delete(String dbname)//deletes the product by calling cadproduct
        {
            CAD.CADProduct c = new CAD.CADProduct(dbname);
            c.Delete(id);
        }

    }
}
