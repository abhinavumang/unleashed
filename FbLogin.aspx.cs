using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ASPSnippets.FaceBookAPI;
using System.Web.Script.Serialization;

public partial class FbLogin : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        FaceBookConnect.API_Key = "704670469605575 ";
        FaceBookConnect.API_Secret = "50a860333cbe580da8576d0ecf8f144c";
        if(!Page.IsPostBack)
        {
            if(Request.QueryString["error"]=="access_denied")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert()", "alert('user has denied access.')", true);
                return;
            }
        }
        string code = Request.QueryString["code"];
        if(!string.IsNullOrEmpty(code))
        {
            string data = FaceBookConnect.Fetch(code, "me");
            FaceBookUser1 faceBookUser = new JavaScriptSerializer().Deserialize<FaceBookUser1>(data);
            faceBookUser.PictureUrl=string.Format("http://graph.facebook.com/{0}/picture",faceBookUser.Id);
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
}

public class FaceBookUser1
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