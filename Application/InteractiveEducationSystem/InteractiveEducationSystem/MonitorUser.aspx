<%@ Page Title="Register and Assign roles to new users" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="MonitorUser.aspx.cs" Inherits="InteractiveEducationSystem.AssignRole" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            -webkit-box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 3px 1px -2px rgba(0, 0, 0, 0.12), 0 1px 5px 0 rgba(0, 0, 0, 0.2);
            box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 3px 1px -2px rgba(0, 0, 0, 0.12), 0 1px 5px 0 rgba(0, 0, 0, 0.2);
            font-size: 14px;
            outline-width: 0;
            outline-style: none;
            outline-color: invert;
            display: inline-block;
            color: #fff;
            position: relative;
            overflow: hidden;
            z-index: 1;
            height: 40px;
            line-height: 40px;
            border-radius: 50%;
            -webkit-transition: background-color .3s;
            transition: background-color .3s;
            cursor: pointer;
            vertical-align: middle;
            padding: 0;
            background-color: #26a69a;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


          <asp:Button ID="Student" runat="server" Text="Student" CssClass="btn-floating" Width="15%" OnClick="Student_Click" />
          <asp:Button ID="Professor" runat="server" Text="Professor" CssClass="auto-style1" Width="15%" OnClick="Professor_Click" />
          <asp:Button ID="Course_Coordinator" runat="server" Text="Course-Coordinator" CssClass="auto-style1" Width="15%"  OnClick="Coordinator_Click" />

    </asp:Content>
