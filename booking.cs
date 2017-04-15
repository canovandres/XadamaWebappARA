using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lib.EN
{
    class Booking
    {
        public String client { get; set; } 
        public String calendar { get; set; } 
        public int room { get; set; } 
        public String hotel { get; set; } 
        public float price { get; set; }

        public Booking(String client, String calendar, int room, String hotel, float price)
        {
            this.client = client;
            this.calendar = calendar;
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
            Booking p = b.Read(calendar, room, hotel);
            client = p.client;
            calendar = p.calendar;
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
            b.Delete(calendar, room, hotel);
        }
    }
}
