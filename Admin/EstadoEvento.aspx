<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="false" CodeFile="EstadoEvento.aspx.vb" Inherits="Admin_EstadoEvento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <body>
<div class="container">
     
      <div class="tab-pane col-lg-8 col-lg-offset-1 active" id="eventos">
          
          <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
              AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id_evento" 
              DataSourceID="EstadoEventoDS" ForeColor="Black" GridLines="Horizontal" 
              Width="90%">
              <Columns>
                  <asp:HyperLinkField DataNavigateUrlFields="id_evento" 
                      DataNavigateUrlFormatString="EventoDetalle.aspx?id_evento={0}" 
                      DataTextField="id_evento" HeaderText="Ver" />
                  <asp:BoundField DataField="fecha" DataFormatString="{0:d}" HeaderText="Fecha" 
                      SortExpression="fecha" />
                  <asp:BoundField DataField="hora" HeaderText="Hora" SortExpression="hora" />
                  <asp:BoundField DataField="cant_participantes" HeaderText="Cant." 
                      SortExpression="cant_participantes" />
                  <asp:BoundField DataField="Expr1" HeaderText="Deporte" SortExpression="Expr1" />
                  <asp:BoundField DataField="descripcion" HeaderText="Cancha" 
                      SortExpression="descripcion" />
                  <asp:BoundField DataField="username" HeaderText="Creador" 
                      SortExpression="username" />
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
              SelectCommand="SELECT Crear_Evento.id_evento, Crear_Evento.username, Crear_Evento.fecha, Crear_Evento.hora, Crear_Evento.cant_participantes, Cancha.descripcion, Deporte.descripcion AS Expr1, EstadoEvento.estado FROM Cancha INNER JOIN Deporte ON Cancha.id_deporte = Deporte.id_deporte INNER JOIN Crear_Evento ON Cancha.id_cancha = Crear_Evento.id_cancha INNER JOIN EstadoEvento ON Crear_Evento.id_evento = EstadoEvento.id_evento WHERE (EstadoEvento.estado = '1') ORDER BY Crear_Evento.fecha">
          </asp:SqlDataSource>
          <br />
    
    </div>
</div>
</body>
</asp:Content>

