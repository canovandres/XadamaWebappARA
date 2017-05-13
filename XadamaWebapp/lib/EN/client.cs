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
        public String surname1 { get; set; }
        public String surname2 { get; set; }
        public int age { get; set; }
        public int phone { get; set; }
        public String address { get; set; }
        public String creditCard { get; set; }
        public Client(String email, String password, String name, String surname1 = "", String surname2 = "",  int age = 0, int phone = 0, String address = "", String creditCard = "")
        {
            this.email = email;
            this.password = password;
            this.name = name;
            this.surname1 = surname1;
            this.surname2 = surname2;
            this.age = age;
            this.phone = phone;
            this.address = address;
            this.creditCard = creditCard;
        }

        public void Create(String dbname)
        {
            CAD.CADClient c = new CAD.CADClient(dbname);
            c.Create(this);
        }

        public void Read(String dbname)
        {
            CAD.CADClient c = new CAD.CADClient(dbname);
            Client p = (Client)c.Read(email);
            this.email = p.email;
            this.password = p.password;
            this.name = p.name;
            this.surname1 = p.surname1;
            this.surname2 = p.surname2;
            this.age = p.age;
            this.phone = p.phone;
            this.address = p.address;
            this.creditCard = p.creditCard;
        }

        public void Update(String dbname)
        {
            CAD.CADClient c = new CAD.CADClient(dbname);
            c.Update(this);
        }

        public void Delete(String dbname)
        {
            CAD.CADClient c = new CAD.CADClient(dbname);
            c.Delete(email);
        }

    }
}

