    <%@ Page Title="Administrator Home" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="InteractiveEducationSystem.FrontEnd.Administrator.AdminHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <h1> Administrator Panel</h1>
    <asp:Button ID="assignRole" CssClass="btn-small" runat="server" Text="Register Users" Width="100%" OnClick="rolePage" />
</asp:Content>
