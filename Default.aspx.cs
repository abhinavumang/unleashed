using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    string name;
    protected void Page_Load(object sender, EventArgs e)
    {
        global.connect();
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string query = "select * from auth where username='" + txtUser.Text + "'";
        global.cmd = new SqlCommand(query, global.con);
        global.cmd.CommandType = CommandType.Text;
        global.sdr=global.cmd.ExecuteReader();
        global.sdr.Read();

        try
        {
            name = global.sdr["username"].ToString();
            if(txtPwd.Text==global.sdr["pwd"].ToString())
            {
                Response.Redirect("Accordion.aspx");
            }
            else
            {
                Response.Write("<script type='text/javascript'>alert('wrong password')</script>");
            }
        }
        catch(Exception ex)
        {
            if(name==null)
            {
                Response.Write("<script type='text/javascript'>alert('unauthorized user')</script>");
            }
        }
        
    }
}