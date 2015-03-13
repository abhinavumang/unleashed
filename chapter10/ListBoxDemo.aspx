<%@ 
    Page Language="C#" 
    AutoEventWireup="true" 
    CodeFile="ListBoxDemo.aspx.cs" 
    Inherits="ListBoxDemo" 
 %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ListBox Demo</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <!--Select a single item from a ListBox control-->
        <!--Default selection mode is single-->
    <asp:ListBox ID="lstMovies" runat="server" DataSourceID="srcMovies" DataTextField="Title"
        DataValueField="Id" Rows="8" />
        <p>
            <asp:Button ID="singleSelect" runat="server" Text="Single Selection Button" OnClick="singleSelect_Click"/>
        </p>
        <hr />
        <asp:Label ID="lblMovie" runat="server"/>
        <hr />
        <!--Select multiple items from a ListBox control-->
        <asp:ListBox ID="multiSelectMovies" runat="server" DataSourceID="srcMovies" DataTextField="Title"
        DataValueField="Id" Rows="8"  SelectionMode="Multiple"/>
        <p>
            <asp:Button ID="multiSelect" runat="server" Text="Multiple Selection Button " OnClick="multiSelect_Click" />
        </p>
        <hr />
        <asp:Label ID="lblMovies" runat="server" EnableViewState="false"/>


        <!--Declarative Data Binding-->
        <asp:SqlDataSource runat="server" ID="srcMovies" SelectCommand="Select Id,title from movies"
            ConnectionString="<%$ConnectionStrings:FilesDBConnectionString %>" />
    </div>
    </form>
</body>
</html>
