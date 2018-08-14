<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="IConflict.aspx.cs" Inherits="InteractiveEducationSystem.FrontEnd.Administrator.IConflict" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Issue_Id" DataSourceID="getIssue" OnSelectedIndexChanged="IssueDelete">
        <Columns>
            <asp:BoundField DataField="Issue_Id" HeaderText="Issue_Id" InsertVisible="False" ReadOnly="True" SortExpression="Issue_Id" />
            <asp:BoundField DataField="Issue" HeaderText="Issue" SortExpression="Issue" />
            <asp:BoundField DataField="ID_FK" HeaderText="ID_FK" SortExpression="ID_FK" />
            <asp:CommandField DeleteText="Issue Resolved" ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="getIssue" runat="server" ConnectionString="<%$ ConnectionStrings:IES %>" deletecommand="Delete from Conflicts where Issue_Id = @Issue_Id" SelectCommand="SELECT * FROM [Conflicts]"></asp:SqlDataSource>
</asp:Content>
