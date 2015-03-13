using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.IO;
using ASPSnippets.FaceBookAPI;
using System.Web.Script.Serialization;
public partial class SendMail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FaceBookLogin();
        FaceBookContacts();
        if(!IsPostBack)
        {
            string usermsg="";
            usermsg +="Name:"+ Request.Form["txtName"]+"<br/>";
            usermsg +="Email:"+ Request.Form["txtEmail"]+"<br/>";
            usermsg +="Phone:" +Request.Form["txtPhone"]+"<br/>";
            usermsg +="Message:" +Request.Form["txtMessage"]+"<br/>";
            string fileName=Request.Form["fileUpload"];
         
            string path = Path.GetFullPath(MapPath(fileName));
            //FileInfo fin = new FileInfo(fileName);
            
            //int i = send_message(Request.Form["txtName"],Request.Form["txtEmail"],usermsg);
            int i = send_attachment(usermsg, path);
            if(i>0)
            {
                Response.Write("<script type='text/javascript'>alert('Message has been sent successfully')</script>");
                confirmation_message(Request.Form["txtEmail"]);
            }
            else
            {
                Response.Write("<script type='text/javascript'>alert('Message has not been sent successfully')</script>");
            }
        }
    }
    public int send_message(string name,string email,string msg)
    {
        try
        {
            //System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            //mail.To.Add("abhinavumang18@gmail.com");
            //MailMessage mmsg = new MailMessage();
            //mmsg.To.Add(new MailAddress("abhinavumang18@gmail.com"));
            //mail.From = new MailAddress("abhinavumang18@gmail.com");
            //mail.From = new MailAddress("ankur90srivastava@gmail.com", name);
            MailMessage mail = new MailMessage();
            mail.To.Add("abhinavumang18@gmail.com");
            mail.From = new MailAddress("ankur90srivastava@gmail.com","ankur");
            mail.Subject = "Contact Information";
            mail.Body = msg;
            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Credentials = new System.Net.NetworkCredential("ankur90srivastava@gmail.com", "9026537350");
            smtp.EnableSsl = true;
            smtp.Send(mail);
            return 1;
        }
        catch(Exception ex)
        {
            string str = ex.Message;
            return 0;
        }
    }
    public void confirmation_message(string email)
    {
        try
        {
            MailMessage mail = new MailMessage();
            mail.To.Add(email);
            mail.From = new MailAddress("ankur90srivastava@gmail.com", "ankur");
            mail.Subject = "Confirmation Message";
            mail.Body = "We will get back to you shortly";
            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Credentials = new NetworkCredential("ankur90srivastava@gmail.com", "9026537350");
            smtp.EnableSsl = true;
            smtp.Send(mail);
        }
        catch(Exception ex)
        {
            string str = ex.Message;
        }
        
        
    }
    public int send_attachment(string msg, string attachment)
    {
        try
        {
            MailMessage mail = new MailMessage();
            mail.To.Add("abhinavumang18@gmail.com");
            mail.From = new MailAddress("ankur90srivastava@gmail.com", "ankur");
            mail.Subject = "Please find the attachment";
            mail.Body = msg;
            mail.Attachments.Add(new Attachment(attachment));
            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Credentials = new NetworkCredential("ankur90srivastava@gmail.com", "9026537350");
            smtp.EnableSsl = true;
            smtp.Send(mail);
            return 1;

        }
        catch(Exception ex)
        {
            string str = ex.Message;
            Response.Write(str);
            return 0;
        }
        //if (FileUpload1.HasFile)
        //{
        //    string FileName = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
        //    mm.Attachments.Add(new Attachment(FileUpload1.PostedFile.InputStream, FileName));
        //}
    }
    void btnSubmit_Click(object sender, EventArgs e)
    {
        if(file1.PostedFile!=null)
        {
            try
            {
                file1.PostedFile.SaveAs("");
                span1.InnerHtml = "Upload Successful";
            }
            catch (Exception ex)
            {
                span1.InnerHtml = "Error saving file<b>C:\\" + file1.Value + "</b></br>" + ex.ToString();
            }
        }
    }
    void FaceBookLogin()
    {
        FaceBookConnect.API_Key = "704670469605575 ";
        FaceBookConnect.API_Secret = "50a860333cbe580da8576d0ecf8f144c";
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["error"] == "access_denied")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert()", "alert('user has denied access.')", true);
                return;
            }
        }
        string code = Request.QueryString["code"];
        if (!string.IsNullOrEmpty(code))
        {
            string data = FaceBookConnect.Fetch(code, "me");
            FaceBookUser faceBookUser = new JavaScriptSerializer().Deserialize<FaceBookUser>(data);
            faceBookUser.PictureUrl = string.Format("http://graph.facebook.com/{0}/picture", faceBookUser.Id);
            pnlFaceBookUser.Visible = true;
            lblId.Text = faceBookUser.Id;
            lblUserName.Text = faceBookUser.UserName;
            lblName.Text = faceBookUser.Name;
            lblEmail.Text = faceBookUser.Email;
            ProfileImage.ImageUrl = faceBookUser.PictureUrl;
            btnLogin.Enabled = false;
        }
    }
    protected void Login(object sender, EventArgs e)
    {
        FaceBookConnect.Authorize("user_photos,email", Request.Url.AbsoluteUri.Split('?')[0]);
    }
    
    void FaceBookContacts()
    {
        FaceBookConnect.API_Key = "704670469605575 ";
        FaceBookConnect.API_Secret = "50a860333cbe580da8576d0ecf8f144c";
        if(!IsPostBack)
        {
            string code = Request.QueryString["code"];
            if(!string.IsNullOrEmpty(code))
            {
                string data = FaceBookConnect.Fetch(code, "me/friends");
                FaceBookData facebookData = new JavaScriptSerializer().Deserialize<FaceBookData>(data);
                foreach(FaceBookUser user in facebookData.Data)
                {
                    user.PictureUrl = string.Format("https://graph.facebook.com/{0}/picture", user.Id);
                }
                gvFriends.DataSource = facebookData.Data;
                gvFriends.DataBind();
            }
        }
    }

    protected void btnFetch_Click(object sender, EventArgs e)
    {
        FaceBookConnect.Authorize("user_photos,friends_photos",Request.Url.AbsoluteUri);
    }

}
public class FaceBookUser
{
    public string Id
    {
        get;
        set;
    }
    public string Name
    {
        get;
        set;
    }
    public string UserName
    {
        get;
        set;
    }
    public string PictureUrl
    {
        get;
        set;
    }
    public string Email
    {
        get;
        set;

    }
}

public class FaceBookData
{
    public List<FaceBookUser> Data
    {
        get;
        set;
    }
}