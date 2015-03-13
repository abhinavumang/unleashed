using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing.Text;

public partial class ShowFonts1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            InstalledFontCollection fonts = new InstalledFontCollection();
            fontGrid.DataSource = fonts.Families;
            fontGrid.DataBind();
            int fontRows = fontGrid.Rows.Count;
            Response.Write("Number of Fonts=" + fontRows);
            Label1.Text = "Number of Fonts=" + fontRows;


            //Create shopping cart
            List<CartItem> shoppingCart = new List<CartItem>();
            shoppingCart.Add(new CartItem(1, "Notebook Computer"));
            shoppingCart.Add(new CartItem(2, "HD Plasma Television"));
            shoppingCart.Add(new CartItem(3, "Lava Lamp"));

            //Bind ListBox to shopping cart
            lstShoppingCart.DataSource = shoppingCart;
            lstShoppingCart.DataBind();

        }
    }

}
public class CartItem
{
    private int _id;
    public string _description;

    public int id
    {
        get
        {
            return _id;
        }
    }
    public string description
    {
        get
        {
            return _description;
        }
    }

    public CartItem(int Id, string Description)
    {
        _id = Id;
        _description = Description;
    }
}