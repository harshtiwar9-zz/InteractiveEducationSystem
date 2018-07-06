<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd/Professor/ProfessorMaster.Master" AutoEventWireup="true" CodeBehind="ProfessorCourses.aspx.cs" Inherits="InteractiveEducationSystem.FrontEnd.Professor.ProfessorCourses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="brand-logo center-align">
        <h1>Course List</h1>
    </div>
    <div class="row container">
        <div class="col l8 s12 m12 offset-l4">
            <div class="row card-panel hoverable white-text">
                <div class="collection">
                    
                    <a href="CourseQuiz.aspx?Course={0}" class="collection-item">Course 1</a>
                    <a href="#!" class="collection-item active">Course 2</a>
                    <a href="#!" class="collection-item">Course 3</a>
                    <a href="#!" class="collection-item">Course 4</a>

                    <asp:Button ID="stu_answer" runat="server" Text="Submitted Answers" OnClick="stu_answer_Click" />


                </div>
            </div>
        </div>
    </div>

</asp:Content>
