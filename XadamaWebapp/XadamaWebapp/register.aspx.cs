using lib.EN;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace XadamaWebapp
{
    public partial class register : System.Web.UI.Page
    {
        private DataSet dbvirtual = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                
            }
        }

        protected void OnCreateClick(object sender, EventArgs e)
        {
            DataSet bdvirtual = new DataSet();
            try
            {
                string conString = "";
                conString = ConfigurationManager.ConnectionStrings["DatabaseConnection"].ToString();
                conString = conString.Replace("|DataDirectory|", AppDomain.CurrentDomain.GetData("DataDirectory").ToString());

                SqlConnection con = new SqlConnection(conString);
                SqlCommand cmd = new SqlCommand("select * from usuario where email = @email", con);
                cmd.Parameters.AddWithValue("@email", TextBoxEmail.Text);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Open();
                int i = cmd.ExecuteNonQuery();
                con.Close();
                if (dt.Rows.Count > 0)
                {
                    TextBoxEmail.CssClass = "form-error error-text";
                    TextBoxEmail.Text = string.Empty;
                    TextBoxEmail.Attributes.Add("placeholder", "Email already in use!");
                }
                else
                {
                    Client c = new Client(TextBoxEmail.Text, TextBoxPassword.Text);
                    c.email = TextBoxEmail.Text;
                    c.password = TextBoxPassword.Text;
                    c.name = TextBoxName.Text;
                    c.surname1 = TextBox1Surname.Text;
                    c.surname2 = TextBox2Surname.Text;
                    c.age = (Birthdate.Text).ToString();
                    c.phone = Int32.Parse(TextBoxPhone.Text);
                    c.address = TextBoxAddress.Text;
                    c.creditCard = TextBoxCreditCard.Text;
                    c.Create();

                    Session["email"] = TextBoxEmail.Text;
                    Session["name"] = TextBoxName.Text;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error Creating Account: " + ex.ToString());
            }
        }

        protected void OnSingInClick (object sender, EventArgs e)
        {
            DataSet bdvirtual = new DataSet();
            try
            {
                string conString = "";
                conString = ConfigurationManager.ConnectionStrings["DatabaseConnection"].ToString();
                conString = conString.Replace("|DataDirectory|", AppDomain.CurrentDomain.GetData("DataDirectory").ToString());

                SqlConnection con = new SqlConnection(conString);
                SqlCommand cmd = new SqlCommand("select * from usuario where email = @email and password = @password", con);
                cmd.Parameters.AddWithValue("@email", TextBoxEmailSignIn.Text);
                cmd.Parameters.AddWithValue("@password", TextBoxPasswordSignIn.Text);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Open();
                int i = cmd.ExecuteNonQuery();
                con.Close();
                if (dt.Rows.Count > 0)
                {
                    TextBoxEmailSignIn.Text = string.Empty;
                    TextBoxEmailSignIn.Attributes.Add("placeholder", "Correct email!");

                    Session["email"] = TextBoxEmail.Text;
                    Session["name"] = TextBoxName.Text;
                }
                else
                {
                    TextBoxPasswordSignIn.CssClass = "form-error error-text";
                    TextBoxEmailSignIn.CssClass = "form-error error-text";
                    TextBoxEmailSignIn.Text = string.Empty;
                    TextBoxEmailSignIn.Attributes.Add("placeholder", "Incorrect email or password!");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error Creating Account: " + ex.ToString());
            }
        }
    }
}