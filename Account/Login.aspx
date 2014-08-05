<%@ Page Title="Log In" Language="VB" MasterPageFile="~/Account/Account.master" AutoEventWireup="false"
    CodeFile="Login.aspx.vb" Inherits="Account_Login" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="container">
    <div class="col-lg-12">
        <img src="../imagenes/bannerBolas1.fw.png" width="100%" />
        
    </div>
<div class=" col-lg-7 col-lg-offset-1">
    <h2>
        Iniciar Sesión
    </h2>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;Por favor digite su nombre y contraseña.
        <asp:HyperLink ID="RegisterHyperLink" runat="server" EnableViewState="false">Regístrese</asp:HyperLink> si no ha creado una cuenta.
    </p>
    <form class="form-horizontal" action="">

    <asp:Login ID="LoginUser" runat="server" EnableViewState="false" RenderOuterTable="false" DestinationPageUrl="~/Miembros/Default.aspx">
        <LayoutTemplate>
            <span class="failureNotification">
                <asp:Literal ID="FailureText" runat="server" ></asp:Literal>
            </span>
            <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="failureNotification alert alert-danger" 
                 ValidationGroup="LoginUserValidationGroup"/>
            <div class="accountInfo">

            
            <fieldset class="login">
                    <legend>Información de la Cuenta</legend>
    <div class="form-group">
      <asp:Label ID="lblUsuario" runat="server" AssociatedControlID="UserName" CssClass="col-lg-3 control-label">Usuario:</asp:Label>
      <div class="col-lg-9">
           <asp:TextBox ID="UserName" runat="server" CssClass="textEntry form-control"></asp:TextBox>
           <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" 
           CssClass="failureNotification" 
               ErrorMessage="Debe ingresar su nombre de usuario." ToolTip="Ingresar nombre de usuario" 
           ValidationGroup="LoginUserValidationGroup"></asp:RequiredFieldValidator>
      </div>
    </div>
    <div class="form-group">
         <asp:Label ID="lblPassword" runat="server" AssociatedControlID="Password" CssClass="col-lg-3 control-label">Password:</asp:Label>
         <div class="col-lg-9 clearfix">
              <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry form-control" TextMode="Password"></asp:TextBox>
              <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                  CssClass="failureNotification" ErrorMessage="Debe ingresar la contraseña." ToolTip="Ingresar la contraseña."
                  ValidationGroup="LoginUserValidationGroup"></asp:RequiredFieldValidator>
      </div>
    </div>
         <div class="form-group clearfix">
            <asp:CheckBox ID="RememberMe" runat="server"/>
                  <asp:Label ID="RememberMeLabel" runat="server" AssociatedControlID="RememberMe" CssClass="inline">Mantenga mi sesión</asp:Label>
         </div>
                </fieldset>
                <p class="submitButton">
                    <asp:Button ID="LoginButton" CssClass="btn btn-primary" runat="server" CommandName="Login" Text="Log In" ValidationGroup="LoginUserValidationGroup"/>
                </p>
            </div>
        </LayoutTemplate>
    </asp:Login>   


</form>   
</div>    
</div>
    
    
    
</asp:Content>