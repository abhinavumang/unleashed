<%@ Page Language="C#" AutoEventWireup="true" CodeFile="importexcelrecords.aspx.cs" Inherits="ImportExcelRecords" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Import Excel Data Using ASP.net</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
            height: 179px;
        }
        .style2
        {
            text-align: left;
        }
        .style3
        {
            height: 27px;
        }
        .style4
        {
            height: 27px;
        }
        .style5
        {
            height: 27px;
            font-weight: bold;
        }
        .style6
        {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table class="style1">
        <tr>
            <td class="style5" colspan="2">
                <h2 style="text-align: center">
                    Import (Excel to SQL Server Database)</h2>
                <p style="text-align: center">
                    &nbsp;</p>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Enter the file name</td>
            <td class="style4">
                <asp:TextBox ID="TextBox1" runat="server" Width="219px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Enter the table name</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" Width="215px">excel</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Upload</asp:LinkButton>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                <br />
            </td>
        </tr>
        <tr>
            <td class="style6" colspan="2">
                <br />
                Copyright: left</td>
        </tr>
    </table>
    </form>
</body>
</html>
