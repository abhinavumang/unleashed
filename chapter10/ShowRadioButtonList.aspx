<%@ 
    Page Language="C#" 
    AutoEventWireup="true" 
    CodeFile="ShowRadioButtonList.aspx.cs" 
    Inherits="ShowRadioButtonList" 
 %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>RadioButtonList Demo</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:RadioButtonList ID="rblMovies" runat="server" DataSourceID="srcMovies" DataTextField="Title" 
        DataValueField="Id" RepeatColumns="3" />
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
        <hr />
        <asp:Label runat="server" ID="lblMovie" />
        <!--Declarative Data Binding-->
        <asp:SqlDataSource runat="server" ID="srcMovies" SelectCommand="Select Id,title from movies"
            ConnectionString="<%$ConnectionStrings:FilesDBConnectionString %>" />
    </div>
    </form>
</body>
</html>


