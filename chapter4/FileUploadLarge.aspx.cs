using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class chapter4_FileUploadLarge : System.Web.UI.Page
{
    const string conString = "Data Source=.;Initial Catalog=FilesDB;Integrated Security=True";
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (upFile.HasFile)
        {
            if (CheckFileType(upFile.FileName))
            {
                AddFile(upFile.FileName, upFile.FileContent);
                rptFiles.DataBind();
            }
        }
    }

    bool CheckFileType(string fileName)
    {
        //return Path.GetExtension(fileName).ToLower() == ".doc";
        return (Path.GetExtension(fileName).ToLower() == ".doc" || Path.GetExtension(fileName).ToLower() == ".docx");
    }
    void AddFile(string fileName, Stream upload)
    {
        SqlConnection con = new SqlConnection(conString);
        SqlCommand cmd = new SqlCommand("INSERT INTO Files (FileName) VALUES (@FileName);" + "select @Identity=SCOPE_IDENTITY()", con);
        cmd.Parameters.AddWithValue("@FileName", fileName);
        SqlParameter idParm = cmd.Parameters.Add("@Identity", SqlDbType.Int);
        idParm.Direction = ParameterDirection.Output;

        using (con)
        {
            con.Open();
            cmd.ExecuteNonQuery();
            int newFileId = (int)idParm.Value;
            StoreFile(newFileId, upload, con);
        }
    }
    void StoreFile(int fileId, Stream upload, SqlConnection connection)
    {
        int bufferLen = 8040;
        BinaryReader br = new BinaryReader(upload);
        byte[] chunk = br.ReadBytes(bufferLen);

        SqlCommand cmd = new SqlCommand("update Files set FileBytes=@Buffer where Id=@FileId", connection);
        cmd.Parameters.AddWithValue("@FileId", fileId);
        cmd.Parameters.Add("@Buffer", SqlDbType.VarBinary, bufferLen).Value = chunk;
        cmd.ExecuteNonQuery();

        SqlCommand cmdAppend = new SqlCommand("update Files set FileBytes.Write(@Buffer,NULL,0) where Id=@FileId", connection);
        cmdAppend.Parameters.AddWithValue("@FileId", fileId);
        cmdAppend.Parameters.Add("@Buffer", SqlDbType.VarBinary, bufferLen);
        chunk = br.ReadBytes(bufferLen);

        while (chunk.Length > 0)
        {
            cmdAppend.Parameters["@Buffer"].Value = chunk;
            cmdAppend.ExecuteNonQuery();
            chunk = br.ReadBytes(bufferLen);
        }
        br.Close();
    }
}