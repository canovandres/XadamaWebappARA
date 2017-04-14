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
        public Hotel(String id, String name="")
        {
            this.id = id;
            this.name = name;
        }

        void Create(String dbname)
        {
            CAD.CADHotel h = new CAD.CADHotel(dbname);
            h.Create(this);
        }

        void Read(String dbname)//calls the cadproduct method to read a product with the same id as the actual one
        {
            CAD.CADHotel h = new CAD.CADHotel(dbname);
            Hotel p = h.Read(id);
            id = p.id;
            name = p.name;
        }

        void Update(String dbname)//updates the product with the same id as the actual one by calling the cadproduct's appropiate method
        {
            CAD.CADHotel h = new CAD.CADHotel(dbname);
            h.Update(this);
        }

        void Delete(String dbname)//deletes the product by calling cadproduct
        {
            CAD.CADHotel h = new CAD.CADHotel(dbname);
            h.Delete(id);
        }

    }
}

