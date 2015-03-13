using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Drawing;
using System.Drawing.Text;


/// <summary>
/// Summary description for Fonts
/// </summary>
public class Fonts
{

    public FontFamily[] GetFonts()
    {
        InstalledFontCollection fonts = new InstalledFontCollection();
        FontFamily[] fontsfamily = fonts.Families;
        return fontsfamily;
    }
}

