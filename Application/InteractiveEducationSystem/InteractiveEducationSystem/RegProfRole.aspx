<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="RegProfRole.aspx.cs" Inherits="InteractiveEducationSystem.RegProfRole" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IES %>" SelectCommand="SELECT * FROM [Professor] WHERE ([ID_FK] IS NULL)"></asp:SqlDataSource>
<asp:GridView ID="GridView1" runat="server" EmptyDataText="No Unregistered User" AutoGenerateSelectButton="True" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="RegisterUser"></asp:GridView>
</asp:Content>