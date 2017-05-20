using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lib.EN
{
    public class Reservation
    {
        public Reservation(String client, int table, String restaurant, String date = "", int ntables = 0)
        {
            this.client = client;
            this.table = table;
            this.restaurant = restaurant;
            this.date = date;
            this.ntables = ntables;
        }

        public String client { get; set; }
        public int table { get; set; }
        public String restaurant { get; set; }
        public String date { get; set; }
        public int ntables { get; set; }

        void Create()
        {
            CAD.CADReservation r = new CAD.CADReservation();
            r.Create(this);
        }

        void Read()
        {
            CAD.CADReservation r = new CAD.CADReservation();
            Reservation res = r.Read(client, table, restaurant);
            client = res.client;
            table = res.table;
            restaurant = res.restaurant;
            date = res.date;
        }

        void Update()
        {
            CAD.CADReservation r = new CAD.CADReservation();
            r.Update(this);
        }

        void Delete()
        {
            CAD.CADReservation r = new CAD.CADReservation();
            r.Delete(client, table, restaurant);
        }

        public int tablesAvailable()
        {
            CAD.CADReservation r = new CAD.CADReservation();
            int freetables = r.tablesAvailable(this);
            return freetables;
        }
        public bool isAvailable()
        {
            CAD.CADReservation r = new CAD.CADReservation();
            bool available = r.isAvailable(this);
            return available;
        }

        public bool reserveTables()
        {
            CAD.CADReservation r = new CAD.CADReservation();
            bool done = r.reserveTables(this);
            return done;
        }
    }
}

