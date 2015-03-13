using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
/// <summary>
/// Summary description for Movie3
/// </summary>
public class Movie3
{
    private static readonly string _connectionString;
    private int _id;
    private string _title;
    private string _director;
   static Movie3()
	{
		//
		// TODO: Add constructor logic here
		//
        _connectionString = WebConfigurationManager.ConnectionStrings["Movies"].ConnectionString;
	}
    public int Id
   {
       set { _id = value; }
       get { return _id; }
   }
    public string Title
    {
        set { _title = value; }
        get { return _title; }
    }
    public string Director
    {
        set { _director = value; }
        get { return _director; }
    }

    public void Update(int id, string title,string director)
    {
        SqlConnection con = new SqlConnection(_connectionString);
        SqlCommand cmd = new SqlCommand("update movies set Title=@Title,Director=@Director where Id=@Id", con);
        cmd.Parameters.AddWithValue("@Title", title);
        cmd.Parameters.AddWithValue("@Director", director);
        cmd.Parameters.AddWithValue("@Id", id);
        using(con)
        {
            con.Open();
            cmd.ExecuteNonQuery();
        }
    }
    public void Delete(int id)
    {
        SqlConnection con = new SqlConnection(_connectionString);
        SqlCommand cmd = new SqlCommand("Delete Movies where Id=@Id", con);
        cmd.Parameters.AddWithValue("@Id", id);
        using(con)
        {
            con.Open();
            cmd.ExecuteNonQuery();
        }
    }
    public List<Movie3> GetAll()
    {
        List<Movie3> results = new List<Movie3>();
        SqlConnection con = new SqlConnection(_connectionString);
        SqlCommand cmd = new SqlCommand("Select Id,Title,Director from Movies", con);
        using(con)
        {
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while(reader.Read())
            {
                Movie3 newMovie = new Movie3();
                newMovie.Id = (int)reader["Id"];
                newMovie.Title = (string)reader["Title"];
                newMovie.Director = (string)reader["Director"];
                results.Add(newMovie);
            }

        }
        return results;
            
    }
}