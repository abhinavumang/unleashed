using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Default2 : System.Web.UI.Page
{
    string name;
    protected void Page_Load(object sender, EventArgs e)
    {
        global.connect();
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        global.cmd = new SqlCommand("sp_auth", global.con);
        global.cmd.Parameters.AddWithValue("@username", txtUser.Text);
        global.cmd.CommandType = CommandType.StoredProcedure;
        global.sdr = global.cmd.ExecuteReader();
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
    protected void btnReg_Click(object sender, EventArgs e)
    {
        global.cmd = new SqlCommand("sp_authreg", global.con);
        global.cmd.Parameters.AddWithValue("@username", txtUser.Text);
        global.cmd.Parameters.AddWithValue("@password", txtPwd.Text);
        global.cmd.CommandType = CommandType.StoredProcedure;
        int n=global.cmd.ExecuteNonQuery();
        if(n>0)
        {
            Response.Write("<script type='text/javascript'>alert('Data successfully inserted')</script>");
        }
        else
        {
            Response.Write("<script type='text/javascript'>alert('Data is not inserted')</script>");
        }
        global.cmd.Connection.Close();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        global.cmd = new SqlCommand("sp_authupdate", global.con);
        global.cmd.Parameters.AddWithValue("@username", txtUser.Text);
        global.cmd.Parameters.AddWithValue("@password", txtPwd.Text);
        global.cmd.CommandType = CommandType.StoredProcedure;
        int n = global.cmd.ExecuteNonQuery();
        if (n > 0)
        {
            Response.Write("<script type='text/javascript'>alert('Data successfully updated')</script>");
        }
        else
        {
            Response.Write("<script type='text/javascript'>alert('Data is not updated')</script>");
        }
        global.cmd.Connection.Close();
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        global.cmd = new SqlCommand("sp_auth_delete", global.con);
        global.cmd.Parameters.AddWithValue("@username", txtUser.Text);
        global.cmd.CommandType = CommandType.StoredProcedure;
        int n = global.cmd.ExecuteNonQuery();
        if(n>0)
        {
            Response.Write("<script type='text/javascript'>alert('Data successfully deleted')</script>");
        }
        else
        {
            Response.Write("<script type='text/javascript'>alert('Data is not deleted')</script>");
        }
        global.cmd.Connection.Close();
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        foreach(Control b in container.Controls)
        {
            TextBox c;
            if(b is TextBox)
            {
                c = b as TextBox;
                if (c != null)
                    c.Text = String.Empty;
            }
        }
    }
}