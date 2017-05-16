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
        private Ticket ticket = new Ticket("");
        private DataSet ds = new DataSet();
        private DataTable dt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            ds = ticket.typePrice();
            DataTable t = ds.Tables["tickettype"];
            ListView1.DataSource = t;
            ListView1.DataBind();
        }
    }
}