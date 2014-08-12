<%@ Page Title="Mis Eventos" Language="VB" MasterPageFile="~/Miembros/Miembro.master" AutoEventWireup="false" CodeFile="MisEventos.aspx.vb" Inherits="Miembros_Mensajes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
 <body>
    <div class="container">
        <div class="tab-pane col-lg-8 col-lg-offset-1 active" id="miembro">
            <asp:LoginName ID="LoginName1" runat="server" Visible="false"/>
            <asp:Label ID="lblUsuario" runat="server" Text="Label" Visible="False"></asp:Label>
            <legend>Mis Eventos</legend>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                CellPadding="4" DataSourceID="MisEventosDS" ForeColor="Black" 
                GridLines="Horizontal" Width="90%">
                <Columns>
                    <asp:HyperLinkField DataNavigateUrlFields="id_evento" 
                        DataNavigateUrlFormatString="VerEvento.aspx?id_evento={0}" 
                        DataTextField="id_evento" HeaderText="Ver" Text="ver">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:HyperLinkField>
                    <asp:BoundField DataField="fecha" DataFormatString="{0:d}" HeaderText="Fecha" 
                        SortExpression="fecha" />
                    <asp:BoundField DataField="hora" HeaderText="Hora" SortExpression="hora" />
                    <asp:BoundField DataField="cant_participantes" HeaderText="No. Participantes" 
                        SortExpression="cant_participantes" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="edadMin" HeaderText="Edad Min" 
                        SortExpression="edadMin" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="edadMax" HeaderText="Edad Max" 
                        SortExpression="edadMax" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="restriccionGen" HeaderText="Género" 
                        SortExpression="restriccionGen" />
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
            <asp:SqlDataSource ID="MisEventosDS" runat="server" 
                ConnectionString="<%$ ConnectionStrings:JuguemosConnectionString %>" 
                
                SelectCommand="SELECT ParticipantesXevento.username, Crear_Evento.fecha, Crear_Evento.hora, Crear_Evento.cant_participantes, Crear_Evento.edadMin, Crear_Evento.edadMax, Crear_Evento.restriccionGen, Cancha.descripcion, ParticipantesXevento.id_evento FROM ParticipantesXevento INNER JOIN Crear_Evento ON ParticipantesXevento.id_evento = Crear_Evento.id_evento INNER JOIN Cancha ON Crear_Evento.id_cancha = Cancha.id_cancha WHERE (ParticipantesXevento.username = @username)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblUsuario" Name="username" 
                        PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
 </body>
</asp:Content>

