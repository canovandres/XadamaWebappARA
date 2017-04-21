using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lib.EN
{
    class Admin : User
    {
        public Admin(String email, String password)
        {
            this.password = password;
            this.email = email;
        }

        public String email { get; set; }

        public String password { get; set; }

        public void save(String dbname)
        {
            CAD.CADAdmin cadadmin = new CAD.CADAdmin(dbname);
            cadadmin.Create(this);
        }

        public void read(String dbname, String email)
        {
            CAD.CADAdmin cadadmin = new CAD.CADAdmin(dbname);
            Admin admin = (Admin)cadadmin.Read(email);
            this.email = admin.email;
            this.password = admin.password;
        }

        public void update(String dbname, Worker worker)
        {
            CAD.CADAdmin cadadmin = new CAD.CADAdmin(dbname);
            cadadmin.Update(this);
        }

        public void delete(String dbname, String email)
        {
            CAD.CADAdmin cadadmin = new CAD.CADAdmin(dbname);
            cadadmin.Delete(email);
        }
    }
}
