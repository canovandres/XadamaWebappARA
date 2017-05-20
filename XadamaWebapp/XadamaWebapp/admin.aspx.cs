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
                    /*GridProducts.DataSource = d;
                    GridProducts.DataBind();*/
                
                    GridClients.DataSource = Client.ListAllClients();
                    GridClients.DataBind();
                
                    GridWorkers.DataSource = Worker.ListAllWorkers();
                    GridWorkers.DataBind();
                
                    GridReviews.DataSource = Review.ListAllReviews();
                    GridReviews.DataBind();

                    /*GridRides.DataSource = Ride.ListAllRides();
                    GridRestaurants.DataSource = Restaurant.ListAllRestaurants();
                    GridShows.DataSource = Show.ListAllShows();
                    GridTickets.DataSource = Ticket.ListAllTickets();*/

                    /*GridRides.DataBind();
                    GridRestaurants.DataBind();
                    GridShows.DataBind();
                    GridTickets.DataBind();*/
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
        
        //Grid Shows

        protected void GridShows_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Show show = new Show("");
            //GridShows.DataSource = show.DeleteShow(e.RowIndex);
            GridShows.DataBind();
        }

        protected void GridShows_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridShows.EditIndex = e.NewEditIndex;
            //GridShows.DataSource = Show.ListAllShows();
            GridShows.DataBind();
        }
        protected void GridShows_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string cod = ((Label)GridShows.Rows[e.RowIndex].FindControl("lblCode")).Text;
            string name = ((TextBox)GridShows.Rows[e.RowIndex].FindControl("txtName")).Text;
            string description = ((TextBox)GridShows.Rows[e.RowIndex].FindControl("txtDescription")).Text;
            string image = ((TextBox)GridShows.Rows[e.RowIndex].FindControl("txtImage")).Text;
            string zone = ((TextBox)GridShows.Rows[e.RowIndex].FindControl("txtZone")).Text;
            Show show = new Show(cod, name, description, image, zone);
            //show.Update();
            GridShows.EditIndex = -1;
            //GridShows.DataSource = Show.ListAllShows();
            GridShows.DataBind();
        }
        protected void GridShows_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridShows.PageIndex = e.NewPageIndex;
            //GridShows.DataSource = Show.ListAllShows();
            GridShows.DataBind();
        }
        protected void GridShows_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridShows.EditIndex = -1;
            //GridShows.DataSource = Show.ListAllShows();
            GridShows.DataBind();
        }

        protected void AddNewShow(object sender, EventArgs e)
        {
            string cod = ((TextBox)GridReviews.FooterRow.FindControl("txtCode")).Text;
            string name = ((TextBox)GridReviews.FooterRow.FindControl("txtName")).Text;
            string description = ((TextBox)GridReviews.FooterRow.FindControl("txtDescription")).Text;
            string image = ((TextBox)GridReviews.FooterRow.FindControl("txtImage")).Text;
            string zone = ((TextBox)GridReviews.FooterRow.FindControl("txtZone")).Text;

            Show show = new Show(cod, name, description, image, zone);
            //show.Create();
            //GridShows.DataSource = Show.ListAllShows();
            GridShows.DataBind();
        }

        //Grid Reviews

        protected void GridReviews_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Review review = new Review("", "", 0, "");
            GridReviews.DataSource = review.DeleteReview(e.RowIndex);
            GridReviews.DataBind();
        }

        protected void GridReviews_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridReviews.EditIndex = e.NewEditIndex;
            GridReviews.DataSource = Review.ListAllReviews();
            GridReviews.DataBind();
        }
        protected void GridReviews_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string cod = ((Label)GridReviews.Rows[e.RowIndex]
                        .FindControl("lblCode")).Text;
            string description = ((TextBox)GridReviews.Rows[e.RowIndex]
                                .FindControl("txtDescription")).Text;
            string score = ((TextBox)GridReviews.Rows[e.RowIndex]
                                .FindControl("txtScore")).Text;
            string hotel = ((TextBox)GridReviews.Rows[e.RowIndex]
                                .FindControl("txtHotel")).Text;
            string name = ((TextBox)GridReviews.Rows[e.RowIndex]
                                .FindControl("txtName")).Text;
            string reports = ((TextBox)GridReviews.Rows[e.RowIndex]
                                .FindControl("txtReports")).Text;
            Review review = new Review(cod, description, Convert.ToInt32(score), hotel, name, Convert.ToInt32(reports));
            review.Update();
            GridReviews.EditIndex = -1;
            GridReviews.DataSource = Review.ListAllReviews();
            GridReviews.DataBind();
        }
        protected void GridReviews_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridReviews.PageIndex = e.NewPageIndex;
            GridReviews.DataSource = Review.ListAllReviews();
            GridReviews.DataBind();
        }
        protected void GridReviews_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridReviews.EditIndex = -1;
            GridReviews.DataSource = Review.ListAllReviews();
            GridReviews.DataBind();
        }

        protected void AddNewReview(object sender, EventArgs e)
        {
            string description = ((TextBox)GridReviews.FooterRow.FindControl("txtDescription")).Text;
            string score = ((TextBox)GridReviews.FooterRow.FindControl("txtScore")).Text;
            string hotel = ((TextBox)GridReviews.FooterRow.FindControl("txtHotel")).Text;
            string name = ((TextBox)GridReviews.FooterRow.FindControl("txtName")).Text;
            string reports = ((TextBox)GridReviews.FooterRow.FindControl("txtReports")).Text;

            Review review = new Review("", description, Convert.ToInt32(score), hotel, name, Convert.ToInt32(reports));
            review.Create();
            GridReviews.DataSource = Review.ListAllReviews();
            GridReviews.DataBind();
        }

        //Grid Tickets

        protected void GridTickets_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Ticket ticket = new Ticket(0, "", "");
            //GridTickets.DataSource = worker.DeleteWorker(e.RowIndex);
            GridTickets.DataBind();
        }

        protected void GridTickets_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridTickets.EditIndex = e.NewEditIndex;
            //GridTickets.DataSource = Ticket.ListAllTickets();
            GridTickets.DataBind();
        }
        protected void GridTickets_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string type = ((Label)GridTickets.Rows[e.RowIndex]
                        .FindControl("lblType")).Text;
            string price = ((TextBox)GridTickets.Rows[e.RowIndex]
                                .FindControl("txtPrice")).Text;
            //Ticket ticket = new Ticket(0, "", "");
            //ticket.UpdatePrice(type, price);
            GridTickets.EditIndex = -1;
            //GridTickets.DataSource = Ticket.ListAllTickets();
            GridTickets.DataBind();
        }
        protected void GridTickets_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridTickets.PageIndex = e.NewPageIndex;
            //GridTickets.DataSource = Ticket.ListAllTickets();
            GridTickets.DataBind();
        }
        protected void GridTickets_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridTickets.EditIndex = -1;
            //GridTickets.DataSource = Ticket.ListAllTickets();
            GridTickets.DataBind();
        }

        protected void AddNewTicket(object sender, EventArgs e)
        {
            string type = ((TextBox)GridWorkers.FooterRow.FindControl("txtType")).Text;
            string price = ((TextBox)GridWorkers.FooterRow.FindControl("txtPrice")).Text;

            Ticket ticket = new Ticket(0, "", "");
            //ticket.CreateType(type, price);
            //GridWorkers.DataSource = Ticket.ListAllTickets();
            GridWorkers.DataBind();
        }

        //Grid Workers

        protected void GridWorkers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Worker worker = new Worker("");
            GridWorkers.DataSource = worker.DeleteWorker(e.RowIndex);
            GridWorkers.DataBind();
        }

        protected void GridWorkers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridWorkers.EditIndex = e.NewEditIndex;
            GridWorkers.DataSource = Worker.ListAllWorkers();
            GridWorkers.DataBind();
        }
        protected void GridWorkers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string email = ((Label)GridWorkers.Rows[e.RowIndex]
                        .FindControl("lblEmail")).Text;
            string name = ((TextBox)GridWorkers.Rows[e.RowIndex]
                                .FindControl("txtName")).Text;
            string surname1 = ((TextBox)GridWorkers.Rows[e.RowIndex]
                                .FindControl("txtSurname1")).Text;
            string surname2 = ((TextBox)GridWorkers.Rows[e.RowIndex]
                                .FindControl("txtSurname2")).Text;
            string age = ((TextBox)GridWorkers.Rows[e.RowIndex]
                                .FindControl("txtAge")).Text;
            string phone = ((TextBox)GridWorkers.Rows[e.RowIndex]
                                .FindControl("txtPhone")).Text;
            Worker worker = new Worker(email, "", name, surname1, surname2, age, Convert.ToInt32(phone));
            worker.Update();
            GridWorkers.EditIndex = -1;
            GridWorkers.DataSource = Worker.ListAllWorkers();
            GridWorkers.DataBind();
        }
        protected void GridWorkers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridWorkers.PageIndex = e.NewPageIndex;
            GridWorkers.DataSource = Worker.ListAllWorkers();
            GridWorkers.DataBind();
        }
        protected void GridWorkers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridWorkers.EditIndex = -1;
            GridWorkers.DataSource = Worker.ListAllWorkers();
            GridWorkers.DataBind();
        }

        protected void AddNewWorker(object sender, EventArgs e)
        {
            string email = ((TextBox)GridWorkers.FooterRow.FindControl("txtEmail")).Text;
            string name = ((TextBox)GridWorkers.FooterRow.FindControl("txtName")).Text;
            string surname1 = ((TextBox)GridWorkers.FooterRow.FindControl("txtSurname1")).Text;
            string surname2 = ((TextBox)GridWorkers.FooterRow.FindControl("txtSurname2")).Text;
            string age = ((TextBox)GridWorkers.FooterRow.FindControl("txtAge")).Text;
            string phone = ((TextBox)GridWorkers.FooterRow.FindControl("txtPhone")).Text;

            Random rnd = new Random();
            string password = rnd.Next(100000, 1000000).ToString();

            Worker worker = new Worker(email, password, name, surname1, surname2, age, Convert.ToInt32(phone));
            worker.Create();
            GridWorkers.DataSource = Client.ListAllClients();
            GridWorkers.DataBind();
            PasswordPop.Text = "New Password: " + password;
            passwordPopup.Visible = true;
        }

        //Grid Clients

        protected void GridClients_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Client client = new Client("");
            GridClients.DataSource = client.DeleteClient(e.RowIndex);
            GridClients.DataBind();
        }
        
        protected void GridClients_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridClients.EditIndex = e.NewEditIndex;
            GridClients.DataSource = Client.ListAllClients();
            GridClients.DataBind();
        }
        protected void GridClients_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string email = ((Label)GridClients.Rows[e.RowIndex]
                        .FindControl("lblEmail")).Text;
            string name = ((TextBox)GridClients.Rows[e.RowIndex]
                                .FindControl("txtName")).Text;
            string surname1 = ((TextBox)GridClients.Rows[e.RowIndex]
                                .FindControl("txtSurname1")).Text;
            string surname2 = ((TextBox)GridClients.Rows[e.RowIndex]
                                .FindControl("txtSurname2")).Text;
            string age = ((TextBox)GridClients.Rows[e.RowIndex]
                                .FindControl("txtAge")).Text;
            string phone = ((TextBox)GridClients.Rows[e.RowIndex]
                                .FindControl("txtPhone")).Text;
            string address = ((TextBox)GridClients.Rows[e.RowIndex]
                                .FindControl("txtAddress")).Text;
            string creditCard = ((TextBox)GridClients.Rows[e.RowIndex]
                                .FindControl("txtCreditCard")).Text;
            Client client = new Client(email, "", name, surname1, surname2, age, Convert.ToInt32(phone), address, creditCard);
            client.Update();
            GridClients.EditIndex = -1;
            GridClients.DataSource = Client.ListAllClients();
            GridClients.DataBind();
        }
        protected void GridClients_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridClients.PageIndex = e.NewPageIndex;
            GridClients.DataSource = Client.ListAllClients();
            GridClients.DataBind();
        }
        protected void GridClients_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridClients.EditIndex = -1;
            GridClients.DataSource = Client.ListAllClients();
            GridClients.DataBind();
        }

        protected void AddNewClient(object sender, EventArgs e)
        {
            string email = ((TextBox)GridClients.FooterRow.FindControl("txtEmail")).Text;
            string name = ((TextBox)GridClients.FooterRow.FindControl("txtName")).Text;
            string surname1 = ((TextBox)GridClients.FooterRow.FindControl("txtSurname1")).Text;
            string surname2 = ((TextBox)GridClients.FooterRow.FindControl("txtSurname2")).Text;
            string age = ((TextBox)GridClients.FooterRow.FindControl("txtAge")).Text;
            string phone = ((TextBox)GridClients.FooterRow.FindControl("txtPhone")).Text;
            string address = ((TextBox)GridClients.FooterRow.FindControl("txtAddress")).Text;
            string creditCard = ((TextBox)GridClients.FooterRow.FindControl("txtCreditCard")).Text;

            Random rnd = new Random();
            string password = rnd.Next(100000, 1000000).ToString();

            Client client = new Client(email, password, name, surname1, surname2, age, Convert.ToInt32(phone), address, creditCard);
            client.Create();
            GridClients.DataSource = Client.ListAllClients();
            GridClients.DataBind();
            PasswordPop.Text = "New Password: " + password;
            passwordPopup.Visible = true;
        }

        protected void hidePop(object sender, EventArgs e)
        {
            passwordPopup.Visible = false;
        }
    }
}