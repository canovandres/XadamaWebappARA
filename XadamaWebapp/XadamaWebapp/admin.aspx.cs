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
    public partial class admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Product p = new Product();
                DataSet d = p.showTypeProducts("Bags");
                GridProducts.DataSource = d;
                GridProducts.DataBind();
                DataSet d2 = p.showTypeProducts("Jumpers");
                GridProducts2.DataSource = d2;
                GridProducts2.DataBind();
                DataSet d3 = p.showTypeProducts("T-Shirts");
                GridProducts3.DataSource = d3;
                GridProducts3.DataBind();
                if (Session["Admin"] != null)
                {
                }
                else
                {
                    //Response.Redirect("register.aspx");
                }
            }
        }

        protected void MenuItemClick(object sender, MenuEventArgs e)
        {
            int index = Int32.Parse(e.Item.Value);
            MultiView1.ActiveViewIndex = index;
        }
        
    }
}