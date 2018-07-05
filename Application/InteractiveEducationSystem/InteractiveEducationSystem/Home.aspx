<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="InteractiveEducationSystem.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Home Page
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/FrontEnd/Student/StudentHome.aspx">Student</asp:HyperLink>
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/FrontEnd/Professor/ProfessorHome.aspx">Professor Home</asp:HyperLink>
</asp:Content>
