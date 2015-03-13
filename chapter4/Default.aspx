<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FileUpload File</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Label runat="server" ID="lblImageFile" Text="Image File" AssociatedControlID="upImage"/>
    <asp:FileUpload runat="server" ID="upImage" />
        <div style="height:5px;clear:both"></div>
        <asp:Button runat="server" ID="btnAdd" Text="Add Image" OnClick="btnAdd_Click" />
        <hr />
        <asp:DataList runat="server" ID="dlstImages" RepeatColumns="5">
            <ItemTemplate>
                <asp:Image runat="server" ID="image1" ImageUrl='<%# Eval("Name","~/chapter4/UploadImages/{0}") %>'  
                    style="width:100px;height:100px"/>
                <div style="height:5px;clear:both"></div>

                <%# Eval("Name") %>

            </ItemTemplate>
        </asp:DataList>
    </div>
    </form>
</body>
</html>
