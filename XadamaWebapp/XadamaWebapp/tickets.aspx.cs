using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using lib.EN;
using System.Net.Mail;
using System.Data;

namespace XadamaWebapp
{
    public partial class tickets : System.Web.UI.Page
    {
        private DataSet bdvirtual = new DataSet();
        private DataSet bdvirtual2 = new DataSet();
        private DataTable t = new DataTable();
        Ticket ticket;
        float disc = 0;
        protected void Page_Load(object sender, EventArgs e)
        {/*
            TicketsError.Visible = false;
            TicketsCorrect.Visible = false;
            PromoError.Visible = false;
            boughtCorrectly.Visible = false;
            registerPanel.Visible = false;
            
            CalendarExtender1.StartDate = DateTime.Today;
            
            bdvirtual = Ticket.getTypes();
            ListViewTickets.DataSource = bdvirtual;
            ListViewTickets.DataBind();


            
            bdvirtual2 = Ticket.getTypes();
            ListViewBuyTickets.DataSource = bdvirtual2;
            ListViewBuyTickets.DataBind();


            //signin.UserControlButtonClicked += new EventHandler(UCButton);

            if (Session["Ticket"] != null)
            {
                ticket = (Ticket)Session["Ticket"];
                Session.Remove("Ticket");

                date.Text = ticket.day;
               // Children.Text = ticket.child.ToString();
               // Adults.Text = ticket.adult.ToString();

                if(checkPromo()){
                    checkPurchase();
                }
            }
        }
        protected bool checkPromo()
        {
            return true;
                /*
            try
            {
                if(PromoCode.Text == "")
                {
                    disc = 0;
                    return true;
                }
                else if(PromoCode.Text.Substring(0, 1).Equals("T"))
                {
                    Promo promo = new Promo(PromoCode.Text);
                    promo.Read();
                    disc = promo.discount;
                    return true;
                }
                else
                {
                    PromoError.Visible = true;
                    return false;
                }
                
            }
            catch (Exception exc)
            {
                PromoError.Visible = true;
                return false;
            }*/
        }
        protected void checkPurchase()
        {/*
            TicketsError.Visible = false;
            TicketsCorrect.Visible = false;
            
            if (ticket.child <= 0 && ticket.adult <= 0) 
            {
                TicketsError.Visible = true;
            }
            else
            {
                Date2.Text = ticket.day;
                Children2.Text = ticket.child.ToString();
                Adults2.Text = ticket.adult.ToString();
                Promo2.Text = disc.ToString();
                Price2.Text = ((ticket.totalPrice()) * (((float)(100 - disc)) / 100)).ToString();
                //Price2.Text = Math.Round(ticket.totalPrice() - ticket.totalPrice() * (disc / 100), 2).ToString();
                TicketsCorrect.Visible = true; 
            }*/
        }
        
        protected void OnClickBuyNow(object sender, EventArgs e)
        {/*
            string email = null;
            if (Session["Client"] != null)
            {
                email = ((Client)Session["Client"]).email;
            }
            ticket = new Ticket(email, date.Text, Int32.Parse(Adults.Text), Int32.Parse(Children.Text));
            Session["ticket"] = ticket;
            Page_Load(sender, e);
        }

        protected void buyTickets(object sender, EventArgs e)
        {
            ticket = new Ticket("", Date2.Text, Int32.Parse(Adults2.Text), Int32.Parse(Children2.Text)); if (Session["Client"] != null)
            {
                ticket.client = ((Client)Session["Client"]).email;
                ticket.buyTickets();
                sendEmail();
                TicketsCorrect.Visible = false;
                boughtCorrectly.Visible = true;
            }
            else
            {
                TicketsCorrect.Visible = true;
                registerPanel.Visible = true;
            }*/
        }

        protected void sendEmail()
        {/*
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            MailMessage message = new MailMessage();
            try
            {
                MailAddress fromAddress = new MailAddress("xadama.park@gmail.com", "Xadama Bookings");
                MailAddress toAddress = new MailAddress(((Client)Session["Client"]).email, ((Client)Session["Client"]).name + " " + ((Client)Session["Client"]).surname1);
                message.From = fromAddress;
                message.To.Add(toAddress);
                message.Subject = "Xadama Park Ticket Purchase";
                message.IsBodyHtml = true;
                message.Body = "<div style=\"margin: 20px\">"
                                    + "<h1>Dear " + ((Client)Session["Client"]).name +",</h1>"
                                    + "<p>We are glad to confirm your purchase of " + Children2.Text +" child tickets and " + Adults2.Text + " adult tickets, for the day " + Date2.Text + ".<br>"
                                    + "<p>Please, do not hesitate to contact us if you have any questions. </p>"
                                    + "<p>Best regards from Xadama Park team!"
                                + "</div>";
                smtpClient.EnableSsl = true;

                smtpClient.Credentials = new System.Net.NetworkCredential("xadama.park@gmail.com", "XadamaHADA");
                smtpClient.Send(message);
            }
            catch (Exception ex)
            {
            }*/
        }

        private void UCButton(object sender, EventArgs e)
        {/*
            if (Session["Client"] != null)
            {
                signin.Visible = false;
                TicketsCorrect.Visible = true;
            }*/
        }
    }
}