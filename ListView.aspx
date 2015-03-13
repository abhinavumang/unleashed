<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListView.aspx.cs" Inherits="ListView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <div>
            <asp:TextBox ID="txtpath" runat="server" 
                placeholder="Enter the path of a directory to be browsed"
                style="width:500px">
            </asp:TextBox>
            <asp:Button ID="btnpath" runat="server" 
                text="Submit" OnClick="btnpath_Click"/>
        </div>             
        <hr />
        <div>
            <asp:ListView ID="ListView1" runat="server">
                <LayoutTemplate>
                <ol>
                <asp:PlaceHolder runat="server" ID="itemPlaceholder">
                </asp:PlaceHolder>
                </ol>
            </LayoutTemplate>
            <ItemTemplate>
                <asp:ImageButton ID="ImageButton1" 
                runat="server" Width="50px" Height="50px"  
                ImageUrl='<%#Bind("Name") %>'>
            </asp:ImageButton>
            </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
    </form>
</body>
</html>
