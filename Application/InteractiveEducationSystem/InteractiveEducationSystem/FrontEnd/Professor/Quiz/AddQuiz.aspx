<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd/Professor/ProfessorMaster.Master" AutoEventWireup="true" CodeBehind="~/FrontEnd/Professor/Quiz/AddQuiz.aspx.cs" Inherits="InteractiveEducationSystem.FrontEnd.Professor.AddQuiz" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="brand-logo center-align">
        <h1>Add Quiz</h1>
    </div>
    <div class="row ">
        <div class="col l4 s12 m12 offset-l3 input-field">
            <input id="chapter_no" runat="server" type="text" class="validate">
            <label for="chapter_no">Chapter No.</label>
        </div>
        <div class="col l4 s12 m12 offset-l3 input-field">
            <input id="quiz_no" runat="server" type="text" class="validate">
            <label for="quiz_no">Quiz No.</label>
        </div>
        <div class="col l3 s12 m12 offset-l3 input-field center">
            <asp:Button runat="server" CssClass="btn waves-effect waves-light" ID="addQuiz_btn" Text="Add Quiz" OnClick="addQuiz_btn_Click"></asp:Button>
            <label class="red-text hoverable card" runat="server" id="msg" />
        </div>
        <div class="col l3 s12 m12 offset-l3 hide-on-small-only">
            <ul class="section table-of-contents">
                <li>
                    <asp:GridView ID="AddQuestions" runat="server" AutoGenerateColumns="False" DataKeyNames="Quiz_id_PK" DataSourceID="getQuizid">
                        <Columns>
                            <asp:HyperLinkField DataNavigateUrlFields="Quiz_id_PK" DataNavigateUrlFormatString="~/FrontEnd/Professor/Quiz/AddQuizQuestions.aspx?quiz={0}" Text="Add Questions" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="getQuizid" runat="server" ConnectionString="<%$ ConnectionStrings:IES %>" SelectCommand="SELECT TOP 1 * FROM Quiz ORDER BY Quiz_id_pk DESC"></asp:SqlDataSource>
                </li>
            </ul>
        </div>
    </div>

</label>

</asp:Content>
