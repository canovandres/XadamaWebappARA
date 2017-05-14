using AjaxControlToolkit;
using lib.EN;
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
        DataSet d = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            d = Review.ListReviews("H1");
            ListViewReviews.DataSource = d;
            ListViewReviews.DataBind();
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
            Review review = new Review("EU", TextBoxReview.Text, ReviewRating.CurrentRating, "H1");
            if(TextBoxName.Text != "")
            {
                review.name = TextBoxName.Text;
            }
            review.Create();

            d = Review.ListReviews("H1");

            ListViewReviews.DataSource = d;
            ListViewReviews.DataBind();
        }

        protected void book(object sender, EventArgs e)
        {
            Session["From"] = From.Text;
            Session["To"] = To.Text;
            Session["Modality"] = DropDownModality.Text;
            Session["Single"] = DropDownSingle.DataValueField;
            Session["Double"] = DropDownDouble.DataValueField;
            Session["Hotel"] = "europeanpalace";

            Response.Redirect("bookhotel.aspx");
        }
    }
}