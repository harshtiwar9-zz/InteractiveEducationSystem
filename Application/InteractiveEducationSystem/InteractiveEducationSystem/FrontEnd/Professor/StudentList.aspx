<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd/Professor/ProfessorMaster.Master" AutoEventWireup="true" CodeBehind="StudentList.aspx.cs" Inherits="InteractiveEducationSystem.FrontEnd.Professor.StudentList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Student List" Font-Bold="True" Font-Underline="True"></asp:Label>

    <div class="row container">

    <div>Please Select Course :
        <asp:DropDownList ID="CourseList" runat="server"></asp:DropDownList>
    </div>
          <asp:Button ID="Btnsubmit" runat="server" Text="Submit" CssClass="btn-floating" Width="15%" OnClick="BtnSave_Click"/>
    </div>
    <div>
        <asp:GridView ID="GridView1" runat="server"></asp:GridView>
    </div>
</asp:Content>
