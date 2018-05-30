<%@ Page Title="Registration" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" %>

<%@ Import Namespace="Hargreaves_FinalProject" %>
<script runat="server">
    int studentID;
    protected void Page_Load(object sender, EventArgs e)
    {

        HttpCookie myCookie = Request.Cookies["myCookieCollection"];
        if (myCookie != null)
        {
            studentID = int.Parse(myCookie["studentID"]);
            List<Data.classesById> classes = Data.getClassData();
            List<Data.classesById> classesRegistered = Data.getClassesById(studentID);
            if (classes != null)
            {
                foreach (Data.classesById classAvailable in classes)
                {
                    TableRow row = new TableRow();
                    TableCell buttonCell = new TableCell();
                    TableCell className = new TableCell();
                    TableCell classDate = new TableCell();
                    TableCell classDescription = new TableCell();

                    bool match = false;
                    foreach (Data.classesById class2 in classesRegistered)
                    {
                        if (classAvailable.classId == class2.classId)
                        {
                            match = true;
                            break;
                        }

                    }
                    if (match)
                    {
                        buttonCell.Text = "Registered";
                    }
                    else
                    {
                        CheckBox cb = new CheckBox() { ID = classAvailable.classId.ToString() };
                        buttonCell.Controls.Add(cb);
                        buttonCell.HorizontalAlign = HorizontalAlign.Center;
                    }

                    className.Text = classAvailable.className;
                    classDate.Text = classAvailable.classDate.ToShortDateString();
                    classDescription.Text = classAvailable.classDescription;
                    row.Cells.Add(buttonCell);
                    row.Cells.Add(className);
                    row.Cells.Add(classDate);
                    row.Cells.Add(classDescription);
                    Table1.Rows.Add(row);
                }
            }
        }
        else { Response.Redirect("Login.aspx"); }
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        for (int r = 1; r < Table1.Rows.Count; r++)
        {
            try
            {
                if (Table1.Rows[r].Cells[0].Controls[0] is CheckBox)
                {
                    //Control ctrl = Table1.Rows[r].Cells[0].Controls[0];

                    //if (ctrl is CheckBox)
                    //{
                    CheckBox cb = Table1.Rows[r].Cells[0].Controls[0] as CheckBox;
                    if (cb.Checked)
                    {
                        if (Data.classRegister(int.Parse(cb.ID), studentID))
                        {
                            Response.Redirect("MyClasses.aspx");
                        }
                        else
                        {
                            response.Text = "An error occurred, please try again";
                            response.Visible = true;
                        }
                    }
                    //}
                }
            }
            catch { }

        }
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
                    <asp:TableHeaderCell runat="server">Register</asp:TableHeaderCell>
                    <asp:TableHeaderCell runat="server">Class ID</asp:TableHeaderCell>
                    <asp:TableHeaderCell runat="server">Start Date</asp:TableHeaderCell>
                    <asp:TableHeaderCell runat="server">Description</asp:TableHeaderCell>
                </asp:TableHeaderRow>
                <%--<asp:TableRow BorderStyle="Solid" runat="server">
                    <asp:TableCell ID="" CssClass="header" runat="server">
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
                </asp:TableRow>--%>
            </asp:Table>
            <br />
            <asp:Button runat="server" ID="btnRegister" Text="Register" OnClick="btnRegister_Click" />
        </p>
        <asp:Label ID="response" runat="server" Visible="false"></asp:Label>
    </div>
</asp:Content>
