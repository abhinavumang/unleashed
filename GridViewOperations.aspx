<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridViewOperations.aspx.cs" Inherits="GridViewOperations" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="srcGrid" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="username" HeaderText="User Name" SortExpression="username" />
                <asp:BoundField DataField="pwd" HeaderText="Password" SortExpression="pwd" />
                <asp:BoundField DataField="role" HeaderText="Role" SortExpression="role" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:masterConnectionString %>" 
            SelectCommand="SELECT [username], [pwd], [role] FROM [auth]"></asp:SqlDataSource>
        <br />
        <asp:GridView ID="userGrid" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" ShowHeader="true" ShowFooter="true" 
            OnRowCommand="userGrid_RowCommand">
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:Label ID="lblUser" runat="server" Text="User Name" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblUser1" runat="server" Text='<%#Bind("username") %>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtUser" runat="server" Text='<%#Bind("username") %>' />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtUser1" runat="server" Text='<%#Bind("username") %>' />
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:Label ID="lblPwd" runat="server" Text="Password" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblPwd1" runat="server" Text='<%#Bind("pwd") %>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPwd" runat="server" Text='<%#Bind("pwd") %>' />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtPwd1" runat="server" Text='<%#Bind("pwd") %>' />
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:Label ID="lblRole" runat="server" Text="Role" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblRole1" runat="server" Text='<%#Bind("role") %>'/>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtRole" runat="server" Text='<%#Bind("role") %>' />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtRole1" runat="server" Text='<%#Bind("role") %>' />
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:Label ID="lblAction" runat="server" Text="Action" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="linkEdit" runat="server" Text="Edit" CommandName="Edit" />
                        <asp:LinkButton ID="linkDelete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%#Bind("userid") %>'/>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:LinkButton ID="linkUpdate" runat="server" Text="Update" CommandName="Update" CommandArgument='<%#Bind("userid") %>'/>
                        <asp:LinkButton ID="linkCancel" runat="server" Text="Cancel" CommandName="Cancel" CommandArgument='<%#Bind("userid") %>'/>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="linkInsert" runat="server" Text="Insert" CommandName="Insert" />
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
