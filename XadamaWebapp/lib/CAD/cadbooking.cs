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
        public lib.EN.Booking Read(String calendar, int room, String hotel) {
            EN.Booking booking = new EN.Booking(null, "");

            return booking;
        }
        public void Update(lib.EN.Booking b) { }
        public void Delete(String calendar, int room, String hotel) { }
    }
}
