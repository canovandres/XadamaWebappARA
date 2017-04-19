using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lib.CAD
{
    class CADPromo
    {
        public CADPromo(String dbname)
        {

        }

        public void Create(EN.Promo p)//Adds a new promo to the database by executing an appropiate command
        {

        }

        public EN.Promo Read(String id)//Reads a promo which has the same id as the one passed by parameter by executing the appropiate command
        {
            EN.Promo promo = new EN.Promo("");

            return promo;
        }

        public void Update(EN.Promo p)//Updates an existing promo which has the same id as the one passed by parameter changing its current values to the ones the promo of the parameter has by executing appropiate commands
        {

        }

        public void Delete(String id)//Deletes the promo which has the same id as the one passed by parameter by executing appropiate commands
        {

        }

        public List<String> getPromos(String currentdate)//Returns a list of promos active in the date passed by parameter by executing appropiate commands
        {
            List<String> promos = new List<string>();

            return promos;
        }
    }
}
