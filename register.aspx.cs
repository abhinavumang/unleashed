using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        global.connect();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        global.cmd = new SqlCommand("sp_register", global.con);
        global.cmd.CommandType = CommandType.StoredProcedure;
        global.cmd.Parameters.AddWithValue("@name", txtName.Text);
        global.cmd.Parameters.AddWithValue("@city", txtCity.Text);
        global.cmd.Parameters.AddWithValue("@address", txtAddress.Text);
        global.cmd.Parameters.AddWithValue("@gender", rbl.SelectedValue);
        global.cmd.Parameters.AddWithValue("@state", ddlState.SelectedValue);
        global.cmd.Parameters.AddWithValue("@country", ddlCountry.SelectedValue);
        global.cmd.Parameters.AddWithValue("@course", ddlCourse.SelectedValue);
        string dob = ddlDay.SelectedValue + "/" + ddlMonth.SelectedValue + "/" + ddlYear.SelectedValue;
        DateTime dt = Convert.ToDateTime(dob);
        global.cmd.Parameters.AddWithValue("@dob", dt);
        int n = global.cmd.ExecuteNonQuery();
        if(n>0)
        {
            Response.Write("Registration successful");
        }
        else
        {
            Response.Write("Registration is not successful");
        }
    }
}