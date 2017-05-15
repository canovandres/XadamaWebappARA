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
        //Booking booking;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Booking"] != null)
            {
                /*booking = (Booking)Session["Booking"];
                Session.Remove("Booking");

                DropDownHotel.SelectedIndex = Convert.ToInt32(booking.hotel.Substring(1));
                From.Text = booking.datestart;
                To.Text = booking.dateend;
                DropDownSingle.SelectedIndex = booking.nsingle;
                DropDownDouble.SelectedIndex = booking.ndouble;*/
            }
        }

        protected void checkBooking(object sender, EventArgs e)
        {
            /*if (booking.isAvalaible())
            {

            }*/
        }
    }
}