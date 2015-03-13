<%@ WebHandler Language="C#" Class="FileHandler" %>

using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;

public class FileHandler : IHttpHandler {

    const string conString = "Data Source=.;Initial Catalog=FilesDB;Integrated Security=True";
    SqlDataReader dr;
    public void ProcessRequest (HttpContext context) {
        //context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");
        context.Response.ContentType = "application/msword";
        
        //context.Response.TransmitFile(context.Server.MapPath("~/file.doc"));
        SqlConnection con = new SqlConnection(conString);
        //SqlCommand cmd = new SqlCommand("select FileBytes from Files where Id=@Id", con);//correct hai
        SqlCommand cmd1 = new SqlCommand("select FileName,FileBytes from Files where Id=@Id", con);
        cmd1.Parameters.AddWithValue("@Id", context.Request["Id"]);
        //cmd.Parameters.AddWithValue("@Id", context.Request["Id"]);//correct hai
        
        
        using (con)
        {
            con.Open();
            dr = cmd1.ExecuteReader();
            dr.Read();
            string fname=(string)dr["FileName"];
            context.Response.AppendHeader("Content-Disposition", "attachment; filename="+fname);
            //context.Response.TransmitFile(context.Server.MapPath("~/uploads"));
            byte[] file = (byte[])dr["FileBytes"];
            dr.Close();
            //byte[] file =(byte[]) cmd.ExecuteScalar();//correct h
            context.Response.BinaryWrite(file);
        }
        
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}