using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lib.EN
{
    public class Admin : User
    {
        public Admin(String email, String password = "")
        {
            this.password = password;
            this.email = email;
        }

        public String email { get; set; }

        public String password { get; set; }

        public void Create()
        {
            CAD.CADAdmin cadadmin = new CAD.CADAdmin();
            cadadmin.Create(this);
        }

        public void Read()
        {
            CAD.CADAdmin cadadmin = new CAD.CADAdmin();
            Admin admin = (Admin)cadadmin.Read(email);
            this.email = admin.email;
            this.password = admin.password;
        }

        public void Update()
        {
            CAD.CADAdmin cadadmin = new CAD.CADAdmin();
            cadadmin.Update(this);
        }

        public void Delete()
        {
            CAD.CADAdmin cadadmin = new CAD.CADAdmin();
            cadadmin.Delete(email);
        }

        public bool ExistsAdmin()
        {
            CAD.CADAdmin w = new CAD.CADAdmin();
            return (w.ExistsAdmin(email));
        }
    }
}
