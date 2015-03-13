using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class chapter4_MultiViewForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void v3_Activate(object sender, EventArgs e)
    {
        lblFirstNameResult.Text = txtFirstName.Text;
        lblColorResult.Text = txtColor.Text;
    }
}