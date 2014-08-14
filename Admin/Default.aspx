<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<body id="usuario"></body>
    <div class="container">     
      <div class="tab-pane col-lg-8 col-lg-offset-1 active" id="eventos">

          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
              BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
              CellPadding="4" DataKeyNames="id_usuario" DataSourceID="SqlDataSource1" 
              ForeColor="Black" GridLines="Horizontal" Width="90%" AllowSorting="True">
              <Columns>
                  <asp:HyperLinkField DataNavigateUrlFields="id_usuario" 
                      DataNavigateUrlFormatString="UsuarioDetalle.aspx?id_usuario={0}" 
                      DataTextField="id_usuario" HeaderText="Ver" Text="Ver"></asp:HyperLinkField>
                  <asp:ImageField DataImageUrlField="foto" HeaderText="Foto">
                      <ControlStyle Height="50px" Width="50px" />
                  </asp:ImageField>
                  <asp:BoundField DataField="username" HeaderText="Usuario" 
                      SortExpression="username" />
                  <asp:BoundField DataField="email" HeaderText="Correo" SortExpression="email" />
                  <asp:BoundField DataField="tel" HeaderText="Teléfono" SortExpression="tel" />
                  <asp:BoundField DataField="ano" HeaderText="Año" SortExpression="ano" />
                  <asp:BoundField DataField="mes" HeaderText="Mes" SortExpression="mes" />
                  <asp:BoundField DataField="estado" HeaderText="Estado" 
                      SortExpression="estado" />
              </Columns>
              <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="#3399F3" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
          </asp:GridView>
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
              ConnectionString="<%$ ConnectionStrings:JuguemosConnectionString %>" 
              SelectCommand="SELECT Usuario.id_usuario, Usuario.username, Usuario.foto, Usuario.email, Usuario.tel, EstadoUsuario.ano, EstadoUsuario.mes, EstadoUsuario.estado FROM Usuario INNER JOIN EstadoUsuario ON Usuario.id_usuario = EstadoUsuario.id_usuario">
          </asp:SqlDataSource>
    </div>
</div>
</asp:Content>

