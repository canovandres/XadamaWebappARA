using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace lib.CAD
{
    class CADPromo
    {
        private string conString;
        public CADPromo()
        {
            conString = ConfigurationManager.ConnectionStrings["DatabaseConnection"].ToString();
            conString = conString.Replace("|DataDirectory|", AppDomain.CurrentDomain.GetData("DataDirectory").ToString());
        }

        public void Create(EN.Promo p)//Adds a new promo to the database by executing an appropiate command
        {
            SqlConnection con = new SqlConnection(conString);
            try
            {
                DataSet bdvirtual = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter("select* from promo",con);
                da.Fill(bdvirtual, "promocion");
                DataTable t = new DataTable();
                t = bdvirtual.Tables["promocion"];
                DataRow newline = t.NewRow();
                t.Rows.Add(newline);
                SqlCommandBuilder cb = new SqlCommandBuilder(da);
                da.Update(bdvirtual,"promocion");
                //hacer return true??
            }//terminar esto añadiendole los parametros
            catch(Exception ex)
            {

            }
            finally
            {
                con.Close();
            }
        }

        public EN.Promo Read(String cod)//Reads a promo which has the same id as the one passed by parameter by executing the appropiate command
        {
            EN.Promo promo = new EN.Promo("");
            SqlConnection con = new SqlConnection(conString);
            try
            {
                DataSet bdvirtual = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter("select* from promo where cod=" + cod, con);
                da.Fill(bdvirtual, "promocion");
                DataTable t = new DataTable();
                t = bdvirtual.Tables["promocion"];
                promo.cod = t.Rows[0][0].ToString();
                promo.name = t.Rows[0][1].ToString();
                promo.description= t.Rows[0][2].ToString();
                promo.discount = Int32.Parse(t.Rows[0][3].ToString());
                promo.initialdate= t.Rows[0][4].ToString();
                promo.enddate= t.Rows[0][5].ToString();
            }
            catch (Exception ex)
            {

            }
            finally
            {
                con.Close();
            }
            return promo;
        }

        public void Update(EN.Promo p)//Updates an existing promo which has the same id as the one passed by parameter changing its current values to the ones the promo of the parameter has by executing appropiate commands
        {
            SqlConnection con = new SqlConnection(conString);
            try
            {
                DataSet bdvirtual = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter("select* from promo where cod=" + p.cod, con);
                da.Fill(bdvirtual, "promocion");
                DataTable t = new DataTable();
                t = bdvirtual.Tables["promocion"];
                t.Rows[0][0] = p.cod;
                t.Rows[0][1] = p.name;
                t.Rows[0][2] = p.description;
                t.Rows[0][3] = p.discount;
                t.Rows[0][4] = p.initialdate;
                t.Rows[0][5] = p.enddate;
                SqlCommandBuilder cb = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "promocion");


            }//terminar esto añadiendole los parametros
            catch (Exception ex)
            {

            }
            finally
            {
                con.Close();
            }//hacer un return bool
        }

        public void Delete(String cod)//Deletes the promo which has the same id as the one passed by parameter by executing appropiate commands
        {
            SqlConnection con = new SqlConnection(conString);
            try
            {
                DataSet bdvirtual = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter("select* from promo where cod=" + cod, con);
                da.Fill(bdvirtual, "promocion");
                DataTable t = new DataTable();
                t = bdvirtual.Tables["promocion"];
                t.Rows[0].Delete();
                SqlCommandBuilder cb = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "promocion");
            }
            catch (Exception ex)
            {

            }
            finally
            {
                con.Close();
            }
        }

        public List<EN.Promo> getPromos(String currentdate)//Returns a list of promos active in the date passed by parameter by executing appropiate commands
        {
            List<EN.Promo> promos = new List<EN.Promo>();
            EN.Promo promo = new EN.Promo("");
            SqlConnection con = new SqlConnection(conString);
            try
            {
                DataSet bdvirtual = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter("select* from promo where enddate >= convert(date,'" + currentdate + "') and initialdate <= convert(date, '" + currentdate + "')", con);
                da.Fill(bdvirtual, "promocion");
                DataTable t = new DataTable();
                t = bdvirtual.Tables["promocion"];//rellenar
                int i = 0;
                foreach(DataRow r in t.Rows)
                {
                    promo.cod = t.Rows[i][0].ToString();
                    promo.name = t.Rows[i][1].ToString();
                    promo.description = t.Rows[i][2].ToString();
                    promo.discount = Int32.Parse(t.Rows[i][3].ToString());
                    promo.initialdate = t.Rows[i][4].ToString();
                    promo.enddate = t.Rows[i][5].ToString();
                    promos.Add(promo);
                    i++;
                }
            }
            catch(Exception ex)
            {

            }
            finally
            {
                con.Close();
            }
            return promos;
        }
    }
}
