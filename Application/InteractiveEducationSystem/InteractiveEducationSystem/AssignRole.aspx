<%@ Page Title="Register and Assign roles to new users" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AssignRole.aspx.cs" Inherits="InteractiveEducationSystem.AssignRole" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <p>
      <label>
        <input runat="server" name="roleType" value="s" type="radio" />
        <span>Student</span>
      </label>
    </p>
    <p>
      <label>
        <input runat="server" name="roleType" value="p" type="radio" />
        <span>Professor</span>
      </label>
    </p>
    <p>
      <label>
        <input runat="server" name="roleType" value="c" type="radio" />
        <span>Course Co-Ordinator</span>
      </label>
    </p>
    <p>
      <label>
        <input runat="server" name="roleType" value="a" type="radio" />
        <span>Administrator</span>
      </label>
    </p>
    

</asp:Content>
