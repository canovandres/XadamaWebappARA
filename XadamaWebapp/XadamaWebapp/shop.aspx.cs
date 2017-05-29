﻿using lib.EN;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Threading;

namespace XadamaWebapp
{
    public partial class shop : System.Web.UI.Page
    {
        private DataSet bdvirtual = new DataSet();
        private Product p = new Product();
        //private List<Product> products = new List<Product>();
        private DataTable tcart;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Page.IsPostBack)
            {
                LabelLv.CssClass = "wide xxlarge black padding-large appear";
            }
            else
            {
                tcart = new DataTable();
                DataColumn name = tcart.Columns.Add("name", typeof(String));
                DataColumn price = tcart.Columns.Add("price", typeof(float));
                DataColumn image = tcart.Columns.Add("image", typeof(String));
                DataColumn quantity = tcart.Columns.Add("quantity",typeof(int));
                DataColumn cod = tcart.Columns.Add("cod", typeof(String));
                Session["products"] = tcart;
            }

        }

        protected void OnTShirtsClicked(object sender, EventArgs e)
        {
            LabelLv.Text = "T-SHIRTS";
            bdvirtual = p.showTypeProducts("T-Shirts");
            DataTable t = bdvirtual.Tables["producto"];
            ListView1.DataSource = t;
            ListView1.DataBind();
        }

        protected void OnJumpersClicked(object sender, EventArgs e)
        {
            LabelLv.Text = "JUMPERS";
            bdvirtual = p.showTypeProducts("Jumpers");
            DataTable t = bdvirtual.Tables["producto"];
            ListView1.DataSource = t;
            ListView1.DataBind();
        }

        protected void OnCapsClicked(object sender, EventArgs e)
        {
            LabelLv.Text = "CAPS";
            bdvirtual = p.showTypeProducts("Caps");
            DataTable t = bdvirtual.Tables["producto"];
            ListView1.DataSource = t;
            ListView1.DataBind();
        }

        protected void OnBagsClicked(object sender, EventArgs e)
        {
            LabelLv.Text = "BAGS";
            bdvirtual = p.showTypeProducts("Bags");
            DataTable t = bdvirtual.Tables["producto"];
            ListView1.DataSource = t;
            ListView1.DataBind();
        }

        
        protected void AddToCart(object sender, ListViewSelectEventArgs e)
        {
            //Product p1 = new Product();

            ListViewItem item = ListView1.Items[e.NewSelectedIndex];

            Label c = (Label)item.FindControl("Label1");
            Label c1 = (Label)item.FindControl("Label2");
            Image i = (Image)item.FindControl("Image1");
            LinkButton l = (LinkButton)item.FindControl("LinkButton1");
            Label c2 = (Label)item.FindControl("Label3");

            DataRow r = ((DataTable)Session["products"]).NewRow();
            r[0] = c.Text;
            r[1] = Int32.Parse(c1.Text);
            r[2] = i.ImageUrl;
            r[3] = 1;
            r[4] = c2.Text;

            bool found = false;

            for (int j = ((DataTable)Session["products"]).Rows.Count - 1; j >= 0 && !found; j--)
            {
                DataRow dr = ((DataTable)Session["products"]).Rows[j];
                if ((String)dr["cod"] == (String)r[4])
                {
                    found = true;

                }
            }

            if (!found)
            {
                ((DataTable)Session["products"]).Rows.Add(r);
            }


            /*p1.name = c.Text;
            p1.price = Int32.Parse(c1.Text);
            p1.image = i.ImageUrl;

            products.Add(p1);*/

            l.Text = "Added";

            //Thread.Sleep((int)TimeSpan.FromSeconds(2).TotalMilliseconds);
            //l.Text = "Add to cart";
                        
        }

        protected void OnBrowseClick(object sender, EventArgs e)
        {
            LabelLv.Text = "SEARCH";
            String s = TextBox1.Text;
            bdvirtual = p.searchProduct(s);
            DataTable t = bdvirtual.Tables["search"];
            ListView1.DataSource = t;
            ListView1.DataBind();
        }

        [System.Web.Services.WebMethodAttribute(),System.Web.Script.Services.ScriptMethodAttribute()]
        public static string[] SuggestionList(string prefixText)
        {
            Product p = new Product();
            string[] names;
            names = p.getProductsName(prefixText).ToArray();
            return names;
        }
    }
}