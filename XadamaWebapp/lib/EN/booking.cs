using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lib.EN
{
    public class Booking
    {
        public Client client { get; set; } 
        public String date { get; set; } 
        public int room { get; set; } 
        public String hotel { get; set; } 
        public float price { get; set; }

        public Booking(Client client, String date, int room = 0, String hotel = "", float price = 0)
        {
            this.client = client;
            this.date = date;
            this.room = room;
            this.hotel = hotel;
            this.price = price;
        }

        void Create(String dbname)
        {
            CAD.CADBooking b = new CAD.CADBooking(dbname);
            b.Create(this);
        }

        void Read(String dbname)
        {
            CAD.CADBooking b = new CAD.CADBooking(dbname);
            Booking p = b.Read(date, room, hotel);
            client = p.client;
            date = p.date;
            room = p.room;
            hotel = p.hotel;
            price = p.price;
        }

        void Update(String dbname)
        {
            CAD.CADBooking b = new CAD.CADBooking(dbname);
            b.Update(this);
        }

        void Delete(String dbname)
        {
            CAD.CADBooking b = new CAD.CADBooking(dbname);
            b.Delete(date, room, hotel);
        }
    }
}
