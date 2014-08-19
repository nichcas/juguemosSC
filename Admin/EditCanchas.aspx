<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="false" CodeFile="EditCanchas.aspx.vb" Inherits="Admin_EditCanchas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<body id="canchas"></body>
<div class="container">     
    <div class="tab-pane col-lg-5 col-lg-offset-1 active" id="eventos">

        <asp:DetailsView ID="DetailsView2" runat="server" AllowPaging="True" 
            AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id_deporte" 
            DataSourceID="EditDeporteDS" ForeColor="Black" GridLines="Horizontal" 
            Height="50px" Width="100%">
            <EditRowStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="#3399F3" />
            <Fields>
                <asp:BoundField DataField="descripcion" HeaderText="Deporte" 
                    SortExpression="descripcion" />
                <asp:CommandField ShowDeleteButton="True" ShowInsertButton="True" 
                    CancelText="Cancelar" DeleteText="Eliminar" EditText="Editar" NewText="Nuevo" 
                    UpdateText="Actualizar" />
            </Fields>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="EditDeporteDS" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:JuguemosConnectionString %>" 
            DeleteCommand="DELETE FROM [Deporte] WHERE [id_deporte] = @original_id_deporte AND (([descripcion] = @original_descripcion) OR ([descripcion] IS NULL AND @original_descripcion IS NULL))" 
            InsertCommand="INSERT INTO [Deporte] ([descripcion]) VALUES (@descripcion)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [Deporte]" 
            UpdateCommand="UPDATE [Deporte] SET [descripcion] = @descripcion WHERE [id_deporte] = @original_id_deporte AND (([descripcion] = @original_descripcion) OR ([descripcion] IS NULL AND @original_descripcion IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_id_deporte" Type="Int32" />
                <asp:Parameter Name="original_descripcion" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="descripcion" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="descripcion" Type="String" />
                <asp:Parameter Name="original_id_deporte" Type="Int32" />
                <asp:Parameter Name="original_descripcion" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Refrescar" CssClass="btn btn-primary btn-block" Width="100%"/>
        <br />
        <br />

        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            DataSourceID="DeporteDS" DataTextField="descripcion" 
            DataValueField="id_deporte" CssClass="textEntry form-control" Width="100%">
        </asp:DropDownList>
        <br />
        <asp:SqlDataSource ID="DeporteDS" runat="server" 
            ConnectionString="<%$ ConnectionStrings:JuguemosConnectionString %>" 
            SelectCommand="SELECT * FROM [Deporte]"></asp:SqlDataSource>
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
            AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id_cancha" 
            DataSourceID="CanchasDS" ForeColor="Black" GridLines="Horizontal" Width="100%">
            <EditRowStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="#3399F3" />
            <Fields>
                <asp:BoundField DataField="id_deporte" HeaderText="ID Deporte" 
                    SortExpression="id_deporte" />
                <asp:BoundField DataField="descripcion" HeaderText="Tipo Cancha" 
                    SortExpression="descripcion" />
                <asp:CommandField CancelText="Cancelar" DeleteText="Eliminar" EditText="Editar" 
                    InsertText="Agregar" NewText="Nuevo" ShowDeleteButton="True" 
                    ShowEditButton="True" ShowInsertButton="True" UpdateText="Actualizar" >
                <ControlStyle Font-Size="Larger" />
                </asp:CommandField>
            </Fields>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="CanchasDS" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:JuguemosConnectionString %>" 
            DeleteCommand="DELETE FROM [Cancha] WHERE [id_cancha] = @original_id_cancha AND (([id_deporte] = @original_id_deporte) OR ([id_deporte] IS NULL AND @original_id_deporte IS NULL)) AND (([descripcion] = @original_descripcion) OR ([descripcion] IS NULL AND @original_descripcion IS NULL))" 
            InsertCommand="INSERT INTO [Cancha] ([id_deporte], [descripcion]) VALUES (@id_deporte, @descripcion)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [Cancha] WHERE ([id_deporte] = @id_deporte)" 
            UpdateCommand="UPDATE [Cancha] SET [id_deporte] = @id_deporte, [descripcion] = @descripcion WHERE [id_cancha] = @original_id_cancha AND (([id_deporte] = @original_id_deporte) OR ([id_deporte] IS NULL AND @original_id_deporte IS NULL)) AND (([descripcion] = @original_descripcion) OR ([descripcion] IS NULL AND @original_descripcion IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_id_cancha" Type="Int32" />
                <asp:Parameter Name="original_id_deporte" Type="Int32" />
                <asp:Parameter Name="original_descripcion" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="id_deporte" Type="Int32" />
                <asp:Parameter Name="descripcion" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="id_deporte" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="id_deporte" Type="Int32" />
                <asp:Parameter Name="descripcion" Type="String" />
                <asp:Parameter Name="original_id_cancha" Type="Int32" />
                <asp:Parameter Name="original_id_deporte" Type="Int32" />
                <asp:Parameter Name="original_descripcion" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
    </div>
</div>
</asp:Content>

