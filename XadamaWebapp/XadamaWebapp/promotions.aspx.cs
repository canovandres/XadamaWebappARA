using lib.EN;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Threading;

namespace XadamaWebapp
{
    public partial class promo : System.Web.UI.Page
    {
        private DataSet bdvirtual = new DataSet();
        private DataTable t = new DataTable();
        private String currentdate = Convert.ToString(DateTime.Today);

        protected void Page_Load(object sender, EventArgs e)
        {
            
            bdvirtual = Promo.getPromos(currentdate);
            ListViewPromo.DataSource = bdvirtual;
            ListViewPromo.DataBind();
            if (Page.IsPostBack)
            {
               
            }

        }

    }
}