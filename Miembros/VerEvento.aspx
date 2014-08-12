<%@ Page Title="" Language="VB" MasterPageFile="~/Miembros/Miembro.master" AutoEventWireup="false" CodeFile="VerEvento.aspx.vb" Inherits="Miembros_VerEvento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="container">
    <div class="tab-pane col-lg-8 col-lg-offset-1 active" id="miembro"><br />
    <asp:LoginName ID="LoginName1" runat="server" Visible="false"/>
    
        <asp:Label ID="lblUsuario" runat="server" Text="Label" Visible="False"></asp:Label>
        <asp:Label ID="lblEvento" runat="server" Text="Label" Visible="False"></asp:Label>
        <asp:Label ID="lblNoPart" runat="server" Text="Label" Visible="False"></asp:Label>

    <legend>Participantes</legend>

        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="50%" 
            AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id_evento" 
            DataSourceID="CantPartDS" ForeColor="Black" GridLines="Horizontal">
            <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="cant_participantes" HeaderText="Campos Disponibles" 
                    SortExpression="cant_participantes" />
            </Fields>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        </asp:DetailsView>

        <asp:SqlDataSource ID="CantPartDS" runat="server" 
            ConnectionString="<%$ ConnectionStrings:JuguemosConnectionString %>" 
            SelectCommand="SELECT [id_evento], [cant_participantes] FROM [Crear_Evento] WHERE ([id_evento] = @id_evento)">
            <SelectParameters>
                <asp:ControlParameter ControlID="lblEvento" Name="id_evento" 
                    PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataKeyNames="id_evento,username" 
            DataSourceID="ParticipantesDS" ForeColor="Black" GridLines="Horizontal" 
            Width="50%">
            <Columns>
                <asp:ImageField DataImageUrlField="foto">
                    <ControlStyle Height="50px" Width="50px" CssClass="img-circle" />
                </asp:ImageField>
                <asp:BoundField DataField="username" HeaderText="Participantes" ReadOnly="True" 
                    SortExpression="username" >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
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
        <asp:SqlDataSource ID="ParticipantesDS" runat="server" 
            ConnectionString="<%$ ConnectionStrings:JuguemosConnectionString %>" 
            
            SelectCommand="SELECT ParticipantesXevento.id_evento, ParticipantesXevento.username, Usuario.foto FROM ParticipantesXevento INNER JOIN Usuario ON ParticipantesXevento.username = Usuario.username WHERE (ParticipantesXevento.id_evento = @id_evento)">
            <SelectParameters>
                <asp:QueryStringParameter Name="id_evento" QueryStringField="id_evento" 
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    <br /><br />

        <asp:Button ID="Button1" runat="server" Text="Participar" CssClass="btn btn-primary "/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:Button ID="Button2" runat="server" Text="Salir" CssClass="btn btn-primary " />
    </div>
</div>
</asp:Content>

