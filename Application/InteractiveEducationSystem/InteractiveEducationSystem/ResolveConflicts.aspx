<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ResolveConflicts.aspx.cs" Inherits="InteractiveEducationSystem.ResolveConflicts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:TextBox ID="issueDesc" runat="server" Height="137px" TextMode="MultiLine" Width="321px"></asp:TextBox>

    <br />

    <asp:Button ID="btnSubmit" runat="server" Text="Report Issue" OnClick="btnSubmit_Click" />
    <asp:Label ID="errorShow" runat="server"></asp:Label>
</asp:Content>
