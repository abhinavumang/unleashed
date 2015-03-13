<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FileUploadLarge.aspx.cs" Inherits="chapter4_FileUploadLarge" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        .fileList li{
            margin-bottom:5px;
        }
    </style>
    <title>FileUpload Large</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Label runat="server" ID="lblFile" Text="Word Document" AssociatedControlID="upFile"/>
    <asp:FileUpload runat="server" ID="upFile" />
    <asp:Button runat="server" ID="btnAdd" Text="Add Document" OnClick="btnAdd_Click" />
    <hr />

        <asp:Repeater runat="server" ID="rptFiles" DataSourceID="srcFiles">
            <HeaderTemplate>
                <ul class="fileList">
            </HeaderTemplate>
            <ItemTemplate>
                <li>
                    <asp:HyperLink runat="server" ID="lnkFile" Text='<%#Eval("FileName") %>' NavigateUrl='<%#Eval("Id","~/chapter4/FileHandlerLarge.ashx?id={0}") %>'/>
                </li>
            </ItemTemplate>
            <FooterTemplate>
                </ul>
            </FooterTemplate>
        </asp:Repeater>

        <asp:SqlDataSource ID="srcFiles" runat="server" ConnectionString="<%$ ConnectionStrings:FilesDBConnectionString %>" 
            SelectCommand="SELECT [Id], [FileName] FROM [Files]"/>

    </div>
    </form>
</body>
</html>
