using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using lib.EN;
using System.Net.Mail;

namespace XadamaWebapp
{
    public partial class shoppingcart : System.Web.UI.Page
    {
        DataTable t=new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                
                t = (DataTable)Session["products"];
                if (t.Rows.Count == 0)
                {
                    makeinvisible();                    
                }
                else
                {
                    float price = 0;
                    for (int i = t.Rows.Count - 1; i >= 0; i--)
                    {
                        DataRow dr = t.Rows[i];
                        price += (float)(dr["price"]);
                    }


                    Label9.Text = Convert.ToString(price);
                    ListView1.DataSource = t;
                    ListView1.DataBind();
                }
                
            }
            catch (Exception ex){}
            finally{}

        }

        protected void DeleteProduct(object sender, ListViewSelectEventArgs e)
        {
            
                ListViewItem item = ListView1.Items[e.NewSelectedIndex];
                
                Label name = (Label)item.FindControl("Label1");
                bool found = false;
                for (int i = ((DataTable)Session["products"]).Rows.Count - 1; i >= 0 && !found; i--)
                {
                    DataRow dr = ((DataTable)Session["products"]).Rows[i];
                    if ((String)dr["name"] == name.Text)
                    {
                        ((DataTable)Session["products"]).Rows.Remove(dr);
                        found = true;
                    }
                }

                t = (DataTable)Session["products"];
                float price = 0;
                for (int i = t.Rows.Count - 1; i >= 0; i--)
                {
                    DataRow dr = t.Rows[i];
                    price += (float)(dr["price"]);
                }


                Label9.Text = Convert.ToString(price);
                ListView1.DataSource = t;
                ListView1.DataBind();
                if (t.Rows.Count == 0)
                {
                     makeinvisible();
                }
                           
        }

        protected void makeinvisible()
        {
            Label34.Visible = true;
            Label12.Visible = false;
            TextBox1.Visible = false;
            Label8.Visible = false;
            Label9.Visible = false;
            Button23.Visible = false;
            Label5.Visible = false;
            Label6.Visible = false;
            Label7.Visible = false;
            Label3.Visible = false;
        }

        protected void buyitems(object sender, EventArgs e)
        {
            if (Session["Client"] != null)
            {
                //booking.bookRooms();
                sendEmail();
                
            }
            else
            {
                Response.Redirect("register.aspx");
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
                                    /*+ "<h1>" + hotelName.Text + "</h1><br>"
                                    + "<b>From: </b>" + DateFrom.Text + "<br>"
                                    + "<b>To: </b>" + DateTo.Text + "<br>"
                                    + "<b>Single Rooms: </b>" + SingleRooms.Text + "<br>"
                                    + "<b>Double Rooms: </b>" + DoubleRooms.Text + "<br>"
                                    + "<b>Price: </b>" + Price.Text + "<br>"*/
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