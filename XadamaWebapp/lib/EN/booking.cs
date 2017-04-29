using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lib.EN
{
    class Booking
    {
<<<<<<< HEAD
        public String client { get; set; } 
        public String calendar { get; set; } 
        public int room { get; set; } 
        public String hotel { get; set; } 
        public float price { get; set; }

        public Booking(String client, String calendar, int room, String hotel, float price)
=======
        public String client { get; set; } //FK + NNV
        public String calendar { get; set; } //PK + FK
        public int room { get; set; } // PK + FK
        public String hotel { get; set; } //PK + FK

        public Booking(String client, String calendar, int room, String hotel)
>>>>>>> origin/48792973Z
        {
            this.client = client;
            this.calendar = calendar;
            this.room = room;
            this.hotel = hotel;
<<<<<<< HEAD
            this.price = price;
=======
>>>>>>> origin/48792973Z
        }

        void Create(String dbname)
        {
            CAD.CADBooking b = new CAD.CADBooking(dbname);
            b.Create(this);
        }

        void Read(String dbname)
        {
            CAD.CADBooking b = new CAD.CADBooking(dbname);
<<<<<<< HEAD
            Booking p = b.Read(calendar, room, hotel);
=======
            Booking p = b.Read(calendar, hotel, room);
>>>>>>> origin/48792973Z
            client = p.client;
            calendar = p.calendar;
            room = p.room;
            hotel = p.hotel;
<<<<<<< HEAD
            price = p.price;
=======
>>>>>>> origin/48792973Z
        }

        void Update(String dbname)
        {
            CAD.CADBooking b = new CAD.CADBooking(dbname);
            b.Update(this);
        }

        void Delete(String dbname)
        {
            CAD.CADBooking b = new CAD.CADBooking(dbname);
<<<<<<< HEAD
            b.Delete(calendar, room, hotel);
        }
=======
            b.Delete(calendar, hotel, room);
        }

>>>>>>> origin/48792973Z
    }
}
