<%@ Page Title="Mi Perfil" Language="VB" MasterPageFile="~/Miembros/Miembro.master" AutoEventWireup="false" CodeFile="Perfil.aspx.vb" Inherits="Miembros_Mensajes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <body id="perfil">
    <div class="container" >
        <div class="tab-pane col-lg-8 col-lg-offset-1 active">
            <asp:LoginName ID="LoginName1" runat="server" Visible="false"/>
            <asp:Label ID="lblUsuario" runat="server" Text="Label" Visible="False"></asp:Label>

            <legend>Mi Perfil</legend>

            <asp:DetailsView ID="DetailsView2" runat="server" Height="50px" Width="125px" 
                AutoGenerateRows="False" DataSourceID="FotoDS" BackColor="White" 
                BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="0px" CellPadding="0" 
                ForeColor="Black" GridLines="Horizontal">
                <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <Fields>
                    <asp:ImageField DataImageUrlField="foto">
                        <ControlStyle Height="250px" Width="250px" />
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
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="60%" 
                AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" 
                BorderStyle="None" BorderWidth="1px" CellPadding="10" DataKeyNames="id_usuario" 
                DataSourceID="PerfilDS" ForeColor="Black" GridLines="Horizontal">
                <EditRowStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="Black" />
                <Fields>
                    <asp:BoundField DataField="email" HeaderText="E-mail:     " 
                        SortExpression="email">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="tel" HeaderText="No. Telefónico:" 
                        SortExpression="tel">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    
                    <asp:CommandField ShowEditButton="True">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:CommandField>
                </Fields>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="Black" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="PerfilDS" runat="server" 
                ConflictDetection="CompareAllValues" 
                ConnectionString="<%$ ConnectionStrings:JuguemosConnectionString %>" 
                DeleteCommand="DELETE FROM [Usuario] WHERE [id_usuario] = @original_id_usuario AND (([username] = @original_username) OR ([username] IS NULL AND @original_username IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND (([tel] = @original_tel) OR ([tel] IS NULL AND @original_tel IS NULL)) AND (([genero] = @original_genero) OR ([genero] IS NULL AND @original_genero IS NULL)) AND (([f_nacimiento] = @original_f_nacimiento) OR ([f_nacimiento] IS NULL AND @original_f_nacimiento IS NULL)) AND (([edad] = @original_edad) OR ([edad] IS NULL AND @original_edad IS NULL)) AND (([foto] = @original_foto) OR ([foto] IS NULL AND @original_foto IS NULL))" 
                InsertCommand="INSERT INTO [Usuario] ([username], [email], [tel], [genero], [f_nacimiento], [edad], [foto]) VALUES (@username, @email, @tel, @genero, @f_nacimiento, @edad, @foto)" 
                OldValuesParameterFormatString="original_{0}" 
                SelectCommand="SELECT * FROM [Usuario] WHERE ([username] = @username)" 
                UpdateCommand="UPDATE [Usuario] SET [username] = @username, [email] = @email, [tel] = @tel, [genero] = @genero, [f_nacimiento] = @f_nacimiento, [edad] = @edad, [foto] = @foto WHERE [id_usuario] = @original_id_usuario AND (([username] = @original_username) OR ([username] IS NULL AND @original_username IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND (([tel] = @original_tel) OR ([tel] IS NULL AND @original_tel IS NULL)) AND (([genero] = @original_genero) OR ([genero] IS NULL AND @original_genero IS NULL)) AND (([f_nacimiento] = @original_f_nacimiento) OR ([f_nacimiento] IS NULL AND @original_f_nacimiento IS NULL)) AND (([edad] = @original_edad) OR ([edad] IS NULL AND @original_edad IS NULL)) AND (([foto] = @original_foto) OR ([foto] IS NULL AND @original_foto IS NULL))">
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
                    <asp:Parameter Name="username" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="tel" Type="String" />
                    <asp:Parameter Name="genero" Type="String" />
                    <asp:Parameter Name="f_nacimiento" Type="DateTime" />
                    <asp:Parameter Name="edad" Type="Int32" />
                    <asp:Parameter Name="foto" Type="String" />
                    <asp:Parameter Name="original_id_usuario" Type="Int32" />
                    <asp:Parameter Name="original_username" Type="String" />
                    <asp:Parameter Name="original_email" Type="String" />
                    <asp:Parameter Name="original_tel" Type="String" />
                    <asp:Parameter Name="original_genero" Type="String" />
                    <asp:Parameter Name="original_f_nacimiento" Type="DateTime" />
                    <asp:Parameter Name="original_edad" Type="Int32" />
                    <asp:Parameter Name="original_foto" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            
            
        </div>
    </div>
</body>
</asp:Content>

