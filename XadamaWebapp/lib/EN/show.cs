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

        public void save()
        {
            CAD.CADShow show = new CAD.CADShow();
            show.Create(this);
        }

        public void Read(String cod)
        {
            CAD.CADShow show = new CAD.CADShow();
            Show s = (Show)show.Read(cod);
            this.cod = s.cod;
            this.name = s.name;
            this.description = s.description;
            this.image = s.image;
            this.zone = s.zone;
        }

        public void Update(Show s)
        {
            CAD.CADShow show = new CAD.CADShow();
            show.Update(s);
        }

        public void Delete(String cod)
        {
            CAD.CADShow show = new CAD.CADShow();
            show.Delete(cod);
        }

        public DataTable zoneShows(String zone)
        {
            CAD.CADShow show = new CAD.CADShow();
            return show.zoneShows(zone);
        }

        public static DataSet ListAllShows()
        {
            CAD.CADShow s = new CAD.CADShow();
            DataSet shows = s.ListAllShows();
            return shows;
        }

        public DataSet DeleteShow(int i)
        {
            CAD.CADShow s = new CAD.CADShow();
            DataSet a = s.DeleteShow(this, i);
            return a;
        }
    }
}
