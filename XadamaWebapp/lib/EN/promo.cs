using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lib.EN
{
    class Promo
    {
        private int pdiscount;
        public String cod { get; set; }
        public String initialdate { get; set; }
        public String enddate { get; set; }
        public String description { get; set; }
        public int discount
        {
            get
            {
                return pdiscount;
            }
            set
            {
                pdiscount = value;
                if(pdiscount<0 || pdiscount > 100)
                {
                    Console.WriteLine("ERROR. The percentage of discount has to be between 0 and 100");
                    pdiscount = 0;
                }
            }
        }

        public Promo(String cod, String initialdate = "", String enddate = "", String description = "", int discount = 0)
        {
            this.cod = cod;
            this.initialdate = initialdate;
            this.enddate = enddate;
            this.description = description;
            this.discount = discount;
        }

        public void Create(String dbname)//Creates a new promotion in the database by calling the appropiate methods in cadpromo
        {
            CAD.CADPromo c = new CAD.CADPromo(dbname);
            c.Create(this);
        }

        public void Read(String dbname)//Reads the promo that has the same id as the actual one from the database by calling the appropiate method in cadpromo
        {
            CAD.CADPromo c = new CAD.CADPromo(dbname);
            Promo p = c.Read(cod);
            this.initialdate = p.initialdate;
            this.enddate = p.enddate;
            this.description = p.description;
            this.discount = p.discount;

        }

        public void Update(String dbname)//Updates the promo in the database with the same id as the actual one, and changes its attributes to the actual ones by calling the appropiate method in cadpromo
        {
            CAD.CADPromo c = new CAD.CADPromo(dbname);
            c.Update(this);
        }

        public void Delete(String dbname)//Deletes the promo from the database by calling the appropiate method of cadpromo
        {
            CAD.CADPromo c = new CAD.CADPromo(dbname);
            c.Delete(cod);
        }

        public List<String> getPromos(String dbname, String currentdate)//returns a list of promos that are active during the date passed by parameter by calling the appropiate method in cadpromo
        {
            CAD.CADPromo c = new CAD.CADPromo(dbname);
            return c.getPromos(currentdate);
        }
    }
}
