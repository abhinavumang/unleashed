<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowMovieDataReader.aspx.cs" Inherits="ShowMovieDataReader" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:ObjectDataSource ID="srcMovies" runat="server" SelectMethod="GetMovies" TypeName="MovieDataReader"/>
        <asp:GridView ID="grdMovies" runat="server" DataSourceID="srcMovies" />
    
    </div>
    </form>
</body>
</html>
