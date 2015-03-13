<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DemoLengthValidator.aspx.cs" Inherits="DemoLengthValidator" %>

<%@ Register TagPrefix="custom" Namespace="MyValidators" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Length Validator Demo</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label runat="server" ID="lblComments" Text="Comments" AssociatedControlID="txtComments"/>
        <div style="clear:both;height:5px"></div>
        <asp:TextBox runat="server" ID="txtComments" TextMode="MultiLine" Columns="30"
            rows="2" />
        <custom:LengthValidator runat="server" ID="valComments" ControlToValidate="txtComments"
            Text="(Must be less than 10 characters)"
            MaximumLength="10" />
        <div style="clear:both;height:5px"></div>
        <asp:Button runat="server" ID="btnSubmit" Text="Submit" />
    </div>
    </form>
</body>
</html>

