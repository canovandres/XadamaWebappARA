using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lib.EN
{
    class Show
    {
        public Show(string name, string zname)
        {
            this.name = name;
            this.zonename = zname;
        }

        public string name { get; set; }
        public string zonename { get; set; }

        public void save(string dbname)
        {
            CAD.CADShow show = new CAD.CADShow(dbname);
            show.Create(this);
        }

        public void Read(String dbname, String name)
        {
            CAD.CADShow show = new CAD.CADShow(dbname);
            Show s = (Show)show.Read(name);
            this.name = s.name;
            this.zonename = s.zonename;
        }

        public void Update(String dbname, Show s)
        {
            CAD.CADShow show = new CAD.CADShow(dbname);
            show.Update(s);
        }

        public void Delete(String dbname, String name)
        {
            CAD.CADShow show = new CAD.CADShow(dbname);
            show.Delete(name);
        }
    }
}
