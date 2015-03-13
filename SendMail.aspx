<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SendMail.aspx.cs" Inherits="SendMail" %>
<script runat="server">
void btnSubmit_Click(object sender, EventArgs e)
    {
        if(file1.PostedFile!=null)
        {
            try
            {
                file1.PostedFile.SaveAs("");
                span1.InnerHtml = "Upload Successful";
            }
            catch (Exception ex)
            {
                span1.InnerHtml = "Error saving file<b>C:\\" + file1.Value + "</b></br>" + ex.ToString();
            }
        }
    }
</script>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="scripts/jquery-1.10.2.min.js"></script>
</head>
<body>
    <script>
        // initialize the JavaScript SDK
        window.fbAsyncInit = function () {
            FB.init({
                appId: '704670469605575',
                xfbml: true,
                //status: true,
                version: 'v2.0'
                //channelUrl: '//' + window.location.hostname + '/channel', // Path to your Channel File
                //scope: 'id,name,gender,user_birthday,email' // This to get the user details back from Facebook
            });
            // listen for and handle auth.statusChange events
            FB.Event.subscribe('auth.statusChange', OnLogin);
        };

        //after initializing the JavaScript SDK, we call 
        // FB.getLoginStatus()
        //FB.getLoginStatus(function (response) {
          //  if (response.status === 'connected') {
            //    console.log('Logged in.');
            //}
            //else {
              //  FB.login();
            //}
        //});

        // Load the SDK asynchronously
        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) { return; }
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));

        // This method will be called after the user login into facebook.
        function OnLogin(response) {
            if (response.authResponse) {
                FB.api('/me?fields=id,name,gender,email,birthday', LoadValues);
            }
        }

        //This method will load the values to the labels
        function LoadValues(me) {
            if (me.name) {
                document.getElementById('displayname').innerHTML = me.name;
                document.getElementById('FBId').innerHTML = me.id;
                document.getElementById('DisplayEmail').innerHTML = me.email;
                document.getElementById('Gender').innerHTML = me.gender;
                document.getElementById('DOB').innerHTML = me.birthday;
                document.getElementById('auth-loggedin').style.display = 'block';
            }
        }
    </script>
    <form id="form1" runat="server" enctype="multipart/form-data">
    <div>
    Select a file to upload:<br />
        <input type="file" id="file1" runat="server" />
        <p>
            <input type="submit" id="btnSubmit" runat="server" value="Upload File" onserverclick="btnSubmit_Click" />
        </p>
        <span id="span1" runat="server" />
    </div>

    <div id="fb-root"></div> <!-- This initializes the FB controls-->   
    <!--<div class="fb-login-button" autologoutlink="true" scope="user_birthday,email" >-->
     <div class="fb-login-button" autologoutlink="true" >
      Login with Facebook
     </div> <!-- FB Login Button -->   
    <!-- Details --> 
    <div id="auth-status">    
    <div id="auth-loggedin" style="display: none">
        Hi, <span id="displayname"></span><br/>
        Your Facebook ID : <span id="FBId"></span><br/>
        Your Email : <span id="DisplayEmail"></span><br/>
        Your Sex: <span id="Gender"></span><br/>
        Your Date of Birth : <span id="DOB"></span><br/>        
    </div>
    </div>
        <asp:Button ID="btnLogin" runat="server" Text="Login with FaceBook" OnClick="Login" />
    <asp:Panel ID="pnlFaceBookUser" runat="server" Visible="false">
    <hr />
<table>
    <tr>
        <td rowspan="5" valign="top">
            <asp:Image ID="ProfileImage" runat="server" Width="50" Height="50" />
        </td>
    </tr>
    <tr>
        <td>ID:<asp:Label ID="lblId" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr>
        <td>UserName:<asp:Label ID="lblUserName" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr>
        <td>Name:<asp:Label ID="lblName" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr>
        <td>Email:<asp:Label ID="lblEmail" runat="server" Text=""></asp:Label></td>
    </tr>
</table>
</asp:Panel>
        <asp:Button ID="btnFetch" runat="server" Text="Fetch Friends" OnClick="btnFetch_Click" />
<br />
<asp:GridView ID="gvFriends" runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:ImageField DataImageUrlField="PictureUrl" HeaderText="Picture" />
        <asp:BoundField DataField="Name" HeaderText="Name" />
    </Columns>
</asp:GridView>
    </form>
</body>
</html>
