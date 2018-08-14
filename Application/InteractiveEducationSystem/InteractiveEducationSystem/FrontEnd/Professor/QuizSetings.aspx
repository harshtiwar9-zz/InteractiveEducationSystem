<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="QuizSetings.aspx.cs" Inherits="InteractiveEducationSystem.FrontEnd.Professor.QuizSetings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="brand-logo center-align">
        <h2>Settings</h2>
    </div>           
    <div class="row container">
       <div class="col l8 s14 m12 offset-l4">
           <div class="row card-panel hoverable white-text">
               <div class="collection">
                   <asp:ValidationSummary ID="ValidationSummary1"   ShowMessageBox ="true" 
                    runat="server"  />  
                   <asp:label runat="server" text="Enter the Default Time for Quiz" ForeColor="Black"></asp:label>
                   <asp:textbox runat="server" ForeColor="Black" ID="quizTime_tb" ViewStateMode="Disabled"></asp:textbox>
                   <asp:RequiredFieldValidator runat="server" id="requiredtime" ControlToValidate="quizTime_tb" ForeColor="white" ErrorMessage="Please Enter the Quiz Time field."></asp:RequiredFieldValidator>
                   <asp:CompareValidator Operator="DataTypeCheck" Type="Integer"  runat="server" ControlToValidate="quizTime_tb" ForeColor="white" ErrorMessage="Enter numeric values only in Quiz Time field !" Display="Dynamic"></asp:CompareValidator>
                   
                   <br/>
                   <asp:Label ID="Label2" runat="server" Text="Maximum attempts allowed to students" ForeColor="Black"></asp:Label>
                   

                   <br />
                   <asp:textbox runat="server" ForeColor="Black" ID="quizAttempts_tb"></asp:textbox>
                   <asp:RequiredFieldValidator runat="server" id="requiredattempt" ControlToValidate="quizAttempts_tb" ForeColor="White" ErrorMessage="Please Enter the Quiz Attempt field."></asp:RequiredFieldValidator>
                   <asp:CompareValidator Operator="DataTypeCheck" Type="Integer" runat="server" ControlToValidate="quizAttempts_tb"  ErrorMessage="Enter numeric values only in Quiz Attempt field !" Display="Dynamic"></asp:CompareValidator>
                   

                   <br/><br/>
                   <asp:button runat="server" text="Apply Changes" Height="33px" ID="applyChange_button" OnClick="ApplyChange_button_Click" />

                   </div>
               
               </div> 
           </div> 
       </div>  

</asp:Content>
