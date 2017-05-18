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
    public partial class client : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if(Session["email"] != null)
                {
                    Client c = new Client(Session["email"].ToString());
                    c.Read();

                    TextBoxEmail.Text = Session["email"].ToString();
                    TextBoxName.Text = c.name;
                    TextBox1Surname.Text = c.surname1;
                    TextBox2Surname.Text = c.surname2;
                    Birthdate.Text = c.age;
                    if(c.phone != 0)
                    {
                        TextBoxPhone.Text = (c.phone).ToString();
                    }
                    TextBoxAddress.Text = c.address;
                    TextBoxCreditCard.Text = c.creditCard;
                }
                else
                {
                    // Reenviar a la pagina de LogIn o Inicio
                }
            }
        }

        protected void MenuItemClick(object sender, MenuEventArgs e)
        {
            int index = Int32.Parse(e.Item.Value);
            MultiView1.ActiveViewIndex = index;
        }

        protected void OnSaveChangesClick(object sender, EventArgs e)
        {
            DataSet bdvirtual = new DataSet();
            try
            {
                Client c = new Client(Session["email"].ToString());
                c.email = Session["email"].ToString();
                c.password = Session["password"].ToString();
                c.name = TextBoxName.Text;
                c.surname1 = TextBox1Surname.Text;
                c.surname2 = TextBox2Surname.Text;
                if (Birthdate.Text != "")
                {
                    c.age = (Birthdate.Text).ToString();
                }
                if (TextBoxPhone.Text != "")
                {
                    c.phone = Int32.Parse(TextBoxPhone.Text);
                }
                if (TextBoxAddress.Text != "")
                {
                    c.address = TextBoxAddress.Text;
                }
                c.creditCard = TextBoxCreditCard.Text;
                c.Update();

                Session["email"] = TextBoxEmail.Text;
                Session["name"] = TextBoxName.Text;

                SuccessfulyLabel.Text = "Done!";
                SuccessfulyLabel.Visible = true;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error Creating Account: " + ex.ToString());
            }
        }

        protected void OnChangePasswordClick (object sender, EventArgs e)
        {
            DataSet bdvirtual = new DataSet();
            try
            {
                string conString = "";
                conString = ConfigurationManager.ConnectionStrings["DatabaseConnection"].ToString();
                conString = conString.Replace("|DataDirectory|", AppDomain.CurrentDomain.GetData("DataDirectory").ToString());

                SqlConnection con = new SqlConnection(conString);
                SqlCommand cmd = new SqlCommand("select * from usuario where email = @email and password = @password", con);
                cmd.Parameters.AddWithValue("@email", Session["email"].ToString());
                cmd.Parameters.AddWithValue("@password", TextBoxPassword.Text);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Open();
                int i = cmd.ExecuteNonQuery();
                con.Close();
                if (dt.Rows.Count > 0)
                {
                    Client c = new Client(Session["email"].ToString());
                    c.password = TextBoxPassword.Text;
                    c.email = Session["email"].ToString();
                    c.password = TextBoxNewPassword.Text;
                    c.name = TextBoxName.Text;
                    c.surname1 = TextBox1Surname.Text;
                    c.surname2 = TextBox2Surname.Text;
                    if (Birthdate.Text != "")
                    {
                        c.age = (Birthdate.Text).ToString();
                    }
                    if (TextBoxPhone.Text != "")
                    {
                        c.phone = Int32.Parse(TextBoxPhone.Text);
                    }
                    if (TextBoxAddress.Text != "")
                    {
                        c.address = TextBoxAddress.Text;
                    }
                    c.creditCard = TextBoxCreditCard.Text;
                    c.Update();

                    ChangedLabel.Text = "Done!";
                    ChangedLabel.Visible = true;
                }
                else
                {
                    TextBoxPassword.CssClass = "form-error error-text";
                    TextBoxPassword.CssClass = "form-error error-text";
                    TextBoxPassword.Text = string.Empty;
                    TextBoxPassword.Attributes.Add("placeholder", "Incorrect password!");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error Creating Account: " + ex.ToString());
            }
        }
    }
}