<%@ Page Title="" Language="VB" MasterPageFile="~/Miembros/Miembro.master" AutoEventWireup="false" CodeFile="Perfil.aspx.vb" Inherits="Miembros_Mensajes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
 <body id="perfil">
    <div class="container" >
        <div class="tab-pane col-lg-8 col-lg-offset-1 active" id="miembro"><br />
            <p>Detailview para editar perfil</p>

            <!-- Small modal -->
                <button class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">Small modal</button>

                <div class="modal  bs-example-modal-sm"  tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
                  <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                      ...
                    </div>
                  </div>
                </div>
        </div>
    </div>
 </body>
</asp:Content>

