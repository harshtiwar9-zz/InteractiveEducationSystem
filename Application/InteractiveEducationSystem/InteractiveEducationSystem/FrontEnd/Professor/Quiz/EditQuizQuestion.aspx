<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd/Professor/ProfessorMaster.Master" AutoEventWireup="true" CodeBehind="EditQuizQuestion.aspx.cs" Inherits="InteractiveEducationSystem.FrontEnd.Professor.Quiz.EditQuizQuestion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="brand-logo center-align">
        <h1>Edit Quiz Questions</h1>
    </div>
    <div class="row">
        <div class="col l5 s12 m12 offset-l3">
            <asp:GridView ID="quizQuestions" runat="server" AutoGenerateColumns="False" DataKeyNames="Quiz_question_id" DataSourceID="QuizQuestionsSource">
                <Columns>
                    <asp:BoundField DataField="Question" HeaderText="Question" SortExpression="Question" />
                    <asp:CommandField ShowEditButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="QuizQuestionsSource" runat="server" ConnectionString="<%$ ConnectionStrings:IES %>" SelectCommand="SELECT * FROM [Quiz_question] WHERE ([Quiz_id] = @Quiz_id)" UpdateCommand="UPDATE Quiz_question SET Question = @Question WHERE Quiz_question_id = @Quiz_question_id">
                <SelectParameters>
                    <asp:QueryStringParameter Name="Quiz_id" QueryStringField="quiz" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                        <asp:Parameter Name="Question" Type="String" />
                    </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>

</asp:Content>
