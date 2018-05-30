<%@ Page Title="Login" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" %>

<%@ Import Namespace="Hargreaves_FinalProject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script runat="server">

        protected void buttonSubmit_Click(object sender, EventArgs e)
        {
            int studentID = Data.checkLogin(userId.Text, password.Text);
            if (studentID > 0)
            {
                HttpCookie arrOfCookieData = new HttpCookie("myCookieCollection");
                arrOfCookieData["studentID"] = studentID.ToString();
                arrOfCookieData.Expires = DateTime.Now.AddMinutes(10);
                Response.Cookies.Add(arrOfCookieData);
                Response.Redirect("MyClasses.aspx");
            }
            else
            {
                error.Visible = true;
            }
        }

        protected void Page_Load()
        {

            HttpCookie myCookie = Request.Cookies["myCookieCollection"];
            if (myCookie != null)
            {
                if (IsPostBack) { Response.Redirect(Request.UrlReferrer.ToString()); }
                Response.Redirect("MyClasses.aspx");

            }

        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login">
        <div class="loginbox radius">
            <div class="loginboxinner">
                <div class="bannerlogo">
                    <img src="KayodyLogo.png" id="logoGraphic" alt="Kayody LLC" class="logo">
                </div>
                <div id="userData">
                    <p>
                        <label for="userId">User Name</label>
                        <span role="status" aria-live="polite"></span>
                        <asp:TextBox runat="server" ID="userId" CssClass="text-input"></asp:TextBox>
                    </p>
                    <p>
                        <label for="password">Password</label>
                        <asp:TextBox runat="server" ID="password" CssClass="text-input" TextMode="Password"></asp:TextBox>
                    </p>
                    <p>
                        <asp:Button runat="server" CssClass="radius button" Text="SIGN IN" OnClick="buttonSubmit_Click"></asp:Button>
                    </p>
                    <asp:Label ID="error" runat="server" ForeColor="Red" Visible="false">Your username or password is incorrect</asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
