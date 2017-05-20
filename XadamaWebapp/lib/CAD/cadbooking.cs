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

        public CADBooking()
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

                DateTime convertedStart = Convert.ToDateTime(b.datestart);
                for (int i=0; i<numberOfNights(newBooking); i++)
                {
                    String day = convertedStart.ToString("dd/MM/yyyy");

                    DataRow r = t.NewRow();
                    r[0] = newBooking.client;
                    r[1] = newBooking.room;
                    r[2] = newBooking.hotel;
                    r[3] = day;
                    t.Rows.Add(r);

                    convertedStart = convertedStart.AddDays(1);
                }
                
                SqlCommandBuilder cb = new SqlCommandBuilder(da);
                da.Update(virtualdb, "booking");
            }
            catch (Exception ex) { }
            finally { conn.Close(); }
        }
        
        public Booking Read(Booking b)
        {
            Booking booking = new Booking("", 0, "", "", "", "");
            SqlConnection conn = new SqlConnection(connectionString);
            DataSet virtualdb = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from booking where client like '" + b.client + "' and room like '" + b.room + "and hotel like '" + b.hotel + "'", conn);
                da.Fill(virtualdb, "booking");

                DataTable t = new DataTable();
                t = virtualdb.Tables["booking"];

                DateTime convertedStart = Convert.ToDateTime(b.datestart);
                DateTime NextDay = convertedStart;
                booking.datestart = t.Rows[0][3].ToString();
                for (int i = 0; i < numberOfNights(b); i++)
                {
                    if (NextDay == convertedStart.AddDays(i))
                    {
                        booking.client = t.Rows[i][0].ToString();
                        booking.room = Int32.Parse(t.Rows[i][1].ToString());
                        booking.hotel = t.Rows[i][2].ToString();
                        booking.dateend = t.Rows[i][3].ToString();
                    }
                    
                    NextDay.AddDays(1);
                }
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

                DateTime convertedStart = Convert.ToDateTime(b.datestart);
                DateTime NextDay = convertedStart;
                t.Rows[0][3] = newBooking.datestart;
                for (int i = 0; i < numberOfNights(b); i++)
                {
                    if (NextDay == convertedStart.AddDays(i))
                    {
                        String day = NextDay.ToString();
                        t.Rows[i][0] = newBooking.client;
                        t.Rows[i][1] = newBooking.room;
                        t.Rows[i][2] = newBooking.hotel;
                        if (i != 0)
                        {
                            t.Rows[i][3] = day;
                        }
                    }
                    NextDay.AddDays(1);
                }
               
                SqlCommandBuilder cb = new SqlCommandBuilder(da);
                da.Update(virtualdb, "booking");
            }
            catch (Exception ex) { }
            finally { conn.Close(); }
        }
        public void Delete(Booking b)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            DataSet virtualdb = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from booking where client like '" + b.client + "' and room like '" + b.room + "and hotel like '" + b.hotel + "'", conn);
                da.Fill(virtualdb, "booking");

                DataTable t = new DataTable();
                t = virtualdb.Tables["booking"];

                DateTime convertedStart = Convert.ToDateTime(b.datestart);
                DateTime NextDay = convertedStart;
                for (int i=0; i<numberOfNights(b); i++)
                {
                    if (NextDay == convertedStart.AddDays(i))
                    {
                        t.Rows[i].Delete();
                    }
                    NextDay.AddDays(1);
                }
                
                SqlCommandBuilder cb = new SqlCommandBuilder(da);
                da.Update(virtualdb, "booking");
            }
            catch (Exception ex) { }
            finally { conn.Close(); }
        }
        public bool isAvalaible(Booking b)
        {
            bool ok = false;
            SqlConnection conn = new SqlConnection(connectionString);
            DataSet virtualdb = new DataSet();

            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select count(*) from room where type like 'individual' and hotel like '" + b.hotel + "' and num not in (select room from booking where day between '" + b.datestart + "' and '" + b.dateend + "')", conn);
                da.Fill(virtualdb, "room");

                DataTable t = new DataTable();
                t = virtualdb.Tables["room"];
                int freeSingle = Convert.ToInt32(t.Rows[0][0].ToString());

                SqlDataAdapter da2 = new SqlDataAdapter("select count(*) from room where type like 'double' and hotel like '" + b.hotel + "' and num not in (select room from booking where day between '" + b.datestart + "' and '" + b.dateend + "')", conn);
                da2.Fill(virtualdb, "room2");

                DataTable t2 = new DataTable();
                t2 = virtualdb.Tables["room2"];
                int freeDouble = Convert.ToInt32(t2.Rows[0][0].ToString());

                if(freeSingle >= b.nsingle && freeDouble >= b.ndouble)
                {
                    ok = true;
                }

            }
            catch (Exception ex) { }
            finally { conn.Close(); }
            return ok;
        }
        public bool bookRooms (Booking b)
        {
            bool done = false;
            SqlConnection conn = new SqlConnection(connectionString);
            DataSet virtualdb = new DataSet();
            try
            {
                if (b.nsingle > 0 && isAvalaible(b))
                {
                    for (int i = 0; i < b.nsingle; i++)
                    {
                        SqlDataAdapter da = new SqlDataAdapter("select * from room where type like 'Individual' and hotel like '" + b.hotel + "' and num not in (select room from booking where day between '" + b.datestart + "' and '" + b.dateend + "')", conn);
                        da.Fill(virtualdb, "room");

                        DataTable t = new DataTable();
                        t = virtualdb.Tables["room"];

                        int roomnum = Int32.Parse(t.Rows[0][0].ToString());
                        String roomhotel = t.Rows[0][1].ToString();
                        Booking newBooking = new Booking(b.client, roomnum, roomhotel, b.datestart, b.dateend, b.board);
                        Create(newBooking);
                    }
                    done = true;
                }
                else done = false;
                if (b.ndouble > 0 && isAvalaible(b))
                {
                    for (int i = 0; i < b.ndouble; i++)
                    {
                        SqlDataAdapter da = new SqlDataAdapter("select * from room where type like 'Double' and hotel like '" + b.hotel + "' and num not in (select room from booking where day between '" + b.datestart + "' and '" + b.dateend + "')", conn);
                        da.Fill(virtualdb, "room");

                        DataTable t = new DataTable();
                        t = virtualdb.Tables["room"];

                        int roomnum = Int32.Parse(t.Rows[0][0].ToString());
                        String roomhotel = t.Rows[0][1].ToString();
                        Booking newBooking = new Booking(b.client, roomnum, roomhotel, b.datestart, b.dateend, b.board);
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
                SqlDataAdapter da2 = new SqlDataAdapter("select individual from typeprices where hotel like '" + b.hotel + "'", conn);
                SqlDataAdapter da3 = new SqlDataAdapter("select doble from typeprices where hotel like '" + b.hotel + "'", conn);
                SqlDataAdapter da4 = new SqlDataAdapter("select " + b.board+ " from boardprices where hotel like '" + b.hotel + "'", conn);
                
                da2.Fill(virtualdb, "typeprices");
                da3.Fill(virtualdb, "typeprices2");
                da4.Fill(virtualdb, "boardprices");
                
                DataTable t2 = new DataTable();
                DataTable t3 = new DataTable();
                DataTable t4 = new DataTable();

                t2 = virtualdb.Tables["typeprices"];
                t3 = virtualdb.Tables["typeprices2"];
                t4 = virtualdb.Tables["boardprices"];

                float singleprice = float.Parse(t2.Rows[0][0].ToString());
                float doubleprice = float.Parse(t3.Rows[0][0].ToString());
                float board = float.Parse(t4.Rows[0][0].ToString());

                float s = (b.nsingle * numberOfNights(b) * (singleprice + board));
                float d = (b.ndouble * numberOfNights(b) * (doubleprice + board));
                price = s + d;
                b.price = price;
                
            }
            catch (Exception ex) { }
            finally { conn.Close(); }

            return price;
        }
        public int numberOfNights(Booking b)
        {
            int num = 0;

            DateTime convertedStart = Convert.ToDateTime(b.datestart);
            DateTime convertedEnd = Convert.ToDateTime(b.dateend);
            TimeSpan ts = convertedEnd - convertedStart;
            num = ts.Days;
            b.nights = num;

            return num;
        }
    }
}