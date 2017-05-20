using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using lib.EN;

namespace XadamaWebapp
{
    public partial class signin : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public event EventHandler UserControlButtonClicked;

        private void OnUserControlButtonClick()
        {
            if (UserControlButtonClicked != null)
            {
                UserControlButtonClicked(this, EventArgs.Empty);
            }
        }

        protected void OnSingInClick(object sender, EventArgs e)
        {
            Client c_aux = new Client(TextBoxEmailSignIn.Text, TextBoxPasswordSignIn.Text);
            if (c_aux.ExistsUsuarioPassword())
            {
                if (c_aux.ExistsClient())
                {
                    Client c = new Client(TextBoxEmailSignIn.Text);
                    c.Read();
                    Session["Client"] = c;
                }
                else
                {
                    Worker w_aux = new Worker(TextBoxEmailSignIn.Text);
                    if (w_aux.ExistsWorker())
                    {
                        Worker w = new Worker(TextBoxEmailSignIn.Text);
                        w.Read();
                        Session["Worker"] = w;
                    }
                    else
                    {
                        Admin a_aux = new Admin(TextBoxEmailSignIn.Text);
                        if (a_aux.ExistsAdmin())
                        {
                            Admin a = new Admin(TextBoxEmailSignIn.Text);
                            a.Read();
                            Session["Admin"] = a;
                        }
                    }
                }
            }
            OnUserControlButtonClick();
        }
    }
}