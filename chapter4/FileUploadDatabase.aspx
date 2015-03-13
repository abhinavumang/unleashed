<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FileUploadDatabase.aspx.cs" Inherits="chapter4_FileUploadDatabase" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" id="Head1">
    <style>
        .fileList li{
            margin-bottom:5px;
        }
    </style>
    <title>FileUpload Database</title>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Label runat="server" ID="lblFile" Text="Word Document:" AssociatedControlID="upFile"/>
    <asp:FileUpload runat="server" ID="upFile" />
    <asp:Button runat="server" ID="btnAdd" Text="Add Document" OnClick="btnAdd_Click" />
    <hr />
    <asp:Repeater runat="server" ID="rptFiles" DataSourceID="srcFiles">
        <HeaderTemplate>
            <ul class="fileList">
        </HeaderTemplate>
        <ItemTemplate>
          <li>
              <asp:HyperLink runat="server" ID="lnkFile" Text='<%#Eval("FileName") %>' 
                  NavigateUrl='<%#Eval("Id","~/chapter4/FileHandler.ashx?id={0}") %>'/>
          </li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
        </FooterTemplate>
    </asp:Repeater>
        <asp:SqlDataSource ID="srcFiles" runat="server" ConnectionString="<%$ ConnectionStrings:FilesDBConnectionString %>" 
            
            InsertCommand="INSERT INTO Files (FileName,FileBytes) VALUES (@FileName,@FileBytes)" 
            SelectCommand="SELECT [Id], [FileName] FROM [Files]" >
            
            <InsertParameters>
                <%-- <asp:Parameter Name="FileName" Type="String" />--%>
                <asp:ControlParameter Name="FileName" ControlID="upFile" PropertyName="FileName" />
                <asp:ControlParameter Name="FileBytes" ControlID="upFile" PropertyName="FileBytes" />
            </InsertParameters>
            
        </asp:SqlDataSource>
        <a href="Default.aspx">anchor</a>
    </div>
    </form>
</body>
</html>

