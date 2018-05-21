<%@ Page Title="Cookies" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script runat="server">

        protected void buttonSubmit_Click(object sender, EventArgs e)
        {
            HttpCookie arrOfCookieData = new HttpCookie("myCookieCollection");
            //arrOfCookieData["login"] = login.Text;
            Response.Cookies.Add(arrOfCookieData);
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
    <div class="login">
        <div class="loginbox radius">
            <div class="loginboxinner">
                <div class="bannerlogo">
                    <img src="KayodyLogo.png" id="logoGraphic" alt="Kayody LLC" class="logo">
                </div>
                <div id="errorDiv" style="display: none">
                    <span id="errormsg">Incorrect User Name or Password</span>
                </div>
                <div id="userData">
                    <p>
                        <label for="userId">User Name</label>
                        <span role="status" aria-live="polite"></span>
                        <input type="email" id="userId" name="employeeid" value="" class="text-input" autocomplete="off">
                    </p>
                    <p>
                        <label for="password">Password</label>
                        <input type="password" id="password1" name="password" class="text-input" autocomplete="off">
                    </p>
                    <p>
                        <input type="submit" class="radius button" name="client_login" value="Sign In">
                    </p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
