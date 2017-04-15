using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using lib.EN;

namespace lib.CAD
{
    class CADReservation
    {
        public CADReservation(string dbname)
        {

        }

        ~CADReservation()
        {

        }

        public void Create (Reservation r)
        {

        }

        public Reservation Read(String cod)
        {
            Reservation res = new Reservation(cod);
            return res;
        }

        public void Update(Reservation r)
        {

        }

        public void Delete(String cod)
        {

        }
    }
}
