using lib.EN;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XadamaWebapp
{
    public partial class register : System.Web.UI.Page
    {
        private DataSet dbvirtual = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void OnCreateClick(object sender, EventArgs e)
        {
            try
            {
                if (TextBoxEmail.Text != "" && TextBoxName.Text != "" && TextBox1Surname.Text != "" && TextBox2Surname.Text != ""
                    && (TextBoxPassword == TextBoxRepeatPassword))
                {
                    Client c = new Client("");
                    c.email = TextBoxEmail.Text;
                    c.password = TextBoxPassword.Text;
                    c.name = TextBoxName.Text;
                    c.surname1 = TextBox1Surname.Text;
                    c.surname2 = TextBox2Surname.Text;
                    c.age = Birthdate.Text;
                    c.phone = Int32.Parse(TextBoxPhone.Text);
                    c.address = TextBoxAddress.Text;
                    c.creditCard = TextBoxCreditCard.Text;

                    c.Create("");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error Creating Account: " + ex.ToString());
            }
        }
    }
}