using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// global class used for database connection
/// </summary>
public class global
{
    public static SqlConnection con;
    public static SqlCommand cmd;
    public static SqlDataAdapter sda;
    public static SqlDataReader sdr;
    public static SqlParameter spr;

    public static void connect()
    {
        con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
        con.Open();
    }

}