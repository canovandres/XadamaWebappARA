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
    class CADMenu
    {
        private string conString;

        public CADMenu(String db)
        {
            conString = ConfigurationManager.ConnectionStrings["DatabaseConnection"].ToString();
            conString = conString.Replace("|DataDirectory|", AppDomain.CurrentDomain.GetData("DataDirectory").ToString());
        }

        /*~CADMenu()
        {

        }*/

        public void Create(EN.Menu en)
        {
            Menu newMenu = (Menu)en;
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from menu", con);
                da.Fill(bdvirtual, "menu");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["menu"];

                DataRow newrow = t.NewRow();
                newrow[0] = newMenu.cod;
                newrow[1] = newMenu.restaurant;
                newrow[2] = newMenu.first1;
                newrow[3] = newMenu.first2;
                newrow[4] = newMenu.second1;
                newrow[5] = newMenu.second2;
                newrow[6] = newMenu.dessert1;
                newrow[7] = newMenu.dessert2;
                newrow[8] = newMenu.price;

                t.Rows.Add(newrow);
                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "menu");

            }
            catch (Exception ex) { }
            finally { con.Close(); }
        }

        public EN.Menu Read(String cod)
        {
            Menu menu = new Menu(cod);
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from menu where cod like '" + cod + "'", con);
                da.Fill(bdvirtual, "menu");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["menu"];

                menu.cod = t.Rows[0][0].ToString();
                menu.restaurant = t.Rows[0][1].ToString();
                menu.first1 = t.Rows[0][2].ToString();
                menu.first2 = t.Rows[0][3].ToString();
                menu.second1 = t.Rows[0][4].ToString();
                menu.second2 = t.Rows[0][5].ToString();
                menu.dessert1 = t.Rows[0][6].ToString();
                menu.dessert2 = t.Rows[0][7].ToString();
                menu.price = Int32.Parse(t.Rows[0][8].ToString());

            }
            catch (Exception ex) { }
            finally { con.Close(); }

            return menu;
        }

        public void Update(EN.Menu en)
        {
            Menu newMenu = (Menu)en;
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from menu where cod like '" + en.cod + "'", con);
                da.Fill(bdvirtual, "menu");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["menu"];

                t.Rows[0][0] = newMenu.cod;
                t.Rows[0][1] = newMenu.restaurant;
                t.Rows[0][2] = newMenu.first1;
                t.Rows[0][3] = newMenu.first2;
                t.Rows[0][4] = newMenu.second1;
                t.Rows[0][5] = newMenu.second2;
                t.Rows[0][6] = newMenu.dessert1;
                t.Rows[0][7] = newMenu.dessert2;
                t.Rows[0][8] = newMenu.price;


                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "menu");
            }
            catch (Exception ex) { }
            finally { con.Close(); }
        }

        public void Delete(String cod)
        {
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from menu where cod like '" + cod + "'", con);
                da.Fill(bdvirtual, "menu");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["menu"];

                t.Rows[0].Delete();
                t.Rows[1].Delete();
                t.Rows[2].Delete();
                t.Rows[3].Delete();
                t.Rows[4].Delete();
                t.Rows[5].Delete();
                t.Rows[6].Delete();
                t.Rows[7].Delete();
                t.Rows[8].Delete();

                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "menu");
            }
            catch (Exception ex) { }
            finally { con.Close(); }
        }
    }
}
