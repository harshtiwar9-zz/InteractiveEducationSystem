<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="CourseCoordinator.aspx.cs" Inherits="InteractiveEducationSystem.FrontEnd.Course_Coordinator.CourseCoordinator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <asp:Label ID="Label1" runat="server" Text="Course-Coordinator Access" Font-Bold="True" Font-Underline="True"></asp:Label>

    <div class="row container">

    <div> <h3>Please Select Quiz ID :</h3>

        <asp:DropDownList ID="CourseList" runat="server"></asp:DropDownList>
    </div>
          <asp:Button ID="Btnsubmit" runat="server" Text="Submit" CssClass="btn-floating" Width="15%" OnClick="BtnSave_Click"/>
    </div>
    <div>
        <asp:GridView ID="GridView1" runat="server"></asp:GridView>
    </div>

</asp:Content>
