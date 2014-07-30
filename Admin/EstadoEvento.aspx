<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="false" CodeFile="EstadoEvento.aspx.vb" Inherits="Admin_EstadoEvento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <body id="evento">
<div class="container">
     
      <div class="tab-pane col-lg-8 col-lg-offset-1 active" id="eventos">
          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
              BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
              CellPadding="4" DataSourceID="EstadoEventoDS" ForeColor="Black" 
              GridLines="Horizontal" Width="90%">
              <Columns>
                  <asp:HyperLinkField DataTextField="id_evento" HeaderText="Ver" Text="Ver" 
                      DataNavigateUrlFields="id_evento" 
                      DataNavigateUrlFormatString="EventoDetalle.aspx?id_evento={0}" />
                  <asp:BoundField DataField="username" HeaderText="Usuario" 
                      SortExpression="username" />
                  <asp:BoundField DataField="fecha" HeaderText="Fecha" SortExpression="fecha" 
                      DataFormatString="{0:d}" />
                  <asp:BoundField DataField="hora" HeaderText="Hora" SortExpression="hora" />
                  <asp:BoundField DataField="descripcion" HeaderText="Cancha" 
                      SortExpression="descripcion" />
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
          <asp:SqlDataSource ID="EstadoEventoDS" runat="server" 
              ConnectionString="<%$ ConnectionStrings:JuguemosConnectionString %>" 
              
              SelectCommand="SELECT Crear_Evento.username, Crear_Evento.fecha, Crear_Evento.hora, Cancha.descripcion, EstadoEvento.estado, Crear_Evento.id_evento FROM Crear_Evento INNER JOIN EstadoEvento ON Crear_Evento.id_evento = EstadoEvento.id_evento INNER JOIN Cancha ON Crear_Evento.id_cancha = Cancha.id_cancha WHERE (EstadoEvento.estado = 1)">
          </asp:SqlDataSource>
          <br />
          <br />
    
    </div>
</div>
</body>
</asp:Content>

