<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DemoIsPostBack.aspx.cs" Inherits="DemoIsPostBack" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>IsPostBack Demo</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:DropDownList ID="ddl" runat="server" />
    <asp:Button ID="btn" runat="server" Text="Submit" OnClick="btn_Click" />
    <div style="height:5px;clear:both"></div>
    <hr />
    <asp:Label ID="lbl" runat="server" />
    </div>
    </form>
</body>
</html>
