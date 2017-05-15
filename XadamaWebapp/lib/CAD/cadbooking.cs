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
    class CADBooking
    {
        private string connectionString;

        public CADBooking(String dbname)
        {
            connectionString = ConfigurationManager.ConnectionStrings["DatabaseConnection"].ToString();
            connectionString = connectionString.Replace("|DataDirectory|", AppDomain.CurrentDomain.GetData("DataDirectory").ToString());
        }

        public void Create(Booking b)
        {
            Booking newBooking = (Booking)b;
            SqlConnection conn = new SqlConnection(connectionString);
            DataSet virtualdb = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from booking", conn);
                da.Fill(virtualdb, "booking");

                DataTable t = new DataTable();
                t = virtualdb.Tables["booking"];

                DataRow r = t.NewRow();
                r[0] = newBooking.client;
                r[1] = newBooking.room;
                r[2] = newBooking.hotel;
                r[3] = newBooking.datestart;
                r[4] = newBooking.dateend;
                t.Rows.Add(r);
                SqlCommandBuilder cb = new SqlCommandBuilder(da);
                da.Update(virtualdb, "booking");
            }
            catch (Exception ex) { }
            finally { conn.Close(); }


        }
        public Booking Read(String client, int room, String hotel)
        {
            Booking booking = new Booking("", 0, "", "", "");
            SqlConnection conn = new SqlConnection(connectionString);
            DataSet virtualdb = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from booking where client like '" + client + "' and room like '" + room + "and hotel like '" + hotel + "'", conn);
                da.Fill(virtualdb, "booking");

                DataTable t = new DataTable();
                t = virtualdb.Tables["booking"];

                booking.client = t.Rows[0][0].ToString();
                booking.room = Int32.Parse(t.Rows[0][1].ToString());
                booking.hotel = t.Rows[0][2].ToString();
                booking.datestart = t.Rows[0][3].ToString();
                booking.dateend = t.Rows[0][4].ToString();
            }
            catch (Exception ex) { }
            finally { conn.Close(); }
            return booking;
        }

        public void Update(Booking b)
        {
            Booking newBooking = (Booking)b;
            SqlConnection conn = new SqlConnection(connectionString);
            DataSet virtualdb = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from booking where client like '" + b.client + "' and room like '" + b.room + "and hotel like '" + b.hotel + "'", conn);
                da.Fill(virtualdb, "booking");

                DataTable t = new DataTable();
                t = virtualdb.Tables["booking"];

                t.Rows[0][0] = newBooking.client;
                t.Rows[0][1] = newBooking.room;
                t.Rows[0][2] = newBooking.hotel;
                t.Rows[0][3] = newBooking.datestart;
                t.Rows[0][4] = newBooking.dateend;

                SqlCommandBuilder cb = new SqlCommandBuilder(da);
                da.Update(virtualdb, "booking");
            }
            catch (Exception ex) { }
            finally { conn.Close(); }
        }
        public void Delete(String client, int room, String hotel)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            DataSet virtualdb = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from booking where client like '" + client + "' and room like '" + room + "and hotel like '" + hotel + "'", conn);
                da.Fill(virtualdb, "booking");

                DataTable t = new DataTable();
                t = virtualdb.Tables["booking"];

                t.Rows[0].Delete();
                t.Rows[1].Delete();
                t.Rows[2].Delete();
                t.Rows[3].Delete();
                t.Rows[4].Delete();

                SqlCommandBuilder cb = new SqlCommandBuilder(da);
                da.Update(virtualdb, "booking");
            }
            catch (Exception ex) { }
            finally { conn.Close(); }
        }

        public bool bookRooms (Booking b, string type, int n)
        {
            bool done = false;
            int freerooms = 0; 
            SqlConnection conn = new SqlConnection(connectionString);
            DataSet virtualdb = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select count(*) from room where type like '" + type + "' and hotel like '"+b.hotel+"' and num not in (select room from booking)", conn);
                da.Fill(virtualdb, "room");

                DataTable t = new DataTable();
                t = virtualdb.Tables["room"];

                freerooms = Int32.Parse(t.Rows[0][0].ToString());

                if (freerooms == n)
                {
                    for (int i = 0; i < n; i++)
                    {
                        SqlDataAdapter da2 = new SqlDataAdapter("select * from room where type like '" + type + "' and hotel like '" + b.hotel + "' and num not in (select room from booking)", conn);
                        da2.Fill(virtualdb, "room");

                        DataTable t2 = new DataTable();
                        t2 = virtualdb.Tables["room"];

                        int roomnum = Int32.Parse(t2.Rows[0][0].ToString());
                        String roomhotel = t2.Rows[0][1].ToString();
                        Booking newBooking = new Booking(b.client, roomnum, roomhotel, b.datestart, b.dateend);
                        Create(newBooking);

                    }
                    done = true;
                }
                else done = false;
            }
            catch (Exception ex) { }
            finally { conn.Close(); }

            return done;
        }
       
        public float getPrice(Booking b)
        {
            float price = 0;

            SqlConnection conn = new SqlConnection(connectionString);
            DataSet virtualdb = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from booking where client like '" + b.client + "' and room like '" + b.room +"and hotel like '"+b.hotel+ "'", conn);
                SqlDataAdapter da2 = new SqlDataAdapter("select * from room where num like '" + b.room + "' and hotel like '" + b.hotel + "'", conn);
                da.Fill(virtualdb, "booking");
                da2.Fill(virtualdb, "room");

                DataTable t = new DataTable();
                DataTable t2 = new DataTable();
                t = virtualdb.Tables["booking"];
                t2 = virtualdb.Tables["room"];

                float roomprice = float.Parse(t2.Rows[0][4].ToString());
                price = roomprice*numberOfNights(b);
                
            }
            catch (Exception ex) { }
            finally { conn.Close(); }

            return price;
        }
        public int numberOfNights(Booking b)
        {
            int num = 0;
            SqlConnection conn = new SqlConnection(connectionString);
            DataSet virtualdb = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from booking where client like '" + b.client + "' and room like '" + b.room + "and hotel like '" + b.hotel + "'", conn);
                da.Fill(virtualdb, "booking");

                DataTable t = new DataTable();
                t = virtualdb.Tables["booking"];

                String start = t.Rows[0][3].ToString();
                String end = t.Rows[0][3].ToString();

                DateTime convertedStart = Convert.ToDateTime(start);
                DateTime convertedEnd = Convert.ToDateTime(end);
                TimeSpan ts = convertedEnd - convertedStart;
                num = ts.Days;

            }
            catch (Exception ex) { }
            finally { conn.Close(); }

            return num;
        }
    }
}