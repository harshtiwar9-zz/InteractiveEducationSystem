<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd/Professor/ProfessorMaster.Master" AutoEventWireup="true" CodeBehind="ProfessorCourses.aspx.cs" Inherits="InteractiveEducationSystem.FrontEnd.Professor.ProfessorCourses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="brand-logo center-align">
        <h1>Course List</h1>
    </div>
    <div class="row container">
        <div class="col l8 s12 m12 offset-l4">
            <div class="row card-panel teal-text">

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="Course" HeaderText="Course Name" SortExpression="Course" Visible="True" />
                    </Columns>
                </asp:GridView>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Interactivestring %>" SelectCommand="SELECT [Course] FROM [Quiz]"></asp:SqlDataSource>

                    
                    <asp:Button ForeColor="Red" ID="quiz_man" runat="server" Text="Quiz Management" OnClick="quiz_man_Click"/>


                
            </div>
        </div>
    </div>

</asp:Content>
