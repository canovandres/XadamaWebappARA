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
        public void Create(User user) //Creates a new worker in the database
        {

        }

        public User Read(String email) //Reads a worker from the database
        {
            Worker worker = new Worker("", "", "");

            return worker;
        }

        public void Update(User user) //Update the information of a worker in the database
        {

        }

        public void Delete(String email) //Deletes a worker from the database
        {

        }

        public bool Works(String date) //Checks in the database if the worker works in that date
        {
            return false;
        }
    }
}
