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
                SqlDataAdapter da = new SqlDataAdapter("select* from product", con);
                da.Fill(bdvirtual, "producto");
                DataTable t = new DataTable();
                t = bdvirtual.Tables["producto"];
                DataRow newline = t.NewRow();
                newline[0] = c.cod;
                newline[1] = c.name;
                newline[2] = c.type;
                newline[4] = c.description;
                newline[5] = c.price;
                newline[6] = c.stock;
                newline[7] = c.image;
                t.Rows.Add(newline);
                SqlCommandBuilder cb = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "producto");
            }
            catch (Exception ex)
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
                SqlDataAdapter da = new SqlDataAdapter("select* from product where cod=" + cod, con);
                da.Fill(bdvirtual, "producto");
                DataTable t = new DataTable();
                t = bdvirtual.Tables["producto"];
                product.cod = t.Rows[0][0].ToString();
                product.name = t.Rows[0][1].ToString();
                product.type = t.Rows[0][2].ToString();
                product.description = t.Rows[0][3].ToString();
                product.price = float.Parse(t.Rows[0][4].ToString());
                product.stock = Int32.Parse(t.Rows[0][5].ToString());
                product.image = t.Rows[0][6].ToString();
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
                t.Rows[0][0] = c.cod;
                t.Rows[0][1] = c.name;
                t.Rows[0][2] = c.type;
                t.Rows[0][3] = c.description;
                t.Rows[0][4] = c.price;
                t.Rows[0][5] = c.stock;
                t.Rows[0][6] = c.image;
                SqlCommandBuilder cb = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "producto");


            }
            catch (Exception ex)
            {

            }
            finally
            {
                con.Close();
            }
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

        public List<string> getProductsName(string prefixText)
        {//returns every product which has inside its name the prefixText passed
            List<string> l = new List<string>();
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select name from product where name like '%" + prefixText + "%'", con);
                da.Fill(bdvirtual, "producto");
                DataTable t = bdvirtual.Tables["producto"];
                foreach (DataRow r in t.Rows)
                {
                    l.Add(r["name"].ToString());
                }

            }
            catch (Exception ex)
            {

            }
            finally
            {
                con.Close();
            }
            return l;
        }

        public DataSet GetAllProducts()
        {//returns all de information of all the products of the database
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select*from product", con);
                da.Fill(bdvirtual, "producto");
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

        public void DeleteProduct(int index)
        {//deletes de product depending on de index it has in the database
            SqlConnection con = new SqlConnection(conString);
            try
            {
                DataSet bdvirtual = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter("select* from product", con);
                da.Fill(bdvirtual, "producto");
                DataTable t = new DataTable();
                t = bdvirtual.Tables["producto"];
                t.Rows[index].Delete();
                SqlCommandBuilder cb = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "producto");
            }
            catch (Exception ex)
            {

            }
            finally
            {
                con.Close();
            }
        }

        public int getStock(String cod)
        {
            SqlConnection con = new SqlConnection(conString);
            try
            {
                DataSet bdvirtual = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter("select stock from product where cod=" + cod, con);
                da.Fill(bdvirtual, "product");
                DataTable t = new DataTable();
                t = bdvirtual.Tables["producto"];
                return int.Parse(t.Rows[0][0].ToString());
            }
            catch (Exception ex)
            {

            }
            finally
            {
                con.Close();
            }
            return 0;
        }
    }
}
