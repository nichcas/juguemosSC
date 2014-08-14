<%@ Page Title="Eventos Disponibles" Language="VB" MasterPageFile="~/Miembros/Miembro.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Miembros_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <body>
<div class="container">
     
      <div class="tab-pane col-lg-8 col-lg-offset-1 active" id="eventos">
      <legend>Eventos Disponibles</legend>

          <asp:LoginName ID="LoginName1" runat="server" Visible="false"/>
          <asp:Label ID="lblUsuario" runat="server" Text="Label" Visible="False"></asp:Label>
          <asp:Label ID="lblEdad" runat="server" Text="Label" Visible="False"></asp:Label>  
          <asp:Label ID="lblGenero" runat="server" Text="" Visible="False"></asp:Label>
          <p>
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                        CellPadding="4" DataKeyNames="id_evento" DataSourceID="EventosFiltradosDS" 
                        ForeColor="Black" GridLines="Horizontal" Width="90%" AllowSorting="True">
                        <Columns>
                            <asp:HyperLinkField DataNavigateUrlFields="id_evento" 
                                DataNavigateUrlFormatString="VerEvento.aspx?id_evento={0}" 
                                DataTextField="id_evento" HeaderText="Ver" />
                            <asp:BoundField DataField="fecha" DataFormatString="{0:d}" HeaderText="Fecha" 
                                SortExpression="fecha" />
                            <asp:BoundField DataField="hora" HeaderText="Hora" SortExpression="hora" />
                            <asp:BoundField DataField="cant_participantes" HeaderText="Jugadores" 
                                SortExpression="cant_participantes" />
                            <asp:BoundField DataField="restriccionGen" HeaderText="Genero" 
                                SortExpression="restriccionGen" />
                            <asp:BoundField DataField="edadMin" HeaderText="Edad Min" 
                                SortExpression="edadMin" />
                            <asp:BoundField DataField="edadMax" HeaderText="Edad Max" 
                                SortExpression="edadMax" />
                            <asp:BoundField DataField="Expr1" HeaderText="Deporte" SortExpression="Expr1" />
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
                    <asp:SqlDataSource ID="EventosFiltradosDS" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:JuguemosConnectionString %>" 
                        SelectCommand="SELECT Crear_Evento.id_evento, Crear_Evento.username, Crear_Evento.edadMin, Crear_Evento.edadMax, Crear_Evento.restriccionGen, Crear_Evento.cant_participantes, Crear_Evento.hora, Crear_Evento.fecha, Cancha.descripcion, Deporte.descripcion AS Expr1 FROM Cancha INNER JOIN Deporte ON Cancha.id_deporte = Deporte.id_deporte INNER JOIN Crear_Evento INNER JOIN EstadoEvento ON Crear_Evento.id_evento = EstadoEvento.id_evento ON Cancha.id_cancha = Crear_Evento.id_cancha WHERE (Crear_Evento.restriccionGen = @genero OR Crear_Evento.restriccionGen = 'Mixto') AND (Crear_Evento.edadMax = 0) AND (Crear_Evento.edadMin = 0) AND (EstadoEvento.estado = 1) OR (Crear_Evento.restriccionGen = @genero OR Crear_Evento.restriccionGen = 'Mixto') AND (EstadoEvento.estado = 1) AND (@edad BETWEEN Crear_Evento.edadMin AND Crear_Evento.edadMax)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lblGenero" Name="genero" PropertyName="Text" />
                            <asp:ControlParameter ControlID="lblEdad" Name="edad" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
          </p>
                    
                    
      </div>
                        
 </div>    
 </body>
    </asp:Content>

