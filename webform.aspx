<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="WebForm.aspx.cs"
    Inherits="WebApplication10.WebForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Online Event Registration</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
        }

        .container {
            width: 650px;
            margin: 30px auto;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px gray;
        }

        h2 {
            text-align: center;
            color: darkblue;
        }

        table {
            width: 100%;
        }

        td {
            padding: 8px;
            vertical-align: top;
        }

        input[type=text],
        textarea,
        select {
            width: 250px;
            padding: 6px;
        }

        .button {
            width: 100px;
            height: 35px;
            font-weight: bold;
            cursor: pointer;
        }

        .error {
            color: red;
            font-size: 13px;
        }

        .success-message {
            display: block;
            width: 650px;
            margin: 15px auto;
            padding: 12px 16px;
            color: #155724;
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
        }
    </style>

    <script type="text/javascript">
        function ValidateTerms(source, args) {
            var chk = document.getElementById('<%= chkTerms.ClientID %>');

            if (chk != null) {
                args.IsValid = chk.checked;
            } else {
                args.IsValid = false;
            }
        }
    </script>
</head>

<body>
    <form id="form1" runat="server">

        <div class="container">

            <h2>ONLINE EVENT REGISTRATION</h2>

            <asp:ValidationSummary
                ID="ValidationSummary1"
                runat="server"
                ForeColor="Red"
                HeaderText="Please correct the following:" />

            <table>

                <!-- Full Name -->
                <tr>
                    <td>Full Name</td>
                    <td>
                        <asp:TextBox
                            ID="txtName"
                            runat="server"></asp:TextBox>

                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1"
                            runat="server"
                            ControlToValidate="txtName"
                            ErrorMessage="Full Name is required"
                            CssClass="error"
                            Display="Dynamic" />
                    </td>
                </tr>

                <!-- Email -->
                <tr>
                    <td>Email ID</td>
                    <td>
                        <asp:TextBox
                            ID="txtEmail"
                            runat="server"></asp:TextBox>

                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator2"
                            runat="server"
                            ControlToValidate="txtEmail"
                            ErrorMessage="Email is required"
                            CssClass="error"
                            Display="Dynamic" />

                        <br />

                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator1"
                            runat="server"
                            ControlToValidate="txtEmail"
                            ValidationExpression="^[\w\.-]+@[\w\.-]+\.\w+$"
                            ErrorMessage="Invalid Email"
                            CssClass="error"
                            Display="Dynamic" />
                    </td>
                </tr>
<!-- Contact Number -->
                <tr>
                    <td>Contact Number</td>
                    <td>
                        <asp:TextBox
                            ID="txtContact"
                            runat="server"
                            MaxLength="10"></asp:TextBox>

                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator3"
                            runat="server"
                            ControlToValidate="txtContact"
                            ErrorMessage="Contact Number is required"
                            CssClass="error"
                            Display="Dynamic" />

                        <br />

                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator2"
                            runat="server"
                            ControlToValidate="txtContact"
                            ValidationExpression="^\d{10}$"
                            ErrorMessage="Enter 10 digits only"
                            CssClass="error"
                            Display="Dynamic" />
                    </td>
                </tr>

                <!-- College -->
                <tr>
                    <td>College</td>
                    <td>
                        <asp:TextBox
                            ID="txtCollege"
                            runat="server"></asp:TextBox>

                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator4"
                            runat="server"
                            ControlToValidate="txtCollege"
                            ErrorMessage="College is required"
                            CssClass="error"
                            Display="Dynamic" />
                    </td>
                </tr>

                <!-- Department -->
                <tr>
                    <td>Department</td>
                    <td>
                        <asp:RadioButtonList
                            ID="rblDepartment"
                            runat="server">

                            <asp:ListItem>Computer Science</asp:ListItem>
                            <asp:ListItem>Information Technology</asp:ListItem>
                            <asp:ListItem>Electronics</asp:ListItem>
                            <asp:ListItem>Mechanical</asp:ListItem>
                            <asp:ListItem>Civil</asp:ListItem>

                        </asp:RadioButtonList>
                    </td>
                </tr>

                <!-- Event -->
                <tr>
                    <td>Event</td>
                    <td>
                        <asp:DropDownList
                            ID="ddlEvent"
                            runat="server">

                            <asp:ListItem Value="">--Select Event--</asp:ListItem>
                            <asp:ListItem Value="Hackathon">Hackathon</asp:ListItem>
                            <asp:ListItem Value="Paper Presentation">Paper Presentation</asp:ListItem>
                            <asp:ListItem Value="Coding Contest">Coding Contest</asp:ListItem>
                            <asp:ListItem Value="Technical Quiz">Technical Quiz</asp:ListItem>

                        </asp:DropDownList>

                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator5"
                            runat="server"
                            ControlToValidate="ddlEvent"
                            InitialValue=""
                            ErrorMessage="Select Event"
                            CssClass="error"
                            Display="Dynamic" />
                    </td>
                </tr>

                <!-- Gender -->
                <tr>
                    <td>Gender</td>
                    <td>
                        <asp:RadioButtonList
                            ID="rblGender"
                            runat="server"
                            RepeatDirection="Horizontal">
<asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                            <asp:ListItem>Other</asp:ListItem>

                        </asp:RadioButtonList>
                    </td>
                </tr>

                <!-- Skills -->
                <tr>
                    <td>Skills</td>
                    <td>
                        <asp:CheckBoxList
                            ID="cblSkills"
                            runat="server">

                            <asp:ListItem>C</asp:ListItem>
                            <asp:ListItem>C#</asp:ListItem>
                            <asp:ListItem>Java</asp:ListItem>
                            <asp:ListItem>Python</asp:ListItem>
                            <asp:ListItem>Web Development</asp:ListItem>

                        </asp:CheckBoxList>
                    </td>
                </tr>

                <!-- Address -->
                <tr>
                    <td>Address</td>
                    <td>
                        <asp:TextBox
                            ID="txtAddress"
                            runat="server"
                            TextMode="MultiLine"
                            Rows="4"></asp:TextBox>
                    </td>
                </tr>

                <!-- Terms -->
                <tr>
                    <td colspan="2">

                        <asp:CheckBox
                            ID="chkTerms"
                            runat="server"
                            Text="I accept the Terms and Conditions" />

                        <asp:CustomValidator
                            ID="CustomValidator1"
                            runat="server"
                            ClientValidationFunction="ValidateTerms"
                            ErrorMessage="Accept Terms & Conditions"
                            CssClass="error"
                            Display="Dynamic"
                            ValidateEmptyText="true" />

                    </td>
                </tr>

                <!-- Buttons -->
                <tr>
                    <td></td>
                    <td>

                        <asp:Button
                            ID="btnSubmit"
                            runat="server"
                            Text="Submit"
                            CssClass="button"
                            OnClick="btnSubmit_Click" />

                        &nbsp;&nbsp;

                        <asp:Button
                            ID="btnReset"
                            runat="server"
                            Text="Reset"
                            CssClass="button"
                            CausesValidation="False"
                            OnClick="btnReset_Click" />

                    </td>
                </tr>

            </table>

        </div>

        <!-- Success Message -->
        <asp:Label
            ID="lblSuccess"
            runat="server"
            Text="Registration Completed Successfully! Thank you for registering. We’ll contact you with the next steps if required."
            CssClass="success-message"
            Visible="false">
        </asp:Label>

    </form>
</body>
</html>
