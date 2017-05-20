using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using lib.EN;
using System.Net.Mail;

namespace XadamaWebapp
{
    public partial class bookhotel : System.Web.UI.Page
    {
        Booking booking = new Booking("", 0, "", "", "", "");
        protected void Page_Load(object sender, EventArgs e)
        {
            okBooking.Visible = false;
            errorBooking.Visible = false;
            errorRooms.Visible = false;
            bookPanel.Visible = false;
            PromoCode.CssClass = "";
            From.Attributes.Add("readonly", "readonly");
            To.Attributes.Add("readonly", "readonly");
            signin.UserControlButtonClicked += new
                    EventHandler(UCButton);

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

        protected void Page_PreRender(object sender, EventArgs e)
        {
            RangeValidator1.MinimumValue = DateTime.Now.Date.ToString("dd-MM-yyyy");
            RangeValidator1.MaximumValue = DateTime.Now.Date.AddYears(90).ToString("dd-MM-yyyy");
        }

        protected void checkBooking()
        {
            okBooking.Visible = false;
            errorBooking.Visible = false;
            bookPanel.Visible = false;
            errorRooms.Visible = false;
            if(booking.nsingle == 0 && booking.ndouble == 0)
            {
                errorRooms.Visible = true;
            }
            else if (booking.isAvalaible())
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
                SingleRooms.Text = booking.nsingle.ToString() + " rooms";
                DoubleRooms.Text = booking.ndouble.ToString() + " rooms";
                Price.Text = Math.Round(booking.getPrice(), 2).ToString() +" €";
                okBooking.Visible = true;
                errorRooms.Visible = false;
            }
            else
            {
                errorBooking.Visible = true;
                errorRooms.Visible = false;
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

        protected void bookRooms(object sender, EventArgs e)
        {
            booking = new Booking("", 0, DropDownHotel.SelectedValue, From.Text, To.Text, DropDownFood.Text, DropDownSingle.SelectedIndex, DropDownDouble.SelectedIndex);
            if (Session["Client"] != null)
            {
                booking.client = ((Client)Session["Client"]).email;
                booking.bookRooms();
                //sendEmail();
                bookPanel.Visible = true;
            }
            else
            {
                okBooking.Visible = true;
                registerPanel.Visible = true;
            }
        }

        protected void sendEmail()
        {
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            MailMessage message = new MailMessage();
            try
            {
                MailAddress fromAddress = new MailAddress("xadama.park@gmail.com", "Xadama Bookings");
                MailAddress toAddress = new MailAddress(((Client)Session["Client"]).email, ((Client)Session["Client"]).name + " " + ((Client)Session["Client"]).surname1);
                message.From = fromAddress;
                message.To.Add(toAddress);
                message.Subject = "Booking at Xadama Park";
                message.IsBodyHtml = true;
                message.Body = "<div style=\"margin: 20px\">"
                                    + "<h1>" + hotelName.Text + "</h1><br>"
                                    + "<b>From: </b>" + DateFrom.Text + "<br>"
                                    + "<b>To: </b>" + DateTo.Text + "<br>"
                                    + "<b>Single Rooms: </b>" + SingleRooms.Text + "<br>"
                                    + "<b>Double Rooms: </b>" + DoubleRooms.Text + "<br>"
                                    + "<b>Price: </b>" + Price.Text + "<br>"
                                + "</div>";
                smtpClient.EnableSsl = true;

                smtpClient.Credentials = new System.Net.NetworkCredential("xadama.park@gmail.com", "XadamaHADA");
                smtpClient.Send(message);
            }
            catch (Exception ex)
            {
            }
        }

        protected void checkPromo(object sender, EventArgs e)
        {
            Promo promo = new Promo(PromoCode.Text);
            try
            {
                promo.Read();
                Price.Text = Math.Round(booking.getPrice() - booking.getPrice() * (promo.discount / 100), 2).ToString();
                PromoCode.CssClass = "";
            }
            catch (Exception exc)
            {
                PromoCode.CssClass = "form-error";
            }
        }

        private void UCButton(object sender, EventArgs e)
        {
            if (Session["Client"] != null)
            {
                signin.Visible = false;
                okBooking.Visible = true;
            }
        }
    }
}