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
            if (Session["Restaurant"]!=null)
            {
                Restaurant r = (Restaurant)Session["Restaurant"];
                ServiceTitle.Text = r.name;
                ServiceDescription.Text = r.description;
                image.ImageUrl = r.image;
            }
            else if (Session["Ride"]!=null)
            {
                Ride r = (Ride)Session["Ride"];
                ServiceTitle.Text = r.name;
                ServiceDescription.Text = r.description;
                minheight.Text = "The minimum height for this ride is: " + r.minHeight+" cm";
                speed.Text = "This ride reaches a speed of " + r.speed + " km/h";
                image.ImageUrl = r.image;
                speed.Visible = true;
                minheight.Visible = true;
            }
            else if (Session["Show"]!=null)
            {
                Show s = (Show)Session["Show"];
                ServiceTitle.Text = s.name;
                ServiceDescription.Text=s.description;
                image.ImageUrl = s.image;
            }
            /*ServiceTitle.Text = Session["ServiceName"].ToString();
            Seadragon.SourceUrl = "~/Media/Rides/Europe/EuropeanGreece.xml";
            ServiceDescription.Text = Session["ServiceDescription"].ToString();*/
        }
    }
}