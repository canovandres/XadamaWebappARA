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
                
                    GridClients.DataSource = Client.ListAllClients();
                    GridClients.DataBind();
                
                    GridWorkers.DataSource = Worker.ListAllWorkers();
                    GridWorkers.DataBind();

                    /*GridRides.DataSource = Ride.ListAllRides();
                    GridRestaurants.DataSource = Restaurant.ListAllRestaurants();
                    GridShows.DataSource = Show.ListAllShows();
                    GridReviews.DataSource = Review.ListAllReviews();
                    GridTickets.DataSource = Ticket.ListAllTickets();*/

                    /*GridRides.DataBind();
                    GridRestaurants.DataBind();
                    GridShows.DataBind();
                    GridReviews.DataBind();
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

        //Grid Tickets
        /*
        protected void GridTickets_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Ticket ticket = new Ticket(0, "", "");
            GridTickets.DataSource = worker.DeleteWorker(e.RowIndex);
            GridTickets.DataBind();
        }

        protected void GridWorkers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridTickets.EditIndex = e.NewEditIndex;
            GridTickets.DataSource = Worker.ListAllWorkers();
            GridTickets.DataBind();
        }
        protected void GridTickets_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string email = ((Label)GridTickets.Rows[e.RowIndex]
                        .FindControl("lblEmail")).Text;
            string name = ((TextBox)GridTickets.Rows[e.RowIndex]
                                .FindControl("txtName")).Text;
            Worker worker = new Worker(email, "", name, surname1, surname2, age, Convert.ToInt32(phone));
            worker.Update();
            GridTickets.EditIndex = -1;
            GridTickets.DataSource = Worker.ListAllWorkers();
            GridTickets.DataBind();
        }
        protected void GridTickets_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridTickets.PageIndex = e.NewPageIndex;
            GridTickets.DataSource = Worker.ListAllWorkers();
            GridTickets.DataBind();
        }
        protected void GridTickets_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridTickets.EditIndex = -1;
            GridTickets.DataSource = Worker.ListAllWorkers();
            GridTickets.DataBind();
        }
        */
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
    }
}