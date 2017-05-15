using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using lib.EN;

namespace XadamaWebapp
{
    public partial class shoppingcart : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                /*products = (List<Product>)Session["products"];
                DataTable t = new DataTable("product");
                DataColumn name = t.Columns.Add("name", typeof(String));
                DataColumn price = t.Columns.Add("price", typeof(float));
                DataColumn image = t.Columns.Add("image", typeof(String));

                foreach (Product i in products)
                {
                    DataRow r = t.NewRow();
                    r[0] = i.name;
                    r[1] = i.price;
                    r[2] = i.image;
                    t.Rows.Add(r);
                }*/
                DataTable t = (DataTable)Session["products"];
                ListView1.DataSource = t;
                ListView1.DataBind();

            }
            catch (Exception ex){}
            finally{}

        }
    }
}