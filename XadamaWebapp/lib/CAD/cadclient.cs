using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Configuration;

namespace lib.CAD
{
    class CADClient : CADUser
    {
        private string conString;

        public CADClient(String dbname)
        {
            conString = ConfigurationManager.ConnectionStrings["DatabaseConnection"].ToString();
            conString = conString.Replace("|DataDirectory|", AppDomain.CurrentDomain.GetData("DataDirectory").ToString());
        }

        public void Create(EN.User user) {
            EN.Client newClient = (EN.Client)user;
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from client", con);
                da.Fill(bdvirtual, "client");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["client"];

                DataRow newrow = t.NewRow();
                newrow[0] = newClient.email;
                //Continuar y modificar segun DB

                t.Rows.Add(newrow);
                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "client");
            }
            catch (Exception ex) { }
            finally { con.Close(); }
        }

        public EN.User Read(String email)
        {
            EN.Client client = new EN.Client("", "");
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from client where email like '" + email + "'", con);
                da.Fill(bdvirtual, "client");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["client"];

                client.email = t.Rows[0][0].ToString();
                client.password = t.Rows[0][1].ToString();
                client.age = Int32.Parse(t.Rows[0][2].ToString());
                //Continuar y modificar segun DB
            }
            catch (Exception ex) { }
            finally { con.Close(); }

            return client;
        }

        public void Update(EN.User user) {
            EN.Client newClient = (EN.Client)user;
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from client where email like '" + user.email + "'", con);
                da.Fill(bdvirtual, "client");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["client"];

                t.Rows[0][0] = newClient.email;
                //Continuar y modificar segun DB

                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "client");
            }
            catch (Exception ex) { }
            finally { con.Close(); }
        }

        public void Delete(String email) {
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from client where email like '" + email + "'", con);
                da.Fill(bdvirtual, "client");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["client"];

                t.Rows[0].Delete();
                //Continuar y modificar segun DB

                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "client");
            }
            catch (Exception ex) { }
            finally { con.Close(); }
        }
    }
}
