using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class chapter10_CheckBoxListDemo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        foreach (ListItem item in cblMovies.Items)
        {
            if (item.Selected)
                lblMovies.Text += "<li>" + item.Text;
        }
    }
}