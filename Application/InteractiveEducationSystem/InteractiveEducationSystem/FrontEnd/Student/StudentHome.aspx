<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd/Student/StudentMaster.Master" AutoEventWireup="true" CodeBehind="StudentHome.aspx.cs" Inherits="InteractiveEducationSystem.FrontEnd.StudentHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Student Home Page
    <asp:Button ID="BtnTakeQuiz" CssClass="btn-small" runat="server" Text="Take Quiz" Width="100%" OnClick="BtnTakeQuiz_Click" />
    <div runat="server" id="quizDiv">
        <asp:Label ID="lblInstruction" runat="server"></asp:Label>
        <asp:Label ID="lblQuestion" CssClass="active" runat="server" ></asp:Label>
        <asp:TextBox ID="txtResponse" CssClass="input-field" runat="server" Width="235px"></asp:TextBox>
        
        <asp:Button ID="btnSave" runat="server" Text="Submit" CssClass="btn-floating" Width="15%" OnClick="btnSave_Click"/>
    </div>
    <asp:Label ID="lblSuccess" CssClass="centered" runat="server"  ForeColor="#0066FF" Height="20"></asp:Label>
    <asp:Label ID="demolabel" runat="server" Text="Label"></asp:Label>

</asp:Content>
