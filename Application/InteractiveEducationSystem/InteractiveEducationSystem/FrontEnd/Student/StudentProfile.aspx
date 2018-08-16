<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd/Student/StudentMaster.Master" AutoEventWireup="true" CodeBehind="StudentProfile.aspx.cs" Inherits="InteractiveEducationSystem.FrontEnd.Student.StudentProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="brand-logo center-align">
        <h2>Student Profile</h2>
        <br />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Student_Id" DataSourceID="profilesource" AllowSorting="True">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="Student_Id" HeaderText="Student_Id" InsertVisible="False" ReadOnly="True" SortExpression="Student_Id" />
                <asp:BoundField DataField="Last_name" HeaderText="Last_name" SortExpression="Last_name" />
                <asp:BoundField DataField="First_name" HeaderText="First_name" SortExpression="First_name" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                <asp:BoundField DataField="Program_Code_FK" ReadOnly="true" HeaderText="Program_Code_FK" SortExpression="Program_Code_FK" />
                <asp:BoundField DataField="ID_FK" HeaderText="ID_FK" ReadOnly="true" SortExpression="ID_FK" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="profilesource" runat="server" ConnectionString="<%$ ConnectionStrings:IES %>" DeleteCommand="DELETE FROM [Student] WHERE [Student_Id] = @Student_Id" InsertCommand="INSERT INTO [Student] ([Last_name], [First_name], [Gender], [Program_Code_FK], [ID_FK]) VALUES (@Last_name, @First_name, @Gender, @Program_Code_FK, @ID_FK)" SelectCommand="SELECT [Student_Id], [Last_name], [First_name], [Gender], [Program_Code_FK], [ID_FK] FROM [Student] WHERE ([ID_FK] = @ID_FK)" UpdateCommand="UPDATE [Student] SET [Last_name] = @Last_name, [First_name] = @First_name, [Gender] = @Gender WHERE [Student_Id] = @Student_Id" >
            <DeleteParameters>
                <asp:Parameter Name="Student_Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Last_name" Type="String" />
                <asp:Parameter Name="First_name" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="Program_Code_FK" Type="Int32" />
                <asp:Parameter Name="ID_FK" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="ID_FK" SessionField="username" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Last_name" Type="String" />
                <asp:Parameter Name="First_name" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="Program_Code_FK" Type="Int32" />
                <asp:Parameter Name="ID_FK" Type="Int32" />
                <asp:Parameter Name="Student_Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
</div>        
</asp:Content>
