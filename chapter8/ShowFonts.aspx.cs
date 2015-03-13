using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing.Text;

public partial class ShowFonts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //Programmatic DataBinding
            //InstalledFontCollection fonts = new InstalledFontCollection();
            //FontGrid.DataSource = fonts.Families;
            //FontGrid.DataBind();
            //int fontRows = FontGrid.Rows.Count;
            //TotalFonts.Text = "Number of Fonts=" + fontRows;
            
        }
    }
}
