using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lib.EN
{
    class Menu
    {
        public String cod { get; set; }

        public String first1 { get; set; }

        public String first2 { get; set; }

        public String second1 { get; set; }

        public String second2 { get; set; }

        public String dessert1 { get; set; }

        public String dessert2 { get; set; }

        public int price { get; set; }

        public String restaurant { get; set; }
        
        public Menu(String cod, String first1 = "", String first2 = "", String second1 = "", String second2 = "", String dessert1 = "", String dessert2 = "", int price = 0, String restaurant = "")
        {
            this.cod = cod;
            this.price = price;
            this.first1 = first1;
            this.first2 = first2;
            this.second1 = second1;
            this.second2 = second2;
            this.dessert1 = dessert1;
            this.dessert2 = dessert2;
            this.restaurant = restaurant;
        }

        public void save(String db)
        {
            CAD.CADMenu cadmenu = new CAD.CADMenu(db);
            cadmenu.Create(this);
        }

        public void read(String db)
        {
            CAD.CADMenu cadmenu = new CAD.CADMenu(db);
            Menu menu = (Menu)cadmenu.Read(cod);
            this.cod = menu.cod;
            this.price = menu.price;
            this.first1 = menu.first1;
            this.first2 = menu.first2;
            this.second1 = menu.second1;
            this.second2 = menu.second2;
            this.dessert1 = menu.dessert1;
            this.dessert2 = menu.dessert2;
            this.restaurant = menu.restaurant;
        }

        public void update(String db)
        {
            CAD.CADMenu cadmenu = new CAD.CADMenu(db);
            cadmenu.Update(this);
        }

        public void delete(String db)
        {
            CAD.CADMenu cadmenu = new CAD.CADMenu(db);
            cadmenu.Delete(cod);
        }
    }
}
