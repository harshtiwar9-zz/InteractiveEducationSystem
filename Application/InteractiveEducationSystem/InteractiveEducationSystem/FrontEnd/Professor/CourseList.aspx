<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd/Professor/ProfessorMaster.Master" AutoEventWireup="true" CodeBehind="CourseList.aspx.cs" Inherits="InteractiveEducationSystem.FrontEnd.Professor.CourseList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Course List
      <div class="row container">
       <div class="col l8 s14 m12 offset-l4">
           <div class="row card-panel hoverable white-text">
               <div class="collection">

                   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Course_Code" DataSourceID="SqlDataSource2" >
                       
                       <Columns>
                           <asp:BoundField DataField="Course_Code" HeaderText="Course_Code" ReadOnly="True" SortExpression="Course_Code" />
                           <asp:BoundField DataField="Course_name" HeaderText="Course_name" SortExpression="Course_name" />
                           <asp:BoundField DataField="Program_Code_FK" HeaderText="Program_Code_FK" SortExpression="Program_Code_FK" />
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
                   <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:IES %>" SelectCommand="SELECT * FROM [Course]"></asp:SqlDataSource>
                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IES %>" SelectCommand="SELECT * FROM [Course_list]"></asp:SqlDataSource>
</div>
               </div>
           </div>

    </div>

</asp:Content>
