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
    class CADTicket
    {
        private string conString;
        public CADTicket()
        {
            conString = ConfigurationManager.ConnectionStrings["DatabaseConnection"].ToString();
            conString = conString.Replace("|DataDirectory|", AppDomain.CurrentDomain.GetData("DataDirectory").ToString());
        }

        public void Create(EN.Ticket ticket)
        {
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();

            try
            {
                SqlDataAdapter da = new SqlDataAdapter("Select * from Ticket", con);
                da.Fill(bdvirtual, "ticket");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["ticket"];

                DataRow newrow = t.NewRow();
                newrow[0] = ticket.cod;
                newrow[1] = ticket.client;
                newrow[2] = ticket.day;
                newrow[3] = ticket.price;
                newrow[4] = ticket.type;

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

        public EN.Ticket Read(String cod)
        {
            EN.Ticket ticket = new EN.Ticket(cod);
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();

            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from ticket cod like '" + cod + "'", con);
                da.Fill(bdvirtual, "ticket");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["ticket"];

                ticket.cod = t.Rows[0][0].ToString();
                ticket.client = t.Rows[0][1].ToString();
                ticket.day = t.Rows[0][2].ToString();
                ticket.client = t.Rows[0][3].ToString();
                ticket.type = t.Rows[0][4].ToString();
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

        public void Update(EN.Ticket ticket)
        {
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();

            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from ticket cod like '" + ticket.cod + "'", con);
                da.Fill(bdvirtual, "ticket");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["ticket"];

                t.Rows[0][1] = ticket.client;
                t.Rows[0][2] = ticket.day;
                t.Rows[0][3] = ticket.price;
                t.Rows[0][4] = ticket.type;

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

        public void Delete(String cod)
        {
            EN.Ticket ticket = new EN.Ticket(cod);
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();

            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from ticket cod like '" + ticket.cod + "'", con);
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

        public DataSet typePrice()
        {
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();

            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from tickettype", con);
                da.Fill(bdvirtual, "tickettype");
                return bdvirtual;
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


