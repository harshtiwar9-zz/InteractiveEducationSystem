<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd/Professor/ProfessorMaster.Master" AutoEventWireup="true" CodeBehind="AddQuizQuestions.aspx.cs" Inherits="InteractiveEducationSystem.FrontEnd.Professor.Quiz.AddQuizQuestions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="brand-logo center-align">
        <h1>Add Quiz Questions</h1>
    </div>
    <div class="row ">
        <div class="col l4 s12 m12 offset-l3 input-field">
            <input id="questions" runat="server" type="text" class="validate">
            <label for="questions">Questions</label>
        </div>

        <div class="col l3 s12 m12 offset-l3 input-field center">
            <asp:Button runat="server" CssClass="btn waves-effect waves-light" ID="addQues_btn" Text="Add Question" OnClick="addQues_btn_Click"></asp:Button>
            <label class="red-text hoverable card" runat="server" id="msg" />
        </div>
    </div>

    <div class="row">
            <div class="col l5 s12 m12 offset-l3 card red-text">
                <ul class="section table-of-contents">
                    <li>
                        <asp:GridView ID="ShowQuestions" CssClass="red-text" runat="server" AutoGenerateColumns="False" DataSourceID="getQuestions">
                            <Columns>
                                <asp:BoundField DataField="Question" HeaderText="Question" SortExpression="Question" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="getQuestions" runat="server" ConnectionString="<%$ ConnectionStrings:IES %>" SelectCommand="SELECT [Question] FROM [Quiz_question] WHERE ([Quiz_id] = @Quiz_id)">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="Quiz_id" QueryStringField="quiz" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </li>
                </ul>
            </div>
        </div>

</label>

</asp:Content>
