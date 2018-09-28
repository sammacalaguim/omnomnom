using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

namespace omm_web
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["title"] != null)
                {
                    this.fldSubject.Value = "Product Inquiry - " + Request.QueryString["title"];
                }
            }
            else {
                this.fldSubject.Value = "";
                this.fldName.Value = "";
                this.fldEmail.Value = "";
                this.fldMessage.Value = "";
            }
        }

        protected void btnSubmit_Click(object source, EventArgs e)
        {
            string custName = this.fldName.Value;
            string custEmail = this.fldEmail.Value;
            string custMessage = this.fldMessage.Value;
            string custSubject = this.fldSubject.Value;

            try
            {
                MailMessage message = new MailMessage();
                SmtpClient smtp = new SmtpClient();
                message.From = new MailAddress("auto-email@gmail.com");
                //message.From.Add(new MailAddress("sammacalaguim@gmail.com"));
                message.To.Add(new MailAddress("sammacalaguim@gmail.com"));
                message.To.Add(new MailAddress(custEmail));
                message.Subject = custSubject;
                //message.IsBodyHtml = true; //to make message body as html  
                message.Body = custMessage;
                //smtp.Port = 587;
                smtp.Port = 465;
                smtp.Host = "smtp.gmail.com"; //for gmail host  
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = true;
                System.Net.NetworkCredential credentials = new System.Net.NetworkCredential("sammacalaguim@gmail.com", "psy/al07");

                smtp.Credentials = credentials;
                smtp.Send(message);
            }
            catch (Exception) { }
        }
    }
}