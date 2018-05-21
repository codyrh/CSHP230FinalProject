<%@ Page Title="Cookies" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script runat="server">

        protected void buttonSubmit_Click(object sender, EventArgs e)
        {

        }

        protected void Page_Load()
        {
            if (!IsPostBack)
            {
                HttpCookie myCookie = Request.Cookies["myCookieCollection"];
                if (myCookie != null)
                {
                    HttpCookie arrOfCookieData = Request.Cookies["myCookieCollection"];

                }
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="loginbox radius">
        <div class="loginboxinner">
            <h2>User Registration</h2>
            <asp:Label runat="server">Name</asp:Label><br />
            <asp:TextBox ID="name" runat="server" Width="332px"></asp:TextBox><br />
            <asp:Label runat="server">Email</asp:Label><br />
            <asp:TextBox ID="email" runat="server" Width="332px" TextMode="Email"></asp:TextBox><br />
            <asp:Label runat="server">Login</asp:Label><br />
            <asp:TextBox ID="login" runat="server" Width="332px"></asp:TextBox><br />
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" Height="16px" Width="428px">
                <asp:ListItem>New User</asp:ListItem>
                <asp:ListItem>Reactivate Account</asp:ListItem>
            </asp:RadioButtonList>
            <asp:Label runat="server">Reason for access</asp:Label><br />
            <asp:TextBox ID="reason" runat="server" Width="471px" Height="24px" TextMode="MultiLine"></asp:TextBox><br />
            <asp:Label for="DateNeeded" runat="server" Text="Date Needed"></asp:Label><br />
            <asp:TextBox ID="DateNeeded" runat="server" TextMode="Date"></asp:TextBox><br />
            <asp:Button class="radius button" ID="buttonSubmit" runat="server" Text="Submit" OnClick="buttonSubmit_Click" /><br />
        </div>
    </div>
</asp:Content>
