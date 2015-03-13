<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin-left:400px">
    <div style="margin-left:50px"><h1>WELCOME</h1></div>
    <div style="float:left;width:100px"><label id="lblUser">User Name:</label></div>
    <div style="float:left;"><asp:TextBox runat="server" ID="txtUser"></asp:TextBox></div>
        <div style="height:10px;clear:both"></div>
        
    <div style="float:left;width:100px"><label>Password:</label></div>
    <div style="float:left;"><asp:TextBox runat="server" ID="txtPwd"></asp:TextBox></div>
        <div style="height:10px;clear:both"></div>
        

    <div style="margin-left:100px"><asp:Button runat="server" ID="btnLogin" Text="Login" style="text-align:center;" OnClick="btnLogin_Click"/></div>
    </div>
    </form>
</body>
</html>
