using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class chapter4_FileUploadDatabase : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (upFile.HasFile)
        {
            if (CheckFileType(upFile.FileName))
            {
                srcFiles.Insert();
                
            }
        }
    }
    bool CheckFileType(string fileName)
    {
        return (Path.GetExtension(fileName).ToLower() == ".doc" || Path.GetExtension(fileName).ToLower() == ".docx");
    }
}