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
            <asp:Label Font-Bold="true" ForeColor="White" Font-Size="X-Large" runat="server">Classes you are registered for:</asp:Label>
            <asp:Table ForeColor="White" GridLines="Both" BorderStyle="Solid" BorderColor="White" BorderWidth="1pt" ID="Table1" runat="server" CellPadding="10">
                <asp:TableHeaderRow runat="server">
                    <asp:TableHeaderCell runat="server">Class ID</asp:TableHeaderCell>
                    <asp:TableHeaderCell runat="server">Start Date</asp:TableHeaderCell>
                    <asp:TableHeaderCell runat="server">Description</asp:TableHeaderCell>
                </asp:TableHeaderRow>
               
                <asp:TableRow BorderStyle="Solid" runat="server">
                    <asp:TableCell runat="server">CSHP 230</asp:TableCell>
                    <asp:TableCell runat="server">06/01/2018</asp:TableCell>
                    <asp:TableCell runat="server">Study topics including HTML5, JavaScript, jQuery, OData, JSON, CSS3 and ASP.NET MVC. Undertake a final project to build a mash-up consuming web services.</asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </p>
    </div>
</asp:Content>
