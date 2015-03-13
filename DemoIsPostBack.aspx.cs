using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DemoIsPostBack : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
       
            //Create collection of items
            ArrayList items = new ArrayList();
            items.Add("Mouse");
            items.Add("Keyboard");
            items.Add("Monitor");
            items.Add("Printer");
            ddl.DataSource = items;
            ddl.DataBind();
        
         
    }
    protected void btn_Click(object sender, EventArgs e)
    {
        
        lbl.Text = "Selected Item is::" + ddl.SelectedItem.Text;
        
    }
}


