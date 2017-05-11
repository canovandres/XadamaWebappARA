using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XadamaWebapp
{
    public partial class about : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public static AjaxControlToolkit.Slide[] GetSlides()
        {
            return new AjaxControlToolkit.Slide[] {
            new AjaxControlToolkit.Slide("Media/Hotels/americanluxury2.jpg", "America", ""),
            new AjaxControlToolkit.Slide("Media/Hotels/africansavannah2.jpg", "Africa", ""),
            new AjaxControlToolkit.Slide("Media/Hotels/europeanpalace.jpg", "Europe", "."),
            new AjaxControlToolkit.Slide("Media/Hotels/oceanicparadise.jpg", "Oceania", ""),
            new AjaxControlToolkit.Slide("Media/Hotels/asiangardens.jpg", "Asia", "")};
        }

        protected void sendSuggestion(object sender, EventArgs e)
        {
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            MailMessage message = new MailMessage();
            try
            {
                MailAddress fromAddress = new MailAddress(TextBoxEmail.Text, TextBoxName.Text + " " + TextBox1Surname.Text + " " + TextBox2Surname.Text);
                MailAddress toAddress = new MailAddress("xadama.park@gmail.com", "Xadama Contact");
                message.From = fromAddress;
                message.To.Add(toAddress);
                message.Subject = DropDownType.SelectedItem.Text;
                message.IsBodyHtml = true;
                message.Body = "<div style=\"margin: 20px\">"
                                    + "<b>Name: </b>" + TextBoxName.Text + "<br>"
                                    + "<b>Surname: </b>" + TextBox1Surname.Text + " " + TextBox2Surname.Text + "<br>"
                                    + "<b>Email: </b>" + TextBoxEmail.Text + "<br>"
                                    + "<b>Phone: </b>" + TextBoxPhone.Text + "<br><br>"
                                    + "<b>Message: </b>"
                                    + "<div style=\"margin: 5px\">"
                                        + "<p>" + TextBoxMessage.Text + "</p>"
                                    + "</div>"
                                + "</div>";
                smtpClient.EnableSsl = true;

                smtpClient.Credentials = new System.Net.NetworkCredential("xadama.park@gmail.com", "XadamaHADA");
                smtpClient.Send(message);
                sendLabel.Text = "Done!";
                sendLabel.Visible = true;
            }
            catch(Exception ex)
            {
                sendLabel.Text = "Failed!";
                sendLabel.Visible = true;
            }
        }
    }
}