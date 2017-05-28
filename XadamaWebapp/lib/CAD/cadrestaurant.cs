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

        public CADRestaurant()
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
                SqlDataAdapter da = new SqlDataAdapter("select * from restaurant where cod like '" + restaurant.cod + "'", con);
                da.Fill(bdvirtual, "restaurant");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["restaurant"];

                t.Rows[0][0] = newRestaurant.cod;
                t.Rows[0][1] = newRestaurant.name;
                t.Rows[0][2] = newRestaurant.description;
                t.Rows[0][3] = newRestaurant.zone;
                t.Rows[0][4] = newRestaurant.image;

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

        public DataSet ListAllRestaurants()
        {
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();

            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from restaurant", con);
                da.Fill(bdvirtual, "restaurant");
                return bdvirtual;
            }
            catch (Exception ex)
            {

            }
            finally
            {
                con.Close();
            }

            return bdvirtual;
        }

        public DataTable zoneRestaurants(String zone)
        {
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            DataTable t = new DataTable();

            try
            {
                if (zone != "*")
                {
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

        public DataSet DeleteRestaurant(Restaurant r, int i)
        {
            Restaurant r1 = r;
            DataSet bdvirtual = new DataSet();
            SqlConnection con = new SqlConnection(conString);
            SqlDataAdapter da = new SqlDataAdapter("select * from Restaurant", con);
            da.Fill(bdvirtual, "restaurant");
            DataTable t = new DataTable();
            t = bdvirtual.Tables["Restaurant"];
            t.Rows[i].Delete();
            SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
            da.Update(bdvirtual, "restaurant");
            return bdvirtual;
        }
    }
}


