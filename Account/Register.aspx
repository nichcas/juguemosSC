<%@ Page Title="Register" Language="VB" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="false"
    CodeFile="Register.aspx.vb" Inherits="Account_Register" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

<div class="container">
    <div class="col-lg-12">
        <img src="../imagenes/bannerBolas1.fw.png" width="100%" />
        
    </div>
<div class=" col-lg-7 col-lg-offset-1">
    <h2>
        Crear cuenta nueva
    </h2>
    <p>
         &nbsp;&nbsp;&nbsp;&nbsp;Utilice el formulario a continuación para crear una cuenta.
    </p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;Las contraseñas deben de tener un mínimo de <%= Membership.MinRequiredPasswordLength %> caracteres.
    </p>
    <form class="form-horizontal">

    <asp:CreateUserWizard ID="RegisterUser" runat="server" EnableViewState="false">
        <LayoutTemplate>
            <asp:PlaceHolder ID="wizardStepPlaceholder" runat="server"></asp:PlaceHolder>
            <asp:PlaceHolder ID="navigationPlaceholder" runat="server"></asp:PlaceHolder>
        </LayoutTemplate>
        <WizardSteps>
            <asp:CreateUserWizardStep ID="RegisterUserWizardStep" runat="server">
                <ContentTemplate>
                    
                    <span class="failureNotification">
                        <asp:Literal ID="ErrorMessage" runat="server"></asp:Literal>
                    </span>
                    <asp:ValidationSummary ID="RegisterUserValidationSummary" runat="server" CssClass="failureNotification" 
                         ValidationGroup="RegisterUserValidationGroup"/>
                    <div class="accountInfo">

            <fieldset class="register">
                    <legend>Información de la Cuenta</legend>
    <div class="form-group">
      <asp:Label ID="lblUsuario" runat="server" AssociatedControlID="UserName" CssClass="col-lg-3 control-label">Usuario:</asp:Label>
      <div class="col-lg-9">
           <asp:TextBox ID="UserName" runat="server" CssClass="textEntry form-control"></asp:TextBox>
           <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" 
           CssClass="failureNotification" ErrorMessage="User Name is required." ToolTip="User Name is required." 
           ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
      </div>
    </div>

    <div class="form-group">
      <asp:Label ID="lblEmail" runat="server" AssociatedControlID="Email" CssClass="col-lg-3 control-label">Email:</asp:Label>
      <div class="col-lg-9">
           <asp:TextBox ID="Email" runat="server" CssClass="textEntry form-control"></asp:TextBox>
           <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" 
           CssClass="failureNotification" ErrorMessage="E-mail is required." ToolTip="E-mail is required." 
           ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
      </div>
    </div>

    <div class="form-group">
         <asp:Label ID="lblPassword" runat="server" AssociatedControlID="Password" CssClass="col-lg-3 control-label">Contraseña:</asp:Label>
         <div class="col-lg-9 clearfix">
              <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry form-control" TextMode="Password"></asp:TextBox>
              <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" 
              CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required." 
              ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
         </div>
    </div>
         
    <div class="form-group">
         <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-lg-3 control-label">Confirmar Contraseña:</asp:Label>
         <div class="col-lg-9 clearfix">
              <asp:TextBox ID="ConfirmPassword" runat="server" CssClass="passwordEntry form-control" TextMode="Password"></asp:TextBox>
              <asp:RequiredFieldValidator ControlToValidate="ConfirmPassword" CssClass="failureNotification" Display="Dynamic" 
                 ErrorMessage="Confirm Password is required." ID="ConfirmPasswordRequired" runat="server" 
                 ToolTip="Confirm Password is required." ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
              <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                 CssClass="failureNotification" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match."
                 ValidationGroup="RegisterUserValidationGroup">*</asp:CompareValidator>
         </div>
    </div>

            </fieldset>
        <p class="submitButton">
            <asp:Button ID="CreateUserButton" runat="server" CssClass="btn btn-primary" CommandName="MoveNext" Text="Crear Usuario" 
                    ValidationGroup="RegisterUserValidationGroup"/>
        </p>
                    </div>   
               </ContentTemplate>
                   <CustomNavigationTemplate>
                   </CustomNavigationTemplate>
            </asp:CreateUserWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>

</form>   
</div>    
</div>

</asp:Content>