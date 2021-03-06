﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace omm_web
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                string ControlID = string.Empty;
                if (!String.IsNullOrEmpty(Request.Form["__EVENTTARGET"]))
                {
                    ControlID = Request.Form["__EVENTTARGET"];
                }
                else
                {
                    //Buttons and ImageButtons
                    if (!String.IsNullOrEmpty(Request.Form[hidSourceID.UniqueID]))
                    {
                        ControlID = Request.Form[hidSourceID.UniqueID];
                    }
                }

                if (Page.User.Identity.Name == string.Empty && ControlID == "btnSubmit")
                {
                    Page.RegisterStartupScript("myScript", "<script language=JavaScript>$('#modalYT').modal('hide');$('#modalPush').modal('show');$('#preloader').remove();</script>");
                    this.validator.Visible = true;
                }
            }
            else
            {
                Page.RegisterStartupScript("myScriptOK", "<script language=JavaScript>$('#modalYT').modal('show');$('#modalPush').modal('hide');</script>");
            }

            if (Page.User.Identity.Name == string.Empty)
            {
                btnLogout.Visible = false;
                lnkEditNews.Visible = false;
                lnkEditProduct.Visible = false;
                btnAdmin.Visible = true;
            }
            else
            {
                btnLogout.Visible = true;
                lnkEditNews.Visible = true;
                lnkEditProduct.Visible = true;
                btnAdmin.Visible = false;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (FormsAuthentication.Authenticate(fldName.Text, fldPassword.Text))
            {
                FormsAuthentication.RedirectFromLoginPage(fldName.Text, true);
                btnLogout.Visible = true;
                lnkEditNews.Visible = true;
                lnkEditProduct.Visible = true;
                btnAdmin.Visible = false;
            }
            else
            {
                btnAdmin.Visible = true;
                lnkEditNews.Visible = false;
                lnkEditProduct.Visible = false;
                btnLogout.Visible = false;
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Cookies[0].Expires.AddDays(-1);
            btnAdmin.Visible = true;
            btnLogout.Visible = false;
            lnkEditNews.Visible = false;
            lnkEditProduct.Visible = false;
            Response.Redirect("~/Default.aspx");
        }
    }
}