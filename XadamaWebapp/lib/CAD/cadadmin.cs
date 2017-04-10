using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using lib.EN;

namespace lib.CAD
{
    class CADAdmin : CADUser
    {
        public CADAdmin(String database)
        {

        }

        public void Create(User user)
        {

        }

        public User Read(String email)
        {
            Admin admin = new Admin("", "");

            return admin;
        }

        public void Update(User user)
        {

        }

        public void Delete(String email)
        {

        }
    }
}
