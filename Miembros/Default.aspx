<%@ Page Title="" Language="VB" MasterPageFile="~/Miembros/Miembro.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Miembros_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="container">
     
      <div class="tab-pane col-lg-8 col-lg-offset-1 active" id="eventos"><br />
                    <p>Poner info de todos los eventos que hay</p>
                <p>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                        CellPadding="4" DataSourceID="EventosDS" ForeColor="Black" 
                        GridLines="Horizontal">
                        <Columns>
                            <asp:BoundField DataField="fecha" HeaderText="Fecha" SortExpression="fecha">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="hora" HeaderText="Hora" SortExpression="hora">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="cant_participantes" HeaderText="No. Participantes" 
                                SortExpression="cant_participantes">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="edadMin" HeaderText="Edad Min" 
                                SortExpression="edadMin">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="edadMax" HeaderText="Edad Max" 
                                SortExpression="edadMax">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="descripcion" HeaderText="descripcion" 
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
                    <asp:SqlDataSource ID="EventosDS" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:JuguemosConnectionString %>" 
                        SelectCommand="SELECT Crear_Evento.fecha, Crear_Evento.hora, Crear_Evento.cant_participantes, Crear_Evento.edadMin, Crear_Evento.edadMax, Cancha.descripcion FROM Crear_Evento INNER JOIN Cancha ON Crear_Evento.id_cancha = Cancha.id_cancha">
                    </asp:SqlDataSource>
                </p>
                    
                    
      </div>
                        
     

</asp:Content>

