<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd/Professor/ProfessorMaster.Master" AutoEventWireup="true" CodeBehind="StudentList.aspx.cs" Inherits="InteractiveEducationSystem.FrontEnd.Professor.StudentList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Student List

    <div class="row container">

        <div class="input-field col l8 m4 s12 offset-l2">
            <select>
                <option value="" disabled selected>Choose your option</option>
                <option value="1">Course 1</option>
                <option value="2">Course 2</option>
                <option value="3">Course 3</option>
            </select>
            <label class="red-text">Select Course</label>
        </div>

        <div class="input-field col l8 m4 s12 offset-l2">
            <select>
                <option value="" disabled selected>Choose your option</option>
                <option value="1">Section 1</option>
                <option value="2">Section 2</option>
                <option value="3">Section 3</option>
            </select>
            <label class="red-text">Select Course Section</label>
        </div>

    </div>
    
</asp:Content>
