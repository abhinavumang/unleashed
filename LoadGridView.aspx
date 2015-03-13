<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoadGridView.aspx.cs" Inherits="LoadGridView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Load Data in GridView</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <fieldset style="width:370px">
                    <legend>Load more data on demand in GridView</legend>
                    <div>
                        <asp:GridView ID="gridStudentDetails" runat="server" AutoGenerateColumns="false" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField HeaderText="Student Name" DataField="studentname" />
                                <asp:BoundField HeaderText="class" DataField="class" />
                                <asp:BoundField HeaderText="Age" DataField="age" />
                                <asp:BoundField HeaderText="Gender" DataField="Gender" />
                                <asp:BoundField HeaderText="Address" DataField="Address" />
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5d7b9d" Font-Bold="true" ForeColor="White" />
                            <HeaderStyle BackColor="#5d7b9d" Font-Bold="true" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#f7f6f3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#e2ded6" Font-Bold="true" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#e9e7e2" />
                            <SortedAscendingHeaderStyle BackColor="#506c8c" />
                            <SortedDescendingCellStyle BackColor="#fffdf8" />
                            <SortedDescendingHeaderStyle BackColor="#6f8dae" />
                        </asp:GridView>
                    </div>
                    <div style="text-align:center">
                        <asp:Button ID="btnLoadMore" runat="server" Text="Load More Data" OnClick="btnLoadMore_Click" />

                    </div>
                    <div style="text-align:center">
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" ClientIDMode="Static" DisplayAfter="10">
                            <ProgressTemplate>
                                <img src="images/ajax-loader.gif" alt="wait image" />
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </div>
                </fieldset>
             </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    </form>
</body>
</html>
