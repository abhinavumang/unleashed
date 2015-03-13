<%@ Page Language="C#" AutoEventWireup="true"%>

<!DOCTYPE html>
<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        lbl.Text = "Click the Button";
    }
    protected void btn_Click(object sender, EventArgs e)
    {
        lbl.Text = "Thanks!";
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Single-File ASP.NET Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Button runat="server" ID="btn" Text="Click Here" OnClick="btn_Click" />
    <div style="height:5px;clear:both"></div>
    <asp:Label runat="server" ID="lbl" />
    </div>
    </form>
</body>
</html>

