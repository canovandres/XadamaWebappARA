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
            ListView1.DataSource = bdvirtual;
            ListView1.DataBind();

        }
    }
}