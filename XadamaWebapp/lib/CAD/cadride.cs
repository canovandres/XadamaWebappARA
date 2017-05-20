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
    class CADRide
    {
        private string conString;

        public CADRide(String db)
        {
            conString = ConfigurationManager.ConnectionStrings["DatabaseConnection"].ToString();
            conString = conString.Replace("|DataDirectory|", AppDomain.CurrentDomain.GetData("DataDirectory").ToString());
        }

        /*~CADRide()
        {

        }*/

        public void Create(EN.Ride en)
        {
            Ride newRide = (Ride)en;
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from ride", con);
                da.Fill(bdvirtual, "ride");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["ride"];

                DataRow newrow = t.NewRow();
                newrow[0] = newRide.cod;
                newrow[1] = newRide.name;
                newrow[2] = newRide.zone;
                newrow[3] = newRide.description;
                newrow[4] = newRide.minHeight;
                newrow[5] = newRide.speed;
                newrow[6] = newRide.image;

                t.Rows.Add(newrow);
                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "ride");

            }
            catch (Exception ex) { }
            finally { con.Close(); }
        }

        public EN.Ride Read(String cod)
        {
            Ride ride = new Ride("", "", "");
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from ride where cod like '" + cod + "'", con);
                da.Fill(bdvirtual, "ride");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["ride"];

                ride.cod = t.Rows[0][0].ToString();
                ride.name = t.Rows[0][1].ToString();
                ride.zone = t.Rows[0][2].ToString();
                ride.description = t.Rows[0][3].ToString();
                ride.minHeight =  float.Parse(t.Rows[0][4].ToString());
                ride.speed = float.Parse(t.Rows[0][5].ToString());
                ride.image = t.Rows[0][6].ToString();

            }
            catch (Exception ex) { }
            finally { con.Close(); }

            return ride;
        }

        public void Update(EN.Ride en)
        {
            Ride newRide = (Ride)en;
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from ride where cod like '" + en.cod + "'", con);
                da.Fill(bdvirtual, "ride");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["ride"];

                t.Rows[0][0] = newRide.cod;
                t.Rows[0][1] = newRide.name;
                t.Rows[0][2] = newRide.zone;
                t.Rows[0][3] = newRide.description;
                t.Rows[0][4] = newRide.minHeight;
                t.Rows[0][5] = newRide.speed;
                t.Rows[0][6] = newRide.image;


                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "ride");
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
                SqlDataAdapter da = new SqlDataAdapter("select * from ride where cod like '" + cod + "'", con);
                da.Fill(bdvirtual, "ride");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["ride"];

                t.Rows[0].Delete();

                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "ride");
            }
            catch (Exception ex) { }
            finally { con.Close(); }
        }

        public DataTable zoneRides(String zone)
        {
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            DataTable t = new DataTable();
            try
            {
                if (zone=="*") {
                    SqlDataAdapter da = new SqlDataAdapter("select cod, name, description, image from ride", con);
                    da.Fill(bdvirtual, "services");
                }
                else
                {
                    SqlDataAdapter da = new SqlDataAdapter("select cod, name, description, image from ride where zone like '" + zone + "'", con);
                    da.Fill(bdvirtual, "services");
                }

                t = bdvirtual.Tables["services"];

            }
            catch (Exception ex) { }
            finally { con.Close(); }

            return t;


        }

        public DataSet DeleteRide(Ride rid, int i)
        {
            Ride r = rid;
            DataSet bdvirtual = new DataSet();
            SqlConnection c = new SqlConnection(conString);
            SqlDataAdapter da = new SqlDataAdapter("select * from Ride", c);
            da.Fill(bdvirtual, "ride");
            DataTable t = new DataTable();
            t = bdvirtual.Tables["ride"];
            t.Rows[i].Delete();
            SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
            da.Update(bdvirtual, "ride");
            return bdvirtual;
        }

        public DataSet ListAllRides()
        {
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from Ride", con);
                da.Fill(bdvirtual, "ride");
            }
            catch (Exception ex) { }
            finally { con.Close(); }

            return bdvirtual;
        }

        public EN.Ride ReadName(String name)
        {
            Ride ride = new Ride("", "", "");
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter($"select * from Ride where name like '" + name + "'", con);
                da.Fill(bdvirtual, "ride");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["ride"];

                SqlDataAdapter da2 = new SqlDataAdapter($"select description from Zone where name like '" + t.Rows[0][2].ToString() + "'", con);
                da2.Fill(bdvirtual, "zone");

                DataTable t2 = new DataTable();
                t2 = bdvirtual.Tables["zone"];

                ride.cod = t.Rows[0][0].ToString();
                ride.name = t.Rows[0][1].ToString();
                ride.zone = t2.Rows[0][0].ToString();
                ride.description = t.Rows[0][3].ToString();
                ride.minHeight = float.Parse(t.Rows[0][4].ToString());
                ride.speed = float.Parse(t.Rows[0][5].ToString());
                ride.image = t.Rows[0][6].ToString();

            }
            catch (Exception ex) { }
            finally { con.Close(); }

            return ride;
        }
    }
}
