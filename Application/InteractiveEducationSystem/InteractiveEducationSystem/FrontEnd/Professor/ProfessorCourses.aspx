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



                </div>
            </div>
            
        </div>
        
    <asp:Label ID="Quiz_idlbl" runat="server" Text="Enter Quiz_id to search"></asp:Label>
    <asp:TextBox ID="QuizIdTxt" runat="server" TextMode="Number"></asp:TextBox><br/>
    <asp:Label ID="Student_idlbl" runat="server" Text="Enter Student_id to search with"></asp:Label>
    <asp:TextBox ID="stuIdTxt" runat="server" TextMode="Number"></asp:TextBox>
    <br/>
    <asp:Button ID="stu_answer" runat="server" Text="Submitted Answers" OnClick="stu_answer_Click"/>      <br/>
    <asp:Label ID="datafound" runat="server" Text=" Following DATA is retreived !!" ForeColor="Green"></asp:Label>    

         <asp:GridView ID="Grid_answers" runat="server" AutoGenerateColumns="False"  AllowPaging="True" AllowSorting="True" >
             <Columns>
                 <asp:BoundField DataField="User_id_FK" HeaderText="User_id_FK" SortExpression="User_id_FK" />
                 <asp:BoundField DataField="Quiz_id_FK" HeaderText="Quiz_id_FK" SortExpression="Quiz_id_FK" />
                 <asp:BoundField DataField="Answer" HeaderText="Answer" SortExpression="Answer" />
             </Columns>
        

    </asp:GridView>
        
        <asp:Label ID="no_datalbl" runat="server" Text=" No data found !!" ForeColor="Red"></asp:Label>
        
    </div>




</asp:Content>
