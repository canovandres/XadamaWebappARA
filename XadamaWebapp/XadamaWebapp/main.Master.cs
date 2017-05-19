using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XadamaWebapp
{
    public partial class main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["Admin"] != null)
            {
                Response.Redirect("admin.aspx");
            }
            else if (Session["Client"] != null || Session["Worker"] != null)
            {
                SignInBt.Visible = false;
                ProfileBT.Visible = true;
                SignOutBt.Visible = true;
            }
            else
            {
                SignInBt.Visible = true;
                ProfileBT.Visible = false;
                SignOutBt.Visible = false;
            }
        }

        protected void ProfileClick(object sender, EventArgs e)
        {
            if(Session["Client"] != null)
            {
                Response.Redirect("client.aspx");
            }
            else if (Session["Worker"] != null)
            {
                Response.Redirect("worker.aspx");
            }
        }

        protected void SignOutClick(object sender, EventArgs e)
        {
            if (Session["Client"] != null)
            {
                Session.Remove("Client");
            }
            else if (Session["Worker"] != null)
            {
                Session.Remove("Worker");
            }
        }
    }
}