<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Accordion.aspx.cs" Inherits="Accordion" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="asp" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        
    <div>
        <asp:Editor ID="Editor1" runat="server" />
        
        <asp:Accordion ID="Accordion1" runat="server" SelectedIndex="0" HeaderCssClass="accordionHeader" HeaderSelectedCssClass="accordionHeaderSelected"
            ContentCssClass="accordionContent" AutoSize="None" FadeTransitions="true" TransitionDuration="250" FramesPerSecond="40" RequireOpenedPane="false"
            SuppressHeaderPostbacks="true">
            <Panes>
                <asp:AccordionPane ID="AccordionPane1" runat="server" HeaderCssClass="accordionHeader" HeaderSelectedCssClass="accordionHeaderSelected"
            ContentCssClass="accordionContent">
                    <Header>1. Accordion</Header>
                    <Content>
                        
                            The Accordion is a web control that allows you to provide multiple panes 
                            and display them one at a time. It is like having several CollapsiblePanels 
                            where only one can be expanded at a time. The Accordion is implemented as a 
                            web control that contains AccordionPane web controls. Each AccordionPane control 
                            has a template for its Header and its Content. We keep track of the selected pane 
                            so it stays visible across postbacks.
                        
                    </Content>
                    
                </asp:AccordionPane>
                <asp:AccordionPane ID="AccordionPane2" runat="server" HeaderCssClass="accordionHeader" HeaderSelectedCssClass="accordionHeaderSelected"
            ContentCssClass="accordionContent">
                    <Header>2. AutoSize</Header>
                    <Content>
                        
                            It also supports three AutoSize modes so it can fit in a variety of layouts.
                            None - The Accordion grows/shrinks without restriction. This can cause other elements on your 
                            page to move up and down with it.
                            Limit - The Accordion never grows larger than the value specified by its Height property. 
                            This will cause the content to scroll if it is too large to be displayed.
                            Fill - The Accordion always stays the exact same size as its Height property. 
                            This will cause the content to be expanded or shrunk if it isn't the right size.
                        
                    </Content>
                </asp:AccordionPane>
                <asp:AccordionPane ID="AccordionPane3" runat="server" HeaderCssClass="accordionHeader" HeaderSelectedCssClass="accordionHeaderSelected"
            ContentCssClass="accordionContent">
                    <Header>3. Control or Extender</Header>
                    <Content>
                        
                            The Accordion is written using an extender like most of the other extenders in 
                            the AJAX Control Toolkit. The extender expects its input in a very specific hierarchy of 
                            container elements (like divs), so the Accordion and AccordionPane web controls are used 
                            to generate the expected input for the extender. The extender can also be used on its own 
                            if you provide it appropriate input.
                        
                    </Content>
                </asp:AccordionPane>
                <asp:AccordionPane ID="AccordionPane4" runat="server" HeaderCssClass="accordionHeader" HeaderSelectedCssClass="accordionHeaderSelected"
            ContentCssClass="accordionContent">
                    <Header>4. What is ASP.NET AJAX?</Header>
                    <Content>
                        
                        ASP.NET AJAX is a free framework for building a new generation of richer, more interactive,
                         highly personalized cross-browser web applications. This new web development technology from 
                        Microsoft integrates cross-browser client script libraries with the ASP.NET 2.0 server-based 
                        development framework. In addition, ASP.NET AJAX offers you the same type of development 
                        platform for client-based web pages that ASP.NET offers for server-based pages. 
                        And because ASP.NET AJAX is an extension of ASP.NET, it is fully integrated with 
                        server-based services. ASP.NET AJAX makes it possible to easily take advantage of 
                        AJAX techniques on the web and enables you to create ASP.NET pages with a rich, 
                        responsive UI and server communication. However, AJAX isn't just for ASP.NET. 
                        You can take advantage of the rich client framework to easily build client-centric 
                        web applications that integrate with any backend data provider and run on most modern browsers.
                        
                      </Content>
                </asp:AccordionPane>
            </Panes>
        </asp:Accordion>
        
    </div>
    </form>
</body>
</html>
