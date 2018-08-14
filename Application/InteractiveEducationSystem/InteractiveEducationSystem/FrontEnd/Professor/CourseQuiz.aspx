<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd/Professor/ProfessorMaster.Master" AutoEventWireup="true" CodeBehind="CourseQuiz.aspx.cs" Inherits="InteractiveEducationSystem.FrontEnd.Professor.CourseQuiz" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="brand-logo center-align">
        <h1>Quiz Management</h1>
    </div>
    <div class="row">
        <div class="col l5 s12 m12 offset-l3">
            <ul>
                <li>
                    <a id="add_Quiz" href="Quiz/AddQuiz.aspx?course=<%=Request.QueryString["course"]%>" class="collection-item">Add Quiz</a>
                </li>
            </ul>
        </div>
    </div>

    <div class="row">
        <div class="col l5 s12 m12 offset-l3">
            <ul>
                <li>
                    <a class="waves-effect waves-light modal-trigger collection-item" href="#edit-quiz">Edit Quiz</a>

                    <!-- Modal Structure -->
                    <div id="edit-quiz" class="modal" style="height:800px;">
                        <div class="modal-content">
                            <h1>
                                Edit Quiz
                                <div class="divider" />
                            </h1>
                            <p>

                                <div class="input-field col s12">

                                    <asp:DropDownList DataSourceID="QuizChapter" DataTextField="QuizChapter" DataValueField="Quiz_id_pk" ID="quizchapterselection" AppendDataBoundItems="true" runat="server">
                                        <asp:ListItem Selected="True">Select Chapter</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="QuizChapter" runat="server" ConnectionString="<%$ ConnectionStrings:IES %>" SelectCommand="SELECT Quiz_id_PK, Course_Code, Chapter_no, Quiz_no, Chapter_no + '(' + Quiz_no + ')' AS QuizChapter FROM Quiz WHERE (Course_Code = @Course_Code)">
                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="Course_Code" QueryStringField="course" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                </div>                            

                            </p>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="initiateQuizbtn" runat="server" OnClick="editQuiz_ServerClick" CssClass="waves-effect waves-green btn-flat" Text="Proceed" OnClientClick="M.toast('Quiz Initiated!!',3000)" />
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    
    <div class="row ">
        <div class="col l5 s12 m12 offset-l3">
            <ul>
                <li>
                    <a class="waves-effect waves-light modal-trigger collection-item" href="#intiate-quiz">Initiate Quiz</a>

                    <!-- Modal Structure -->
                    <div id="intiate-quiz" class="modal" style="height:800px;">
                        <div class="modal-content">
                            <h1>
                                Initiate Quiz
                                <div class="divider" />
                            </h1>
                            <p>

                                <div class="input-field col s12">

                                    <asp:DropDownList DataSourceID="QuizChapter" DataTextField="QuizChapter" DataValueField="Quiz_id_pk" ID="initiatequizselection" AppendDataBoundItems="true" runat="server">
                                        <asp:ListItem Selected="True">Select Chapter</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IES %>" SelectCommand="SELECT Quiz_id_PK, Course_Code, Chapter_no, Quiz_no, Chapter_no + '(' + Quiz_no + ')' AS QuizChapter FROM Quiz WHERE (Course_Code = @Course_Code)">
                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="Course_Code" QueryStringField="course" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                </div>
                                
                                <div class="teal-text" id="initiateQuizMSG" runat="server">

                                </div>
                                
                                <div class="teal-text" id="readerPrint" runat="server">

                                </div>

                                <div class="teal-text" id="dataList" runat="server">

                                </div>

                            </p>
                        </div>
                        <div class="modal-footer">
                            <a href="#!" runat="server" onserverclick="initiateQuiz_ServerClick" class="waves-effect waves-green btn-flat">Proceed</a>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>

    <asp:SqlDataSource ID="studentIDdata" runat="server" ConnectionString="<%$ ConnectionStrings:IES %>" SelectCommand="SELECT [ID_FK] FROM [Student]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="studentIDdata2" runat="server" ConnectionString="<%$ ConnectionStrings:IES %>" SelectCommand="SELECT ID_FK FROM Student WHERE ID_FK NOT IN(SELECT Student_id_FK FROM Student_quiz WHERE (Quiz_id_FK &lt;&gt; @QuizId))">
        <SelectParameters>
            <asp:ControlParameter ControlID="initiatequizselection" Name="QuizId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="quizQuestionID" runat="server" ConnectionString="<%$ ConnectionStrings:IES %>" SelectCommand="SELECT [Quiz_question_id] FROM [Quiz_question] WHERE ([Quiz_id] = @Quiz_id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="initiatequizselection" Name="Quiz_id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
