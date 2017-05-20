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
using lib.EN;

namespace lib.CAD
{
    class CADTicket
    {
        private static string conString;
        public CADTicket()
        {
            conString = ConfigurationManager.ConnectionStrings["DatabaseConnection"].ToString();
            conString = conString.Replace("|DataDirectory|", AppDomain.CurrentDomain.GetData("DataDirectory").ToString());
        }

        public void Create(Ticket ticket)
        {
            Ticket newTicket = (Ticket)ticket;
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();

            try
            {
                SqlDataAdapter da = new SqlDataAdapter("Select * from ticket", con);
                da.Fill(bdvirtual, "ticket");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["ticket"];

                DataRow newrow = t.NewRow();
                newrow[0] = ticket.cod;
                newrow[1] = ticket.client;
                newrow[2] = ticket.day;
                newrow[3] = ticket.totalprice;
                newrow[4] = ticket.child;
                newrow[5] = ticket.adult;

                t.Rows.Add(newrow);
                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "ticket");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error Creating Ticket (CadTicket): " + ex.ToString());
            }
            finally
            {
                con.Close();
            }
        }

        public Ticket Read(int cod, String day, String client)
        {
            Ticket ticket = new Ticket(0, "", "");
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from ticket where cod like '" + cod + "'", con);
                da.Fill(bdvirtual, "ticket");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["ticket"];

                ticket.cod = Int32.Parse(t.Rows[0][0].ToString());
                ticket.client = t.Rows[0][1].ToString();
                ticket.day = t.Rows[0][2].ToString();
                ticket.totalprice = float.Parse(t.Rows[0][3].ToString());
                ticket.child = Int32.Parse(t.Rows[0][4].ToString());
                ticket.adult = Int32.Parse(t.Rows[0][5].ToString());
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error Reading Ticket (CadTicket): " + ex.ToString());
            }
            finally
            {
                con.Close();
            }

            return ticket;
        }

        public void Update(Ticket ticket)
        {
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();

            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from ticket where cod like '" + ticket.cod + "'", con);
                da.Fill(bdvirtual, "ticket");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["ticket"];

                t.Rows[0][1] = ticket.client;
                t.Rows[0][2] = ticket.day;
                t.Rows[0][3] = ticket.totalprice;
                t.Rows[0][4] = ticket.child;
                t.Rows[0][5] = ticket.adult;

                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "ticket");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error Updating Ticket (CadTicket): " + ex.ToString());
            }
            finally
            {
                con.Close();
            }
        }

        public static int NextCode()
        {
            int code = 0;
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select max(cod) from ticket", con);
                da.Fill(bdvirtual, "ticket");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["ticket"];

                code = Convert.ToInt32(t.Rows[0][0].ToString()) + 1;
            }
            catch (Exception ex) { }
            finally { con.Close(); }

            return code;
        }
        public void Delete(int cod)
        {
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from ticket where cod like '" + cod + "'", con);
                da.Fill(bdvirtual, "ticket");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["ticket"];

                t.Rows[0].Delete();

                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "ticket");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error Deleting Ticket (CadTicket): " + ex.ToString());
            }
            finally
            {
                con.Close();
            }
        }

        public float totalPrice(Ticket ti)
        {
            float total = 0;
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();

            try
            {
                SqlDataAdapter da2 = new SqlDataAdapter("select price from tickettype where type like 'Adult'", con);
                da2.Fill(bdvirtual, "adulttype");
                DataTable t2 = new DataTable();
                t2 = bdvirtual.Tables["adulttype"];

                float aprice = float.Parse(t2.Rows[0][0].ToString());

                SqlDataAdapter da3 = new SqlDataAdapter("select price from tickettype where type like 'Child'", con);
                da3.Fill(bdvirtual, "childtype");
                DataTable t3 = new DataTable();
                t3 = bdvirtual.Tables["childtype"];

                float cprice = float.Parse(t3.Rows[0][0].ToString());

                total = (ti.adult * aprice) + (ti.child * cprice);
            }
            catch (Exception ex) {  }
            finally { con.Close(); }

            return total;
        }

        public bool buyTickets(Ticket t)
        {
            bool done = false;
            SqlConnection conn = new SqlConnection(conString);
            DataSet dbvirtual = new DataSet();
            try
            {
                float price = totalPrice(t);
                Ticket newTicket = new Ticket(t.cod, t.client, t.day, price, t.adult, t.child);
                Create(newTicket);
                done = true;
            }
            catch (Exception ex) { }
            finally { conn.Close(); }

            return done;
        }

        public DataSet getTypes()//Returns a list of promos active in the date passed by parameter by executing appropiate commands
        {
            EN.Ticket ticket = new EN.Ticket(0,"","");
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from tickettype", con);
                da.Fill(bdvirtual, "tickettype");

            }
            catch (Exception ex)
            {

            }
            finally
            {
                con.Close();
            }
            return bdvirtual;
        }

    }
}


