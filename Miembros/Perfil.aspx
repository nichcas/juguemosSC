<%@ Page Title="Mi Perfil" Language="VB" MasterPageFile="~/Miembros/Miembro.master" AutoEventWireup="false" CodeFile="Perfil.aspx.vb" Inherits="Miembros_Perfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<body>
    <div class="container" >
        <div class="tab-pane col-lg-5 col-lg-offset-1 active">
            <asp:LoginName ID="LoginName1" runat="server" Visible="false"/>
            <asp:Label ID="lblUsuario" runat="server" Text="Label" Visible="False"></asp:Label>

            <legend>Mi Perfil</legend>

            <asp:DetailsView ID="DetailsView2" runat="server" Height="50px" Width="90%" 
                AutoGenerateRows="False" DataSourceID="FotoDS" BackColor="White" 
                BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="0px" CellPadding="0" 
                ForeColor="Black" GridLines="Horizontal">
                <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <Fields>
                    <asp:ImageField DataImageUrlField="foto">
                        <ControlStyle Height="150px" Width="150px" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:ImageField>
                </Fields>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="FotoDS" runat="server" 
                ConnectionString="<%$ ConnectionStrings:JuguemosConnectionString %>" 
                SelectCommand="SELECT [foto] FROM [Usuario] WHERE ([username] = @username)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblUsuario" Name="username" 
                        PropertyName="Text" Type="String" />
                </SelectParameters>               
            </asp:SqlDataSource>
            <br />
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <br />
            <asp:Button ID="btnImagen" runat="server" Text="Cambiar Imagen" CssClass="btn btn-primary"  />
            <br />
            <asp:Label ID="lblTexto" runat="server" Text=""></asp:Label>
            <br />
            <asp:DetailsView ID="DetailsView3" runat="server" AutoGenerateRows="False" 
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                CellPadding="4" DataKeyNames="id_usuario" DataSourceID="UsuarioDS" 
                ForeColor="Black" GridLines="Horizontal" Height="50px" Width="90%">
                <EditRowStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="#3399F3" />
                <Fields>
                    <asp:BoundField DataField="id_usuario" HeaderText="ID" InsertVisible="False" 
                        ReadOnly="True" SortExpression="id_usuario" />
                    <asp:BoundField DataField="username" HeaderText="Usuario" ReadOnly="True" 
                        SortExpression="username" />
                    <asp:BoundField DataField="email" HeaderText="Correo" SortExpression="email" />
                    <asp:BoundField DataField="tel" HeaderText="Teléfono" SortExpression="tel" />
                    <asp:BoundField DataField="genero" HeaderText="Género" ReadOnly="True" 
                        SortExpression="genero" />
                    <asp:BoundField DataField="f_nacimiento" HeaderText="Fecha Nac." 
                        SortExpression="f_nacimiento" />
                    <asp:BoundField DataField="edad" HeaderText="Edad" SortExpression="edad" />
                    <asp:BoundField DataField="foto" HeaderText="Foto" ReadOnly="True" 
                        SortExpression="foto" />
                    <asp:CommandField CancelText="Cancelar" EditText="Editar" 
                        ShowEditButton="True" />
                </Fields>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
              <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="UsuarioDS" runat="server" 
                ConflictDetection="CompareAllValues" 
                ConnectionString="<%$ ConnectionStrings:JuguemosConnectionString %>" 
                DeleteCommand="DELETE FROM [Usuario] WHERE [id_usuario] = @original_id_usuario AND (([username] = @original_username) OR ([username] IS NULL AND @original_username IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND (([tel] = @original_tel) OR ([tel] IS NULL AND @original_tel IS NULL)) AND (([genero] = @original_genero) OR ([genero] IS NULL AND @original_genero IS NULL)) AND (([f_nacimiento] = @original_f_nacimiento) OR ([f_nacimiento] IS NULL AND @original_f_nacimiento IS NULL)) AND (([edad] = @original_edad) OR ([edad] IS NULL AND @original_edad IS NULL)) AND (([foto] = @original_foto) OR ([foto] IS NULL AND @original_foto IS NULL))" 
                InsertCommand="INSERT INTO [Usuario] ([username], [email], [tel], [genero], [f_nacimiento], [edad], [foto]) VALUES (@username, @email, @tel, @genero, @f_nacimiento, @edad, @foto)" 
                OldValuesParameterFormatString="original_{0}" 
                SelectCommand="SELECT * FROM [Usuario] WHERE ([username] = @username)" 
                
                UpdateCommand="UPDATE Usuario SET email = @email, tel = @tel, f_nacimiento = @f_nacimiento, edad = @edad WHERE (email = @original_email OR email IS NULL AND @original_email IS NULL) AND (tel = @original_tel OR tel IS NULL AND @original_tel IS NULL) AND (f_nacimiento = @original_f_nacimiento OR f_nacimiento IS NULL AND @original_f_nacimiento IS NULL) AND (edad = @original_edad OR edad IS NULL AND @original_edad IS NULL)">
                <DeleteParameters>
                    <asp:Parameter Name="original_id_usuario" Type="Int32" />
                    <asp:Parameter Name="original_username" Type="String" />
                    <asp:Parameter Name="original_email" Type="String" />
                    <asp:Parameter Name="original_tel" Type="String" />
                    <asp:Parameter Name="original_genero" Type="String" />
                    <asp:Parameter Name="original_f_nacimiento" Type="DateTime" />
                    <asp:Parameter Name="original_edad" Type="Int32" />
                    <asp:Parameter Name="original_foto" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="username" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="tel" Type="String" />
                    <asp:Parameter Name="genero" Type="String" />
                    <asp:Parameter Name="f_nacimiento" Type="DateTime" />
                    <asp:Parameter Name="edad" Type="Int32" />
                    <asp:Parameter Name="foto" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblUsuario" Name="username" 
                        PropertyName="Text" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="tel" Type="String" />
                    <asp:Parameter Name="f_nacimiento" Type="DateTime" />
                    <asp:Parameter Name="edad" Type="Int32" />
                    <asp:Parameter Name="original_email" Type="String" />
                    <asp:Parameter Name="original_tel" Type="String" />
                    <asp:Parameter Name="original_f_nacimiento" Type="DateTime" />
                    <asp:Parameter Name="original_edad" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            
            
        </div>
    </div>
</body>

</asp:Content>

