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
        Booking booking;
        protected void Page_Load(object sender, EventArgs e)
        {
            okBooking.Visible = false;
            errorBooking.Visible = false;

            if (Session["Booking"] != null)
            {
                booking = (Booking)Session["Booking"];
                Session.Remove("Booking");

                DropDownHotel.SelectedIndex = Convert.ToInt32(booking.hotel.Substring(1)) - 1;
                From.Text = booking.datestart;
                To.Text = booking.dateend;
                DropDownSingle.SelectedIndex = booking.nsingle;
                DropDownDouble.SelectedIndex = booking.ndouble;
                DropDownFood.Text = booking.board;

                checkBooking();
            }
        }

        protected void checkBooking()
        {
            okBooking.Visible = false;
            errorBooking.Visible = false;
            if (booking.isAvalaible())
            {
                switch (booking.hotel)
                {
                    case "H1":
                        hotelImg.ImageUrl = "~/Media/Hotels/europeanpalace3.jpg";
                        hotelName.Text = "European Palace";
                        break;
                    case "H2":
                        hotelImg.ImageUrl = "~/Media/Hotels/asiangardens3.jpg";
                        hotelName.Text = "Asian Gardens";
                        break;
                    case "H3":
                        hotelImg.ImageUrl = "~/Media/Hotels/africansavannah2.jpg";
                        hotelName.Text = "African Savannah";
                        break;
                    case "H4":
                        hotelImg.ImageUrl = "~/Media/Hotels/americanluxury3.jpg";
                        hotelName.Text = "American Luxury";
                        break;
                    case "H5":
                        hotelImg.ImageUrl = "~/Media/Hotels/oceanicparadise2.jpg";
                        hotelName.Text = "Oceanic Paradise";
                        break;
                }
                DateFrom.Text = booking.datestart;
                DateTo.Text = booking.dateend;
                Modality.Text = booking.board;
                Price.Text = Math.Round(booking.getPrice(), 2).ToString();
                okBooking.Visible = true;
            }
            else
            {
                errorBooking.Visible = true;
            }
        }

        protected void searchBooking(object sender, EventArgs e)
        {
            string email = null;
            if (Session["Client"] != null)
            {
                email = ((Client)Session["Client"]).email;
            }
            booking = new Booking(email, 0, DropDownHotel.SelectedValue, From.Text, To.Text, DropDownFood.Text, DropDownSingle.SelectedIndex, DropDownDouble.SelectedIndex);
            Session["booking"] = booking;
            Page_Load(sender, e);
        }
    }
}