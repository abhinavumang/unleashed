<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="container">
    
        <label class="lbl">Name:</label>
        <asp:TextBox runat="server" ID="txtName" />
        <div class="newline"></div>
        <label class="lbl">City:</label>
        <asp:TextBox runat="server" ID="txtCity" />
        <div class="newline"></div>
        <label class="lbl">Address:</label>
        <asp:TextBox runat="server" ID="txtAddress" />
        <div class="newline"></div>
        <label class="lbl">Gender:</label>
        <asp:RadioButtonList ID="rbl" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem>Male</asp:ListItem>
            <asp:ListItem>Female</asp:ListItem>
       </asp:RadioButtonList>
        <div class="newline"></div>
        <label class="lbl">Date of Birth:</label>
        <asp:DropDownList runat="server" ID="ddlDay" Width="69px">
            <asp:ListItem>Day</asp:ListItem>
            <asp:ListItem>1</asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList runat="server" ID="ddlMonth">
            <asp:ListItem>Month</asp:ListItem>
            <asp:ListItem>1</asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList runat="server" ID="ddlYear">
            <asp:ListItem>Year</asp:ListItem>
            <asp:ListItem>1990</asp:ListItem>
        </asp:DropDownList>
        <div class="newline"></div>
        <label class="lbl">State:</label>
        <asp:DropDownList runat="server" ID="ddlState">
            <asp:ListItem>Select</asp:ListItem>
            <asp:ListItem>New Delhi</asp:ListItem>
        </asp:DropDownList>
        <div class="newline"></div>
        <label class="lbl">Country:</label>
        <asp:DropDownList runat="server" ID="ddlCountry">
            <asp:ListItem>Select</asp:ListItem>
            <asp:ListItem>India</asp:ListItem>
        </asp:DropDownList>
        <div class="newline"></div>
        <label class="lbl">Course:</label>
        <asp:DropDownList runat="server" ID="ddlCourse">
            <asp:ListItem>Select</asp:ListItem>
            <asp:ListItem>MCA</asp:ListItem>
        </asp:DropDownList>
        <div class="newline"></div>
        <asp:Button runat="server" ID="btnSubmit" Text="Submit" OnClick="btnSubmit_Click"/>
    </div>
    </form>
</body>
</html>
