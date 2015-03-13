using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    void Page_PreRender()
    {
        string upFolder = MapPath("~/chapter4/UploadImages/");
        DirectoryInfo dir = new DirectoryInfo(upFolder);
        dlstImages.DataSource = dir.GetFiles();
        dlstImages.DataBind();
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (upImage.HasFile)
        {
            if (CheckFileType(upImage.FileName))
            {
                string filePath = "~/chapter4/UploadImages/" + upImage.FileName;
                upImage.SaveAs(MapPath(filePath));
            }
        }
    }
    bool CheckFileType(string fileName)
    {
        string ext = Path.GetExtension(fileName);
        switch (ext.ToLower()) 
        { 
            case ".gif":
                return true;
            case ".png":
                return true;
            case ".jpg":
                return true;
            case ".jpeg":
                return true;
            default:
                return false;
        }
    }
    
}
