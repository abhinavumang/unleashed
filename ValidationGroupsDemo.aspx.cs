using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ValidationGroupsDemo : System.Web.UI.Page
{
   protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
            lblLoginResult.Text = "Log in successfull!";
    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
            lblRegisterResult.Text = "Registration successfull!";
    }
}

