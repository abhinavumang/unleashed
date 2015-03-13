﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowMovie3.aspx.cs" Inherits="chapter19_ShowMovie3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Movie Details</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:ObjectDataSource ID="srcMovies" TypeName="Movie3" SelectMethod="GetAll" UpdateMethod="Update" DeleteMethod="Delete" runat="server" />
        <asp:GridView ID="grdMovies" DataSourceID="srcMovies" DataKeyNames="Id" AutoGenerateEditButton="true" AutoGenerateDeleteButton="true" runat="server" />
    </div>
    </form>
</body>
</html>
