using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CodeBehind : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lbl.Text = "Click the Button";
    }
    protected void btn_Click(object sender, EventArgs e)
    {
        lbl.Text = "Thanks!";
    }
}




/*
public partial class CodeBehind
{
    //protected System.Web.UI.WebControls.Button btn;
    //protected System.Web.UI.WebControls.Button lbl;

    -----additional code-----
}

public class codebehind_aspx : CodeBehind
{
    -----additional code----
}



public partial class CodeBehind : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         lbl.Text = "Click the Button";
    }
    protected void btn_Click(object sender, EventArgs e)
    {
        lbl.Text = "Thanks!";
    }
}
*/



































