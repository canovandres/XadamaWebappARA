using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lib.EN
{
    public class Booking
    {
        public String client { get; set; }
        public String datestart { get; set; }
        public String dateend { get; set; }
        public int room { get; set; }
        public String hotel { get; set; }
        public float price { get; set; }
        public int nights { get; set; }


        public Booking(String client, int room, String hotel, String datestart, String dateend)
        {
            this.client = client;
            this.datestart = datestart;
            this.dateend = dateend;
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
            Booking p = b.Read(client, room, hotel);
            client = p.client;
            datestart = p.datestart;
            dateend = p.dateend;
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
            b.Delete(client, room, hotel);
        }
    }
}
