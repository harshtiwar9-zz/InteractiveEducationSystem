<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd/Professor/ProfessorMaster.Master" AutoEventWireup="true" CodeBehind="ProfessorCourses.aspx.cs" Inherits="InteractiveEducationSystem.FrontEnd.Professor.ProfessorCourses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="brand-logo center-align">
        <h2>Course List</h2>
    </div>
    <div class="row container">
        <div class="col l8 s12 m12 offset-l4">
            <div class="row card-panel hoverable white-text">

                <asp:GridView ID="ProfCourseList" runat="server" CssClass="collection" AutoGenerateColumns="False" DataKeyNames="Course_Code" DataSourceID="ProfCourseListData">
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="Course_Code" ControlStyle-CssClass="collection-item" DataNavigateUrlFormatString="CourseQuiz.aspx?course={0}" DataTextField="Course_name" />
                    </Columns>
                </asp:GridView>

            </div>

            <asp:SqlDataSource ID="ProfCourseListData" runat="server" ConnectionString="<%$ ConnectionStrings:IES %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Course_name], [Course_Code] FROM [Course]"></asp:SqlDataSource>

        </div>
    </div>
    <div class="row container">
        <div class="col l8 s12 m12 offset-l4">
            

                <asp:GridView ID="ProfCourses" runat="server" CssClass="collection" AutoGenerateColumns="False" DataKeyNames="Student_quiz_PK" DataSourceID="IES">
                    <Columns>
                        <asp:BoundField DataField="Comment" HeaderText="Comment" SortExpression="Comment" />
                        <asp:BoundField DataField="Quiz_id_FK" HeaderText="Quiz_id_FK" SortExpression="Quiz_id_FK" />
                        <asp:BoundField DataField="Answer" HeaderText="Answer" SortExpression="Answer" />
                        <asp:BoundField DataField="Grade" HeaderText="Grade" SortExpression="Grade" />
                        <asp:BoundField DataField="Student_quiz_PK" HeaderText="Student_quiz_PK" SortExpression="Student_quiz_PK" ReadOnly="True" />
                    </Columns>
                </asp:GridView>

            </div>

    </div>

    <div class="brand-logo center-align">
        <h2>Grade Answers   </h2>
    </div>
    <%-- --%>
    <div class="row container">
        <div class="col l8 s14 m12 offset-l4">
            <div class="row card-panel hoverable white-text">
                <div class="collection">
                    <%-- <asp:Label ID="Quiz_idlbl" class="brand-logo center-align" runat="server" Text="Enter Quiz_id to search" ForeColor="#26a69a" ></asp:Label>        
                   <asp:TextBox ID="QuizIdTxt" runat="server" TextMode="Number"></asp:TextBox><br/>
                   <asp:Label ID="Student_idlbl" class="brand-logo center-align" runat="server" Text="   Enter Student_id to search with" ForeColor="#26a69a"></asp:Label>
                   <asp:TextBox ID="stuIdTxt" runat="server" TextMode="Number"></asp:TextBox><br/>--%>
                    <asp:Button ID="stu_answer" class="collection-item" runat="server" Text="Submitted Answers" OnClick="Stu_answer_Click" ForeColor="White" BackColor="#26a69a" autopostback="false" />
                    <br />
                    <asp:Label ID="datafound" runat="server" Text=" Following DATA is retreived !!" ForeColor="Green"></asp:Label>
                    <asp:Label ID="noDatalbl" runat="server" Text=" No data found !!" ForeColor="Red"></asp:Label>

                    <asp:GridView ID="answersList" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" AllowPaging="True" AllowSorting="True" DataSourceID="IES" DataKeyNames="Student_quiz_PK">
                        <Columns>

                            <asp:BoundField DataField="Student_quiz_PK" HeaderText="SQ ID" SortExpression="Student_quiz_PK" ReadOnly="True" />
                            <asp:BoundField DataField="Quiz_id_FK" HeaderText="Quiz ID" SortExpression="Quiz_id_FK" ReadOnly="True" />
                            <asp:BoundField DataField="Answer" HeaderText="Answers" SortExpression="Answer" ReadOnly="True" />
                            <asp:BoundField DataField="Grade" HeaderText="Grade" SortExpression="Grade" />
                            <asp:BoundField DataField="Comment" HeaderText="Comments/Feedback" SortExpression="Comment" />
                            <asp:CommandField ShowEditButton="True" />

                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#333333" />
                        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="White" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#487575" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#275353" />
                    </asp:GridView>



                    <asp:SqlDataSource ID="IES" runat="server" ConnectionString="<%$ ConnectionStrings:IES %>" DeleteCommand="DELETE FROM [Student_quiz] WHERE [Student_quiz_PK] = @Student_quiz_PK" InsertCommand="INSERT INTO [Student_quiz] ([Comment], [Quiz_id_FK], [Answer], [Grade], [Student_quiz_PK]) VALUES (@Comment, @Quiz_id_FK, @Answer, @Grade, @Student_quiz_PK)" SelectCommand="SELECT [Comment], [Quiz_id_FK], [Answer], [Grade], [Student_quiz_PK] FROM [Student_quiz]" UpdateCommand="UPDATE [Student_quiz] SET [Comment] = @Comment, [Grade] = @Grade WHERE [Student_quiz_PK] = @Student_quiz_PK">
                        <DeleteParameters>
                            <asp:Parameter Name="Student_quiz_PK" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Comment" Type="String" />
                            <asp:Parameter Name="Quiz_id_FK" Type="Int32" />
                            <asp:Parameter Name="Answer" Type="String" />
                            <asp:Parameter Name="Grade" Type="String" />
                            <asp:Parameter Name="Student_quiz_PK" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Comment" Type="String" />
                            <asp:Parameter Name="Quiz_id_FK" Type="Int32" />
                            <asp:Parameter Name="Answer" Type="String" />
                            <asp:Parameter Name="Grade" Type="String" />
                            <asp:Parameter Name="Student_quiz_PK" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>



                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IES %>" SelectCommand="SELECT [Comment], [Quiz_id_FK], [Answer], [Grade], [Student_quiz_PK] FROM [Student_quiz]"></asp:SqlDataSource>



                </div>

            </div>
        </div>
    </div>
   
</asp:Content>
