using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace lib.EN
{
    public class Restaurant
    {
        public Restaurant(string cod, string name = "", string description = "", string zone = "", string image = "")
        {
            this.cod = cod;
            this.name = name;
            this.description = description;
            this.image = image;
            this.zone = zone;
        }

        public string cod { get; set; }
        public string name { get; set; }
        public string description { get; set; }
        public string image { get; set; }
        public string zone { get; set; }

        public void save(string dbname)
        {
            CAD.CADRestaurant restaurant = new CAD.CADRestaurant();
            restaurant.Create(this);
        }

        public void Read(String name)
        {
            CAD.CADRestaurant restaurant = new CAD.CADRestaurant();
            Restaurant r = (Restaurant)restaurant.Read(name);
            this.cod = r.cod;
            this.name = r.name;
            this.description = r.description;
            this.image = r.image;
            this.zone = r.zone;
        }

        public void Update(Restaurant r)
        {
            CAD.CADRestaurant restaurant = new CAD.CADRestaurant();
            restaurant.Update(r);
        }

        public void Delete(String cod)
        {
            CAD.CADRestaurant restaurant = new CAD.CADRestaurant();
            restaurant.Delete(cod);
        }

        public DataTable zoneRestaurants(String db, String zone)
        {
            CAD.CADRestaurant restaurant = new CAD.CADRestaurant();
            return restaurant.zoneRestaurants(zone);
        }

        public static DataSet ListAllRestaurants()
        {
            CAD.CADRestaurant r = new CAD.CADRestaurant();
            DataSet restaurants = r.ListAllRestaurants();
            return restaurants;
        }

        public DataSet DeleteRestaurant(int i)
        {
            CAD.CADRestaurant r = new CAD.CADRestaurant();
            DataSet a = r.DeleteRestaurant(this, i);
            return a;
        }
    }
}
