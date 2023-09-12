<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUpPage.aspx.cs" Inherits="CourierNinjaPro.sites.SignUpPage" EnableViewState="true" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Courier Management - Registration</title>

    <link href="../css/SignUpCss.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Courier Delivery Personnel Registration</h2>
            <div class="form-group">
                <label for="fullName">Full Name:</label>
                <asp:TextBox runat="server" ID="etFullName" CssClass="textbox" requied></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="etFullName"
                    Display="Dynamic" ForeColor="Red" ErrorMessage="Full Name is required." EnableClientScript="False" />
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <asp:TextBox runat="server" ID="etEmailReg" CssClass="textbox" type="email" required></asp:TextBox>
                <asp:RegularExpressionValidator runat="server" ControlToValidate="etEmailReg"
                    Display="Dynamic" ForeColor="Red"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ErrorMessage="Enter a valid email address." EnableClientScript="False" />
            </div>
            <div class="form-group">
                <label for="phoneNumber">Phone Number:</label>
                <asp:TextBox runat="server" ID="etPhoneNumber" CssClass="textbox" required></asp:TextBox>
                <asp:RegularExpressionValidator runat="server" ControlToValidate="etPhoneNumber"
                    Display="Dynamic" ForeColor="Red"
                    ValidationExpression="^\d{10}$"
                    ErrorMessage="Enter a 10-digit phone number." EnableClientScript="False" />
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <asp:TextBox runat="server" ID="etPassword" CssClass="textbox" TextMode="Password" required></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="etPassword"
                    Display="Dynamic" ForeColor="Red" ErrorMessage="Password is required." EnableClientScript="False" />
            </div>
           
          
            <div class="form-group">
                <asp:Button runat="server" ID="btnSubmit" Text="Register" CssClass="button" OnClick="btnSubmit_Click" OnClientClick="return validateForm();" />

            </div>
        </div>
    </form>
    <script type="text/javascript">
    function validateForm() {
        var fullName = document.getElementById('<%= etFullName.ClientID %>').value;
        var email = document.getElementById('<%= etEmailReg.ClientID %>').value;
        var phoneNumber = document.getElementById('<%= etPhoneNumber.ClientID %>').value;
        var password = document.getElementById('<%= etPassword.ClientID %>').value;

        // Check if all fields are filled out
        if (fullName.trim() === '' || email.trim() === '' || phoneNumber.trim() === '' || password.trim() === '' || confirmPassword.trim() === '') {
            alert('Please fill out all required fields.');
            return false;
        }
        return true;
    }
</script>

</body>
</html>
