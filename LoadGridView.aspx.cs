using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class LoadGridView : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["studentConnectionString"].ConnectionString);
    static int num = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            num = 2;
            BindGridView(num);
        }
    }
    private void BindGridView(int numOfRows)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = null;
        SqlDataAdapter adp = null;
        try
        {
            int rCount = rowCount();
            if (numOfRows > rCount)
            {
                btnLoadMore.Visible = false;
            }
            cmd = new SqlCommand("sp_getstudentdetails", con);
            cmd.Parameters.AddWithValue("@topval", numOfRows);
            cmd.CommandType = CommandType.StoredProcedure;
            adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                gridStudentDetails.DataSource = dt;
                gridStudentDetails.DataBind();
            }
            else
            {
                gridStudentDetails.DataSource=null;
                gridStudentDetails.DataBind();
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Oops!! Error occured:" + ex.Message.ToString() + "');", true);
        }
        finally
        {
            con.Close();
            cmd.Dispose();
            adp = null;
            dt.Clear();
            dt.Dispose();
        }
    }
    protected int rowCount()
    {
        int NoOfRows = 0;
        SqlCommand cmd = new SqlCommand("sp_getstudentcount", con);
        cmd.CommandType = CommandType.StoredProcedure;
        try
        {
            con.Open();
            NoOfRows = Convert.ToInt32(cmd.ExecuteScalar());
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Oops!! Error occured:" + ex.Message.ToString() + "');", true);
        }
        finally
        {
            con.Close();
            cmd.Dispose();
        }
        return NoOfRows;
    }
    protected void btnLoadMore_Click(object sender, EventArgs e)
    {
        int numVal = num + 2;
        BindGridView(numVal);
        num = numVal;
    }
}