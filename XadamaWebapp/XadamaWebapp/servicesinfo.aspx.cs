using lib.EN;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XadamaWebapp
{
    public partial class servicesinfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["Restaurant"] != null)
                {
                    Restaurant rs = (Restaurant)Session["Restaurant"];
                    ServiceTitle.Text = rs.name;
                    ServiceDescription.Text = rs.description;
                    zone.Text = "Zone: " + rs.zone;
                    image.ImageUrl = rs.image;
                    Button.Visible = true;
                    Session.Remove("Restaurant");
                }
                else if (Session["Ride"] != null)
                {
                    Ride r = (Ride)Session["Ride"];
                    ServiceTitle.Text = r.name;
                    ServiceDescription.Text = r.description;
                    minheight.Text = "The minimum height for this ride is: " + r.minHeight + " m";
                    speed.Text = "This ride reaches a speed of " + r.speed + " km/h";
                    zone.Text = r.zone;
                    image.ImageUrl = r.image;
                    speed.Visible = true;
                    minheight.Visible = true;
                    Session.Remove("Ride");
                }
                else if (Session["Show"] != null)
                {
                    Show s = (Show)Session["Show"];
                    ServiceTitle.Text = s.name;
                    ServiceDescription.Text = s.description;
                    image.ImageUrl = s.image;
                    zone.Text = s.zone;
                    Session.Remove("Show");
                }
            }
            /*ServiceTitle.Text = Session["ServiceName"].ToString();
            Seadragon.SourceUrl = "~/Media/Rides/Europe/EuropeanGreece.xml";
            ServiceDescription.Text = Session["ServiceDescription"].ToString();*/
        }

        protected void Button_Click(object sender, EventArgs e)
        {
            Response.Redirect("bookrestaurant.aspx#"+zone.Text.Substring(6,zone.Text.Length-6));
        }
    }
}