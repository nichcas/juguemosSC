<%@ Page Title="" Language="VB" MasterPageFile="~/Miembros/Miembro.master" AutoEventWireup="false" CodeFile="VerEvento.aspx.vb" Inherits="Miembros_VerEvento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="container">
    <div class="tab-pane col-lg-8 col-lg-offset-1 active" id="miembro"><br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataKeyNames="id_evento,username" 
            DataSourceID="ParticipantesDS" ForeColor="Black" GridLines="Horizontal" 
            Width="40%">
            <Columns>
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
            SelectCommand="SELECT * FROM [ParticipantesXevento] WHERE ([id_evento] = @id_evento)">
            <SelectParameters>
                <asp:QueryStringParameter Name="id_evento" QueryStringField="id_evento" 
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    <br /><br />

    </div>
</div>
</asp:Content>

