﻿using lib.EN;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XadamaWebapp
{
    public partial class europeanpalace : System.Web.UI.Page
    {
        Review review = new Review("", 0, "", "");
        DataSet d = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            d = review.ListReviews("H1");

            GridViewReviews.DataSource = d;
            GridViewReviews.DataBind();
        }

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public static AjaxControlToolkit.Slide[] GetSlides()
        {
            return new AjaxControlToolkit.Slide[] {
            new AjaxControlToolkit.Slide("Media/Hotels/europeanpalace.jpg", "", ""),
            new AjaxControlToolkit.Slide("Media/Hotels/europeanpalace2.jpg", "", ""),
            new AjaxControlToolkit.Slide("Media/Hotels/europeanpalace3.jpg", "", ""),
            new AjaxControlToolkit.Slide("Media/Hotels/europeanpalace4.jpg", "", ""),
            new AjaxControlToolkit.Slide("Media/Hotels/europeanpalace5.jpg", "", ""),
            new AjaxControlToolkit.Slide("Media/Hotels/europeanpalace6.jpg", "", ""),
            new AjaxControlToolkit.Slide("Media/Hotels/europeanpalace7.jpg", "", "")};
        }

        protected void sendReview(object sender, EventArgs e)
        {
            Review review = new Review("EU", ReviewRating.CurrentRating, TextBoxReview.Text, TextBoxName.Text);
            review.Create();
        }

        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            d = review.ListReviews("H1");
            GridViewReviews.PageIndex = e.NewPageIndex;
            GridViewReviews.DataSource = d;
            GridViewReviews.DataBind();
        }
    }
}