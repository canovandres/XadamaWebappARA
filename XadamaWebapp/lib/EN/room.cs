using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lib.EN
{
    class Room
    {
        public int num { get; set; }
        public String hotel { get; set; }
        public String type { get; set; }
        public String client { get; set; }
        public float price { get; set; }
       
        public Room(int num = 0, String hotel = "", String type, String client, float price)
        {
            this.num = num;
            this.hotel = hotel;
            this.type = type;
            this.client = client;
            this.price = price;
        }

        void Create(String dbname)
        {
            CAD.CADRoom r = new CAD.CADRoom(dbname);
            r.Create(this);
        }

        void Read(String dbname)
        {
            CAD.CADRoom r = new CAD.CADRoom(dbname);
            Room p = r.Read(num, hotel);
            num = p.num;
            hotel = p.hotel;
            type = p.type;
            client = p.client;
            price = p.price;
        }

        void Update(String dbname)
        {
            CAD.CADRoom r = new CAD.CADRoom(dbname);
            r.Update(this);
        }

        void Delete(String dbname)
        {
            CAD.CADRoom r = new CAD.CADRoom(dbname);
            r.Delete(num, hotel);
        }
    }
}
}
