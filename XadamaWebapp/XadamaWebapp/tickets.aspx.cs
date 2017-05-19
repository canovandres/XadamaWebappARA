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

        protected void Page_Load(object sender, EventArgs e)
        {
            TicketsError.Visible = false;
            TicketsCorrect.Visible = false;
            PromoCode.CssClass = "";

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

                checkPurchase();
            }
        }
        protected void checkPurchase()
        {
            TicketsError.Visible = false;
            TicketsCorrect.Visible = false;
            
            if ((ticket.child <= 0 && ticket.adult <= 0) || Convert.ToDateTime(ticket.day) < DateTime.Today) // no funciona como deberia whyyyy
            {
                Date2.Text = ticket.day;
                Children2.Text = ticket.child.ToString();
                Adults2.Text = ticket.adult.ToString();
                //Promo2.Text = 
                Price2.Text = Math.Round(ticket.totalPrice(), 2).ToString();
                TicketsError.Visible = true;
            }
            else
            {
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
                     
            ticket = new Ticket(0, email, date.Text, 0, Convert.ToInt32(Adults.ToString()), Int32.Parse(Children.Text));
            Session["ticket"] = ticket;
            Page_Load(sender, e);
        }
    }
}