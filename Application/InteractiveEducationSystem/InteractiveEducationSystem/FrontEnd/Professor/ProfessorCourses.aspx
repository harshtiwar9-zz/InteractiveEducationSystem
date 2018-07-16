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


                   <asp:GridView ID="answersList" runat="server" AutoGenerateColumns="False" DataKeyNames="SQ_ID" DataSourceID="IES" Height="324px" Width="293px" CellPadding="4" ForeColor="#333333" GridLines="None">
                       <AlternatingRowStyle BackColor="White" />
                   <Columns>
                       
                       <asp:BoundField DataField="SQ_ID" HeaderText="SQ_ID" ReadOnly="True" SortExpression="SQ_ID" />
                       <asp:BoundField DataField="Quiz_ID" HeaderText="Quiz_ID" SortExpression="Quiz_ID" ReadOnly="True" />
                       <asp:BoundField DataField="Answer" HeaderText="Answer" SortExpression="Answer" ReadOnly="True"/>
                       <asp:BoundField DataField="Grade" HeaderText="Grade" SortExpression="Grade" />
                       <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                   </Columns>
                       <EditRowStyle BackColor="#7C6F57" />
                       <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                       <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                       <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                       <RowStyle BackColor="#E3EAEB" />
                       <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                       <SortedAscendingCellStyle BackColor="#F8FAFA" />
                       <SortedAscendingHeaderStyle BackColor="#246B61" />
                       <SortedDescendingCellStyle BackColor="#D4DFE1" />
                       <SortedDescendingHeaderStyle BackColor="#15524A" />
               </asp:GridView>
               <asp:SqlDataSource ID="IES" runat="server" ConnectionString="<%$ ConnectionStrings:IES %>" DeleteCommand="DELETE FROM [Student_quiz] WHERE [Student_quiz_PK] = @Student_quiz_PK" InsertCommand="INSERT INTO [Student_quiz] ([Student_quiz_PK], [Grade], [Answer], [Quiz_id_FK], [User_id_FK]) VALUES (@Student_quiz_PK, @Grade, @Answer, @Quiz_id_FK, @User_id_FK)" SelectCommand="SELECT [Student_quiz_PK] as SQ_ID, [Quiz_id_FK] as Quiz_ID, [Answer], [Grade] FROM [Student_quiz]" UpdateCommand="UPDATE [Student_quiz] SET [Grade] = @Grade WHERE [Student_quiz_PK] = @Student_quiz_PK">
                   <DeleteParameters>
                       <asp:Parameter Name="Student_quiz_PK" Type="Int32" />
                   </DeleteParameters>
                   <InsertParameters>
                       <asp:Parameter Name="Student_quiz_PK" Type="Int32" />
                       <asp:Parameter Name="Grade" Type="String" />
                       <asp:Parameter Name="Answer" Type="String" />
                       <asp:Parameter Name="Quiz_id_FK" Type="Int32" />
                       <asp:Parameter Name="User_id_FK" Type="Int32" />
                   </InsertParameters>
                   <UpdateParameters>
                       <asp:Parameter Name="Grade" Type="String" />
                       <asp:Parameter Name="Answer" Type="String" />
                       <asp:Parameter Name="Quiz_id_FK" Type="Int32" />
                       <asp:Parameter Name="User_id_FK" Type="Int32" />
                       <asp:Parameter Name="Student_quiz_PK" Type="Int32" />
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
