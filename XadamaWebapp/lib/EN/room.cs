using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lib.EN
{
    class Room
    {
        public String id { get; set; }
        public int num { get; set; }
        public String type { get; set; }
        public Room(String id, int num, String type = "")
        {
            this.id = id;
            this.num = num;
            this.type = type;
        }

        void Create(String dbname)
        {
            CAD.CADRoom r = new CAD.CADRoom(dbname);
            r.Create(this);
        }

        void Read(String dbname)
        {
            CAD.CADRoom r = new CAD.CADRoom(dbname);
            Room p = r.Read(id, num);
            id = p.id;
            num = p.num;
            type = p.type;
        }

        void Update(String dbname)
        {
            CAD.CADRoom r = new CAD.CADRoom(dbname);
            r.Update(this);
        }

        void Delete(String dbname)
        {
            CAD.CADRoom r = new CAD.CADRoom(dbname);
            r.Delete(id, num);
        }

    }
}


