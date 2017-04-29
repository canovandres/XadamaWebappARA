using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lib.EN
{
    class Hotel
    {
        public String id { get; set; }
        public String name { get; set; }
        public String zone { get; set; } // Relationship with zone 1,1
        public Hotel(String id, String name="", String zone)
        {
            this.id = id;
            this.name = name;
            this.zone = zone;
        }

        void Create(String dbname)
        {
            CAD.CADHotel h = new CAD.CADHotel(dbname);
            h.Create(this);
        }

        void Read(String dbname)
        {
            CAD.CADHotel h = new CAD.CADHotel(dbname);
            Hotel p = h.Read(id);
            id = p.id;
            name = p.name;
        }

        void Update(String dbname)
        {
            CAD.CADHotel h = new CAD.CADHotel(dbname);
            h.Update(this);
        }

        void Delete(String dbname)
        {
            CAD.CADHotel h = new CAD.CADHotel(dbname);
            h.Delete(id);
        }

    }
}

