using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for MovieDataReader
/// </summary>
public class MovieDataReader
{
    private readonly string _conString;
    public MovieDataReader()
	{
		//
		// TODO: Add constructor logic here
		//
        //_conString = WebConfigurationManager.ConnectionStrings["FilesDBConnectionString"].ConnectionString;
        _conString = ConfigurationManager.ConnectionStrings["FilesDBConnectionString"].ConnectionString;
	}
    public SqlDataReader GetMovies()
    {
        SqlConnection con = new SqlConnection(_conString);
        con.Open();
        string query = "Select Id, Title, Director from movies";
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.CommandType = CommandType.Text;
        return cmd.ExecuteReader(CommandBehavior.CloseConnection);
    }
}