<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowFonts.aspx.cs" Inherits="ShowFonts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Show Fonts</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <!--Declarative DataBinding-->
         <asp:GridView ID="FontsGrid" runat="server" DataSourceID="FontsDataSource" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="FontsDataSource" runat="server" SelectMethod="GetFonts" TypeName="Fonts"/>

    </div>
    </form>
</body>
</html>

