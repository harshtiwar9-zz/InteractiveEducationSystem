<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd/Professor/ProfessorMaster.Master" AutoEventWireup="true" CodeBehind="CourseQuiz.aspx.cs" Inherits="InteractiveEducationSystem.FrontEnd.Professor.CourseQuiz" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="brand-logo center-align">
        <h1>Course 1</h1>
    </div>
    <div class="row ">
        <div class="col l5 s12 m12 offset-l3">
            <div class="row white-text">

                <ul class="collapsible collection">
                    <li>
                        <a href="#!" class="collection-item collapsible-header">
                            Add Quiz
                        </a>
                    </li>
                    <li>
                        <a href="#!" class="collection-item collapsible-header">
                            Edit Quiz
                        </a>
                        <div class="collapsible-body">

                            <select>
                                <option value="" disabled selected>Select Quiz to Edit</option>
                                <option value="1">Option 1</option>
                                <option value="2">Option 2</option>
                                <option value="3">Option 3</option>
                                <option value="1">Option 1</option>
                                <option value="2">Option 2</option>
                                <option value="3">Option 3</option>
                            </select>
                            <label>Materialize Select</label>

                        </div>
                    </li>
                    <li>
                        <a href="#!" class="collection-item collapsible-header">
                            Intiate Quiz
                        </a>
                    </li>
                </ul>

            </div>
        </div>
    </div>

</asp:Content>
