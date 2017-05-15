﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.IO;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using lib.EN;

namespace XadamaWebapp
{
    public partial class Services : System.Web.UI.Page
    {
        private DataSet bdvirtual = new DataSet();
        private DataTable t = new DataTable();
        private Ride enride = new Ride("", "", "");
        private Show enshow = new Show("");
        private Restaurant enrest = new Restaurant("");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                DataTable aux = new DataTable();
                if (Request.QueryString["type"] == "rides")
                {
                    ListServices.SelectedIndex = 1;
                }
                else if (Request.QueryString["type"] == "restaurants")
                {
                    ListServices.SelectedIndex = 2;
                }
                else if (Request.QueryString["type"] == "shows")
                {
                    ListServices.SelectedIndex = 3;
                }
                OnListServiceChanged(sender, e);
            }
        }

        protected void OnListZoneChanged(object sender, EventArgs e)
        {
            OnListServiceChanged(sender, e);
        }

        protected void OnListServiceChanged(object sender, EventArgs e)
        {
            DataTable aux = new DataTable();
            if (ListServices.SelectedItem.ToString().ToLower() == "--")
            {
                if (ListZones.SelectedItem.ToString().ToLower() == "--")
                {
                    t = enride.zoneRides("", "*");
                    aux = enshow.zoneShows("", "*");
                    foreach (DataRow r in aux.Rows)
                    {
                        t.ImportRow(r);
                    }
                    aux = enrest.zoneRestaurants("", "*");
                    foreach (DataRow r in aux.Rows)
                    {
                        t.ImportRow(r);
                    }
                }
                else
                {
                    t = enride.zoneRides("", ListZones.SelectedItem.ToString());
                    aux = enshow.zoneShows("", ListZones.SelectedItem.ToString());
                    foreach (DataRow r in aux.Rows)
                    {
                        t.ImportRow(r);
                    }
                    aux = enrest.zoneRestaurants("", ListZones.SelectedItem.ToString());
                    foreach (DataRow r in aux.Rows)
                    {
                        t.ImportRow(r);
                    }
                }
            }
            else if (ListServices.SelectedItem.ToString().ToLower() == "rides")
            {
                if (ListZones.SelectedItem.ToString().ToLower() == "--")
                {
                    t = enride.zoneRides("", "*");
                }
                else
                {
                    t = enride.zoneRides("", ListZones.SelectedItem.ToString());
                }
            }
            else if (ListServices.SelectedItem.ToString().ToLower() == "shows")
            {
                if (ListZones.SelectedItem.ToString().ToLower() == "--")
                {
                    t = enshow.zoneShows("", "*");
                }
                else
                {
                    t = enshow.zoneShows("", ListZones.SelectedItem.ToString());
                }
            }
            else if (ListServices.SelectedItem.ToString().ToLower() == "restaurants")
            {
                if (ListZones.SelectedItem.ToString().ToLower() == "--")
                {
                    t = enrest.zoneRestaurants("", "*");
                }
                else
                {
                    t = enrest.zoneRestaurants("", ListZones.SelectedItem.ToString());
                }
            }

            ListView1.DataSource = t;
            ListView1.DataBind();
        }

        protected void OnSelectedItem(object sender, ListViewSelectEventArgs e)
        {
            ListViewItem item = ListView1.Items[e.NewSelectedIndex];
            Label c = (Label)item.FindControl("Label1");
            Label d = (Label)item.FindControl("Label2");
            Image i = (Image)item.FindControl("Image1");
            Session["ServiceName"] = c.Text;
            Session["ServiceImage"] = i.ImageUrl;
            Session["ServiceDescription"] = d.Text;
            Response.Redirect("servicesinfo.aspx");
        }
    }
}