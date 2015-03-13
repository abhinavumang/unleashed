<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CodeBehind.aspx.cs" Inherits="CodeBehind" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Two-File ASP.NET Page or Code-Behind Page</title>
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
