<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AssignRole.aspx.cs" Inherits="InteractiveEducationSystem.AssignRole1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Ragister user to system</h1>
    <div>
        <asp:Button ID="stuRoleb" CssClass="btn-small" runat="server" Text="Student" Width="100%" OnClick="StuRole" />
        </div>
    <div>
        <asp:Button ID="ProfessorRole" CssClass="btn-small" runat="server" Text="Professor" Width="100%" OnClick="ProfessorRole_Click"  />
        </div>
    <div>
        <asp:Button ID="CourseCordinatorRole" CssClass="btn-small" runat="server" Text="Course-Cordinator " Width="100%" OnClick="CourseCordinatorRole_Click"  />
        </div>

</asp:Content>
