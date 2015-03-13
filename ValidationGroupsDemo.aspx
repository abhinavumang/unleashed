<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ValidationGroupsDemo.aspx.cs" Inherits="ValidationGroupsDemo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link rel="stylesheet" href="style.css" type="text/css"/>
    <title>Validation Groups Demo</title>
</head>
<body>
    <form id="form1" runat="server">

    <div class="column">
        <fieldset>
            <legend>Login</legend>
            <p>
                Please login to our Website!
            </p>
            <asp:Label runat="server" ID="lblUserName" Text="User Name" AssociatedControlID="txtUserName" />
            <div style="clear:both;height:5px"></div>
            <asp:TextBox runat="server" ID="txtUserName" />
            <asp:RequiredFieldValidator runat="server" ID="reqUserName" ControlToValidate="txtUserName" 
                Text="(Required)" ValidationGroup="LoginGroup" />
            <div style="clear:both;height:5px"></div>
            <asp:Label runat="server" ID="lblPassword" Text="Password" AssociatedControlID="txtPassword" />
            <div style="clear:both;height:5px"></div>
            <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" />
            <asp:RequiredFieldValidator runat="server" ID="reqPassword" ControlToValidate="txtPassword" 
                Text="(Required)" ValidationGroup="LoginGroup" />
            <div style="clear:both;height:5px"></div>
            <asp:Button runat="server" ID="btnLogin" Text="Login" ValidationGroup="LoginGroup" OnClick="btnLogin_Click" />
       </fieldset>
        <asp:Label runat="server" ID="lblLoginResult" />
    </div>
    <div class="column">
        <fieldset>
            <legend>Register</legend>
            <p>
                If you do not have a User Name, please register at our Website.
            </p>
            <asp:Label runat="server" ID="lblFirstName" Text="First Name" AssociatedControlID="txtFirstName" />
            <div style="clear:both;height:5px"></div>
            <asp:TextBox runat="server" ID="txtFirstName" />
            <asp:RequiredFieldValidator runat="server" ID="reqFirstName" ControlToValidate="txtFirstName"
                Text="(Required)" ValidationGroup="RegisterGroup" />
            <div style="clear:both;height:5px"></div>
            <asp:Label runat="server" ID="lblLastName" Text="Last Name" />
            <div style="clear:both;height:5px"></div>
            <asp:TextBox runat="server" ID="txtLastName" />
            <asp:RequiredFieldValidator runat="server" ID="reqLastName" ControlToValidate="txtLastName"
                Text="(Required)" ValidationGroup="RegisterGroup" />
            <div style="clear:both;height:5px"></div>
            <asp:Button runat="server" ID="btnRegister" Text="Register" ValidationGroup="RegisterGroup" OnClick="btnRegister_Click" />
        </fieldset>
        <asp:Label runat="server" ID="lblRegisterResult" />
     </div>

    </form>
</body>
</html>


