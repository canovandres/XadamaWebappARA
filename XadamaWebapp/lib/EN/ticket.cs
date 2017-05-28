
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


namespace lib.EN
{
    public class Ticket
    {
        public int cod { get; set; }
        public String client { get; set; }
        public String day { get; set; }
        public float totalprice { get; set; }
        public string type { get; set; }
        public int quantity { get; set; }

        public Ticket(String client, String day, String type="", int quantity = 0, float totalprice = 0, int cod=0)
        {
            this.cod = CAD.CADTicket.NextCode();
            this.client = client;
            this.day = day;
            this.totalprice = totalPrice();
            this.type = type;
            this.quantity = quantity;
        }

        public void Create()
        {
            CAD.CADTicket cadticket = new CAD.CADTicket();
            cadticket.Create(this);
        }

        public void Read()
        {
            CAD.CADTicket cadticket = new CAD.CADTicket();
            Ticket t = (Ticket)cadticket.Read(cod, client, day);
            cod = t.cod;
            client = t.client;
            day = t.day;
            totalprice = t.totalprice;
            type = t.type;
            quantity = t.quantity;
        }

        public void Update()
        {
            CAD.CADTicket t = new CAD.CADTicket();
            t.Update(this);
        }

        public void Delete()
        {
            CAD.CADTicket t = new CAD.CADTicket();
            t.Delete(cod);
        }

        public float totalPrice()
        {
            CAD.CADTicket t = new CAD.CADTicket();
            return t.totalPrice(this);
        }
        // REVISAR
        public bool buyTickets()
        {
            CAD.CADTicket t = new CAD.CADTicket();
            bool done = t.buyTickets(this);
            return done;
        }

        public static DataSet getTypes()
        {
            CAD.CADTicket t = new CAD.CADTicket();
            return t.getTypes();
        }

        public static DataSet ListAllTickets()
        {
            CAD.CADTicket t = new CAD.CADTicket();
            DataSet tickets = t.ListAllTickets();
            return tickets;
        }

        public DataSet DeleteTicket(int i)
        {
            CAD.CADTicket t = new CAD.CADTicket();
            DataSet a = t.DeleteTicket(this, i);
            return a;
        }

        public void UpdatePrice(String type, float price)
        {
            CAD.CADTicket t = new CAD.CADTicket();
            t.UpdatePrice(type, price);
        }

        public void CreateType(String type, float price)
        {
            CAD.CADTicket t = new CAD.CADTicket();
            t.CreateType(type, price);
        }
    }
}