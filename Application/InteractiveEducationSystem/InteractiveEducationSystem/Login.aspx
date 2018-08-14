<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="InteractiveEducationSystem.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <asp:Label ID="Label1" runat="server" Text="User ID"></asp:Label>
    <asp:TextBox ID="Loginbox" runat="server"></asp:TextBox>
    <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
    <asp:TextBox ID="Passwordbox"  runat="server" TextMode="Password"></asp:TextBox>
    <asp:Button ID="loginbutton" runat="server" Text="Login" class="waves-effect waves-light btn" OnClick="loginbutton_Click"/>
</asp:Content>
