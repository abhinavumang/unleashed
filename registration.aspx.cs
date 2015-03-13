using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        global.connect();
        int n=user_registration();
        if(n>0)
        {
            //Response.Write("Registration successful");
            Response.Write("<script type='text/javascript'>alert('Registration successful')</script>");
        }
        else
        {
            Response.Write("<script type='text/javascript'>alert('Registration is not successful')</script>");
        }

    }
    int user_registration()
    {
        global.cmd = new SqlCommand("sp_register", global.con);
        global.cmd.CommandType = CommandType.StoredProcedure;
        global.cmd.Parameters.AddWithValue("@name", Request.Form["txtName"]);
        global.cmd.Parameters.AddWithValue("@city", Request.Form["txtCity"]);
        global.cmd.Parameters.AddWithValue("@address", Request.Form["txtAddress"]);
        global.cmd.Parameters.AddWithValue("@gender", Request.Form["rdGender"]);
        global.cmd.Parameters.AddWithValue("@state", Request.Form["ddlState"]);
        global.cmd.Parameters.AddWithValue("@country", Request.Form["ddlCountry"]);
        global.cmd.Parameters.AddWithValue("Course", Request.Form["ddlCourse"]);
        string dob=Request.Form["ddlDate"]+"/"+Request.Form["ddlMonth"]+"/"+Request.Form["ddlYear"];
        //string dob = "1/1/1990";
        DateTime dt=Convert.ToDateTime(dob);
        global.cmd.Parameters.AddWithValue("@dob",dt);
        int n=global.cmd.ExecuteNonQuery();
        return n;

    }
}