using lib.EN;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace XadamaWebapp
{
    public partial class admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Review.Reported())
            {
                MenuAdmin.Items[5].Text = "<span class=\"text-red bold\">Reviews</span>";
            }
            
            if (!Page.IsPostBack)
            {
                //if (Session["Admin"] != null)
                //{
                    Product p = new Product();
                    DataSet d = p.showTypeProducts("Bags");
                    GridProducts.DataSource = d;
                    GridProducts.DataBind();
                    DataSet d2 = p.showTypeProducts("Jumpers");
                    GridProducts2.DataSource = d2;
                    GridProducts2.DataBind();
                    DataSet d3 = p.showTypeProducts("T-Shirts");
                    GridProducts3.DataSource = d3;
                    GridProducts3.DataBind();
                    DataSet d4 = p.showTypeProducts("Caps");
                    GridProducts4.DataSource = d4;
                    GridProducts4.DataBind();
                
                    /*GridHotels.DataSource = Booking.ListAllHotles();
                    GridRides.DataSource = Ride.ListAllRides();
                    GridRestaurants.DataSource = Restaurant.ListAllRestaurants();
                    GridShows.DataSource = Show.ListAllShows();
                    GridReviews.DataSource = Review.ListAllReviews();
                    GridTickets.DataSource = Ticket.ListAllTickets();
                    GridClients.DataSource = Client.ListAllClients();
                    GridWorkers.DataSource = Worker.ListAllWorkers();*/
                //}
                //else
                //{
                //Response.Redirect("register.aspx");
                //}
            }
        }

        protected void MenuItemClick(object sender, MenuEventArgs e)
        {
            int index = Int32.Parse(e.Item.Value);
            MultiView1.ActiveViewIndex = index;
        }
    }
}