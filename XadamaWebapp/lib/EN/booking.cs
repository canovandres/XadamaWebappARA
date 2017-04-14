using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lib.EN
{
    class Booking
    {
        public String client { get; set; } //FK + NNV
        public String calendar { get; set; } //PK + FK
        public int room { get; set; } // PK + FK
        public String hotel { get; set; } //PK + FK

        public Booking(String client, String calendar, int room, String hotel)
        {
            this.client = client;
            this.calendar = calendar;
            this.room = room;
            this.hotel = hotel;
        }

        void Create(String dbname)
        {
            CAD.CADBooking b = new CAD.CADBooking(dbname);
            b.Create(this);
        }

        void Read(String dbname)
        {
            CAD.CADBooking b = new CAD.CADBooking(dbname);
            Booking p = b.Read(calendar, hotel, room);
            client = p.client;
            calendar = p.calendar;
            room = p.room;
            hotel = p.hotel;
        }

        void Update(String dbname)
        {
            CAD.CADBooking b = new CAD.CADBooking(dbname);
            b.Update(this);
        }

        void Delete(String dbname)
        {
            CAD.CADBooking b = new CAD.CADBooking(dbname);
            b.Delete(calendar, hotel, room);
        }

    }
}
