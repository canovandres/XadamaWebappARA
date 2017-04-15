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

        public Reservation Read(int id)
        {
            Reservation res = new Reservation(id);
            return res;
        }

        public void Update(Reservation r)
        {

        }

        public void Delete(int id)
        {

        }
    }
}
