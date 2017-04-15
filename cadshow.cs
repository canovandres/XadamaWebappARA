using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using lib.EN;

namespace lib.CAD
{
    class CADShow
    {
        public CADShow(string dbname)
        {

        }

        ~CADShow()
        {

        }

        public void Create(EN.Show s)
        {

        }

        public Show Read(string name)
        {
            Show show = new Show(name);
            return show;
        }

        public void Update(Show s)
        {

        }

        public void Delete(string name)
        {

        }


    }
}
