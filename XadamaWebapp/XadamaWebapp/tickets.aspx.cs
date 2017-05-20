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
        private DataTable t = new DataTable();
        Ticket ticket;
        int disc = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            TicketsError.Visible = false;
            TicketsCorrect.Visible = false;
            PromoError.Visible = false;
            PromoCode.CssClass = "";
            
            CalendarExtender1.StartDate = DateTime.Today;

            bdvirtual = Ticket.getTypes();
            ListViewTickets.DataSource = bdvirtual;
            ListViewTickets.DataBind();

            if (Session["Ticket"] != null)
            {
                ticket = (Ticket)Session["Ticket"];
                Session.Remove("Ticket");

                date.Text = ticket.day;
                Children.Text = ticket.child.ToString();
                Adults.Text = ticket.adult.ToString();
               
                if (checkPromo())
                {
                    checkPurchase();
                }
            }
        }
        protected bool checkPromo()
        {
            
            try
            {
                if(PromoCode.Text == null)
                {
                    return true;
                }
                else
                {
                    Promo promo = new Promo(PromoCode.Text);
                    promo.Read();
                    Price2.Text = (ticket.totalprice * (1 - (promo.discount / 100))).ToString();
                    PromoCode.CssClass = "";
                    disc = promo.discount;
                    return true;
                }
                
            }
            catch (Exception exc)
            {
                PromoError.Visible = true;
                return false;
            }
        }
        protected void checkPurchase()
        {
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
                Price2.Text = ticket.totalprice.ToString();
                TicketsCorrect.Visible = true; 
            }
        }
        
        protected void OnClickBuyNow(object sender, EventArgs e)
        {
            string email = null;
            if (Session["Client"] != null)
            {
                email = ((Client)Session["Client"]).email;
            }
            // las conversiones a enteros no funcionan, no se por que 
            ticket = new Ticket(0, email, date.Text, 0, Int32.Parse(Adults.Text), Int32.Parse(Children.Text));
            Session["ticket"] = ticket;
            Page_Load(sender, e);
        }

    }
}