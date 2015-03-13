<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowDropDownList.aspx.cs" Inherits="ShowDropDownList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DropDownList Demo</title>
    <link rel="shortcut-icon" href="/images/agro.png"/>
</head>
<body>
    <form id="form1" runat="server">
    <div>

    <asp:DropDownList runat="server" ID="ddlMovies" DataSourceID="srcMovies" DataTextField="Title" DataValueField="Id" />
    <asp:Button runat="server" ID="btnSubmit" Text="Submit" OnClick="btnSubmit_Click" />
       <!--We can't place other objects in front of a dropdownlist control in apage-->
    <div><asp:Button runat="server" ID="btn" Text="Hi"/></div>

    <hr />
    <asp:Label ID="lblMovies" runat="server" />

     <!--Declarative Data Binding-->

     <asp:SqlDataSource ID="srcMovies" runat="server"
                ConnectionString="<%$ ConnectionStrings:FilesDBConnectionString %>"
                SelectCommand="SELECT [Id], [Title] FROM [movies]" />


        <!--Clear All textbox Text On One Click-->
        <div id="feedback" runat="server">

        <h3>Feedback</h3>
        
                 Name:

         <asp:TextBox ID="name" runat="server" ></asp:TextBox>
            <div style="clear:both;height:5px"></div>
                  Email: 

      <asp:TextBox ID="email" runat="server" ></asp:TextBox>
            <div style="clear:both;height:5px"></div>
      Tell us:<asp:TextBox ID="text" runat="server" CssClass="feedbacktextbox" TextMode="MultiLine" >
      </asp:TextBox>
            <div style="clear:both;height:5px"></div>
      <asp:Button ID="b1" CssClass="feedbackbtn" runat="server" Text="Submit" OnClick="b1_Click"/>      
       </div>
    </div>
    </form>
</body>
</html>

