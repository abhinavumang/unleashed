<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CheckBoxListDemo.aspx.cs" Inherits="chapter10_CheckBoxListDemo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:CheckBoxList runat="server" ID="cblMovies" DataSourceID="srcMovies" DataTextField="Title" DataValueField="Id"
        RepeatColumns="2" />
        <p>
            <asp:Button runat="server" ID="btnSubmit" Text="Submit" OnClick="btnSubmit_Click" />
        </p>
        <hr />
        <asp:Label runat="server" ID="lblMovies" EnableViewState="false" />
        <!--Declarative Data Binding-->

     <asp:SqlDataSource ID="srcMovies" runat="server"
                ConnectionString="<%$ ConnectionStrings:FilesDBConnectionString %>"
                SelectCommand="SELECT [Id], [Title] FROM [movies]" />
    </div>
    </form>
</body>
</html>
