using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace lib.EN
{
    class Ride
    {
        public String cod { get; set; }

        public String name { get; set; }

        public String zone { get; set; }

        public String description { get; set; }

        public int minHeight { get; set; }

        public int speed { get; set; }

        public int height { get; set; }

        public String image { get; set; }

        public Ride(String cod, String name, String zone, String description = "", int minHeight = 0, int speed = 0, int height = 0, String image="")
        {
            this.cod = cod;
            this.name = name;
            this.zone = zone;
            this.description = description;
            this.minHeight = minHeight;
            this.speed = speed;
            this.height = height;
            this.image = image;
        }

        public void save(String db)
        {
            CAD.CADRide cadride = new CAD.CADRide(db);
            cadride.Create(this);
        }

        public void read(String db)
        {
            CAD.CADRide cadride = new CAD.CADRide(db);
            Ride ride = (Ride)cadride.Read(cod);
            this.cod = ride.cod;
            this.name = ride.name;
            this.zone = ride.zone;
            this.description = ride.description;
            this.minHeight = ride.minHeight;
            this.speed = ride.speed;
            this.height = ride.height;
            this.image = image;
        }

        public void update(String db)
        {
            CAD.CADRide cadride = new CAD.CADRide(db);
            cadride.Update(this);
        }

        public void delete(String db)
        {
            CAD.CADRide cadride = new CAD.CADRide(db);
            cadride.Delete(cod);
        }

        public DataTable ShowAllRides(String db)
        {
            CAD.CADRide cadride = new CAD.CADRide(db);
            return cadride.ShowAllRides();
        }
    }
}
