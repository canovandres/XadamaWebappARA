using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.IO;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data.SqlTypes;

namespace XadamaWebapp
{
    public partial class Services : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string conString;
            conString = ConfigurationManager.ConnectionStrings["DatabaseConnection"].ToString();

            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("select * from Ride", con);
            da.Fill(bdvirtual, "ride");

            DataTable t = new DataTable();
            t = bdvirtual.Tables["ride"];
            Response.Write(t.Rows[0][2]);
        }
    }
}