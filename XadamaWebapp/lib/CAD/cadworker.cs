using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using lib.EN;

namespace lib.CAD
{
    class CADWorker : CADUser
    {
        public CADWorker(String database)
        {

        }
        public void Create(User user)
        {

        }

        public User Read(String email)
        {
            Worker worker = new Worker("", "", "");

            return worker;
        }

        public void Update(User user)
        {

        }

        public void Delete(String email)
        {

        }
    }
}
