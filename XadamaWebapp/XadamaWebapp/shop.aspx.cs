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
            bdvirtual = p.showTypeProducts("Bags");
            DataTable t = bdvirtual.Tables["producto"];
            ListView1.DataSource = t;
            ListView1.DataBind();

        }
    }
}