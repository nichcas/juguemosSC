<%@ Page Title="" Language="VB" MasterPageFile="~/Miembros/Miembro.master" AutoEventWireup="false" CodeFile="MisEventos.aspx.vb" Inherits="Miembros_Mensajes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
 <body id="misEventos">
    <div class="container">
        <div class="tab-pane col-lg-8 col-lg-offset-1 active" id="miembro"><br />
            <asp:LoginName ID="LoginName1" runat="server" Visible="false"/>
            <asp:Label ID="lblUsuario" runat="server" Text="Label" Visible="False"></asp:Label>

            <asp:GridView ID="GridView1" runat="server" BackColor="White" 
                BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                ForeColor="Black" GridLines="Horizontal" AutoGenerateColumns="False" 
                DataKeyNames="id_evento" DataSourceID="MisEventosDS" Width="100%">
                <Columns>
                    <asp:BoundField DataField="fecha" HeaderText="fecha" SortExpression="fecha" />
                    <asp:BoundField DataField="hora" HeaderText="hora" SortExpression="hora" />
                    <asp:BoundField DataField="cant_participantes" HeaderText="cant_participantes" 
                        SortExpression="cant_participantes" />
                    <asp:BoundField DataField="edadMin" HeaderText="edadMin" 
                        SortExpression="edadMin" />
                    <asp:BoundField DataField="edadMax" HeaderText="edadMax" 
                        SortExpression="edadMax" />
                    <asp:BoundField DataField="restriccionGen" HeaderText="restriccionGen" 
                        SortExpression="restriccionGen" />
                    <asp:BoundField DataField="id_cancha" HeaderText="id_cancha" 
                        SortExpression="id_cancha" />
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
                
                SelectCommand="SELECT * FROM [Crear_Evento] WHERE ([username] = @username)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblUsuario" Name="username" 
                        PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
 </body>
</asp:Content>

