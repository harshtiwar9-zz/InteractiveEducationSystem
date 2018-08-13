<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd/Professor/ProfessorMaster.Master" AutoEventWireup="true" CodeBehind="ProfessorProfile.aspx.cs" Inherits="InteractiveEducationSystem.FrontEnd.Professor.ProfessorProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .white-text {
            height: 170px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="brand-logo center-align">
        <h2>Professor Profile:</h2>
        <br />
        <br />
        <br />

        <asp:Panel ID="Panel1" runat="server" Height="214px">
            <asp:HiddenField ID="txtprofileid" runat="server"></asp:HiddenField>

            <label style="width: 100px; float: left;">
                First Name:</label>
            <div style="width: 100px; float: left; margin-top: -29px;">
                <asp:TextBox ID="txtfirstname" runat="server"></asp:TextBox>
            </div>
            <label style="width: 100px; float: left;">
                Last Name:</label>
            <div style="width: 100px; float: left; margin-top: -29px;">
                <asp:TextBox ID="txtlastname" runat="server"></asp:TextBox>
            </div>
            <label style="width: 100px; float: left;">
                Gender:</label>
            <div style="width: 100px; float: left; margin-top: -29px;">
                <asp:DropDownList ID="drpGender" runat="server">
                    <asp:ListItem Value="male">Male</asp:ListItem>
                    <asp:ListItem Value="female">Female</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div style="width: 100px; margin-left: 20px; float: left;">

                <asp:Button CssClass="collection-item" ID="Button1" runat="server" Text="Update" OnClick="UpdateProfile" />
            </div>
        </asp:Panel>
        <p>&nbsp;</p>
    </div>
    <%-- --%>
</asp:Content>
