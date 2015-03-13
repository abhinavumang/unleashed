<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowFonts1.aspx.cs" Inherits="ShowFonts1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <asp:GridView runat="server" ID="fontGrid"></asp:GridView>
        <asp:ListBox ID="lstShoppingCart" runat="server" DataTextField="Description" DataValueField="Id" />
    </div>
    </form>
</body>
</html>
