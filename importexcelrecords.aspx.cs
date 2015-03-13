using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.IO;

public partial class ImportExcelRecords : System.Web.UI.Page
{
    OleDbConnection conn;
    protected void Page_Load(object sender, EventArgs e)
    {
        global.connect();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        //string importConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;"+
        //    "Data Source='"+ TextBox1.Text+"';" +
        //    "Extended Properties=Excel 8.0;";
        //string importConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0;" +
        //    "Data Source='" + TextBox1.Text + "';" +
        //    "Extended Properties=Excel 12.0;HDR=YES;IMEX=1;";
            //string filename = TextBox1.Text;
            //string path = System.IO.Path.GetFullPath(Server.MapPath(TextBox1.Text));
            string path = Path.GetFullPath(Server.MapPath(TextBox1.Text));
            string pathext = Path.GetExtension(path);
            if(pathext==".xls")
            {
                conn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source='" + path + "';Extended Properties='Excel 8.0;HDR=YES;IMEX=2'");
            }
            else if(pathext==".xlsx")
            {
                conn = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source='" + path + "';Extended Properties='Excel 12.0;HDR=YES;IMEX=1'");
            }


        conn.Open();
        string query = "select statename from [Sheet1$]";
        //OleDbConnection conn = new OleDbConnection(importConnectionString);
        
        
        OleDbCommand cmdd = new OleDbCommand(query, conn);
        OleDbDataReader dr = cmdd.ExecuteReader();
        while(dr.Read())
        {
            Label1.Text = dr["statename"].ToString();
            global.cmd = new SqlCommand("insert_stateinfo", global.con);
            global.cmd.CommandType = CommandType.StoredProcedure;
            global.cmd.Parameters.Clear();
            global.cmd.Parameters.AddWithValue("statename", Label1.Text);
            int n=global.cmd.ExecuteNonQuery();
            if(n>0)
            {
                Response.Write("<script type='text/javascript'>alert('Data is imported successfully')</script>");
            }
            else
            {
                Response.Write("<script type='text/javascript'>alert('Data is not imported successfully')</script>");
            }
         }
        global.con.Close();
        dr.Close();
        conn.Close();




    }
}