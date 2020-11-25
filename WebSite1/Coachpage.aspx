<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Coachpage.aspx.cs" Inherits="Coachpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <br />

            <asp:DropDownList ID="DropCoach" runat="server" DataSourceID="Coaches" DataTextField="Coaches" DataValueField="CoachId" AppendDataBoundItems="True">
                <asp:ListItem Text="All Coaches" Value="0"></asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:DropDownList ID="DropLevel" runat="server" DataSourceID="Level" DataTextField="SkillLevel" DataValueField="SkillId" AppendDataBoundItems="True">
                <asp:ListItem Text="All Level" Value="0"></asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:DropDownList ID="Dropposition" runat="server" DataSourceID="Position" DataTextField="Position" DataValueField="PostionId" AppendDataBoundItems="True">
                <asp:ListItem Text="All Position" Value="0"></asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />

            <br />
            <asp:DropDownList ID="Filter" runat="server">
               
            </asp:DropDownList>

            <br />
            <br />
            <br />
            <br />
            <asp:SqlDataSource ID="Coaches" runat="server" ConnectionString="<%$ ConnectionStrings:BasketballinfoConnectionString %>" SelectCommand="SELECT * FROM [CoachesTable]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="Level" runat="server" ConnectionString="<%$ ConnectionStrings:BasketballinfoConnectionString %>" SelectCommand="SELECT * FROM [SkillTable]"></asp:SqlDataSource>

        </div>
        <asp:SqlDataSource ID="Position" runat="server" ConnectionString="<%$ ConnectionStrings:BasketballinfoConnectionString %>" SelectCommand="SELECT * FROM [Table]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="Contactinfo" runat="server" ConnectionString="<%$ ConnectionStrings:BasketballinfoConnectionString %>" SelectCommand="SELECT [FirstName], [LastName], [PhoneNumber], [Email], [StreetAddress], [City], [State], [Zip] FROM [ApplicantTable] WHERE ([ApplicantId] = @ApplicantId)">
            <SelectParameters>
                <asp:ControlParameter ControlID="Filter" Name="ApplicantId" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Button ID="Contact" runat="server" Height="39px" Text="Contact" Width="117px" OnClick="Contact_Click" />
        <asp:Button ID="stats" runat="server" Height="39px" OnClick="stats_Click" Text="stats" Width="117px" />
        <asp:Button ID="academics" runat="server" Height="39px" Text="academics" Width="117px" OnClick="academics_Click" />
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BasketballinfoConnectionString %>" SelectCommand="SELECT ApplicantTable.FirstName, ApplicantTable.LastName, ApplicantTable.GPA, ApplicantTable.ACT, MajorTable.Major FROM ApplicantTable INNER JOIN MajorTable ON ApplicantTable.MajorN = MajorTable.MajorId"></asp:SqlDataSource>
        <br />
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="Contactinfo">
                    <Columns>
                        <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                        <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                        <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                        <asp:BoundField DataField="StreetAddress" HeaderText="StreetAddress" SortExpression="StreetAddress" />
                        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                        <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                        <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" />
                    </Columns>
                </asp:GridView>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <asp:GridView ID="GridView1" runat="server"></asp:GridView>
            </asp:View>
            <asp:View ID="View3" runat="server">
                <asp:GridView ID="GridView3" runat="server"></asp:GridView>
            </asp:View>
        </asp:MultiView>
        <br />
    </form>
</body>
</html>
