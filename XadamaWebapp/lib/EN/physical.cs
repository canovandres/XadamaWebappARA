using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lib.EN
{
    class Physical : Shop
    {
        public string name { get; set; }
        public int id { get; set; }

        public Physical(string name, int id)
        {
            this.name = name;
            this.id = id;
        }
    }
}
