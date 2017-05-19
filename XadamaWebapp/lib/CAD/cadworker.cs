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
        private static string conString;

        public CADWorker()
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
                SqlDataAdapter da2 = new SqlDataAdapter("select * from usuario", con);
                SqlDataAdapter da = new SqlDataAdapter("select * from worker", con);
                da2.Fill(bdvirtual, "usuario");
                da.Fill(bdvirtual, "worker");

                DataTable t2 = new DataTable();
                DataTable t = new DataTable();
                t2 = bdvirtual.Tables["usuario"];
                t = bdvirtual.Tables["worker"];

                DataRow newrow2 = t2.NewRow();
                newrow2[0] = newWorker.email;
                newrow2[1] = newWorker.password;

                DataRow newrow = t.NewRow();
                newrow[0] = newWorker.email;
                newrow[1] = newWorker.name;
                newrow[2] = newWorker.surname1;
                newrow[3] = newWorker.surname2;
                newrow[4] = newWorker.age;
                newrow[5] = newWorker.phone;

                t2.Rows.Add(newrow2);
                t.Rows.Add(newrow);

                SqlCommandBuilder cbuilder2 = new SqlCommandBuilder(da2);
                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                
                da.Update(bdvirtual, "worker");
                if (newWorker.password != "")
                    da2.Update(bdvirtual, "usuario");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error Creating Worker (CadWorker): " + ex.ToString());
            }
            finally {
                con.Close();
            }
        }

        public User Read(String email) //Reads a worker from the database
        {
            Worker worker = new Worker("");
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from worker where usuario like '" + email + "'", con);
                SqlDataAdapter da2 = new SqlDataAdapter("select * from usuario where email like '" + email + "'", con);

                da.Fill(bdvirtual, "worker");
                da2.Fill(bdvirtual, "usuario");

                DataTable t = new DataTable();
                DataTable t2 = new DataTable();
                t = bdvirtual.Tables["worker"];
                t2 = bdvirtual.Tables["usuario"];

                worker.email = t.Rows[0][0].ToString();
                worker.password = t2.Rows[0][1].ToString();
                worker.name = t.Rows[0][1].ToString();
                worker.surname1 = t.Rows[0][2].ToString();
                worker.surname2 = t.Rows[0][3].ToString();
                worker.age = t.Rows[0][4].ToString();
                if(t.Rows[0][5].ToString() != null)
                {
                    worker.phone = Int32.Parse(t.Rows[0][5].ToString());
                } else
                {
                    worker.phone = 0;
                }
            }
            catch (Exception ex) {
                Console.WriteLine("Error Reading Worker (CadWorker): " + ex.ToString());
            }
            finally {
                con.Close();
            }

            return worker;
        }

        public void Update(User user) //Update the information of a worker in the database
        {
            Worker newWorker = (Worker)user;
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from worker where usuario like '" + user.email + "'", con);
                SqlDataAdapter da2 = new SqlDataAdapter("select * from usuario where email like '" + user.email + "'", con);
                da.Fill(bdvirtual, "worker");
                da2.Fill(bdvirtual, "usuario");

                DataTable t = new DataTable();
                DataTable t2 = new DataTable();
                t = bdvirtual.Tables["worker"];
                t2 = bdvirtual.Tables["usuario"];

                t.Rows[0][1] = newWorker.name;
                t.Rows[0][2] = newWorker.surname1;
                t.Rows[0][3] = newWorker.surname2;
                t.Rows[0][4] = newWorker.age;
                t.Rows[0][5] = newWorker.phone;
                t2.Rows[0][1] = newWorker.password;

                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                SqlCommandBuilder cbuilder2 = new SqlCommandBuilder(da2);
                da.Update(bdvirtual, "worker");
                da2.Update(bdvirtual, "usuario");
            }
            catch (Exception ex) {
                Console.WriteLine("Error Updating Worker (CadWorker): " + ex.ToString());
            }
            finally {
                con.Close();
            }
        }

        public void Delete(String email) //Deletes a worker from the database
        {
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from worker where email like '" + email + "'", con);
                SqlDataAdapter da2 = new SqlDataAdapter("select * from usuario where email like '" + email + "'", con);
                da.Fill(bdvirtual, "worker");
                da2.Fill(bdvirtual, "usuario");

                DataTable t = new DataTable();
                DataTable t2 = new DataTable();
                t = bdvirtual.Tables["worker"];
                t2 = bdvirtual.Tables["usuario"];

                t.Rows[0].Delete();
                t2.Rows[0].Delete();

                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                SqlCommandBuilder cbuilder2 = new SqlCommandBuilder(da2);
                da.Update(bdvirtual, "worker");
                da2.Update(bdvirtual, "usuario");
            }
            catch (Exception ex) {
                Console.WriteLine("Error Deleting Worker (CadWorker): " + ex.ToString());
            }
            finally {
                con.Close();
            }
        }

        /*
        public bool Works(String date) //Checks in the database if the worker works in that date
        {
            return false;
        }
        */

        public bool ExistsWorker(String email)
        {
            bool exists = false;
            SqlConnection con = new SqlConnection(conString);
            try
            {
                SqlCommand cmd = new SqlCommand("select * from worker where usuario = @email", con);
                cmd.Parameters.AddWithValue("@email", email);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Open();
                int i = cmd.ExecuteNonQuery();
                if (dt.Rows.Count > 0)
                {
                    exists = true;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error ExistsWorker (CadWorker): " + ex.ToString());
            }
            finally
            {
                con.Close();
            }
            return exists;
        }

        public DataSet ListAllWorkers()
        {
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from Worker", con);
                da.Fill(bdvirtual, "worker");
            }
            catch (Exception ex) { }
            finally { con.Close(); }

            return bdvirtual;
        }

        public DataSet DeleteWorker(Worker wor, int i)
        {
            Worker wk = wor;
            DataSet bdvirtual = new DataSet();
            SqlConnection c = new SqlConnection(conString);
            SqlDataAdapter da = new SqlDataAdapter("select * from Worker", c);
            da.Fill(bdvirtual, "worker");
            DataTable t = new DataTable();
            t = bdvirtual.Tables["worker"];
            t.Rows[i].Delete();
            SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
            da.Update(bdvirtual, "worker");
            return bdvirtual;
        }
    }
}
