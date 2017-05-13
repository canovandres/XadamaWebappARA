using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using lib.EN;

namespace XadamaWebapp
{
    public partial class bookhotel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Booking booking = new Booking(null, "");
            if (Session["Hotel"] != null)
            {
                booking.hotel = Session["Hotel"].ToString();
            }
            if (Session["From"] != null)
            {

            }
            if (Session["To"] != null)
            {

            }
            if (Session["Modality"] != null)
            {

            }
            if (Session["Single"] != null)
            {

            }
            if (Session["Double"] != null)
            {

            }
        }
    }
}