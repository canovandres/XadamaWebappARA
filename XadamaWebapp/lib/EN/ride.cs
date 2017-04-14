using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lib.EN
{
    class Ride
    {
        public String cod { get; set; }

        public String name { get; set; }

        public int minHeight { get; set; }

        public int speed { get; set; }

        public int height { get; set; }

        public Ride(String cod = "", String name = "", int minHeight = 0, int speed = 0, int height = 0)
        {
            this.cod = cod;
            this.name = name;
            this.minHeight = minHeight;
            this.speed = speed;
            this.height = height;
        }

        public void save(String db)
        {
            CAD.CADRide cadride = new CAD.CADRide(db);
            cadride.Create(this);
        }

        public void read(String db, String cod)
        {
            CAD.CADRide cadride = new CAD.CADRide(db);
            Ride ride = (Ride)cadride.Read(cod);
            this.cod = ride.cod;
            this.name = ride.name;
            this.minHeight = ride.minHeight;
            this.speed = ride.speed;
            this.height = ride.height;
        }

        public void update(String db, EN.Ride ride)
        {
            CAD.CADRide cadride = new CAD.CADRide(db);
            cadride.Update(this);
        }

        public void delete(String db, String cod)
        {
            CAD.CADRide cadride = new CAD.CADRide(db);
            cadride.Delete(this);
        }





    }
}
