<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowMovie1.aspx.cs" Inherits="chapter19_ShowMovie1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Movie Details</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:GridView ID="grdMovies" DataSourceID="srcMovies" runat="server" />
    <asp:ObjectDataSource ID="srcMovies" TypeName="Movie1" SelectMethod="GetAll" runat="server" />
    </div>
    </form>
</body>
</html>
