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
    class CADShow
    {
        private string conString;

        public CADShow(string dbname)
        {
            conString = ConfigurationManager.ConnectionStrings["DatabaseConnection"].ToString();
            conString = conString.Replace("|DataDirectory|", AppDomain.CurrentDomain.GetData("DataDirectory").ToString());
        }

       /* ~CADShow()
        {

        }*/

        public void Create(EN.Show show)
        {
            Show newShow = show;
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from show", con);
                da.Fill(bdvirtual, "show");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["show"];

                DataRow newrow = t.NewRow();
                newrow[0] = newShow.cod;
                newrow[1] = newShow.name;
                newrow[2] = newShow.description;
                newrow[3] = newShow.image;
                newrow[4] = newShow.zone;
                t.Rows.Add(newrow);

                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "show");

            }
            catch (Exception ex) { }
            finally { con.Close(); }
        }

        public Show Read(string cod)
        {
            Show show = new Show(cod, "", "", "", "");
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();

            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from show where cod like '" + cod + "'", con);
                da.Fill(bdvirtual, "show");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["show"];

                show.cod = t.Rows[0][0].ToString();
                show.name = t.Rows[0][1].ToString();
                show.description = t.Rows[0][2].ToString();
                show.image = t.Rows[0][3].ToString();
                show.zone = t.Rows[0][4].ToString();
            }
            catch (Exception ex) { }
            finally { con.Close(); }

            return show;
        }

        public void Update(Show show)
        {
            Show newShow = show;
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter();
                da.Fill(bdvirtual, "show");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["show"];

                t.Rows[0][0] = newShow.cod;

                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "show");
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
                SqlDataAdapter da = new SqlDataAdapter("select * from show where cod like '" + cod + "'", con);
                da.Fill(bdvirtual, "show");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["show"];

                t.Rows[0].Delete();

                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "show");
            }
            catch (Exception ex) { }
            finally { con.Close(); }
        }

        public DataTable zoneShows(String zone)
        {
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            DataTable t = new DataTable();

            try
            {
                if (zone!="*") {
                    SqlDataAdapter da = new SqlDataAdapter("select name, description, image from restaurant where zone like '" + zone + "'", con);
                    da.Fill(bdvirtual, "services");
                }
                else
                {
                    SqlDataAdapter da = new SqlDataAdapter("select name, description, image from restaurant", con);
                    da.Fill(bdvirtual, "services");
                }

                t = bdvirtual.Tables["services"];

            }catch (Exception e) { }
            finally { con.Close();  }

            return t;
        }
    }
}
