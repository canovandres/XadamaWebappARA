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
    class CADReservation
    {
        private string conString;
        public CADReservation()
        {
            conString = ConfigurationManager.ConnectionStrings["DatabaseConnection"].ToString();
            conString = conString.Replace("|DataDirectory|", AppDomain.CurrentDomain.GetData("DataDirectory").ToString());
        }

        /*~CADReservation()
        {

        }*/

        public void Create(Reservation r)
        {
            Reservation newReservation = r;
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from reservation", con);
                da.Fill(bdvirtual, "reservation");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["reservation"];

                DataRow newrow = t.NewRow();
                newrow[0] = newReservation.client;
                newrow[1] = newReservation.table;
                newrow[2] = newReservation.restaurant;
                newrow[3] = newReservation.date;

                t.Rows.Add(newrow);
                SqlCommandBuilder cb = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "reservation");
            }
            catch (Exception ex)
            {

            }
            finally { con.Close(); }

        }

        public Reservation Read(Reservation r)
        {
            Reservation reservation = new Reservation("", 0, "", "");
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from reservation where client like '" + r.client + "and table like '" + r.table + "and restaurant like '" + r.restaurant + "'", con);
                da.Fill(bdvirtual, "reservation");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["reservation"];

                reservation.client = t.Rows[0][0].ToString();
                reservation.table = Int32.Parse(t.Rows[0][1].ToString());
                reservation.restaurant = t.Rows[0][2].ToString();
                reservation.date = t.Rows[0][3].ToString();
            }
            catch (Exception ex) { }
            finally { con.Close(); }

            return reservation;
        }

        public void Update(Reservation r)
        {
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();

            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from reservation where client like '" + r.client + "' and table like '" + r.table + "' and restaurant like '" + r.restaurant + "'", con);
                da.Fill(bdvirtual, "");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["reservation"];

                t.Rows[0][0] = r.client;
                t.Rows[0][1] = r.table;
                t.Rows[0][2] = r.restaurant;
                t.Rows[0][3] = r.date;

                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "reservation");
            }
            catch (Exception ex)
            {

            }
            finally
            {
                con.Close();
            }

        }

        public void Delete(Reservation r)
        {
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();

            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from restaurant where client like '" + r.client + "' and table like '" + r.table + "' and restaurant like '" + r.restaurant + "'", con);
                da.Fill(bdvirtual, "reservation");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["reservation"];

                t.Rows[0].Delete();

                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "reservation");
            }
            catch (Exception ex)
            {

            }
            finally
            {
                con.Close();
            }

        }

        public int tablesAvailable(Reservation r)
        {
            int freetables = 0;
            SqlConnection con = new SqlConnection(conString);
            DataSet virtualdb = new DataSet();

            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select count(*) from table where restaurant ='" + r.restaurant + "' and num not in (select table from reservation where day like '" + r.date + "')", con);
                da.Fill(virtualdb, "table");

                DataTable t = new DataTable();
                t = virtualdb.Tables["table"];
                freetables = Convert.ToInt32(t.Rows[0][0].ToString());
                return freetables;
            }
            catch (Exception ex) { }
            finally { con.Close(); }
            
            return freetables;
        }
        public bool isAvailable(Reservation r)
        {
            bool ok = false;
            if (r.tablesAvailable() >= r.ntables)
            {
                ok = true;
            }
            return ok;
        }

        public bool reserveTables(Reservation r)
        {
            bool done = false;
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                if (r.ntables > 0 && isAvailable(r))
                {

                    for (int i = 0; i < r.ntables; i++)
                    {
                        SqlDataAdapter da = new SqlDataAdapter("select * from table where restaurant like '" + r.restaurant + "' and num not in (select table from reservation where date like '" + r.date + "')", con);
                        da.Fill(bdvirtual, "table");

                        DataTable t = new DataTable();
                        t = bdvirtual.Tables["table"];

                        int tablenum = Int32.Parse(t.Rows[0][0].ToString());
                        String tablerestaurant = t.Rows[0][1].ToString();
                        Reservation newReservation = new Reservation(r.client, tablenum, tablerestaurant, r.date);
                        Create(newReservation);
                    }
                    done = true;
                }
                else done = false;
            }
            catch (Exception ex) { }
            finally { con.Close(); }

            return done;
        }
    }
}

