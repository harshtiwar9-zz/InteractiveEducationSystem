<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="CoordinatorData.aspx.cs" Inherits="InteractiveEducationSystem.FrontEnd.Administrator.CoordinatorData" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="User_id_PK" HeaderText="User_id_PK" SortExpression="User_id_PK" />
            <asp:BoundField DataField="First_name" HeaderText="First_name" SortExpression="First_name" />
            <asp:BoundField DataField="Last_name" HeaderText="Last_name" SortExpression="Last_name" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
            <asp:BoundField DataField="ID_FK" HeaderText="ID_FK" SortExpression="ID_FK" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IES %>" SelectCommand="SELECT * FROM [Course_coordinator]"></asp:SqlDataSource>
</asp:Content>
