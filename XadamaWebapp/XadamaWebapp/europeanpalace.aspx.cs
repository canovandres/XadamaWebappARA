using AjaxControlToolkit;
using lib.EN;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
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

        protected void Page_PreRender(object sender, EventArgs e)
        {
            RangeValidator1.MinimumValue = DateTime.Now.Date.ToString("dd-MM-yyyy");
            RangeValidator1.MaximumValue = DateTime.Now.Date.AddYears(90).ToString("dd-MM-yyyy");
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
            Review review = new Review("", TextBoxReview.Text, ReviewRating.CurrentRating, "H1");
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
            string email = null;
            if(Session["Client"] != null)
            {
                email = ((Client)Session["Client"]).email;
            }
            Booking booking = new Booking(email, 0, "H1", From.Text, To.Text, DropDownModality.Text, DropDownSingle.SelectedIndex, DropDownDouble.SelectedIndex);
            Session["Booking"] = booking;

            Response.Redirect("bookhotel.aspx");
        }

        protected void Report(object sender, ListViewSelectEventArgs e)
        {
            DataTable t = new DataTable();
            t = d.Tables["review"];

            Review.Report(t.Rows[e.NewSelectedIndex][0].ToString());
        }

    }
}