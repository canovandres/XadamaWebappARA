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

        protected void OnSaveChangesClick(object sender, EventArgs e)
        {
            DataSet bdvirtual = new DataSet();
            try
            {
                Client c = new Client(Session["email"].ToString());
                c.email = Session["email"].ToString();
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
    }
}