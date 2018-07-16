<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd/Professor/ProfessorMaster.Master" AutoEventWireup="true" CodeBehind="ProfessorCourses.aspx.cs" Inherits="InteractiveEducationSystem.FrontEnd.Professor.ProfessorCourses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >

    <div class="brand-logo center-align">
        <h2>Course List</h2>
    </div>
    <div class="row container">
        <div class="col l8 s12 m12 offset-l4">
            <div class="row card-panel hoverable white-text">
                <div class="collection">
                    
                    <a href="CourseQuiz.aspx?Course={0}" class="collection-item">Course 1</a>
                    <a href="#!" class="collection-item active">Course 2</a>
                    <a href="#!" class="collection-item">Course 3</a>
                    <a href="#!" class="collection-item">Course 4</a>
                    
                </div>
            </div>
            
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
                   <asp:Button ID="stu_answer" class="collection-item" runat="server" Text="Submitted Answers" OnClick="stu_answer_Click" ForeColor="White" BackColor="#26a69a" autopostback="false"/>      <br/>
                   <asp:Label ID="datafound" runat="server" Text=" Following DATA is retreived !!" ForeColor="Green"></asp:Label>    
                   <asp:Label ID="noDatalbl" runat="server" Text=" No data found !!" ForeColor="Red"></asp:Label>

                   <asp:GridView ID="answersList" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="Student_quiz_PK" DataSourceID="IES" GridLines="Horizontal">
                       <Columns>
                           <asp:BoundField DataField="Student_quiz_PK" ReadOnly="true" HeaderText="SQ ID" SortExpression="Student_quiz_PK" />
                           <asp:BoundField DataField="Quiz_id_FK" ReadOnly="true" HeaderText="Quiz ID" SortExpression="Quiz_id_FK" />
                           <asp:BoundField DataField="Answer" ReadOnly="true" HeaderText="Submitted Answers" SortExpression="Answer" />
                           <asp:BoundField DataField="Grade" HeaderText="Grade" SortExpression="Grade" />
                           
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

                   <asp:SqlDataSource ID="IES" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:IES %>" DeleteCommand="DELETE FROM [Student_quiz] WHERE [Student_quiz_PK] = @original_Student_quiz_PK AND [Quiz_id_FK] = @original_Quiz_id_FK AND [Answer] = @original_Answer AND [Grade] = @original_Grade" InsertCommand="INSERT INTO [Student_quiz] ([Quiz_id_FK], [Answer], [Grade], [Student_quiz_PK]) VALUES (@Quiz_id_FK, @Answer, @Grade, @Student_quiz_PK)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Quiz_id_FK], [Answer], [Grade], [Student_quiz_PK] FROM [Student_quiz]" UpdateCommand="UPDATE [Student_quiz] SET [Grade] = @Grade WHERE [Student_quiz_PK] = @original_Student_quiz_PK">
                       <DeleteParameters>
                           <asp:Parameter Name="original_Student_quiz_PK" Type="Int32" />
                           <asp:Parameter Name="original_Quiz_id_FK" Type="Int32" />
                           <asp:Parameter Name="original_Answer" Type="String" />
                           <asp:Parameter Name="original_Grade" Type="String" />
                       </DeleteParameters>
                       <InsertParameters>
                           <asp:Parameter Name="Quiz_id_FK" Type="Int32" />
                           <asp:Parameter Name="Answer" Type="String" />
                           <asp:Parameter Name="Grade" Type="String" />
                           <asp:Parameter Name="Student_quiz_PK" Type="Int32" />
                       </InsertParameters>
                       <UpdateParameters>
                           <asp:Parameter Name="Grade" Type="String" />
                           <asp:Parameter Name="original_Student_quiz_PK" Type="Int32" />
                       </UpdateParameters>
                   </asp:SqlDataSource>

                   </div>
               
               </div> 
           </div> 
       </div> 
       <%-- <asp:Label ID="Quiz_idlbl" runat="server" Text="Enter Quiz_id to search"></asp:Label>        
                   <asp:TextBox ID="QuizIdTxt" runat="server" TextMode="Number"></asp:TextBox><br/>
                   <asp:Label ID="Student_idlbl" runat="server" Text="Enter Student_id to search with"></asp:Label>
                   <asp:TextBox ID="stuIdTxt" runat="server" TextMode="Number"></asp:TextBox><br/>
                   <asp:Button ID="stu_answer" runat="server" Text="Submitted Answers" OnClick="stu_answer_Click"/>      <br/>
                   <asp:Label ID="datafound" runat="server" Text=" Following DATA is retreived !!" ForeColor="Green"></asp:Label>    
                   <asp:Label ID="noDatalbl" runat="server" Text=" No data found !!" ForeColor="Red"></asp:Label>
                   <asp:GridView ID="Grid_answers" runat="server" AutoGenerateColumns="False"  AllowPaging="True" AllowSorting="True" OnRowUpdating="grades_update">
                       <Columns>
                           <asp:BoundField DataField="Student_quiz_PK" HeaderText="Sq ID" SortExpression="Student_quiz_PK" /> 
                           <asp:BoundField DataField="User_id_FK" HeaderText="User_id_FK" SortExpression="User_id_FK" />
                           <asp:BoundField DataField="Quiz_id_FK" HeaderText="Quiz_id_FK" SortExpression="Quiz_id_FK" />
                           <asp:BoundField DataField="Answer" HeaderText="Answer" SortExpression="Answer" />
                           <asp:BoundField DataField="Grade" HeaderText="Grades" SortExpression="Grade" />
                            
                       </Columns>

                   </asp:GridView>--%>
                   




</asp:Content>
