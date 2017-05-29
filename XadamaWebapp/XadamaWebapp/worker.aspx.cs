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
    public partial class worker : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!Page.IsPostBack)
            {
                if (Session["Worker"] != null)
                {
                    Birthdate.Attributes.Add("readonly", "readonly");

                    //
                    Worker w = (Worker)Session["Worker"];
                    TextBoxEmail.Text = w.email;
                    //

                    /*
                    TextBoxEmail.Text = Session["email"].ToString();
                    */

                    if(w.name != "")
                    {
                        TextBoxName.Text = w.name;
                    }
                    if (w.surname1 != "")
                    {
                        TextBox1Surname.Text = w.surname1;
                    }
                    if (w.surname2 != "")
                    {
                        TextBox2Surname.Text = w.surname2;
                    }
                    if (w.age != "")
                    {
                        Birthdate.Text = w.age;
                    }
                    if (w.phone != 0)
                    {
                        TextBoxPhone.Text = (w.phone).ToString();
                    }
                }
                else
                {
                    Response.Redirect("register.aspx");
                }
            }
        }

        protected void MenuItemClick(object sender, MenuEventArgs e)
        {
            if (Session["Worker"] != null)
            {
                int index = Int32.Parse(e.Item.Value);
                MultiView1.ActiveViewIndex = index;

                // TODO: NO SÉ SI HABRIA QUE HACERLO DE ESTA FORMA
                if (index == 0)
                {
                    //
                    Worker w = (Worker)Session["Worker"];
                    TextBoxEmail.Text = w.email;
                    //

                    /*
                    TextBoxEmail.Text = Session["email"].ToString();
                    */
                    TextBoxName.Text = w.name;
                    if(w.surname1 != "")
                    {
                        TextBox1Surname.Text = w.surname1;
                    }
                    if (w.surname2 != "")
                    {
                        TextBox2Surname.Text = w.surname2;
                    }                    
                    if (w.age != "")
                    {
                        Birthdate.Text = w.age;
                    }
                    if (w.phone != 0)
                    {
                        TextBoxPhone.Text = (w.phone).ToString();
                    }

                    SuccessfulyLabel.Visible = false;
                }
                else if (index == 2)
                {

                }
            }
            else
            {

            }
        }

        protected void OnSaveChangesClick(object sender, EventArgs e)
        {
            DataSet bdvirtual = new DataSet();
            try
            {
                //
                Worker w_aux = (Worker)Session["Worker"];

                Worker w = new Worker(w_aux.email);
                w.email = w_aux.email;
                w.password = w_aux.password;
                //

                /*
                Client c = new Client(Session["email"].ToString());
                c.email = Session["email"].ToString();
                c.password = Session["password"].ToString();
                */
                w.name = TextBoxName.Text;
                w.surname1 = TextBox1Surname.Text;
                w.surname2 = TextBox2Surname.Text;
                if (Birthdate.Text != "")
                {
                    w.age = (Birthdate.Text).ToString();
                }
                else
                {
                    w.age = "";
                }
                if (TextBoxPhone.Text != "")
                {
                    w.phone = Int32.Parse(TextBoxPhone.Text);
                }
                else
                {
                    w.phone = 0;
                }
                w.Update();

                //
                Session["Worker"] = w;
                //

                /*
                Session["email"] = TextBoxEmail.Text;
                Session["name"] = TextBoxName.Text;
                */

                SuccessfulyLabel.Text = "Done!";
                SuccessfulyLabel.Visible = true;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error Updating Account: " + ex.ToString());
            }
        }

        protected void OnChangePasswordClick(object sender, EventArgs e)
        {
            DataSet bdvirtual = new DataSet();
            try
            {
                Worker w_aux = (Worker)Session["Worker"];

                string conString = "";
                conString = ConfigurationManager.ConnectionStrings["DatabaseConnection"].ToString();
                conString = conString.Replace("|DataDirectory|", AppDomain.CurrentDomain.GetData("DataDirectory").ToString());

                SqlConnection con = new SqlConnection(conString);
                SqlCommand cmd = new SqlCommand("select * from usuario where email = @email and password = @password", con);
                cmd.Parameters.AddWithValue("@email", w_aux.email);
                cmd.Parameters.AddWithValue("@password", TextBoxPassword.Text);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Open();
                int i = cmd.ExecuteNonQuery();
                con.Close();
                if (dt.Rows.Count > 0)
                {
                    //


                    Worker w = new Worker(w_aux.email);
                    w.email = w_aux.email;
                    //

                    /*
                    Client c = new Client(Session["email"].ToString());
                    c.email = Session["email"].ToString();
                    */
                    w.password = TextBoxNewPassword.Text;
                    w.name = TextBoxName.Text;
                    w.surname1 = TextBox1Surname.Text;
                    w.surname2 = TextBox2Surname.Text;
                    if (Birthdate.Text != "")
                    {
                        w.age = (Birthdate.Text).ToString();
                    }
                    else
                    {
                        w.age = "";
                    }
                    if (TextBoxPhone.Text != "")
                    {
                        w.phone = Int32.Parse(TextBoxPhone.Text);
                    }
                    else
                    {
                        w.phone = 0;
                    }
                    w.Update();

                    //
                    Session["Worker"] = w;
                    //

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

        protected void CalendarDayRender(object sender, DayRenderEventArgs e)
        {
            Worker w = new Worker(((Worker)Session["Worker"]).email);

            DataSet dsWorks = w.Works();
            DateTime nextDate;
            if (dsWorks != null)
            {
                foreach (DataRow dr in dsWorks.Tables[0].Rows)
                {
                    nextDate = Convert.ToDateTime(dr["calendar"]);
                    if (nextDate == e.Day.Date)
                    {
                        e.Cell.BackColor = System.Drawing.Color.Green;
                    }
                }
            }
        }
    }
}