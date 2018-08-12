<%@ Page Title="Register and Assign roles to new users" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AssignRole.aspx.cs" Inherits="InteractiveEducationSystem.AssignRole" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:RadioButtonList ID="RadioButtonList1" runat="server">
        <asp:ListItem Value="s">Student</asp:ListItem>
        <asp:ListItem Value="p">Professor</asp:ListItem>
        <asp:ListItem Value="c">Course Co-ordinator</asp:ListItem>
        <asp:ListItem Value="a">Administrator</asp:ListItem>
    </asp:RadioButtonList>
</asp:Content>
