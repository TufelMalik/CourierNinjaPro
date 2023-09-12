<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignInPage.aspx.cs" Inherits="CourierNinjaPro.sites.SignInPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/SignUpCss.css" rel="stylesheet" type="text/css" />
</head>
<body>


     <form id="form1" runat="server">
        <div class="container">
            <h2>Courier Delivery Personnel Login</h2>
           
            <div class="form-group">
                <label for="email">Email:</label>
                <asp:TextBox runat="server" ID="etEmailLogin" CssClass="textbox" type="email" required></asp:TextBox>
                <asp:RegularExpressionValidator runat="server" ControlToValidate="etEmailLogin"
                    Display="Dynamic" ForeColor="Red"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ErrorMessage="Enter a valid email address." EnableClientScript="False" />
            </div>
           
            <div class="form-group">
                <label for="password">Password:</label>
                <asp:TextBox runat="server" ID="etPasswordLogin" CssClass="textbox" TextMode="Password" required></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="etPasswordLogin"
                    Display="Dynamic" ForeColor="Red" ErrorMessage="Password is required." EnableClientScript="False" />
            </div>
           
          
            <div class="form-group">
                <asp:Button runat="server" ID="btnLogin" Text="Login" CssClass="button" OnClick="btnLogin_Click" OnClientClick="return validateForm();" />

            </div>
        </div>
    </form>

</body>
</html>
