using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lib.EN
{
    class Ticket
    {
        public Ticket(String cod, String date = "", int price = 0, String email = "")
        {
            this.cod = cod;
            this.date = date;
            this.price = price;
            this.email = email;
        }

        public String cod { get; set; }

        public String date { get; set; }

        public int price { get; set; }

        public String email { get; set; }

        public void save(String dbname)
        {
            CAD.CADTicket cadticket = new CAD.CADTicket(dbname);
            cadticket.Create(this);
        }

        public void read(String dbname, String cod)
        {
            CAD.CADTicket cadticket = new CAD.CADTicket(dbname);
            Ticket ticket = (Ticket) cadticket.Read(cod);
            this.cod = ticket.cod;
            this.date = ticket.date;
            this.price = ticket.price;
            this.email = ticket.email;
        }

        public void update(String dbname, Ticket ticket)
        {
            CAD.CADTicket cadticket = new CAD.CADTicket(dbname);
            cadticket.Update(this);
        }

        public void delete(String dbname, String cod)
        {
            CAD.CADTicket cadticket = new CAD.CADTicket(dbname);
            cadticket.Delete(cod);
        }
    }
}