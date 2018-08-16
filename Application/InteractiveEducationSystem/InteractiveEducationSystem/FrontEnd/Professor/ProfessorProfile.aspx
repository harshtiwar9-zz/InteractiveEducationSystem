<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd/Professor/ProfessorMaster.Master" AutoEventWireup="true" CodeBehind="ProfessorProfile.aspx.cs" Inherits="InteractiveEducationSystem.FrontEnd.Professor.ProfessorProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="brand-logo center-align">
        <h2>Professor Profile</h2>
        <br />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>


         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Prof_Id" DataSourceID="ProfProfile" AllowSorting="True">
             <Columns>
                 <asp:CommandField ShowEditButton="True" />
                 <asp:BoundField DataField="Prof_Id" HeaderText="Prof_Id" InsertVisible="False" ReadOnly="True" SortExpression="Prof_Id" />
                 <asp:BoundField DataField="First_name" HeaderText="First_name" SortExpression="First_name" />
                 <asp:BoundField DataField="Last_name" HeaderText="Last_name" SortExpression="Last_name" />
                 <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                 <asp:BoundField DataField="ID_FK" ReadOnly="true" HeaderText="ID_FK" SortExpression="ID_FK" />
             </Columns>
         </asp:GridView>

         <asp:SqlDataSource ID="ProfProfile" runat="server" ConnectionString="<%$ ConnectionStrings:IES %>" DeleteCommand="DELETE FROM [Professor] WHERE [Prof_Id] = @Prof_Id" InsertCommand="INSERT INTO [Professor] ([First_name], [Last_name], [Gender], [ID_FK]) VALUES (@First_name, @Last_name, @Gender, @ID_FK)" SelectCommand="SELECT [Prof_Id], [First_name], [Last_name], [Gender], [ID_FK] FROM [Professor] WHERE ([ID_FK] = @ID_FK)" UpdateCommand="UPDATE [Professor] SET [First_name] = @First_name, [Last_name] = @Last_name, [Gender] = @Gender WHERE [Prof_Id] = @Prof_Id">
             <DeleteParameters>
                 <asp:Parameter Name="Prof_Id" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="First_name" Type="String" />
                 <asp:Parameter Name="Last_name" Type="String" />
                 <asp:Parameter Name="Gender" Type="String" />
                 <asp:Parameter Name="ID_FK" Type="Int32" />
             </InsertParameters>
             <SelectParameters>
                 <asp:SessionParameter Name="ID_FK" SessionField="username" Type="Int32" />
             </SelectParameters>
             <UpdateParameters>
                 <asp:Parameter Name="First_name" Type="String" />
                 <asp:Parameter Name="Last_name" Type="String" />
                 <asp:Parameter Name="Gender" Type="String" />
                 <asp:Parameter Name="ID_FK" Type="Int32" />
                 <asp:Parameter Name="Prof_Id" Type="Int32" />
             </UpdateParameters>
         </asp:SqlDataSource>

    </div>
</asp:Content>
