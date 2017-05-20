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
        private DataTable t=new DataTable();
        private Order order=new Order("");
        protected void Page_Load(object sender, EventArgs e)
        {
            signin.UserControlButtonClicked += new
                    EventHandler(UCButton);
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
                        float actual= (float)(dr["price"]);
                        int cant = (int)(dr["quantity"]);
                        price += (cant * actual);
                    }


                    Label9.Text = Convert.ToString(price);
                    ListView1.DataSource = t;
                    ListView1.DataBind();
                }
                
            }
            catch (Exception ex){}
            finally{}

        }

        protected void DeleteProduct(object sender, ListViewCommandEventArgs e)
        {
                        
            Label name = (Label)e.Item.FindControl("Label1");

            bool found = false;

            if (e.CommandName == "delete")
                {
                                    
                    for (int i = ((DataTable)Session["products"]).Rows.Count - 1; i >= 0 && !found; i--)
                    {
                        DataRow dr = ((DataTable)Session["products"]).Rows[i];
                        if ((String)dr["name"] == name.Text)
                        {
                            ((DataTable)Session["products"]).Rows.Remove(dr);
                            found = true;
                        }
                    }
                                        
                }
                else if (e.CommandName == "add")
                {
                    for (int i = ((DataTable)Session["products"]).Rows.Count - 1; i >= 0 && !found; i--)
                    {
                        DataRow dr = ((DataTable)Session["products"]).Rows[i];
                        if ((String)dr["name"] == name.Text)
                        {
                        int aux = (int)dr["quantity"];
                        aux += 1;
                        found = true;
                        ((DataTable)Session["products"]).Rows[i]["quantity"] = aux;
                        }
                    }
                }
                else if(e.CommandName == "minus")
                {
                    for (int i = ((DataTable)Session["products"]).Rows.Count - 1; i >= 0 && !found; i--)
                    {
                        DataRow dr = ((DataTable)Session["products"]).Rows[i];
                        if ((String)dr["name"] == name.Text)
                        {
                            int aux = (int)dr["quantity"];
                            if (aux > 1)
                            {
                                aux -= 1;
                                ((DataTable)Session["products"]).Rows[i]["quantity"] = aux;
                            }
                            found = true;
                            
                        }
                    }
            }

            t = (DataTable)Session["products"];

            float price = 0;
            for (int i = t.Rows.Count - 1; i >= 0; i--)
            {
                DataRow dr = t.Rows[i];
                float actual = (float)(dr["price"]);
                int cant = (int)(dr["quantity"]);
                price += (cant * actual);
            }
            
            Label9.Text = Convert.ToString(price);
            ListView1.DataSource = t;
            ListView1.DataBind();
            if (t.Rows.Count == 0)
            {
                makeinvisible();
            }

            if (e.CommandName == "delete")
            {
                Response.Redirect("shoppingcart.aspx");
            }
            
        }

        protected void makeinvisible()
        {
            Label34.Visible = true;
            Label12.Visible = false;
            TextBox1.Visible = false;
            Label8.Visible = false;
            Label9.Visible = false;
            shopButton.Visible = false;
            Label5.Visible = false;
            Label6.Visible = false;
            Label7.Visible = false;
            Label3.Visible = false;
            applypromo.Visible = false;
        }

        protected void buyItems(object sender, EventArgs e)
        {
            bool fallo = false;
            
            String aux = "";
            for (int i = ((DataTable)Session["products"]).Rows.Count - 1; i >= 0 && !fallo; i--)
            {
                DataRow dr = ((DataTable)Session["products"]).Rows[i];
                Product p = new Product();
                p.cod = (String)dr["cod"];
                int stock = p.getStock();
                int cantidad = (int)dr["quantity"];

                if (cantidad > stock)
                {
                    fallo = true;
                    aux = (string)dr["name"];
                }
            }
            
            if (!fallo)
            {

                if (Session["Client"] != null)
                {
                    Client cliente = (Client)Session["Client"];
                    order.client = cliente;
                    order.date = DateTime.Today.ToString("dd/MM/yyyy");
                    //order.date = Convert.ToString(today);
                    //order.cod = Order.NextCode();
                    order.cod = "022";
                    List<Product> _products = new List<Product>();

                    for (int i = ((DataTable)Session["products"]).Rows.Count - 1; i >= 0 && !fallo; i--)
                    {
                        DataRow dr = ((DataTable)Session["products"]).Rows[i];
                        Product p = new Product();
                        p.cod = (String)dr["cod"];
                        p.name = (String)dr["name"];
                        p.price = (float)dr["price"];
                        _products.Add(p);

                    }

                    order._products = _products;
                    order.save("");

                    for (int i = ((DataTable)Session["products"]).Rows.Count - 1; i >= 0 && !fallo; i--)
                    {
                        DataRow dr = ((DataTable)Session["products"]).Rows[i];
                        Product p = new Product();
                        p.cod = (String)dr["cod"];
                        int cantidad = (int)dr["quantity"];
                        order.buyItems("",p.cod, cantidad);

                    }

                    shopPanel.Visible = true;
                    sendEmail();
                }
                else
                {
                   
                    registerPanel.Visible = true;
                }
            }
            else
            {
                Label97.Text = "Sorry, the product " + aux + " is not available for your requirement quantity";
                Panel2.Visible = true;
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
                message.Subject = "Shopping at Xadama Park";
                message.IsBodyHtml = true;
                message.Body = "<div style=\"margin: 20px\">"
                                    /*+ "<h1>" + hotelName.Text + "</h1><br>"
                                    + "<b>From: </b>" + DateFrom.Text + "<br>"
                                    + "<b>To: </b>" + DateTo.Text + "<br>"
                                    + "<b>Single Rooms: </b>" + SingleRooms.Text + "<br>"
                                    + "<b>Double Rooms: </b>" + DoubleRooms.Text + "<br>"
                                    + "<b>Price: </b>" + Price.Text + "<br>"*/
                                    + "<h1> Shopping: </h1><br>"                                    
                                    + "<br>"
                                    + "<b>You have bought a total of: </b>" + ((DataTable)Session["products"]).Rows.Count + "<b> items.</b>"+"<br>"
                                    + "<b>Total price: </b>" + Label9.Text + "<b> €.</b>" + "<br>"
                                    + "<br>"
                                    + "<b>If you have any problem with your shop, pleas let us know. Xadama. </b>"
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
            Promo promo = new Promo(TextBox1.Text);
            try
            {
                promo.Read();
                float actual = float.Parse(Label9.Text);
                float nuevo = (float) Math.Round(actual - actual * (promo.discount / 100), 2);
                Label9.Text = Convert.ToString(nuevo);
                TextBox1.CssClass = "";
            }
            catch (Exception exc)
            {
                TextBox1.CssClass = "form-error";
            }
        }

        protected void hidestock(object sender, EventArgs e)
        {
            Panel2.Visible = false;
        }

        private void UCButton(object sender, EventArgs e)
        {
            if (Session["Client"] != null)
            {
                registerPanel.Visible = false;
                
            }
        }
    }
}