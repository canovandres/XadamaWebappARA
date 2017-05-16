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
                // NULL EXCEPT POINTER
                // TextBoxEmail.Text = Session["email"].ToString();

                // Client c = new Client(Session["email"].ToString());
                // c.Read();
            }
        }
    }
}