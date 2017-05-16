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

namespace XadamaWebapp
{
    public partial class tickets : System.Web.UI.Page
    {
        Ticket ticket;
        private DataSet ds = new DataSet();
        private DataTable dt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            ticket = new Ticket("");
            ds = ticket.typePrice();
            DataTable t = ds.Tables["tickettype"];
            ListView1.DataSource = t;
            ListView1.DataBind();
        }

        protected void buyTicket(object sender, EventArgs e)
        {
            string email = null;
            if(Session["Client"] != null)
            {
                email = ((Client)Session["Client"]).email;
            }
            int nadults = Convert.ToInt32(Adults.Text);
            int nchildren = Convert.ToInt32(Children.Text);

            ticket = new Ticket("", email, date.Text, 0, "", nadults, nchildren);
            bool buy = ticket.buyTickets();

            Session["tickets"] = ticket;
            Page_Load(sender, e);
        }
    }
}