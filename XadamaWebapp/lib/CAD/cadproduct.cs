using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace lib.CAD
{
    class CADProduct
    {
        private string conString;
        public CADProduct()
        {
            conString = ConfigurationManager.ConnectionStrings["DatabaseConnection"].ToString();
            conString = conString.Replace("|DataDirectory|", AppDomain.CurrentDomain.GetData("DataDirectory").ToString());
        }

        public void Create(lib.EN.Product c)
        {//Adds a new product to the database by executing an appropiate command
            SqlConnection con = new SqlConnection(conString);
            try
            {
                DataSet bdvirtual = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter("select* from product",con);
                da.Fill(bdvirtual, "producto");
                DataTable t = new DataTable();
                t = bdvirtual.Tables["producto"];
                DataRow newline = t.NewRow();
                t.Rows.Add(newline);
                SqlCommandBuilder cb = new SqlCommandBuilder(da);
                da.Update(bdvirtual,"producto");
                //hacer return true??
            }//terminar esto añadiendole los parametros
            catch(Exception ex)
            {

            }
            finally
            {
                con.Close();
            }
        }
        public lib.EN.Product Read(String cod)//Reads a product which has the same id as the one passed by parameter by executing the appropiate command
        {
            EN.Product product = new EN.Product("");
            SqlConnection con = new SqlConnection(conString);
            try
            {
                DataSet bdvirtual = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter("select* from product where cod="+cod, con);
                da.Fill(bdvirtual,"producto");
                DataTable t = new DataTable();
                t = bdvirtual.Tables["producto"];
                //igualar todos los parametros con product
            }
            catch (Exception ex)
            {

            }
            finally
            {
                con.Close();
            }

            return product;
        }
        public void Update(lib.EN.Product c)
        {//Updates an existing product which has the same id as the one passed by parameter changing its current values to the ones the product of the parameter has by executing appropiate commands
            SqlConnection con = new SqlConnection(conString);
            try
            {
                DataSet bdvirtual = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter("select* from product where cod=" + c.cod, con);
                da.Fill(bdvirtual, "producto");
                DataTable t = new DataTable();
                t = bdvirtual.Tables["producto"];
                DataRow newline = t.NewRow();
                t.Rows.Add(newline);
                SqlCommandBuilder cb = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "producto");


            }//terminar esto añadiendole los parametros
            catch (Exception ex)
            {

            }
            finally
            {
                con.Close();
            }//hacer un return bool
        }
        public void Delete(String cod)
        {//Deletes the product which has the same id as the one passed by parameter by executing appropiate commands
            SqlConnection con = new SqlConnection(conString);
            try
            {
                DataSet bdvirtual = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter("select* from product where cod=" + cod, con);
                da.Fill(bdvirtual, "producto");
                DataTable t = new DataTable();
                t = bdvirtual.Tables["producto"];
                t.Rows[0].Delete();
                SqlCommandBuilder cb = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "producto");
                //ver si devolver bool
            }
            catch (Exception ex)
            {

            }
            finally
            {
                con.Close();
            }
        }

        public DataSet showTypeProducts(String type)
        {
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select* from product where type= '" + type + "' ", con);
                da.Fill(bdvirtual, "producto");
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

        public DataSet searchProduct(String search)
        {
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select* from product where name like '%" + search + "%' ", con);
                da.Fill(bdvirtual, "search");
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
