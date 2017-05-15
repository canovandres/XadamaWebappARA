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
        public int nsingle { get; set; }
        public int ndouble { get; set; }

        public String board { get; set; }


        public Booking(String client, int room, String hotel, String datestart, String dateend, String board, int nsingle=0, int ndouble=0)
        {
            this.client = client;
            this.datestart = datestart;
            this.dateend = dateend;
            this.room = room;
            this.hotel = hotel;
            this.nsingle = nsingle;
            this.ndouble = ndouble;
            this.board = board;
        }

        public void Create()
        {
            CAD.CADBooking b = new CAD.CADBooking();
            b.Create(this);
        }

        public void Read()
        {
            CAD.CADBooking b = new CAD.CADBooking();
            Booking p = b.Read(client, room, hotel);
            client = p.client;
            datestart = p.datestart;
            dateend = p.dateend;
            room = p.room;
            hotel = p.hotel;
        }

        public void Update()
        {
            CAD.CADBooking b = new CAD.CADBooking();
            b.Update(this);
        }

        public void Delete()
        {
            CAD.CADBooking b = new CAD.CADBooking();
            b.Delete(this);
        }

        public float getPrice()
        {
            CAD.CADBooking b = new CAD.CADBooking();
            float price = b.getPrice(this);
            return price;
        }

        public bool isAvalaible()
        {
            CAD.CADBooking b = new CAD.CADBooking();
            bool ok = b.isAvalaible(this);
            return ok;
        }

        public bool bookRooms()
        {
            CAD.CADBooking b = new CAD.CADBooking();
            bool ok = b.bookRooms(this);
            return ok;
        }
    }
}
