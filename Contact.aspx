<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Contact.aspx.vb" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

 <body  id="contacto">

    <div class="container">
    <div class="col-lg-12">
        <img src="imagenes/bannerBolas1.fw.png" width="100%" />
    </div>
<div class=" col-lg-7">
    <h2>
        Comentarios
    </h2>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;Por favor envienos un comentario o una consuta y pronto le responderemos.
    </p>
    <form class="form-horizontal">

    
        <LayoutTemplate>
            <span class="failureNotification">
                <asp:Literal ID="FailureText" runat="server"></asp:Literal>
            </span>
            <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="failureNotification" 
                 ValidationGroup="LoginUserValidationGroup"/>
            <div class="accountInfo">

            <fieldset class="login">
                    <legend>Formulario para consultas</legend>
    <div class="form-group">
      <asp:Label ID="lblNombre" runat="server" AssociatedControlID="UserName" CssClass="col-lg-3 control-label">Nombre:</asp:Label>
      <div class="col-lg-9">
           <asp:TextBox ID="UserName" runat="server" CssClass="textEntry form-control"></asp:TextBox>
           <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" 
           CssClass="failureNotification" ErrorMessage="User Name is required." ToolTip="Por favor digite su nombre." 
           ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
      </div>
    </div>

    <div class="form-group">
      <asp:Label ID="lblEmail" runat="server" AssociatedControlID="Email" CssClass="col-lg-3 control-label">Email:</asp:Label>
      <div class="col-lg-9">
           <asp:TextBox ID="Email" runat="server" CssClass="emailEntry form-control"></asp:TextBox>
           <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" 
           CssClass="failureNotification" ErrorMessage="E-mail is required." ToolTip="E-mail is required." 
           ValidationGroup="RegisterUserValidationGroup"></asp:RequiredFieldValidator>
      </div>
    </div>

    <div class="form-group">
         <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtTel" CssClass="col-lg-3 control-label">Teléfono:</asp:Label>
         <div class="col-lg-9 clearfix">
              <asp:TextBox ID="txtTel" runat="server" CssClass="textEntry form-control" ></asp:TextBox>
              <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="txtTel" 
              CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required." 
              ValidationGroup="RegisterUserValidationGroup"></asp:RequiredFieldValidator>
         </div>
    </div><br />
         
    <div class="form-group">
      <asp:Label ID="lblComentario" runat="server" AssociatedControlID="Comment" CssClass="col-lg-3 control-label">Comentario:</asp:Label>
      <div class="col-lg-9">
           <asp:TextBox ID="Comment" runat="server" CssClass="textEntry form-control" 
               Rows="3" TextMode="MultiLine"></asp:TextBox>
           
      </div>
    </div>
         
                </fieldset>
                <p class="submitButton">
                    <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" CommandName="Submit" Text="Enviar" ValidationGroup="LoginUserValidationGroup"/>
                </p>
            </div>
        </LayoutTemplate>
      


</form>   
</div>    
</div>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:JuguemosConnectionString %>" 
    SelectCommand="SELECT * FROM [Cancha]"></asp:SqlDataSource>
</body>
</asp:Content>

