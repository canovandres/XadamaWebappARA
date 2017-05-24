﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lib.EN
{
    public class Order
    {
        public List<Product> _products = new List<Product>();

        public Order(int cod, Client client = null, String date = "")
        {
            this.cod = cod;
            this.date = date;
            this.client = client;
        }

        public int cod { get; set; }

        public String date { get; set; }

        public Client client { get; set; }

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

        public void read(String dbname, String cod, String email)
        {
            CAD.CADOrder cadorder = new CAD.CADOrder(dbname);
            Order order = (Order)cadorder.Read(cod, email);
            this.cod = order.cod;
            this.date = order.date;
            this.client = order.client;
        }

        public void update(String dbname, Order order)
        {
            CAD.CADOrder cadorder = new CAD.CADOrder(dbname);
            cadorder.Update(this);
        }

        public void delete(String dbname, String cod)
        {
            CAD.CADOrder cadorder = new CAD.CADOrder(dbname);
            cadorder.Delete(cod);
        }

        public DataTable getOrderInfo(String dbname, String clientid)
        {
            CAD.CADOrder cadorder = new CAD.CADOrder(dbname);
            return cadorder.getOrderInfo(clientid);
        }

        public void buyItems(String dbname, String cod, int quantity)
        {
            CAD.CADOrder cadorder = new CAD.CADOrder(dbname);
            cadorder.buyItems(cod, quantity,this);
        }

        public static int NextCode()
        {
            CAD.CADOrder c = new CAD.CADOrder("");
            return c.NextCode();
        }
    }
}