using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lib.EN
{
    public class Client : User
    {
        public String email { get; set; }
        public String password { get; set; }
        public String name { get; set; }
        public int age { get; set; }
        public int phone { get; set; }
        public String address { get; set; }
        public Client(String email, String password, String name = "", int age = 0, int phone = 0, String address = "")
        {
            this.email = email;
            this.password = password;
            this.name = name;
            this.age = age;
            this.phone = phone;
            this.address = address;
        }

        void Create(String dbname)
        {
            CAD.CADClient c = new CAD.CADClient(dbname);
            c.Create(this);
        }

        void Read(String dbname)
        {
            CAD.CADClient c = new CAD.CADClient(dbname);
            Client p = (Client)c.Read(email);
            email = p.email;
            password = p.password;
            name = p.name;
            age = p.age;
            phone = p.phone;
            address = p.address;
        }

        void Update(String dbname)
        {
            CAD.CADClient c = new CAD.CADClient(dbname);
            c.Update(this);
        }

        void Delete(String dbname)
        {
            CAD.CADClient c = new CAD.CADClient(dbname);
            c.Delete(email);
        }

    }
}

