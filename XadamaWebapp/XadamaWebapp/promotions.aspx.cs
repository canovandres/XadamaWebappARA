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
    public partial class promo : System.Web.UI.Page
    {
        private DataSet bdvirtual = new DataSet();
        private Promo p = new Promo();
        private String currentdate = Convert.ToString(DateTime.Today);

        protected void Page_Load(object sender, EventArgs e)
        {
            bdvirtual = p.getPromos(currentdate);
            DataTable t = bdvirtual.Tables["promocion"];
            ListView1.DataSource = t;
            ListView1.DataBind();

        }
    }
}