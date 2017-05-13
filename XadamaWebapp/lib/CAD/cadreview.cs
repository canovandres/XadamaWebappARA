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
    class CADReview
    {
        private static string conString;

        public CADReview()
        {
            conString = ConfigurationManager.ConnectionStrings["DatabaseConnection"].ToString();
            conString = conString.Replace("|DataDirectory|", AppDomain.CurrentDomain.GetData("DataDirectory").ToString());
        }

        public void Create(EN.Review review) {
            EN.Review newReview = (EN.Review)review;
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from review", con);
                da.Fill(bdvirtual, "review");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["review"];

                DataRow newrow = t.NewRow();
                newrow[0] = newReview.cod;
                //Continuar y modificar segun DB

                t.Rows.Add(newrow);
                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "review");
            }
            catch (Exception ex) { }
            finally { con.Close(); }
        }

        public EN.Review Read(String cod)
        {
            EN.Review review = new EN.Review("", 0, "", "");
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from review where cod like '" + cod + "'", con);
                da.Fill(bdvirtual, "review");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["review"];

                review.cod = t.Rows[0][0].ToString();
                review.name = t.Rows[0][1].ToString();
                review.score = Int32.Parse(t.Rows[0][2].ToString());
                //Continuar y modificar segun DB
            }
            catch (Exception ex) { }
            finally { con.Close(); }

            return review;
        }

        public void Update(EN.Review review) {
            EN.Review newReview = (EN.Review)review;
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from review where cod like '" + review.cod + "'", con);
                da.Fill(bdvirtual, "review");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["review"];

                t.Rows[0][0] = newReview.cod;
                //Continuar y modificar segun DB

                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "review");
            }
            catch (Exception ex) { }
            finally { con.Close(); }
        }

        public void Delete(String cod) {
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from review where cod like '" + cod + "'", con);
                da.Fill(bdvirtual, "review");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["review"];

                t.Rows[0].Delete();
                //Continuar y modificar segun DB

                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "review");
            }
            catch (Exception ex) { }
            finally { con.Close(); }
        }

        public static int MaxCode(String hotel)
        {
            int code = 0;
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select max(code) from review where hotel like '" + hotel + "'", con);
                da.Fill(bdvirtual, "review");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["review"];

                code = Int32.Parse(t.Rows[0][0].ToString());
            }
            catch (Exception ex) { }
            finally { con.Close(); }

            return code;
        }

        public DataSet ListReviews(String hotel)
        {
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from review where hotel like '" + hotel + "'", con);
                da.Fill(bdvirtual, "review");
            }
            catch (Exception ex) { }
            finally { con.Close(); }

            return bdvirtual;
        }
    }
}
