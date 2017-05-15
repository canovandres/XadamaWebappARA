using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XadamaWebapp
{
    public partial class servicesinfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ServiceTitle.Text = Session["ServiceName"].ToString();
            ServiceImage.ImageUrl = Session["ServiceImage"].ToString();
            ServiceDescription.Text = Session["ServiceDescription"].ToString();
        }
    }
}