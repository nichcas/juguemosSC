<%@ Page Title="Detalle del Evento " Language="VB" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="false" CodeFile="EventoDetalle.aspx.vb" Inherits="Admin_EventoDetalle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container">
     
      <div class="tab-pane col-lg-8 col-lg-offset-1 active" id="eventos">

      <h3>Si elimina el evento, no se podrá recuperar su estado de activo.</h3>
          <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" 
              AutoGenerateRows="False" DataKeyNames="id_estadoE" 
              DataSourceID="EventoDetalleDS" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
              GridLines="Horizontal">
              <EditRowStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="#3399F3" />
              <Fields>
                  <asp:BoundField DataField="id_evento" HeaderText="id_evento" ReadOnly="True" 
                      SortExpression="id_evento" />
                  <asp:BoundField DataField="estado" HeaderText="estado" 
                      SortExpression="estado" />
                  <asp:CommandField ShowEditButton="True" EditText="Editar" />
              </Fields>
              <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
              <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
          </asp:DetailsView>

          <asp:SqlDataSource ID="EventoDetalleDS" runat="server" 
              ConflictDetection="CompareAllValues" 
              ConnectionString="<%$ ConnectionStrings:JuguemosConnectionString %>" 
              DeleteCommand="DELETE FROM [EstadoEvento] WHERE [id_estadoE] = @original_id_estadoE AND (([id_evento] = @original_id_evento) OR ([id_evento] IS NULL AND @original_id_evento IS NULL)) AND (([estado] = @original_estado) OR ([estado] IS NULL AND @original_estado IS NULL))" 
              InsertCommand="INSERT INTO [EstadoEvento] ([id_evento], [estado]) VALUES (@id_evento, @estado)" 
              OldValuesParameterFormatString="original_{0}" 
              SelectCommand="SELECT * FROM [EstadoEvento] WHERE ([id_evento] = @id_evento)" 
              
              UpdateCommand="UPDATE EstadoEvento SET estado = @estado WHERE (id_estadoE = @original_id_estadoE) AND (estado = @original_estado) OR (id_estadoE = @original_id_estadoE) AND (estado = @original_estado) AND (@original_id_evento IS NULL) OR (id_estadoE = @original_id_estadoE) AND (estado IS NULL) AND (@original_estado IS NULL) OR (id_estadoE = @original_id_estadoE) AND (id_evento IS NULL) AND (estado IS NULL) AND (@original_id_evento IS NULL) AND (@original_estado IS NULL)">
              <DeleteParameters>
                  <asp:Parameter Name="original_id_estadoE" Type="Int32" />
                  <asp:Parameter Name="original_id_evento" Type="Int32" />
                  <asp:Parameter Name="original_estado" Type="String" />
              </DeleteParameters>
              <InsertParameters>
                  <asp:Parameter Name="id_evento" Type="Int32" />
                  <asp:Parameter Name="estado" Type="String" />
              </InsertParameters>
              <SelectParameters>
                  <asp:QueryStringParameter Name="id_evento" QueryStringField="id_evento" 
                      Type="Int32" />
              </SelectParameters>
              <UpdateParameters>
                  <asp:Parameter Name="estado" Type="String" />
                  <asp:Parameter Name="original_id_estadoE" Type="Int32" />
                  <asp:Parameter Name="original_estado" Type="String" />
                  <asp:Parameter Name="original_id_evento" Type="Int32" />
              </UpdateParameters>
          </asp:SqlDataSource>
          <br />
          <asp:Button ID="Button1" runat="server" Text="Volver" CssClass="btn btn-primary" PostBackUrl="~/Admin/EstadoEvento.aspx" />

      </div>
</div>
</asp:Content>

