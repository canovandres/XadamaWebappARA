using lib.EN;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Configuration;
using System.Net.Mail;


namespace XadamaWebapp
{
    public partial class bookrestaurant : System.Web.UI.Page
    {
        Reservation reservation;
        private DataSet ds = new DataSet();
        private DataTable dt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            noTablesAvailableAf.Visible = false;
            noTablesAvailableAm.Visible = false;
            noTablesAvailableAs.Visible = false;
            noTablesAvailableE.Visible = false;
            noTablesAvailableO.Visible = false;
            reservePanel.Visible = false;
            signin.UserControlButtonClicked += new EventHandler(UCButton);

            if (Session["reservation"] != null)
            {
                reservation = (Reservation)Session["reservation"];
                Session.Remove("reservation");
                checkReservation(sender, e);
            }
        }

        private void UCButton(object sender, EventArgs e)
        {
            if (Session["Client"] != null)
            {
                signin.Visible = false;
            }
        }

        protected void checkReservation(object sender, EventArgs e)
        {
            noTablesAvailableAf.Visible = false;
            noTablesAvailableAm.Visible = false;
            noTablesAvailableAs.Visible = false;
            reservePanel.Visible = false;
           
            if (reservation.ntables == 0)
            {
                switch (reservation.restaurant)
                {
                    case "E1":
                        errorE.Text = "Select at least 1 table";
                        noTablesAvailableE.Visible = true;
                        break;
                    case "E2":
                        errorAs.Text = "Select at least 1 table";
                        noTablesAvailableAs.Visible = true;
                        break;
                    case "E3":
                        errorAf.Text = "Select at least 1 table";
                        noTablesAvailableAf.Visible = true;
                        break;
                    case "E4":
                        errorAm.Text = "Select at least 1 table";
                        noTablesAvailableAm.Visible = true;
                        break;
                    case "E5":
                        errorO.Text = "Select at least 1 table";
                        noTablesAvailableO.Visible = true;
                        break;
                }
            }
            else if (checkAvailable())
            {
                reserveTable(sender, e);
                
            }
            else
            {
                switch (reservation.restaurant)
                {
                    case "E1":
                        errorE.Text = reservation.tablesAvailable() + " table(s) available";
                        noTablesAvailableE.Visible = true;
                        break;
                    case "E2":
                        errorAs.Text = reservation.tablesAvailable() + " table(s) available";
                        noTablesAvailableAs.Visible = true;
                        break;
                    case "E3":
                        errorAf.Text = reservation.tablesAvailable() + " table(s) available";
                        noTablesAvailableAf.Visible = true;
                        break;
                    case "E4":
                        errorAm.Text = reservation.tablesAvailable() + " table(s) available";
                        noTablesAvailableAm.Visible = true;
                        break;
                    case "E5":
                        errorO.Text = reservation.tablesAvailable() + " table(s) available";
                        noTablesAvailableO.Visible = true;
                        break;
                }
            }
        }
        protected bool checkAvailable()
        {
            bool available = false;
            if (reservation.isAvailable())
            {
                available = true;
            }

            return available;
        }
        protected void reserveAfrica(object sender, EventArgs e)
        {
            string email = null;
            if (Session["Client"] != null)
            {
                email = ((Client)Session["Client"]).email;
            }
            int ntables = Int32.Parse(TablesAfrica.Text);
            reservation = new Reservation(email, 0, "E3", TextBox.Text, ntables);
            Session["reservation"] = reservation;
            Page_Load(sender, e);
        }

        protected void reserveAmerica(object sender, EventArgs e)
        {
            noTablesAvailableAm.Visible = false;
            reservePanel.Visible = false;
            string email = null;
            if (Session["Client"] != null)
            {
                email = ((Client)Session["Client"]).email;
            }
            int ntables = Int32.Parse(TablesAmerica.Text);
            reservation = new Reservation(email, 0, "E4", TextBox1.Text, ntables);
            Session["reservation"] = reservation;
            Page_Load(sender, e);
        }

        protected void reserveAsia(object sender, EventArgs e)
        {
            noTablesAvailableAs.Visible = false;
            string email = null;
            if (Session["Client"] != null)
            {
                email = ((Client)Session["Client"]).email;
            }
            int ntables = Int32.Parse(TablesAsia.Text);
            reservation = new Reservation(email, 0, "E2", TextBox2.Text, ntables);
            Session["reservation"] = reservation;
            Page_Load(sender, e);
        }

        protected void reserveEuropa(object sender, EventArgs e)
        {
            noTablesAvailableO.Visible = false;
            string email = null;
            if (Session["Client"] != null)
            {
                email = ((Client)Session["Client"]).email;
            }
            int ntables = Int32.Parse(TablesEuropa.Text);
            reservation = new Reservation(email, 0, "E1", TextBox3.Text, ntables);
            Session["reservation"] = reservation;
            Page_Load(sender, e);
        }

        protected void reserveOceania(object sender, EventArgs e)
        {
            noTablesAvailableO.Visible = false;
            string email = null;
            if (Session["Client"] != null)
            {
                email = ((Client)Session["Client"]).email;
            }
            int ntables = Int32.Parse(TablesOceania.Text);
            reservation = new Reservation(email, 0, "E5", TextBox4.Text, ntables);
            Session["reservation"] = reservation;
            Page_Load(sender, e);
        }

        protected void reserveTable(object sender, EventArgs e)
        {
            if (Session["Client"] != null)
            {
                reservation.client = ((Client)Session["Client"]).email;
                reservation.reserveTables();
                sendEmail();
                reservePanel.Visible = true;
            }
            else
            {
                registerPanel.Visible = true;
            }
        }
        protected void sendEmail()
        {
            String restaurantName = "";
            switch (reservation.restaurant)
            {
                case "E1":
                    restaurantName = "Shellfish Restaurant";
                    break;
                case "E2":
                    restaurantName = "Sushi King";
                    break;
                case "E3":
                    restaurantName = "Baobab Exotic";
                    break;
                case "E4":
                    restaurantName = "Delicious Burger";
                    break;
                case "E5":
                    restaurantName = "Great Barrier";
                    break;
            }


            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            MailMessage message = new MailMessage();
            try
            {
                MailAddress fromAddress = new MailAddress("xadama.park@gmail.com", "Xadama Bookings");
                MailAddress toAddress = new MailAddress(((Client)Session["Client"]).email, ((Client)Session["Client"]).name + " " + ((Client)Session["Client"]).surname1);
                message.From = fromAddress;
                message.To.Add(toAddress);
                message.Subject = "Reservation of table(s) Xadama Park";
                message.IsBodyHtml = true;
                message.Body = "<div style=\"margin: 20px\">"
                                    + "<h1>" + restaurantName + "</h1><br>"
                                    + "<b>Day: </b>" + reservation.date + "<br>"
                                    + "<b>Number of tables: </b>" + reservation.ntables + "<br>"
                                + "</div>";
                smtpClient.EnableSsl = true;

                smtpClient.Credentials = new System.Net.NetworkCredential("xadama.park@gmail.com", "XadamaHADA");
                smtpClient.Send(message);
            }
            catch (Exception ex)
            {
            }
        }
    }
}