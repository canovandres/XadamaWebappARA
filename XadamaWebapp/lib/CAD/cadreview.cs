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
                newrow[1] = newReview.description;
                newrow[2] = newReview.score;
                newrow[3] = newReview.hotel;
                newrow[4] = newReview.name;

                t.Rows.Add(newrow);
                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "review");
            }
            catch (Exception ex) { }
            finally { con.Close(); }
        }

        public EN.Review Read(String cod)
        {
            EN.Review review = new EN.Review("", "", 0, "");
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from Review where cod like '" + cod + "'", con);
                da.Fill(bdvirtual, "review");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["review"];

                review.cod = t.Rows[0][0].ToString();
                review.description = t.Rows[0][1].ToString();
                review.score = Int32.Parse(t.Rows[0][2].ToString());
                review.hotel = t.Rows[0][3].ToString();
                review.name = t.Rows[0][4].ToString();
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
                SqlDataAdapter da = new SqlDataAdapter("select * from Review where cod like '" + review.cod + "'", con);
                da.Fill(bdvirtual, "review");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["review"];

                t.Rows[0][0] = newReview.cod;
                t.Rows[0][1] = newReview.description;
                t.Rows[0][2] = newReview.score;
                t.Rows[0][3] = newReview.hotel;
                t.Rows[0][4] = newReview.name;

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
                SqlDataAdapter da = new SqlDataAdapter("select * from Review where cod like '" + cod + "'", con);
                da.Fill(bdvirtual, "review");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["review"];

                t.Rows[0].Delete();

                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                da.Update(bdvirtual, "review");
            }
            catch (Exception ex) { }
            finally { con.Close(); }
        }

        public static string NextCode()
        {
            int cod = 0;
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select max(cod) from Review", con);
                da.Fill(bdvirtual, "review");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["review"];

                cod = Convert.ToInt32(t.Rows[0][0].ToString()) + 1;
            }
            catch (Exception ex) { }
            finally { con.Close(); }

            return cod.ToString();
        }

        public DataSet ListReviews(String hotel)
        {
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from Review where hotel like '" + hotel + "'", con);
                da.Fill(bdvirtual, "review");
            }
            catch (Exception ex) { }
            finally { con.Close(); }

            return bdvirtual;
        }

        public DataSet ListAllReviews(String hotel)
        {
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from Review", con);
                da.Fill(bdvirtual, "review");
            }
            catch (Exception ex) { }
            finally { con.Close(); }

            return bdvirtual;
        }

        public bool Reported()
        {
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select count(*) from Review where reported > 0", con);
                da.Fill(bdvirtual, "review");

                DataTable t = new DataTable();
                t = bdvirtual.Tables["review"];

                return Convert.ToInt32(t.Rows[0][0]) > 0 ? true : false;
            }
            catch (Exception ex) { }
            finally { con.Close(); }

            return false;
        }
    }
}
