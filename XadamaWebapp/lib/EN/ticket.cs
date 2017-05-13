using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lib.EN
{
    public class Ticket
    {
        public String cod { get; set; }
        public String client { get; set; }
        public String day { get; set; }
        public int price { get; set; }
        public String type { get; set; }

        public Ticket(String cod, String client = "", String day = "", int price = 0, String type = "")
        {
            this.cod = cod;
            this.client = client;
            this.day = day;
            this.price = price;
            this.type = type;
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
    }
}