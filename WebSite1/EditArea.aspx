<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditArea.aspx.cs" Inherits="EditArea" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <br />
            <asp:Button ID="BtnEditplayer" runat="server" OnClick="BtnEditplayer_Click" Text="Edit player" />
            <asp:Button ID="btnEditCoach" runat="server" OnClick="btnEditCoach_Click" Text="Edit Coach" />
            <asp:Button ID="btnschool" runat="server" OnClick="btnschool_Click" Text="School" />
            <asp:Button ID="btnLevel" runat="server" OnClick="btnLevel_Click" Text="Level" />
            <asp:Button ID="btncomments" runat="server" OnClick="btncomments_Click" Text="comments" />
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">
                    <br />
                    <asp:DropDownList ID="ddlist" runat="server">
                    </asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Select" runat="server" OnClick="Button1_Click" Text="Select" />
                    <br />
                    <br />
                    First Name:
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    Last Name:
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    PhoneNumber:<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    Email:<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    StreetAddress<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    City:<asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    State:<asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    Zip:
                    <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    GPA:
                    <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    ACT:<asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    PointAverage:<asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    Shooting:<asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    ThreepointAvg:<asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
                    <br />
                    ReboundAvg:<asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Update" />
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Delete" />
                    <br />
                    <br />
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BasketballinfoConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [CoachesTable] ORDER BY [CoachId]"></asp:SqlDataSource>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CoachId" DataSourceID="SqlDataSource1" Height="163px" Width="219px">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="CoachId" HeaderText="CoachId" InsertVisible="False" ReadOnly="True" SortExpression="CoachId" />
                            <asp:BoundField DataField="Coaches" HeaderText="Coaches" SortExpression="Coaches" />
                        </Columns>
                    </asp:GridView>
                    <br />
                    <br />
                    <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox>
                    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Button" />
                </asp:View>
                <asp:View ID="View3" runat="server">
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:BasketballinfoConnectionString %>" DeleteCommand="DELETE FROM [SchoolTable] WHERE [SchoolId] = @original_SchoolId AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([Adress] = @original_Adress) OR ([Adress] IS NULL AND @original_Adress IS NULL)) AND (([Phone number] = @original_Phone_number) OR ([Phone number] IS NULL AND @original_Phone_number IS NULL)) AND (([Head Coach] = @original_Head_Coach) OR ([Head Coach] IS NULL AND @original_Head_Coach IS NULL))" InsertCommand="INSERT INTO [SchoolTable] ([SchoolId], [Name], [Adress], [Phone number], [Head Coach]) VALUES (@SchoolId, @Name, @Adress, @Phone_number, @Head_Coach)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [SchoolTable]" UpdateCommand="UPDATE [SchoolTable] SET [Name] = @Name, [Adress] = @Adress, [Phone number] = @Phone_number, [Head Coach] = @Head_Coach WHERE [SchoolId] = @original_SchoolId AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([Adress] = @original_Adress) OR ([Adress] IS NULL AND @original_Adress IS NULL)) AND (([Phone number] = @original_Phone_number) OR ([Phone number] IS NULL AND @original_Phone_number IS NULL)) AND (([Head Coach] = @original_Head_Coach) OR ([Head Coach] IS NULL AND @original_Head_Coach IS NULL))">
                        <DeleteParameters>
                            <asp:Parameter Name="original_SchoolId" Type="Int32" />
                            <asp:Parameter Name="original_Name" Type="String" />
                            <asp:Parameter Name="original_Adress" Type="String" />
                            <asp:Parameter Name="original_Phone_number" Type="String" />
                            <asp:Parameter Name="original_Head_Coach" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="SchoolId" Type="Int32" />
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="Adress" Type="String" />
                            <asp:Parameter Name="Phone_number" Type="String" />
                            <asp:Parameter Name="Head_Coach" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="Adress" Type="String" />
                            <asp:Parameter Name="Phone_number" Type="String" />
                            <asp:Parameter Name="Head_Coach" Type="String" />
                            <asp:Parameter Name="original_SchoolId" Type="Int32" />
                            <asp:Parameter Name="original_Name" Type="String" />
                            <asp:Parameter Name="original_Adress" Type="String" />
                            <asp:Parameter Name="original_Phone_number" Type="String" />
                            <asp:Parameter Name="original_Head_Coach" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="SchoolId" DataSourceID="SqlDataSource2">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="SchoolId" HeaderText="SchoolId" ReadOnly="True" SortExpression="SchoolId" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Adress" HeaderText="Adress" SortExpression="Adress" />
                            <asp:BoundField DataField="Phone number" HeaderText="Phone number" SortExpression="Phone number" />
                            <asp:BoundField DataField="Head Coach" HeaderText="Head Coach" SortExpression="Head Coach" />
                        </Columns>
                    </asp:GridView>
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="SchoolId" DataSourceID="SqlDataSource3" Height="50px" Width="125px">
                        <Fields>
                            <asp:BoundField DataField="SchoolId" HeaderText="SchoolId" ReadOnly="True" SortExpression="SchoolId" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Adress" HeaderText="Adress" SortExpression="Adress" />
                            <asp:BoundField DataField="Phone number" HeaderText="Phone number" SortExpression="Phone number" />
                            <asp:BoundField DataField="Head Coach" HeaderText="Head Coach" SortExpression="Head Coach" />
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                        </Fields>
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:BasketballinfoConnectionString %>" DeleteCommand="DELETE FROM [SchoolTable] WHERE [SchoolId] = @original_SchoolId AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([Adress] = @original_Adress) OR ([Adress] IS NULL AND @original_Adress IS NULL)) AND (([Phone number] = @original_Phone_number) OR ([Phone number] IS NULL AND @original_Phone_number IS NULL)) AND (([Head Coach] = @original_Head_Coach) OR ([Head Coach] IS NULL AND @original_Head_Coach IS NULL))" InsertCommand="INSERT INTO [SchoolTable] ([SchoolId], [Name], [Adress], [Phone number], [Head Coach]) VALUES (@SchoolId, @Name, @Adress, @Phone_number, @Head_Coach)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [SchoolTable] WHERE ([SchoolId] = @SchoolId)" UpdateCommand="UPDATE [SchoolTable] SET [Name] = @Name, [Adress] = @Adress, [Phone number] = @Phone_number, [Head Coach] = @Head_Coach WHERE [SchoolId] = @original_SchoolId AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([Adress] = @original_Adress) OR ([Adress] IS NULL AND @original_Adress IS NULL)) AND (([Phone number] = @original_Phone_number) OR ([Phone number] IS NULL AND @original_Phone_number IS NULL)) AND (([Head Coach] = @original_Head_Coach) OR ([Head Coach] IS NULL AND @original_Head_Coach IS NULL))">
                        <DeleteParameters>
                            <asp:Parameter Name="original_SchoolId" Type="Int32" />
                            <asp:Parameter Name="original_Name" Type="String" />
                            <asp:Parameter Name="original_Adress" Type="String" />
                            <asp:Parameter Name="original_Phone_number" Type="String" />
                            <asp:Parameter Name="original_Head_Coach" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="SchoolId" Type="Int32" />
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="Adress" Type="String" />
                            <asp:Parameter Name="Phone_number" Type="String" />
                            <asp:Parameter Name="Head_Coach" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView2" Name="SchoolId" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="Adress" Type="String" />
                            <asp:Parameter Name="Phone_number" Type="String" />
                            <asp:Parameter Name="Head_Coach" Type="String" />
                            <asp:Parameter Name="original_SchoolId" Type="Int32" />
                            <asp:Parameter Name="original_Name" Type="String" />
                            <asp:Parameter Name="original_Adress" Type="String" />
                            <asp:Parameter Name="original_Phone_number" Type="String" />
                            <asp:Parameter Name="original_Head_Coach" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </asp:View>
                <asp:View ID="View4" runat="server">
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:BasketballinfoConnectionString %>" DeleteCommand="DELETE FROM [SkillTable] WHERE [SkillId] = @original_SkillId AND (([SkillLevel] = @original_SkillLevel) OR ([SkillLevel] IS NULL AND @original_SkillLevel IS NULL))" InsertCommand="INSERT INTO [SkillTable] ([SkillLevel]) VALUES (@SkillLevel)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [SkillTable]" UpdateCommand="UPDATE [SkillTable] SET [SkillLevel] = @SkillLevel WHERE [SkillId] = @original_SkillId AND (([SkillLevel] = @original_SkillLevel) OR ([SkillLevel] IS NULL AND @original_SkillLevel IS NULL))">
                        <DeleteParameters>
                            <asp:Parameter Name="original_SkillId" Type="Int32" />
                            <asp:Parameter Name="original_SkillLevel" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="SkillLevel" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="SkillLevel" Type="String" />
                            <asp:Parameter Name="original_SkillId" Type="Int32" />
                            <asp:Parameter Name="original_SkillLevel" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="SkillId" DataSourceID="SqlDataSource4">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="SkillId" HeaderText="SkillId" InsertVisible="False" ReadOnly="True" SortExpression="SkillId" />
                            <asp:BoundField DataField="SkillLevel" HeaderText="SkillLevel" SortExpression="SkillLevel" />
                        </Columns>
                    </asp:GridView>
                    <br />
                    <asp:TextBox ID="TextBox16" runat="server"></asp:TextBox>
                    <asp:Button ID="Button10" runat="server" OnClick="Button10_Click" Text="Button" />
                </asp:View>
                <asp:View ID="View5" runat="server">
                    Comments:
                    <asp:TextBox ID="TextBox17" runat="server" Height="106px" Width="416px"></asp:TextBox>
                    &nbsp;<asp:DropDownList ID="DDL" runat="server" DataSourceID="SqlDataSource5" DataTextField="LastName" DataValueField="ApplicantId">
                    </asp:DropDownList>
                    <asp:Button ID="Read1" runat="server" OnClick="Read1_Click" Text="Read" />
                    <asp:Button ID="Update" runat="server" OnClick="Button12_Click" Text="Update" />
                    <br />
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:BasketballinfoConnectionString %>" DeleteCommand="DELETE FROM [ApplicantTable] WHERE [ApplicantId] = @original_ApplicantId AND (([LastName] = @original_LastName) OR ([LastName] IS NULL AND @original_LastName IS NULL)) AND (([Comments] = @original_Comments) OR ([Comments] IS NULL AND @original_Comments IS NULL))" InsertCommand="INSERT INTO [ApplicantTable] ([LastName], [Comments]) VALUES (@LastName, @Comments)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [ApplicantId], [LastName], [Comments] FROM [ApplicantTable]" UpdateCommand="UPDATE [ApplicantTable] SET [LastName] = @LastName, [Comments] = @Comments WHERE [ApplicantId] = @original_ApplicantId AND (([LastName] = @original_LastName) OR ([LastName] IS NULL AND @original_LastName IS NULL)) AND (([Comments] = @original_Comments) OR ([Comments] IS NULL AND @original_Comments IS NULL))">
                        <DeleteParameters>
                            <asp:Parameter Name="original_ApplicantId" Type="Int32" />
                            <asp:Parameter Name="original_LastName" Type="String" />
                            <asp:Parameter Name="original_Comments" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="LastName" Type="String" />
                            <asp:Parameter Name="Comments" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="LastName" Type="String" />
                            <asp:Parameter Name="Comments" Type="String" />
                            <asp:Parameter Name="original_ApplicantId" Type="Int32" />
                            <asp:Parameter Name="original_LastName" Type="String" />
                            <asp:Parameter Name="original_Comments" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </asp:View>
            </asp:MultiView>
        </div>
    </form>
</body>
</html>
