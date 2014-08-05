<%@ Page Title="" Language="VB" MasterPageFile="~/Miembros/Miembro.master" AutoEventWireup="false" CodeFile="Satisfactorio.aspx.vb" Inherits="Miembros_Satisfactorio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="container">
    <div class="tab-pane col-lg-8 col-lg-offset-1 active" id="eventos">
        <div class="alert alert-success">
            <strong>El evento ha sido creado exitosamente!</strong> Desde ahora los demás 
            socios podran visitar y apuntarse a su evento
        </div>
        
        <asp:Button ID="Button1" runat="server" Text="Volver" CssClass="btn btn-primary" PostBackUrl="~/Miembros/Default.aspx" />

    </div>
</div>

</asp:Content>

