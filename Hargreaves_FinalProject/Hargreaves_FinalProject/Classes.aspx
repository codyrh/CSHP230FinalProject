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
        <p> <br />
            <label class="classHeader">CSHP 210 PROGRAMMING IN C#</label><br />
            <label class="classHeader">06/01/2018</label><br />
            <label>Get an understanding of C# and .NET basic concepts in the .NET framework. Explore classes, objects, and types; defining class structures; inheritance; polymorphism; and more.</label>
        </p>
        <p>
            <label class="classHeader">CSHP 220 CREATING CLIENT APPLICATION IN C#</label><br />
            <label class="classHeader">06/01/2018</label><br />
            <label>Study topics that include common data structures, generics, Windows forms applications, data binding to controls, DataGridView and ADO.NET and databases.</label>
        </p>
        <p>
            <label class="classHeader">CSHP 230 WEB APPLICATIONS IN C#</label><br />
            <label class="classHeader">06/01/2018</label><br />
            <label>Study topics including HTML5, JavaScript, jQuery, OData, JSON, CSS3 and ASP.NET MVC. Undertake a final project to build a mash-up consuming web services.</label>
        </p>
    </div>
</asp:Content>
