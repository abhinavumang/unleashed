using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for MovieCollection
/// </summary>
public class MovieCollection
{
	public MovieCollection()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public List<string> GetString()
    {
        List<string> movies = new List<string>();
        movies.Add("Chennai Express");
        movies.Add("Baghban");
        movies.Add("Dhoom");
        return movies;
    }
}