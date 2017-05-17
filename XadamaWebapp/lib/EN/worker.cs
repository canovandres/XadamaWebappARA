using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lib.EN
{
    public class Worker : User
    {
        public Worker(String email, String password, String name = "", int age = 0, int phone = 0, String address = "")
        {
            this.password = password;
            this.email = email;
            this.name = name;
            this.age = age;
            this.phone = phone;
            this.address = address;
        }

        public String email { get; set; }

        public String password { get; set; }

        public String name { get; set; }

        public int age { get; set; }

        public int phone { get; set; }

        public String address { get; set; }

        public void save (String dbname) //Creates a new worker
        {
            CAD.CADWorker cadworker = new CAD.CADWorker(dbname);
            cadworker.Create(this);
        }

        public void read (String dbname, String email) //Reads the information of a worker
        {
            CAD.CADWorker cadworker = new CAD.CADWorker(dbname);
            Worker worker = (Worker) cadworker.Read(email);
            this.email = worker.email;
            this.password = worker.password;
            this.name = worker.name;
            this.age = worker.age;
            this.phone = worker.phone;
            this.address = worker.address;
        }

        public void update (String dbname) //Update the information about a worker
        {
            CAD.CADWorker cadworker = new CAD.CADWorker(dbname);
            cadworker.Update(this);
        }

        public void delete (String dbname, String email) //Deletes a worker
        {
            CAD.CADWorker cadworker = new CAD.CADWorker(dbname);
            cadworker.Delete(email);
        }

        public bool works (String dbname, String date) //True if the worker works in the date passes as a parameter
        {
            CAD.CADWorker cadworker = new CAD.CADWorker(dbname);
            return cadworker.Works(date);
        }
    }
}
