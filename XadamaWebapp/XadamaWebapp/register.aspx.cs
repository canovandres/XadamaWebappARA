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
                    if(Birthdate.Text != "")
                    {
                        c.age = (Birthdate.Text).ToString();
                    }
                    if(TextBoxPhone.Text != "")
                    {
                        c.phone = Int32.Parse(TextBoxPhone.Text);
                    }
                    if(TextBoxAddress.Text != "")
                    {
                        c.address = TextBoxAddress.Text;
                    }
                    c.creditCard = TextBoxCreditCard.Text;
                    c.Create();
                    
                    //
                    Session["Client"] = c;
                    //

                    /*
                    Session["email"] = TextBoxEmail.Text;
                    Session["password"] = TextBoxPassword.Text;
                    Session["name"] = TextBoxName.Text;
                    */

                    TextBoxEmail.Text = string.Empty;
                    TextBoxEmail.Attributes.Add("placeholder", "Account created!");
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
                    SqlCommand cmd_client = new SqlCommand("select * from client where usuario = @email", con);
                    cmd_client.Parameters.AddWithValue("@email", TextBoxEmailSignIn.Text);
                    SqlDataAdapter da_client = new SqlDataAdapter(cmd_client);
                    DataTable dt_client = new DataTable();
                    da_client.Fill(dt_client);
                    con.Open();
                    int i_client = cmd.ExecuteNonQuery();
                    con.Close();
                    if (dt_client.Rows.Count > 0)
                    {
                        //
                        Client c = new Client(TextBoxEmailSignIn.Text);
                        c.Read();
                        Session["Client"] = c;
                        //

                        /*
                        Session["email"] = TextBoxEmailSignIn.Text;
                        Session["password"] = TextBoxPasswordSignIn.Text;
                        */
                        // Hay que hacerlo de otra forma, cuando se logea no puedes acceder al nombre dsd textbox
                        // Session["name"] = TextBoxName.Text;

                        TextBoxEmailSignIn.Text = string.Empty;
                        TextBoxEmailSignIn.Attributes.Add("placeholder", "Correct email!");
                    }
                    else
                    {
                        SqlCommand cmd_worker = new SqlCommand("select * from worker where usuario = @email", con);
                        cmd_worker.Parameters.AddWithValue("@email", TextBoxEmailSignIn.Text);
                        SqlDataAdapter da_worker = new SqlDataAdapter(cmd_worker);
                        DataTable dt_worker = new DataTable();
                        da_worker.Fill(dt_worker);
                        con.Open();
                        int i_worker = cmd_worker.ExecuteNonQuery();
                        con.Close();
                        if (dt_worker.Rows.Count > 0)
                        {
                            Worker w = new Worker(TextBoxEmailSignIn.Text);
                            w.Read();
                            Session["Worker"] = w;

                            TextBoxEmailSignIn.Text = string.Empty;
                            TextBoxEmailSignIn.Attributes.Add("placeholder", "Correct email!");
                        }
                        else
                        {
                            SqlCommand cmd_admin = new SqlCommand("select * from admin where usuario = @email", con);
                            cmd_admin.Parameters.AddWithValue("@email", TextBoxEmailSignIn.Text);
                            SqlDataAdapter da_admin = new SqlDataAdapter(cmd_admin);
                            DataTable dt_admin = new DataTable();
                            da_admin.Fill(dt_admin);
                            con.Open();
                            int i_admin = cmd_admin.ExecuteNonQuery();
                            con.Close();
                            if (dt_admin.Rows.Count > 0)
                            {
                                // TODO: Quedan implementaciones
                                /*
                                Admin a = new Admin(TextBoxEmailSignIn.Text);
                                a.Read();
                                Session["Admin"] = a;

                                TextBoxEmailSignIn.Text = string.Empty;
                                TextBoxEmailSignIn.Attributes.Add("placeholder", "Correct email!");
                                */
                            }
                            else
                            {
                                TextBoxEmailSignIn.Text = string.Empty;
                                TextBoxEmailSignIn.Attributes.Add("placeholder", "An error ocurred!");
                                /* 
                                 * Solo llegaría aqui en caso de que el email estuviese en la tabla usuario pero no
                                 * estuviera en la tabla de client, ni worker, ni admin. (Si todo OK no debería pasar)
                                 */
                            }
                        }
                    }
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