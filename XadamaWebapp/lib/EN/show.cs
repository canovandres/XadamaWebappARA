using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace lib.EN
{
    public class Show
    {
        public Show(string cod, string name = "", string description = "", string image = "", string zone = "")
        {
            this.cod = cod;
            this.name = name;
            this.description = description;
            this.image = image;
            this.zone = zone;
        }

        public string cod { get; set; }
        public string name { get; set; }
        public string description { get; set; }
        public string image { get; set; }
        public string zone { get; set; }

        public void save(string dbname)
        {
            CAD.CADShow show = new CAD.CADShow(dbname);
            show.Create(this);
        }

        public void Read(String dbname, String cod)
        {
            CAD.CADShow show = new CAD.CADShow(dbname);
            Show s = (Show)show.Read(cod);
            this.cod = s.cod;
            this.name = s.name;
            this.description = s.description;
            this.image = s.image;
            this.zone = s.zone;
        }

        public void Update(String dbname, Show s)
        {
            CAD.CADShow show = new CAD.CADShow(dbname);
            show.Update(s);
        }

        public void Delete(String dbname, String cod)
        {
            CAD.CADShow show = new CAD.CADShow(dbname);
            show.Delete(cod);
        }

        public DataTable zoneShows(String db, String zone)
        {
            CAD.CADShow show = new CAD.CADShow(db);
            return show.zoneShows(zone);
        }
    }
}
