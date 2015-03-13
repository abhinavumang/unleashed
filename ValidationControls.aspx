<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ValidationControls.aspx.cs" Inherits="ValidationControls" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Form</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <fieldset>
        <legend>Product Order Form</legend>
        <asp:Label runat="server" ID="lblProductName" Text="Product Name:" AssociatedControlID="txtProductName" />
        <div style="clear:both;height:5px"></div>
        <asp:TextBox runat="server" ID="txtProductName" />
        <asp:RequiredFieldValidator runat="server" ID="reqProductName" ControlToValidate="txtProductName" Text="(Required)" />
        <div style="clear:both;height:5px"></div>
        <asp:Label runat="server" ID="lblProductPrice" Text="Product Price" AssociatedControlID="txtProductPrice" />
        <div style="clear:both;height:5px"></div>
        <asp:TextBox runat="server" ID="txtProductPrice" Columns="5" />
        <asp:RequiredFieldValidator runat="server" ID="reqProductPrice" ControlToValidate="txtProductPrice" Text="(Required)" 
            Display="Dynamic" />
        <asp:CompareValidator runat="server" ID="cmpProductPrice" ControlToValidate="txtProductPrice" Text="(Invalid Price)" 
            Operator="DataTypeCheck" Type="Currency" />
        <div style="clear:both;height:5px"></div>
        <asp:Label runat="server" ID="lblProductQuantity" Text="Product Quantity" AssociatedControlID="txtProductQuantity" />
        <div style="clear:both;height:5px"></div>
        <asp:TextBox runat="server" ID="txtProductQuantity" columns="5" />
        <asp:RequiredFieldValidator runat="server" ID="reqProductQuantity" ControlToValidate="txtProductQuantity" Text="(Required)" 
            Display="Dynamic" />
        <asp:CompareValidator runat="server" ID="cmpProductQuantity" ControlToValidate="txtProductQuantity" Text="(Invalid Quantity)" 
            Operator="DataTypeCheck" Type="Integer" />
        <div style="clear:both;height:5px"></div>

        
        <asp:Button ID="btnSubmit" runat="server" Text="Submit Product Order" OnClick="btnSubmit_Click" />
    </fieldset>
        <asp:Label runat="server" ID="lblResult" />
    </div>
    </form>
</body>
</html>
