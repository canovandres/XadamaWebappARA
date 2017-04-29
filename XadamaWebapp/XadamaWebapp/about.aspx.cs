using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XadamaWebapp
{
    public partial class about : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public static AjaxControlToolkit.Slide[] GetSlides()
        {
            return new AjaxControlToolkit.Slide[] {
            new AjaxControlToolkit.Slide("Media/Hotels/americanluxury2.jpg", "America", ""),
            new AjaxControlToolkit.Slide("Media/Hotels/africansavannah2.jpg", "Africa", ""),
            new AjaxControlToolkit.Slide("Media/Hotels/europeanpalace.jpg", "Europe", "."),
            new AjaxControlToolkit.Slide("Media/Hotels/oceanicparadise.jpg", "Oceania", ""),
            new AjaxControlToolkit.Slide("Media/Hotels/asiangardens.jpg", "Asia", "")};
        }
    }
}