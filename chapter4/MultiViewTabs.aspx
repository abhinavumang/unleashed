<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MultiViewTabs.aspx.cs" Inherits="chapter4_MultiViewTabs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MultiView</title>
    <link type="text/css"  rel="stylesheet" href="css/style.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>
 <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
     <ContentTemplate>
    <div>
    <asp:Menu runat="server" ID="mvMenu" Orientation="Horizontal" StaticMenuItemStyle-CssClass="tab" StaticSelectedStyle-CssClass="selectedTab"
        CssClass="tabs" BackColor="#B5C7DE" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" OnMenuItemClick="mvMenu_MenuItemClick" StaticSubMenuIndent="10px">
        <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
        <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
        <DynamicMenuStyle BackColor="#B5C7DE" />
        <DynamicSelectedStyle BackColor="#507CD1" />
        <Items>
            <asp:MenuItem Text="Tab1" Value="0" Selected="true"/>
            <asp:MenuItem Text="Tab2" Value="1"/>
            <asp:MenuItem Text="Tab3" Value="2" />
        </Items>
        <StaticHoverStyle BackColor="#284E98" ForeColor="White" />

<StaticMenuItemStyle CssClass="tab" HorizontalPadding="5px" VerticalPadding="2px"></StaticMenuItemStyle>

<StaticSelectedStyle CssClass="selectedTab" BackColor="#507CD1"></StaticSelectedStyle>
    </asp:Menu>
        <div class="tabContents">
        <asp:MultiView runat="server" ID="mv" ActiveViewIndex="0">
            <asp:View runat="server" ID="v1">
                <br />This is the first view
                <br />This is the first view
                <br />This is the first view
                <br />This is the first view
            </asp:View>
            <asp:View runat="server" ID="v2">
                <br />This is the second view
                <br />This is the second view
                <br />This is the second view
                <br />This is the second view
            </asp:View>
            <asp:View runat="server" ID="v3">
                <br />This is the third view
                <br />This is the third view
                <br />This is the third view
                <br />This is the third view
            </asp:View>
        </asp:MultiView>
        </div>
    </div>
   </ContentTemplate>
 </asp:UpdatePanel>
    </form>
</body>
</html>
