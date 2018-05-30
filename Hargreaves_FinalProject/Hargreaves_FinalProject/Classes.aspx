<%@ Page Title="Classes" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" %>

<%@ Import Namespace="Hargreaves_FinalProject" %>

<script runat="server">

    
    protected void Page_Load(object sender, EventArgs e)
    {
        List<Data.classesById> classes = Data.getClassData();
            if (classes != null)
            {
                foreach (Data.classesById classRegistered in classes)
                {
                    TableRow row = new TableRow();
                    TableCell className = new TableCell();
                    TableCell classDate = new TableCell();
                    TableCell classDescription = new TableCell();
                    className.Text = classRegistered.className;
                    classDate.Text = classRegistered.classDate.ToShortDateString();
                    classDescription.Text = classRegistered.classDescription;
                    row.Cells.Add(className);
                    row.Cells.Add(classDate);
                    row.Cells.Add(classDescription);
                    Table1.Rows.Add(row);
                }
            }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <br />
    <asp:Label ID="Header" Font-Bold="true" ForeColor="White" Font-Size="Larger" runat="server">Upcoming classes:</asp:Label>
    <asp:Table ForeColor="White" GridLines="Both" BorderStyle="Solid" BorderColor="White" BorderWidth="1pt" ID="Table1" runat="server" CellPadding="10">
        <asp:TableHeaderRow runat="server">
            <asp:TableHeaderCell runat="server">Class Name</asp:TableHeaderCell>
            <asp:TableHeaderCell runat="server">Start Date</asp:TableHeaderCell>
            <asp:TableHeaderCell runat="server">Description</asp:TableHeaderCell>
        </asp:TableHeaderRow>

    </asp:Table>
</asp:Content>
