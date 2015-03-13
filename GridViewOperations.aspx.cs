using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class GridViewOperations : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        global.connect();
        UserGrid_DataBind();
    }

    void UserGrid_DataBind()
    {
        
        global.cmd = new SqlCommand("sp_auth_select", global.con);
        global.cmd.CommandType = CommandType.StoredProcedure;
        global.sda = new SqlDataAdapter(global.cmd);
        DataTable dt = new DataTable();
        global.sda.Fill(dt);
        userGrid.DataSource = dt;
        userGrid.DataBind();
    }

    protected void userGrid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string cmdName=e.CommandName;
        switch(cmdName)
        {
            case "Insert":
                InsertCommand(sender, e);
                break;
            case "Delete":
                DeleteCommand(sender, e);
                break;
        }

    }

    protected void InsertCommand(object sender, GridViewCommandEventArgs e)
    {
        String uname = (userGrid.FooterRow.FindControl("txtUser1") as TextBox).Text.ToString();
        String pass = (userGrid.FooterRow.FindControl("txtPwd1") as TextBox).Text.ToString();
        String rle = (userGrid.FooterRow.FindControl("txtRole1") as TextBox).Text.ToString();
        global.cmd = new SqlCommand("sp_auth_reg", global.con);
        global.cmd.Parameters.AddWithValue("@username", uname);
        global.cmd.Parameters.AddWithValue("@password", pass);
        global.cmd.Parameters.AddWithValue("@role", rle);
        global.cmd.CommandType = CommandType.StoredProcedure;
        int n = global.cmd.ExecuteNonQuery();
        if(n>0)
        {
            Response.Write("Data inserted successfully");
        }
        UserGrid_DataBind();
    }
    protected void DeleteCommand(object sender, GridViewCommandEventArgs e)
    {

    }
}