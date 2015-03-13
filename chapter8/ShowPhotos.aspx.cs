using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class chapter8_ShowPhotos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            rept.DataSource = GetImages();
            rept.DataBind();
        }
    }

    public List<String> GetImages()
    {
        List<string> images = new List<string>();
        string imagepath = MapPath("~/chapter4/UploadImages/");
        string[] files = Directory.GetFiles(imagepath);

        foreach (string image in files)
        {
            images.Add("~/chapter4/UploadImages/" + Path.GetFileName(image));
            
        }
        return images;
    }
}