<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<body id="usuario"></body>
    <div class="container">     
      <div class="tab-pane col-lg-8 col-lg-offset-1 active" id="eventos">

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="id_usuario" DataSourceID="EstadoUsuarioDS" BackColor="White" 
              BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
              ForeColor="Black" GridLines="Horizontal" Width="90%">
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="id_usuario" 
                    DataTextField="id_usuario" HeaderText="ID" 
                    DataNavigateUrlFormatString="UsuarioDetalle.aspx?id_usuario={0}" />
                <asp:ImageField DataImageUrlField="foto" HeaderText="Foto">
                    <ControlStyle Height="50px" Width="50px" />
                    <ItemStyle Height="50px" Width="50px" />
                </asp:ImageField>
                <asp:BoundField DataField="username" HeaderText="Usuario" 
                    SortExpression="username" />
                <asp:BoundField DataField="email" HeaderText="Correo" SortExpression="email" />
                <asp:BoundField DataField="tel" HeaderText="Teléfono" SortExpression="tel" />
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
        <asp:SqlDataSource ID="EstadoUsuarioDS" runat="server" 
            ConnectionString="<%$ ConnectionStrings:JuguemosConnectionString %>" 
            SelectCommand="SELECT * FROM [Usuario]"></asp:SqlDataSource>
    </div>
</div>
</asp:Content>

