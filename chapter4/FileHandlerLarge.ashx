<%@ WebHandler Language="C#" Class="FileHandlerLarge" %>

using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;

public class FileHandlerLarge : IHttpHandler {

    const string conString = "Data Source=.;Initial Catalog=FilesDB;Integrated Security=True";
    SqlDataReader dr;
    public void ProcessRequest (HttpContext context) {
        //context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");
        context.Response.Buffer = false;
        context.Response.ContentType = "application/msword";

        SqlConnection con = new SqlConnection(conString);
        //SqlCommand cmd = new SqlCommand("select FileBytes from Files where Id=@Id", con);
        SqlCommand cmd = new SqlCommand("select FileName,FileBytes from Files where Id=@Id", con);
        cmd.Parameters.AddWithValue("@Id", context.Request["Id"]);

        using (con)
        {
            con.Open();
            dr = cmd.ExecuteReader(CommandBehavior.SequentialAccess);
            if (dr.Read())
            {
                int bufferSize = 8040;
                byte[] chunk = new byte[bufferSize];
                long retCount;
                long startIndex = 0;
                //retCount = dr.GetBytes(0, startIndex, chunk, 0, bufferSize);
                retCount = ((SqlDataReader)dr["FileBytes"]).GetBytes(0, startIndex, chunk, 0, bufferSize);

                while (retCount == bufferSize)
                {
                    context.Response.BinaryWrite(chunk);
                    startIndex += bufferSize;
                    //retCount = dr.GetBytes(0, startIndex, chunk, 0, bufferSize);
                    retCount =((SqlDataReader)dr["FileBytes"]).GetBytes(0, startIndex, chunk, 0, bufferSize);
                    
                }
                byte[] actualChunk=new Byte[retCount-1];
                Buffer.BlockCopy(chunk, 0, actualChunk,0, (int)retCount - 1);
                context.Response.BinaryWrite(actualChunk);
            }
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}