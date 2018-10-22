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
        }

        protected void btnSubmit_Click(object source, EventArgs e)
        {
            string custName = fldName.Text;
            string custEmail = fldEmail.Text;
            string custMessage = fldMessage.Text;
            string custSubject = fldSubject.Text;

            try
            {
                SmtpClient smtp = new SmtpClient();
                smtp.Port = 587;
                //smtp.Port = 465;
                smtp.Host = "smtp.gmail.com"; //for gmail host  
                smtp.EnableSsl = true;
                smtp.Timeout = 10000;
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.UseDefaultCredentials = false;
                //System.Net.NetworkCredential credentials = new System.Net.NetworkCredential("ommautomail@gmail.com", "ommemail1!");
                smtp.Credentials = new NetworkCredential("ommautomail@gmail.com", "ommemail1!");

                MailMessage message = new MailMessage();
                message.From = new MailAddress("ommautomail@gmail.com");
                //message.From.Add(new MailAddress("sammacalaguim@gmail.com"));
                message.To.Add(new MailAddress("ommautomail@gmail.com"));
                message.To.Add(new MailAddress(custEmail));
                message.Subject = custSubject + " - " + custName;
                //message.IsBodyHtml = true; //to make message body as html  
                message.Body = custMessage;
                message.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;
                
                smtp.Send(message);
                //Response.Redirect("~/Contact.aspx");
            }
            catch (Exception) {
            }
        }
    }
}