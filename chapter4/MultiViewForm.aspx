<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MultiViewForm.aspx.cs" Inherits="chapter4_MultiViewForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MultiView Form</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:MultiView runat="server" ID="mv" ActiveViewIndex="0">
        <asp:View ID="v1" runat="server">
            <h1>Step 1</h1>
            <asp:Label ID="lblFirstName" Text="Enter Your First Name" AssociatedControlID="txtFirstName" runat="server" />
            <br />
            <asp:TextBox runat="server" ID="txtFirstName" />
            <br /><br />
            <asp:Button runat="server" ID="btnNext" Text="Next" CommandName="NextView" />
        </asp:View>

        <asp:View runat="server" ID="v2">
            <h2>Step 2</h2>
            <asp:Label runat="server" ID="lblColor" Text="Enter your favorite color" AssociatedControlID="txtColor" />
            <br />
            <asp:TextBox runat="server" ID="txtColor"/>
            <br /><br />
            <asp:Button runat="server" ID="btnColor" Text="Next" CommandName="NextView" />
         </asp:View>

        <asp:View runat="server" ID="v3" OnActivate="v3_Activate">
        <h1>Summary</h1>
            First Name:<asp:Label ID="lblFirstNameResult" runat="server" />
            <br /><br />
            Favorite color:<asp:Label runat="server" ID="lblColorResult" />
        </asp:View>
    </asp:MultiView>
    </div>
    </form>
</body>
</html>
