using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace omm_web
{
    public partial class Contact : System.Web.UI.Page
    {
        public string subject = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["title"] != null)
            {
                subject = "Product Inquiry - " + Request.QueryString["title"];
            }
        }
    }
}