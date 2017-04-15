using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lib.CAD
{
    class CADBooking
    {
        public CADBooking(String dbname)
        {
        }

        public void Create(lib.EN.Booking b) { }
        public lib.EN.Booking Read(String calendar, int room, String hotel) { }
        public void Update(lib.EN.Booking b) { }
        public void Delete(String calendar, int room, String hotel) { }
    }
}
