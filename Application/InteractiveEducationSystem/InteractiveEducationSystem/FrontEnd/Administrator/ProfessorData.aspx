<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ProfessorData.aspx.cs" Inherits="InteractiveEducationSystem.FrontEnd.Administrator.ProfessorData" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Prof_Id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="Prof_Id" HeaderText="Prof_Id" InsertVisible="False" ReadOnly="True" SortExpression="Prof_Id" />
            <asp:BoundField DataField="First_name" HeaderText="First_name" SortExpression="First_name" />
            <asp:BoundField DataField="Last_name" HeaderText="Last_name" SortExpression="Last_name" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
            <asp:BoundField DataField="ID_FK" HeaderText="ID_FK" SortExpression="ID_FK" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IES %>" SelectCommand="SELECT * FROM [Professor]"></asp:SqlDataSource>
</asp:Content>
