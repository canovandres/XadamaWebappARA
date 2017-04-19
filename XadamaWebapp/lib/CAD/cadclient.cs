using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lib.CAD
{
    class CADClient : CADUser
    {
        public CADClient(String dbname)
        {
        }

        public void Create(EN.User user) { }

        public EN.User Read(String email)
        {
            EN.Client client = new EN.Client("", "");

            return client;
        }

        public void Update(EN.User c) { }

        public void Delete(String email) { }
    }
}
