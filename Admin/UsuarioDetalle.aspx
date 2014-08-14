<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="false" CodeFile="UsuarioDetalle.aspx.vb" Inherits="Admin_EditUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container">
     
      <div class="tab-pane col-lg-8 col-lg-offset-1 active" id="eventos">

          <asp:DetailsView ID="DetailsView2" runat="server" Height="50px" Width="125px" 
              AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id_usuario" 
              DataSourceID="imagenDS" ForeColor="Black" GridLines="Horizontal">
              <EditRowStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="Black" />
              <Fields>
                  <asp:BoundField DataField="username" 
                      SortExpression="username" />
                  <asp:ImageField DataImageUrlField="foto">
                      <ControlStyle Height="225px" />
                  </asp:ImageField>
              </Fields>
              <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
              <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
          </asp:DetailsView>

          <br />

          <asp:SqlDataSource ID="imagenDS" runat="server" 
              ConnectionString="<%$ ConnectionStrings:JuguemosConnectionString %>" 
              SelectCommand="SELECT * FROM [Usuario] WHERE ([id_usuario] = @id_usuario)">
              <SelectParameters>
                  <asp:QueryStringParameter Name="id_usuario" QueryStringField="id_usuario" 
                      Type="Int32" />
              </SelectParameters>
          </asp:SqlDataSource>

          <asp:DetailsView ID="DetailsView3" runat="server" AutoGenerateRows="False" 
              BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
              CellPadding="4" DataKeyNames="id_estadoU" DataSourceID="EstadoDS" 
              ForeColor="Black" GridLines="Horizontal" Height="50px" Width="125px">
              <EditRowStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="Black" />
              <Fields>
                  <asp:BoundField DataField="id_estadoU" HeaderText="No. Estado" 
                      InsertVisible="False" ReadOnly="True" SortExpression="id_estadoU" />
                  <asp:BoundField DataField="id_usuario" HeaderText="ID Usuario" ReadOnly="True" 
                      SortExpression="id_usuario" />
                  <asp:BoundField DataField="mes" HeaderText="Mes" SortExpression="mes" />
                  <asp:BoundField DataField="ano" HeaderText="Año" SortExpression="ano" />
                  <asp:BoundField DataField="estado" HeaderText="Estado" 
                      SortExpression="estado" />
                  <asp:CommandField ShowEditButton="True" />
              </Fields>
              <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
              <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
          </asp:DetailsView>
          <asp:SqlDataSource ID="EstadoDS" runat="server" 
              ConflictDetection="CompareAllValues" 
              ConnectionString="<%$ ConnectionStrings:JuguemosConnectionString %>" 
              DeleteCommand="DELETE FROM [EstadoUsuario] WHERE [id_estadoU] = @original_id_estadoU AND (([id_usuario] = @original_id_usuario) OR ([id_usuario] IS NULL AND @original_id_usuario IS NULL)) AND (([estado] = @original_estado) OR ([estado] IS NULL AND @original_estado IS NULL)) AND (([mes] = @original_mes) OR ([mes] IS NULL AND @original_mes IS NULL)) AND (([ano] = @original_ano) OR ([ano] IS NULL AND @original_ano IS NULL))" 
              InsertCommand="INSERT INTO [EstadoUsuario] ([id_usuario], [estado], [mes], [ano]) VALUES (@id_usuario, @estado, @mes, @ano)" 
              OldValuesParameterFormatString="original_{0}" 
              SelectCommand="SELECT * FROM [EstadoUsuario] WHERE ([id_usuario] = @id_usuario)" 
              
              UpdateCommand="UPDATE EstadoUsuario SET estado = @estado, mes = @mes, ano = @ano WHERE (id_estadoU = @original_id_estadoU) AND (estado = @original_estado OR estado IS NULL AND @original_estado IS NULL) AND (mes = @original_mes OR mes IS NULL AND @original_mes IS NULL) AND (ano = @original_ano OR ano IS NULL AND @original_ano IS NULL)">
              <DeleteParameters>
                  <asp:Parameter Name="original_id_estadoU" Type="Int32" />
                  <asp:Parameter Name="original_id_usuario" Type="Int32" />
                  <asp:Parameter Name="original_estado" Type="String" />
                  <asp:Parameter Name="original_mes" Type="Int32" />
                  <asp:Parameter Name="original_ano" Type="Int32" />
              </DeleteParameters>
              <InsertParameters>
                  <asp:Parameter Name="id_usuario" Type="Int32" />
                  <asp:Parameter Name="estado" Type="String" />
                  <asp:Parameter Name="mes" Type="Int32" />
                  <asp:Parameter Name="ano" Type="Int32" />
              </InsertParameters>
              <SelectParameters>
                  <asp:QueryStringParameter Name="id_usuario" QueryStringField="id_usuario" 
                      Type="Int32" />
              </SelectParameters>
              <UpdateParameters>
                  <asp:Parameter Name="estado" Type="String" />
                  <asp:Parameter Name="mes" Type="Int32" />
                  <asp:Parameter Name="ano" Type="Int32" />
                  <asp:Parameter Name="original_id_estadoU" Type="Int32" />
                  <asp:Parameter Name="original_estado" Type="String" />
                  <asp:Parameter Name="original_mes" Type="Int32" />
                  <asp:Parameter Name="original_ano" Type="Int32" />
              </UpdateParameters>
          </asp:SqlDataSource>
     
    <br />
          <asp:Button ID="Button1" runat="server" Text="Volver" CssClass="btn btn-primary" PostBackUrl="~/Admin/Default.aspx" />
    </div>
</div>
</asp:Content>

