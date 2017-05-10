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
        /*private DataSet bdvirtual = new DataSet();
        private DataTable t = new DataTable();
        private Ride enride = new Ride();
        private Show enshow = new Show();
        private Product enprod = new Product();
        private Restaurant enrest = new Restaurant();*/

        protected void Page_Load(object sender, EventArgs e)
        {
            /*if (!Page.IsPostBack) {
                DataTable service = bdvirtual.Tables.Add("services");
                service.Columns.Add("name", typeof(string));
                service.Columns.Add("image", typeof(string));
                service.Columns.Add("description", typeof(string));
                enride.readRides(bdvirtual, "*");
                enshow.readShows(bdvirtual, "*");
                enrest.readRestaurants(bdvirtual, "*");
                ListView1.DataSource = bdvirtual;
                ListView1.DataBind();
            }*/
            /* string conString;
             conString = ConfigurationManager.ConnectionStrings["DatabaseConnection"].ToString();
             conString = conString.Replace("|DataDirectory|", AppDomain.CurrentDomain.GetData("DataDirectory").ToString());

             SqlConnection con = new SqlConnection(conString);
             DataSet bdvirtual = new DataSet();
             SqlDataAdapter da = new SqlDataAdapter("select * from Ride", con);
             da.Fill(bdvirtual, "ride");

             DataTable t = new DataTable();
             t = bdvirtual.Tables["ride"];
             Response.Write(t.Rows[0][2]);*/
        }
    }
}