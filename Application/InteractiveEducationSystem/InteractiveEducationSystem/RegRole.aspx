<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="RegRole.aspx.cs" Inherits="InteractiveEducationSystem.RegRole" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Register & Assign Role</h1>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IES %>" SelectCommand="SELECT * FROM [Student] WHERE ([ID_FK] IS NULL)" DeleteCommand="DELETE FROM [Student] WHERE [Student_Id] = @Student_Id" InsertCommand="INSERT INTO [Student] ([First_name], [Last_name], [Gender], [Program_Code_FK], [ID_FK], [QuizId]) VALUES (@First_name, @Last_name, @Gender, @Program_Code_FK, @ID_FK, @QuizId)" UpdateCommand="UPDATE [Student] SET [First_name] = @First_name, [Last_name] = @Last_name, [Gender] = @Gender, [Program_Code_FK] = @Program_Code_FK, [ID_FK] = @ID_FK, [QuizId] = @QuizId WHERE [Student_Id] = @Student_Id">
        <DeleteParameters>
            <asp:Parameter Name="Student_Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="First_name" Type="String" />
            <asp:Parameter Name="Last_name" Type="String" />
            <asp:Parameter Name="Gender" Type="String" />
            <asp:Parameter Name="Program_Code_FK" Type="Int32" />
            <asp:Parameter Name="ID_FK" Type="Int32" />
            <asp:Parameter Name="QuizId" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="First_name" Type="String" />
            <asp:Parameter Name="Last_name" Type="String" />
            <asp:Parameter Name="Gender" Type="String" />
            <asp:Parameter Name="Program_Code_FK" Type="Int32" />
            <asp:Parameter Name="ID_FK" Type="Int32" />
            <asp:Parameter Name="QuizId" Type="Int32" />
            <asp:Parameter Name="Student_Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" ShowHeaderWhenEmpty="True" EmptyDataText="No Unregistered User" DataSourceID="SqlDataSource1" AutoGenerateSelectButton="True" OnSelectedIndexChanged="RegisterUser" AutoGenerateColumns="False" DataKeyNames="Student_Id">
        <Columns>
            <asp:BoundField DataField="Student_Id" HeaderText="Student_Id" InsertVisible="False" ReadOnly="True" SortExpression="Student_Id" />
            <asp:BoundField DataField="First_name" HeaderText="First_name" SortExpression="First_name" />
            <asp:BoundField DataField="Last_name" HeaderText="Last_name" SortExpression="Last_name" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
            <asp:BoundField DataField="Program_Code_FK" HeaderText="Program_Code_FK" SortExpression="Program_Code_FK" />
            <asp:BoundField DataField="ID_FK" HeaderText="ID_FK" SortExpression="ID_FK" />
            <asp:BoundField DataField="QuizId" HeaderText="QuizId" SortExpression="QuizId" />
        </Columns>
    </asp:GridView>
   
</asp:Content>
