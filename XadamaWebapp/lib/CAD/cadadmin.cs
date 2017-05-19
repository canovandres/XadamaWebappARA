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
    class CADAdmin : CADUser
    {
        private static string conString;
        public CADAdmin()
        {
            conString = ConfigurationManager.ConnectionStrings["DatabaseConnection"].ToString();
            conString = conString.Replace("|DataDirectory|", AppDomain.CurrentDomain.GetData("DataDirectory").ToString());
        }

        public void Create(User user)
        {

        }

        public User Read(String email)
        {
            Admin admin = new Admin("");
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from admin where usuario like '" + email + "'", con);
                SqlDataAdapter da2 = new SqlDataAdapter("select * from usuario where email like '" + email + "'", con);

                da.Fill(bdvirtual, "admin");
                da2.Fill(bdvirtual, "usuario");

                DataTable t = new DataTable();
                DataTable t2 = new DataTable();
                t = bdvirtual.Tables["admin"];
                t2 = bdvirtual.Tables["usuario"];

                admin.email = t.Rows[0][0].ToString();
                admin.password = t2.Rows[0][1].ToString();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error Reading Admin (CadAdmin): " + ex.ToString());
            }
            finally
            {
                con.Close();
            }

            return admin;
        }

        public void Update(User user)
        {

        }

        public void Delete(String email)
        {

        }

        public bool ExistsAdmin(String email)
        {
            bool exists = false;
            SqlConnection con = new SqlConnection(conString);
            try
            {
                SqlCommand cmd = new SqlCommand("select * from admin where usuario = @email", con);
                cmd.Parameters.AddWithValue("@email", email);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Open();
                int i = cmd.ExecuteNonQuery();
                if (dt.Rows.Count > 0)
                {
                    exists = true;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error ExistsAdmin (CadAdmin): " + ex.ToString());
            }
            finally
            {
                con.Close();
            }
            return exists;
        }
    }
}
