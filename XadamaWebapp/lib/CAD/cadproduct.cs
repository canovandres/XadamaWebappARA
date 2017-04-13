using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lib.CAD
{
    class CADProduct
    {
        public CADProduct(String dbname)
        {
        }

        public void Create(lib.EN.Product c) { }//Adds a new product to the database by executing an appropiate command
        public lib.EN.Product Read(String id);//Reads a product which has the same id as the one passed by parameter by executing the appropiate command
        public void Update(lib.EN.Product c) { }//Updates an existing product which has the same id as the one passed by parameter changing its current values to the ones the product of the parameter has by executing appropiate commands
        public void Delete(String id) { }//Deletes the product which has the same id as the one passed by parameter by executing appropiate commands
    }
}
