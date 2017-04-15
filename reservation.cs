using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lib.EN
{
    class Reservation
    {
        public Reservation(int id, string date="", int idrestaurant=0, string eclient = "")
        {
            this.id = id;
            this.date = date;

        }

        public int id { get; set; }
        public string date { get; set; }
        public int idrestaurant { get; set; }
        public string eclient { get; set; }

        public void Save(String dbname)
        {
            CAD.CADReservation reservation = new CAD.CADReservation(dbname);
            reservation.Create(this);
        }

        public void Read(String dbname, int id)
        {
            CAD.CADReservation reservation = new CAD.CADReservation(dbname);
            Reservation r = (Reservation)reservation.Read();
            this.id = r.id;
            this.date = r.date;
            this.eclient = r.eclient;
            this.idrestaurant = r.idrestaurant;

        }

        public void Update(String dbname, EN.Reservation r)
        {
            CAD.CADReservation reservation = new CAD.CADReservation(dbname);
            reservation.Update(r);
        }

        public void delete(String dbname, int id)
        {
            CAD.CADReservation reservation = new CAD.CADReservation(dbname);
            reservation.Delete(id);
        }
    }
}
