using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lib.EN
{
    class Online : Shop
    {
        public int id { get; set; }

        public Online(int id)
        {
            this.id = id;
        }
    }
}
