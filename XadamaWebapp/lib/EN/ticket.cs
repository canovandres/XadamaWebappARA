
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
        public String cod { get; set; }
        public String client { get; set; }
        public String day { get; set; }
        public float price { get; set; }
        public String type { get; set; }
        public int nadults { get; set; }
        public int nchildren { get; set; }

        public Ticket(String cod, String client="", String day="", float price=0, String type="", int nadults=0, int nchildren=0)
        {
            this.cod = CAD.CADTicket.NextCode();
            this.client = client;
            this.day = day;
            this.price = price;
            this.type = type;
            this.nadults = nadults;
            this.nchildren = nchildren;
        }

        public void Create()
        {
            CAD.CADTicket cadticket = new CAD.CADTicket();
            cadticket.Create(this);
        }

        public void Read()
        {
            CAD.CADTicket cadticket = new CAD.CADTicket();
            Ticket t = (Ticket)cadticket.Read(cod);
            this.cod = t.cod;
            this.client = t.client;
            this.day = t.day;
            this.price = t.price;
            this.type = t.type;
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

        public DataSet typePrice()
        {
            CAD.CADTicket t = new CAD.CADTicket();
            return t.typePrice();
        }

        public bool buyTickets()
        {
            CAD.CADTicket t = new CAD.CADTicket();
            bool done = t.buyTickets(this);
            return done;
        }
    }
}