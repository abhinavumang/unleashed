using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListBoxDemo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
   
    protected void singleSelect_Click(object sender, EventArgs e)
    {
        lblMovie.Text = lstMovies.SelectedItem.Text;
    }
    protected void multiSelect_Click(object sender, EventArgs e)
    {
        foreach (ListItem item in multiSelectMovies.Items)
        {
            if (item.Selected)
                lblMovies.Text += "<li>" + item.Text;
        }
    }
}