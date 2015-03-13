<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BulletedListDemo.aspx.cs" Inherits="BulletedListDemo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BulletedList Demo</title>
    <link rel="shortcut icon" href="../images/sun.png" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <!--Simple BulletedList-->
    <asp:BulletedList runat="server" ID="blMovies" DataSourceID="srcMovies" DataTextField="Title" />
        <!--Custom BulletedList-->
    <asp:BulletedList runat="server" ID="blimgMovies" DataSourceID="srcMovies" DataTextField="Title" 
        BulletStyle="CustomImage" BulletImageUrl="~/images/sun.png" 
        />
        <!--Hyperlinked BulletedList-->
   <asp:BulletedList runat="server" ID="blhyperMovies" DisplayMode="HyperLink" Target="_blank">
       <asp:ListItem  Text="Apple" Value="http://www.apple.com"/>
       <asp:ListItem  Text="Amazon" Value="http://www.amazon.com"/>
       <asp:ListItem  Text="Google" Value="http://www.google.com"/>

   </asp:BulletedList>
       <!--Declarative Data Binding-->
        <asp:SqlDataSource runat="server" ID="srcMovies" SelectCommand="Select title from movies"
            ConnectionString="<%$ConnectionStrings:FilesDBConnectionString %>" />

    </div>
    </form>
</body>
</html>
