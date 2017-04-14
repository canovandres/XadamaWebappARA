using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using lib.EN;

namespace lib.CAD
{
    public interface CADShop
    {
        void create(Shop nshop);
        Shop read(int id);
        void update(Shop nshop);
        void delete(int id);
    }
}
