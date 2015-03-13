<%@ Page Language="C#" AutoEventWireup="true" CodeFile="encryptconstring.aspx.cs" Inherits="WebUtils.EncryptDecrypt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Button runat="server" ID="btnEN" Text="Encrypt Connection String" OnClick="btnEN_Click" />
    <div style="clear:both;height:5px"></div>
    <asp:Button runat="server" ID="btnDE" Text="Decrypt Connection String" OnClick="btnDE_Click" />
    </div>
    </form>
</body>
</html>
