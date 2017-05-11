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
    class CADWorker : CADUser
    {
        private string conString;

        public CADWorker(String database)
        {
            conString = ConfigurationManager.ConnectionStrings["DatabaseConnection"].ToString();
            conString = conString.Replace("|DataDirectory|", AppDomain.CurrentDomain.GetData("DataDirectory").ToString());
        }
        public void Create(User user) //Creates a new worker in the database
        {
            Worker newWorker = (Worker)user;
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from worker", con);
                da.Fill(bdvirtual, "worker");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["worker"];

                DataRow newrow = t.NewRow();
                newrow[0] = newWorker.email;
                //Continuar y modificar segun DB

                t.Rows.Add(newrow);
                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "worker");
            }
            catch (Exception ex) { }
            finally { con.Close(); }
        }

        public User Read(String email) //Reads a worker from the database
        {
            Worker worker = new Worker("", "", "");
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from worker where email like '" + email + "'", con);
                da.Fill(bdvirtual, "worker");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["worker"];

                worker.email = t.Rows[0][0].ToString();
                worker.password = t.Rows[0][1].ToString();
                worker.age = Int32.Parse(t.Rows[0][2].ToString());
                //Continuar y modificar segun DB
            }
            catch (Exception ex) { }
            finally { con.Close(); }

            return worker;
        }

        public void Update(User user) //Update the information of a worker in the database
        {
            Worker newWorker = (Worker)user;
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from worker where email like '" + user.email + "'", con);
                da.Fill(bdvirtual, "worker");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["worker"];

                t.Rows[0][0] = newWorker.email;
                //Continuar y modificar segun DB

                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "worker");
            }
            catch (Exception ex) { }
            finally { con.Close(); }
        }

        public void Delete(String email) //Deletes a worker from the database
        {
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from worker where email like '" + email + "'", con);
                da.Fill(bdvirtual, "worker");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["worker"];

                t.Rows[0].Delete();
                //Continuar y modificar segun DB

                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "worker");
            }
            catch (Exception ex) { }
            finally { con.Close(); }
        }

        public bool Works(String date) //Checks in the database if the worker works in that date
        {
            return false;
        }
    }
}
