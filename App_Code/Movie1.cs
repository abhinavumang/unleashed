using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// Summary description for Movie1
/// </summary>
public class Movie1
{
	 static Movie1()
	{
		//
		// TODO: Add constructor logic here
		//
        _connecionString = WebConfigurationManager.ConnectionStrings["Movies"].ConnectionString;
	}
    private static readonly string _connecionString;
    private string _title;
    private string _director;
    public string Title
    {
        set{_title=value;}
        get {return _title;}
    }
    public string Director
    {
        set{_director=value;}
        get{return _director;}
    }
public List<Movie1> GetAll()
    {
        List<Movie1> results = new List<Movie1>();
        SqlConnection con = new SqlConnection(_connecionString);
        SqlCommand cmd = new SqlCommand("Select Title,Director from Movies",con);
        using (con)
        {
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while(reader.Read())
            {
                Movie1 newMovie = new Movie1();
                newMovie.Title = (string)reader["Title"];
                newMovie.Director = (string)reader["Director"];
                results.Add(newMovie);
            }
        }
        return results;
    }
    
}
