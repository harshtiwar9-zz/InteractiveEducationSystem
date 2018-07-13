<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd/Professor/ProfessorMaster.Master" AutoEventWireup="true" CodeBehind="AddQuiz.aspx.cs" Inherits="InteractiveEducationSystem.FrontEnd.Professor.AddQuiz" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblcourse" runat="server" Text="Course"></asp:Label>
    <asp:TextBox ID="txtcourse" runat="server"></asp:TextBox>
    <asp:Label ID="lblchapter" runat="server" Text="Chapter"></asp:Label>
    <asp:TextBox ID="txtchapter" runat="server"></asp:TextBox>
    <asp:Button ID="btnaddquiz" runat="server" Text="Add Quiz" OnClick="btnaddquiz_Click" />
    <asp:Label ID="lblmsg" runat="server" Text="Quiz Added Successfully" Visible="false"></asp:Label>

    <asp:Button ID="btnaddquestion" runat="server" Text="Add question" Visible="false" OnClick="btnaddquestion_Click" />

<div>
    <asp:Label ID="lblquestion" runat="server" Text="Question" Visible="false"></asp:Label>
    <asp:TextBox ID="txtquestion" runat="server" Visible="false"></asp:TextBox>
    <asp:Button ID="btnsubmit" runat="server" Text="Submit Question" Visible="false" OnClick="btnsubmit_Click" />
</div>
    <asp:Label ID="lblmsg2" runat="server" Text="Question Added Successfully" Visible="false"></asp:Label>
</asp:Content>
