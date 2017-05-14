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
    class CADRoom
    {
        private string connectionString;

        public CADRoom(String dbname)
        {
            connectionString = ConfigurationManager.ConnectionStrings["DatabaseConnection"].ToString();
            connectionString = connectionString.Replace("|DataDirectory|", AppDomain.CurrentDomain.GetData("DataDirectory").ToString());
        }

        public void Create(Room b)
        {
            Room newRoom = (Room)b;
            SqlConnection conn = new SqlConnection(connectionString);
            DataSet virtualdb = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from room", conn);
                da.Fill(virtualdb, "room");

                DataTable t = new DataTable();
                t = virtualdb.Tables["room"];

                DataRow r = t.NewRow();
                r[0] = newRoom.num;
                r[1] = newRoom.hotel;
                r[2] = newRoom.type;
                r[3] = newRoom.client;
                r[4] = newRoom.price;
                t.Rows.Add(r);
                SqlCommandBuilder cb = new SqlCommandBuilder(da);
                da.Update(virtualdb, "room");
            }
            catch (Exception ex) { }
            finally { conn.Close(); }


        }
        public Room Read(int num, String hotel)
        {
            Room room = new Room(null, "", 0, "");
            SqlConnection conn = new SqlConnection(connectionString);
            DataSet virtualdb = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from room where num like '" + num + "' and hotel like '" + hotel + "'", conn);
                da.Fill(virtualdb, "room");

                DataTable t = new DataTable();
                t = virtualdb.Tables["room"];

                room.num = Int32.Parse(t.Rows[0][0].ToString());
                room.hotel = t.Rows[0][1].ToString();
                room.type = t.Rows[0][2].ToString();
                room.client = t.Rows[0][3].ToString();
                room.price = float.Parse(t.Rows[0][0].ToString());
            }
            catch (Exception ex) { }
            finally { conn.Close(); }
            return room;
        }

        public void Update(Room b)
        {
            Room newRoom = (Room)b;
            SqlConnection conn = new SqlConnection(connectionString);
            DataSet virtualdb = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from room where num like '" + b.num + "' and hotel like '" + b.hotel + "'", conn);
                da.Fill(virtualdb, "room");

                DataTable t = new DataTable();
                t = virtualdb.Tables["room"];

                t.Rows[0][0] = newRoom.num;
                t.Rows[0][1] = newRoom.hotel;
                t.Rows[0][2] = newRoom.type;
                t.Rows[0][3] = newRoom.client;
                t.Rows[0][4] = newRoom.price;

                SqlCommandBuilder cb = new SqlCommandBuilder(da);
                da.Update(virtualdb, "room");
            }
            catch (Exception ex) { }
            finally { conn.Close(); }
        }
        public void Delete(int num, String hotel)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            DataSet virtualdb = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from room where num like '" + num + "' and hotel like '" + hotel + "'", conn);
                da.Fill(virtualdb, "room");

                DataTable t = new DataTable();
                t = virtualdb.Tables["room"];

                t.Rows[0].Delete();
                t.Rows[1].Delete();
                t.Rows[2].Delete();
                t.Rows[3].Delete();
                t.Rows[4].Delete();

                SqlCommandBuilder cb = new SqlCommandBuilder(da);
                da.Update(virtualdb, "room");
            }
            catch (Exception ex) { }
            finally { conn.Close(); }
        }
        public float getPrice(int room, String codhotel)
        {
            float pri = 0;
            SqlConnection conn = new SqlConnection(connectionString);
            DataSet virtualdb = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from room where num like '" + room + "' and hotel like '" + codhotel + "'", conn);
                da.Fill(virtualdb, "room");

                DataTable t = new DataTable();
                t = virtualdb.Tables["room"];

                pri = float.Parse(t.Rows[0][4].ToString());

            }
            catch (Exception ex) { }
            finally { conn.Close(); }

            return pri;
        }
        public int numOfRooms(String typeofroom)
        {
            int num = 0;
            SqlConnection conn = new SqlConnection(connectionString);
            DataSet virtualdb = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select count(*) from room where type like '" + typeofroom + "'", conn);
                da.Fill(virtualdb, "room");

                DataTable t = new DataTable();
                t = virtualdb.Tables["room"];

                num = Int32.Parse(t.Rows[0][0].ToString());
            }
            catch (Exception ex) { }
            finally { conn.Close(); }

            return num;
        }
    }
}
