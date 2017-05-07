using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XadamaWebapp
{
    public partial class europeanpalace : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
    }
}