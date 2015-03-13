<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div runat="server" id="container" style="margin-left:400px">
    <div style="margin-left:50px"><h1>WELCOME</h1></div>
    <div style="float:left;width:100px"><label id="lblUser">User Name:</label></div>
    <div style="float:left;"><asp:TextBox runat="server" ID="txtUser"></asp:TextBox></div>
        <div style="height:10px;clear:both"></div>
        
    <div style="float:left;width:100px"><label>Password:</label></div>
    <div style="float:left;"><asp:TextBox runat="server" ID="txtPwd"></asp:TextBox></div>
        <div style="height:10px;clear:both"></div>
        

    <div style="margin-left:100px">
        <asp:Button runat="server" ID="btnLogin" Text="Login" style="text-align:center;" OnClick="btnLogin_Click"/>
        <asp:Button runat="server" ID="btnReset" Text="Reset" style="text-align:center;margin-left:5px" OnClick="btnReset_Click" />
    </div>

                <div style="height:10px;clear:both"></div>
    <div>
        <asp:Button runat="server" ID="btnReg" Text="Register" style="text-align:center;margin-left:20px" OnClick="btnReg_Click" />
        <asp:Button runat="server" ID="btnUpdate" Text="Update" style="text-align:center;margin-left:5px" OnClick="btnUpdate_Click" />
        <asp:Button runat="server" ID="btnDelete" Text="Delete" style="text-align:center;margin-left:5px" OnClick="btnDelete_Click" />
        <asp:Button runat="server" ID="btnForgot" Text="Forgot Password" style="text-align:center;margin-left:5px"/>
    </div>
        <div style="height:10px;clear:both"></div>
        <asp:DataList runat="server" ID="userData" DataSourceID="srcUser">
            <ItemTemplate>
                <b>User Name:</b>
                <%#Eval("username") %>
                <br />
                <b>Password:</b>
                <%#Eval("pwd") %>
                <br />
                <b>Role:</b>
                <%#Eval("role") %>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="srcUser" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MyConnectionString %>"
            SelectCommand="Select * from auth"
         />
        <div style="height:10px;clear:both"></div>
        <asp:FormView runat="server" ID="userForm" 
            DefaultMode="Edit"
            AllowPaging="true"
            DataSourceID="srcData"
            DataKeyNames="userid"
            >
            <EditItemTemplate>
                <asp:Label ID="lblUser" runat="server" Text="User Name:" AssociatedControlID="txtUser" />
                <asp:TextBox ID="txtUser" runat="server" Text='<%# Bind("username") %>' />
                <br />
                <asp:Label ID="lblPwd" runat="server" Text="Password" AssociatedControlID="txtPwd" />
                <asp:TextBox ID="txtPwd" runat="server" Text='<%# Bind("pwd") %>' />
                <br />
                <asp:Label ID="lblRole" runat="server" Text="Role" AssociatedControlID="txtRole" />
                <asp:TextBox ID="txtRole" runat="server" Text='<%#Bind("role") %>' />
                <br />
                <asp:Button ID="btnUpdate" runat="server" Text="Update" CommandName="Update" />

            </EditItemTemplate>
            </asp:FormView>
            <asp:sqldatasource runat="server" ID="srcData"
                ConnectionString="<%$ ConnectionStrings:MyConnectionString %>"
                SelectCommand="Select * from auth"
                UpdateCommand="update auth set pwd=@pwd where username=@username"
                />
        

        
    </div>
    </form>
</body>

</html>
