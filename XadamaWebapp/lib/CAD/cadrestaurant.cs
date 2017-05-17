using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using lib.EN;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Configuration;

namespace lib.CAD
{
    public class CADRestaurant
    {
        private string conString;

        public CADRestaurant(string dbname)
        {
            conString = ConfigurationManager.ConnectionStrings["DatabaseConnection"].ToString();
            conString = conString.Replace("|DataDirectory|", AppDomain.CurrentDomain.GetData("DataDirectory").ToString());
        }

       /* ~CADRestaurant()
        {

        }*/

        public void Create(EN.Restaurant restaurant)
        {
            Restaurant newRestaurant = restaurant;
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from restaurant", con);
                da.Fill(bdvirtual, "restaurant");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["restaurant"];

                DataRow newrow = t.NewRow();
                newrow[0] = newRestaurant.cod;
                newrow[1] = newRestaurant.name;
                newrow[2] = newRestaurant.description;
                newrow[3] = newRestaurant.zone;
                newrow[4] = newRestaurant.image;
                t.Rows.Add(newrow);

                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "restaurant");

            }
            catch (Exception ex) { }
            finally { con.Close(); }
        }

        public Restaurant Read(string cod)
        {
            Restaurant restaurant = new Restaurant(cod, "", "", "", "");
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();

            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from restaurant where cod like '" + cod + "'", con);
                da.Fill(bdvirtual, "restaurant");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["restaurant"];

                restaurant.cod = t.Rows[0][0].ToString();
                restaurant.name = t.Rows[0][1].ToString();
                restaurant.description = t.Rows[0][2].ToString();
                restaurant.zone = t.Rows[0][3].ToString();
                restaurant.image = t.Rows[0][4].ToString();
            }
            catch (Exception ex) { }
            finally { con.Close(); }

            return restaurant;
        }

        public void Update(Restaurant restaurant)
        {
            Restaurant newRestaurant = restaurant;
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter();
                da.Fill(bdvirtual, "restaurant");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["restaurant"];

                t.Rows[0][0] = newRestaurant.cod;

                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "restaurant");
            }
            catch (Exception ex) { }
            finally { con.Close(); }
        }

        public void Delete(string cod)
        {
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from restaurant where cod like '" + cod + "'", con);
                da.Fill(bdvirtual, "restaurant");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["restaurant"];

                t.Rows[0].Delete();

                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "restaurant");
            }
            catch (Exception ex) { }
            finally { con.Close(); }
        }

        public DataTable zoneRestaurants(String zone)
        {
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            DataTable t = new DataTable();

            try
            {
                if (zone!="*") {
                    SqlDataAdapter da = new SqlDataAdapter("select cod, name, description, image from restaurant where zone like '" + zone + "'", con);
                    da.Fill(bdvirtual, "services");
                }
                else
                {
                    SqlDataAdapter da = new SqlDataAdapter("select cod, name, description, image from restaurant", con);
                    da.Fill(bdvirtual, "services");
                }

                t = bdvirtual.Tables["services"];
            }
            catch (Exception e) { }
            finally { con.Close(); }

            return t;
        }
    }
}

