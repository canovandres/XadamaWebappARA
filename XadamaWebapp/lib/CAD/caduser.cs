using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using lib.EN;

namespace lib.CAD
{
    public interface CADUser
    {
        void Create (User user);

        User Read (String email);

        void Update (User user);

        void Delete (String email);
    }
}
