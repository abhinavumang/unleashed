<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowPhotos.aspx.cs" Inherits="chapter8_ShowPhotos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Repeater ID="rept" runat="server" >
        <ItemTemplate>
            <asp:Image runat="server" ID="img1" ImageUrl='<%#Container.DataItem %>' style="width:175px;height:200px"/>
        </ItemTemplate>

    </asp:Repeater>
    </div>
    </form>
 </body>
</html>
