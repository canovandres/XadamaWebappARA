using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lib.EN
{
    public class Worker : User
    {
        public Worker(String email, String password = "", String name = "", String surname1 = "", String surname2 = "", String age = "", int phone = 0)
        {
            this.password = password;
            this.email = email;
            this.name = name;
            this.surname1 = surname1;
            this.surname2 = surname2;
            this.age = age;
            this.phone = phone;
        }

        public String email { get; set; }

        public String password { get; set; }

        public String name { get; set; }

        public String surname1 { get; set; }

        public String surname2 { get; set; }

        public String age { get; set; }

        public int phone { get; set; }

        public void Create() //Creates a new worker
        {
            CAD.CADWorker cadworker = new CAD.CADWorker();
            cadworker.Create(this);
        }

        public void Read() //Reads the information of a worker
        {
            CAD.CADWorker cadworker = new CAD.CADWorker();
            Worker worker = (Worker) cadworker.Read(email);
            this.email = worker.email;
            this.password = worker.password;
            this.name = worker.name;
            this.surname1 = surname1;
            this.surname2 = surname2;
            this.age = worker.age;
            this.phone = worker.phone;
        }

        public void Update() //Update the information about a worker
        {
            CAD.CADWorker cadworker = new CAD.CADWorker();
            cadworker.Update(this);
        }

        public void Delete() //Deletes a worker
        {
            CAD.CADWorker cadworker = new CAD.CADWorker();
            cadworker.Delete(email);
        }

        /*
        public bool Works(date) //True if the worker works in the date passes as a parameter
        {
            CAD.CADWorker cadworker = new CAD.CADWorker();
            return cadworker.Works(date);
        }
        */
    }
}
