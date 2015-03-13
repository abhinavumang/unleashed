using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Collections;

public partial class ListView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnpath_Click(object sender, EventArgs e)
    {
        ArrayList list = new ArrayList();

        try
        {
            string searchpath = txtpath.Text;
            DirectoryInfo dir = new DirectoryInfo(Server.MapPath(@"~/"));
            DirectoryInfo[] di = dir.GetDirectories(searchpath, SearchOption.AllDirectories);
            FileInfo[] files = null;
            foreach (DirectoryInfo d in di)
            {
                files = d.GetFiles("*.*", SearchOption.AllDirectories);
            }
            ArrayList list1 = new ArrayList();
            foreach (FileInfo file2 in files)
            {
                string a = Server.MapPath(@"~/");
                string b = file2.FullName.Replace(a, "~/");
                string c = b.Replace("\\", "/");

                list1.Add(c);

                list.Add(file2);
            }

            ListView1.DataSource = list;
            ListView1.DataBind();
            int _i = 0;
            foreach (ListViewItem li in ListView1.Items)
            {
                Image im = (Image)li.FindControl("ImageButton1");
                im.ImageUrl = list1[_i].ToString();
                _i = _i + 1;
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script type='text/javascript'>alert('Unable to browse this directory')</script>");
        }
    }
}