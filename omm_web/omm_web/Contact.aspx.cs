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
                    this.fldSubject.Text = "Product Inquiry - " + Request.QueryString["title"];
                }
            }
            else {
                fldName.Text = "";
                fldEmail.Text = "";
                fldSubject.Text = "";
                fldMessage.Text = "";
            }
        }

        protected void btnSubmit_Click(object source, EventArgs e)
        {
            string custName = this.fldName.Text;
            string custEmail = this.fldEmail.Text;
            string custMessage = this.fldMessage.Text;
            string custSubject = this.fldSubject.Text;

            try
            {
                MailMessage message = new MailMessage();
                SmtpClient smtp = new SmtpClient();
                message.From = new MailAddress("ommautomail@gmail.com");
                //message.From.Add(new MailAddress("sammacalaguim@gmail.com"));
                message.To.Add(new MailAddress("ommautomail@gmail.com"));
                message.To.Add(new MailAddress(custEmail));
                message.Subject = custSubject + " - " + custName;
                //message.IsBodyHtml = true; //to make message body as html  
                message.Body = custMessage;
                smtp.Port = 587;
                //smtp.Port = 465;
                smtp.Host = "smtp.gmail.com"; //for gmail host  
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = true;
                System.Net.NetworkCredential credentials = new System.Net.NetworkCredential("ommautomail@gmail.com", "ommemail1!");

                smtp.Credentials = credentials;
                smtp.Send(message);
                Response.Redirect("~/Contact.aspx");
            }
            catch (Exception) {
            }
        }
    }
}