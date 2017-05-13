using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lib.EN
{
    public class Reservation
    {
        public Reservation(string cod, Client client = null, string date = "", string idrestaurant = "")
        {
            this.cod = cod;
            this.date = date;
            this.idrestaurant = idrestaurant;
            this.client = client;
        }

        public string cod { get; set; }
        public string date { get; set; }
        public string idrestaurant { get; set; }
        public Client client { get; set; }

        public void save(String dbname)
        {
            CAD.CADReservation reservation = new CAD.CADReservation(dbname);
            reservation.Create(this);
        }

        public void read(String dbname, String id)
        {
            CAD.CADReservation reservation = new CAD.CADReservation(dbname);
            Reservation r = (Reservation)reservation.Read(id);
            this.cod = r.cod;
            this.date = r.date;
            this.client = r.client;
            this.idrestaurant = r.idrestaurant;

        }

        public void update(String dbname, EN.Reservation r)
        {
            CAD.CADReservation reservation = new CAD.CADReservation(dbname);
            reservation.Update(r);
        }

        public void delete(String dbname, String cod)
        {
            CAD.CADReservation reservation = new CAD.CADReservation(dbname);
            reservation.Delete(cod);
        }
    }
}
