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
    public partial class shop : System.Web.UI.Page
    {
        private DataSet bdvirtual = new DataSet();
        private Product p = new Product();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                LabelLv.CssClass = "wide xxlarge black padding-large appear";
            }

        }

        protected void OnTShirtsClicked(object sender, EventArgs e)
        {
            LabelLv.Text = "T-SHIRTS";
            bdvirtual = p.showTypeProducts("T-Shirts");
            DataTable t = bdvirtual.Tables["producto"];
            ListView1.DataSource = t;
            ListView1.DataBind();
        }

        protected void OnJumpersClicked(object sender, EventArgs e)
        {
            LabelLv.Text = "JUMPERS";
            bdvirtual = p.showTypeProducts("Jumpers");
            DataTable t = bdvirtual.Tables["producto"];
            ListView1.DataSource = t;
            ListView1.DataBind();
        }

        protected void OnCapsClicked(object sender, EventArgs e)
        {
            LabelLv.Text = "CAPS";
            bdvirtual = p.showTypeProducts("Caps");
            DataTable t = bdvirtual.Tables["producto"];
            ListView1.DataSource = t;
            ListView1.DataBind();
        }

        protected void OnBagsClicked(object sender, EventArgs e)
        {
            LabelLv.Text = "BAGS";
            bdvirtual = p.showTypeProducts("Bags");
            DataTable t = bdvirtual.Tables["producto"];
            ListView1.DataSource = t;
            ListView1.DataBind();
        }
    }
}