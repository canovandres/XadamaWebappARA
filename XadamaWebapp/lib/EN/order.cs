using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lib.EN
{
    class Order
    {
        private List<Product> _products = new List<Product>();

        public Order(int cod, String date, String email)
        {
            this.cod = cod;
            this.date = date;
            this.email = email;
        }

        public int cod { get; set; }

        public String date { get; set; }

        public String email { get; set; }

        public List<Product> products
        {
            get { return _products; }
        }

        public void addProduct(Product p)
        {
            _products.Add(p);
        }

        public void removeProduct(Product p)
        {
            _products.Remove(p);
        }

        public void save(String dbname)
        {
            CAD.CADOrder cadorder = new CAD.CADOrder(dbname);
            cadorder.Create(this);
        }

        public void read(String dbname, int cod, String email)
        {
            CAD.CADOrder cadorder = new CAD.CADOrder(dbname);
            Order order = (Order)cadorder.Read(cod, email);
            this.cod = order.cod;
            this.date = order.date;
            this.email = order.email;
        }

        public void update(String dbname, Order order)
        {
            CAD.CADOrder cadorder = new CAD.CADOrder(dbname);
            cadorder.Update(this);
        }

        public void delete(String dbname, int cod, String email)
        {
            CAD.CADOrder cadorder = new CAD.CADOrder(dbname);
            cadorder.Delete(cod, email);
        }
    }
}