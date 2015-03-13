using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShowDropDownList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        lblMovies.Text = ddlMovies.SelectedItem.Text;
    }
    protected void b1_Click(object sender, EventArgs e)
    {
        foreach (Control b in feedback.Controls) //feedback is division
        {
            TextBox c;
            if (b is TextBox)
            {
                c = b as TextBox;
                if (c != null)
                {
                    c.Text = String.Empty;

                    // or we can use

                    c.Text = "";
                }
            }
        }
    }
}