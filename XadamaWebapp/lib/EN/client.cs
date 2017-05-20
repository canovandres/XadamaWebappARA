using System;
using System.Collections.Generic;
using System.Data;
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
        public String age { get; set; }
        public int phone { get; set; }
        public String address { get; set; }
        public String creditCard { get; set; }
        public Client(String email, String password = "", String name = "", String surname1 = "", String surname2 = "", String age = "", int phone = 0, String address = "", String creditCard = "")
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

        public void Create()
        {
            CAD.CADClient c = new CAD.CADClient();
            c.Create(this);
        }

        public void Read()
        {
            CAD.CADClient c = new CAD.CADClient();
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

        public void Update()
        {
            CAD.CADClient c = new CAD.CADClient();
            c.Update(this);
        }

        public void Delete()
        {
            CAD.CADClient c = new CAD.CADClient();
            c.Delete(email);
        }

        public bool ExistsUsuario()
        {
            CAD.CADClient c = new CAD.CADClient();
            return (c.ExistsUsuario(email));
        }

        public bool ExistsUsuarioPassword()
        {
            CAD.CADClient c = new CAD.CADClient();
            return (c.ExistsUsuarioPassword(email, password));
        }

        public bool ExistsClient()
        {
            CAD.CADClient c = new CAD.CADClient();
            return (c.ExistsClient(email));
        }

        public static DataSet ListAllClients()
        {
            CAD.CADClient c = new CAD.CADClient();
            DataSet clients = c.ListAllClients();
            return clients;
        }

        public DataSet DeleteClient(int i)
        {
            CAD.CADClient c = new CAD.CADClient();
            DataSet a = c.DeleteClient(this, i);
            return a;
        }
    }
}

