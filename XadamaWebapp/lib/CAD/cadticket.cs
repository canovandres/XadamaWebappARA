using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using lib.EN;

namespace lib.CAD
{
    class CADTicket
    {
        public CADTicket(String database)
        {

        }

        public void Create(Ticket ticket)
        {

        }

        public Ticket Read(String cod)
        {
            Ticket ticket = new EN.Ticket("", "", 0, "");

            return ticket;
        }

        public void Update(Ticket ticket)
        {

        }

        public void Delete(String cod)
        {

        }
    }
}