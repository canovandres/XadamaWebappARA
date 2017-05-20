using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using lib.EN;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace lib.CAD
{
    class CADOrder
    {
        private String conString;
        public CADOrder(String database)
        {
            conString = ConfigurationManager.ConnectionStrings["DatabaseConnection"].ToString();
            conString = conString.Replace("|DataDirectory|", AppDomain.CurrentDomain.GetData("DataDirectory").ToString());
        }

        public void Create(Order order)
        {
            SqlConnection con = new SqlConnection(conString);
            try
            {
                DataSet bdvirtual = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter("select* from order", con);
                da.Fill(bdvirtual, "order");
                DataTable t = new DataTable();
                t = bdvirtual.Tables["order"];
                DataRow newline = t.NewRow();
                newline[0] = order.cod;
                newline[1] = order.client.email;
                newline[2] = order.date;
                t.Rows.Add(newline);
                SqlCommandBuilder cb = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "order");
            }
            catch (Exception ex)
            {

            }
            finally
            {
                con.Close();
            }
        }

        public Order Read(String cod, String email)
        {
            Order order = new Order("", null, "");
            SqlConnection con = new SqlConnection(conString);
            try
            {
                DataSet bdvirtual = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter("select* from order where cod="+cod+" and client="+email, con);
                da.Fill(bdvirtual, "order");
                DataTable t = new DataTable();
                t = bdvirtual.Tables["order"];
                order.cod = t.Rows[0][0].ToString();
                order.client.email = t.Rows[0][1].ToString();
                order.date = t.Rows[0][2].ToString();
            }
            catch (Exception ex)
            {

            }
            finally
            {
                con.Close();
            }
            return order;
        }

        public void Update(Order order)
        {
            SqlConnection con = new SqlConnection(conString);
            try
            {
                DataSet bdvirtual = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter("select* from order where cod=" + order.cod, con);
                da.Fill(bdvirtual, "order");
                DataTable t = new DataTable();
                t = bdvirtual.Tables["order"];
                t.Rows[0][0] = order.cod;
                t.Rows[0][1] = order.client.email;
                t.Rows[0][2] = order.date;
                da.Update(bdvirtual,"order");
                SqlCommandBuilder cb = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "order");
            }
            catch(Exception ex)
            {

            }
            finally
            {
                con.Close();
            }
       }

        public void Delete(String cod)
        {
            SqlConnection con = new SqlConnection(conString);
            try
            {
                DataSet bdvirtual = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter("select* from order where cod=" + cod, con);
                da.Fill(bdvirtual, "order");
                DataTable t = new DataTable();
                t = bdvirtual.Tables["order"];
                t.Rows[0].Delete();
                SqlCommandBuilder cb = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "order");
            }
            catch (Exception ex)
            {

            }
            finally
            {
                con.Close();
            }
        }

        public DataTable getOrderInfo(String clientid)
        {//gets the info of an order where the client is "clientid"
            DataTable t = new DataTable();
            SqlConnection con = new SqlConnection(conString);
            try
            {
                DataSet bdvirtual = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter("select order, product, name, quantity, price from product, orderin where product=cod and client=" + clientid, con);
                da.Fill(bdvirtual, "order");
                t = bdvirtual.Tables["order"];
            }
            catch (Exception ex)
            {

            }
            finally
            {
                con.Close();
            }
            return t;
        }

        public void buyItems(String cod, int quantity, Order order)
        {//inserts in the table orderin the code of the product and quantity of an item when its bought
            DataTable t = new DataTable();
            SqlConnection con = new SqlConnection(conString);
            try
            {
                DataSet bdvirtual = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter("select*from orderin", con);
                da.Fill(bdvirtual, "orderin");
                t = bdvirtual.Tables["orderin"];
                DataRow newline = t.NewRow();
                newline[0] = order.cod;
                newline[1] = order.client.email;
                newline[2] = cod;
                newline[3] = quantity;
                da.Update(bdvirtual, "order");
                SqlCommandBuilder cb = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "order");

            }
            catch (Exception ex)
            {

            }
            finally
            {
                con.Close();
            }
        }

        public String NextCode()
        {
            SqlConnection con = new SqlConnection(conString);
            try
            {
                string aux;
                DataSet bdvirtual = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter("select max(cod) from order", con);
                da.Fill(bdvirtual, "order");
                DataTable t = new DataTable();
                t = bdvirtual.Tables["order"];
                aux = t.Rows[0][0].ToString();
                return aux[0] + Convert.ToString(int.Parse(aux.Substring(1, aux.Length - 1)) + 1);

            }
            catch (Exception ex)
            {

            }
            finally
            {
                con.Close();
            }
            return "";
        }
    }
}