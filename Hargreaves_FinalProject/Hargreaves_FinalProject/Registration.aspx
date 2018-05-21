<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login">
        <p>
            <br />
            <asp:Table ForeColor="White" GridLines="Both" BorderStyle="Solid" BorderColor="White" BorderWidth="1pt" ID="Table1" runat="server" CellPadding="10">
                <asp:TableHeaderRow runat="server">
                    <asp:TableHeaderCell runat="server">&nbsp</asp:TableHeaderCell>
                    <asp:TableHeaderCell runat="server">Class ID</asp:TableHeaderCell>
                    <asp:TableHeaderCell runat="server">Start Date</asp:TableHeaderCell>
                    <asp:TableHeaderCell runat="server">Description</asp:TableHeaderCell>
                </asp:TableHeaderRow>
                <asp:TableRow BorderStyle="Solid" runat="server">
                    <asp:TableCell CssClass="header" runat="server">
                        <asp:Button ID="Register1" runat="server" Text="Register" />
                    </asp:TableCell>
                    <asp:TableCell runat="server">CSHP 210</asp:TableCell>
                    <asp:TableCell runat="server">06/01/2018</asp:TableCell>
                    <asp:TableCell runat="server">Get an understanding of C# and .NET basic concepts in the .NET framework. Explore classes, objects, and types; defining class structures; inheritance; polymorphism; and more.</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow BorderStyle="Solid" runat="server">
                    <asp:TableCell CssClass="header" runat="server">
                        <asp:Button ID="Button2" runat="server" Text="Register" />
                    </asp:TableCell>
                    <asp:TableCell runat="server">CSHP 220</asp:TableCell>
                    <asp:TableCell runat="server">06/01/2018</asp:TableCell>
                    <asp:TableCell runat="server">Study topics that include common data structures, generics, Windows forms applications, data binding to controls, DataGridView and ADO.NET and databases.</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow BorderStyle="Solid" runat="server">
                    <asp:TableCell CssClass="header" runat="server">
                        <asp:Button ID="Button3" runat="server" Text="Register" />
                    </asp:TableCell>
                    <asp:TableCell runat="server">CSHP 230</asp:TableCell>
                    <asp:TableCell runat="server">06/01/2018</asp:TableCell>
                    <asp:TableCell runat="server">Study topics including HTML5, JavaScript, jQuery, OData, JSON, CSS3 and ASP.NET MVC. Undertake a final project to build a mash-up consuming web services.</asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </p>
    </div>
</asp:Content>
