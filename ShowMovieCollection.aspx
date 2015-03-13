<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowMovieCollection.aspx.cs" Inherits="ShowMovieCollection" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Show Movie Collection</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ObjectDataSource ID="srcMovies" runat="server" SelectMethod="GetString" TypeName="MovieCollection"/>
        <asp:GridView ID="grdMovies" runat="server" DataSourceID="srcMovies" />
    </div>
    </form>
</body>
</html>
