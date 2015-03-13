using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ValidationControls : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            lblResult.Text = @"<br/>Product: " + txtProductName.Text
                           + "<br/>Price: " + txtProductPrice.Text
                           + "<br/>Quantity: " + txtProductQuantity.Text;
        }
    }
}