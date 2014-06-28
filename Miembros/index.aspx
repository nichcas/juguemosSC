<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="false" CodeFile="index.aspx.vb" Inherits="Miembros_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="container">
    
    <div class="row col-lg-3">
        <h3>Bienvenido / a <span class="bold"><asp:LoginName ID="HeadLoginName" runat="server" /></span>!</h3>
        <img src="../imagenes/ImagePlaceholder1.fw.png" />
    </div>
    
    <div class="col-lg-9">
        <div class="tabbable tabs">
   	        <ul class="nav nav-tabs">
                 <li class="active"><a href="#eventos" data-toggle="tab">Eventos Disponibles</a></li>
                 <li><a href="#crear" data-toggle="tab">Crear Eventos</a></li>
                 <li><a href="#mensajes" data-toggle="tab">Mensajes <span class="badge"> 42</span></a></li>
            </ul><!--nav nav-tabs-->
        </div><!--tabbable tabs-->
   
        <div class="tab-content">
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
                        
           

        <div class="tab-pane col-lg-8 col-lg-offset-1" id="crear"><br />
        
              <fieldset class="col-sm-12">
                        <legend>Detalles del Evento</legend>
                      
                    <form class="form-horizontal" action="">

                        <div class="form-group">
                            <asp:Label ID="lblDep" runat="server" AssociatedControlID="drdDeportes" CssClass="col-sm-3 control-label">Deporte:</asp:Label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="drdDeportes" runat="server" AutoPostBack="True" 
                                    DataSourceID="DeportesDS" DataTextField="descripcion" 
                                    DataValueField="id_deporte" CssClass="form-control input-md">
                                </asp:DropDownList>                        
                                <asp:SqlDataSource ID="DeportesDS" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:JuguemosConnectionString %>" 
                                SelectCommand="SELECT * FROM [Deporte]"></asp:SqlDataSource>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="drdDeportes" 
                                CssClass="failureNotification" ErrorMessage="Debe de ingresar una fecha." ToolTip="La fecha es requerida." 
                                ValidationGroup="RegisterUserValidationGroup"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblCancha" runat="server" AssociatedControlID="drdCancha" CssClass="col-sm-3 control-label">Cancha:</asp:Label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="drdCancha" runat="server" DataSourceID="CanchasDS" 
                                    DataTextField="descripcion" DataValueField="id_cancha" CssClass="form-control input-md">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="CanchasDS" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:JuguemosConnectionString %>" 
                                    SelectCommand="SELECT * FROM [Cancha] WHERE ([id_deporte] = @id_deporte)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="drdDeportes" DefaultValue="1" 
                                            Name="id_deporte" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="drdCancha" 
                                CssClass="failureNotification" ErrorMessage="Debe de ingresar una fecha." ToolTip="La fecha es requerida." 
                                ValidationGroup="RegisterUserValidationGroup"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblFecha" runat="server" AssociatedControlID="txtFecha" CssClass="col-sm-3 control-label">Fecha:</asp:Label>
                            <div class="col-sm-7">
                                <asp:TextBox ID="txtFecha" runat="server" CssClass="textEntry form-control" placeholder="Usar el calendario" ReadOnly="True"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFecha" 
                                CssClass="failureNotification" ErrorMessage="Debe de ingresar una fecha." ToolTip="La fecha es requerida." 
                                ValidationGroup="RegisterUserValidationGroup"></asp:RequiredFieldValidator>
                            </div>
                            <button type="button" class="btn btn-primary btn-large" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-calendar"></span></button>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblHora" runat="server" AssociatedControlID="drdHora" CssClass="col-sm-3 control-label">Hora:</asp:Label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="drdHora" runat="server"  
                                    DataTextField="descripcion" DataValueField="id_cancha" CssClass="form-control input-md">
                                    <asp:ListItem>6:00 AM</asp:ListItem>
                                    <asp:ListItem>7:00 AM</asp:ListItem>
                                    <asp:ListItem>8:00 AM</asp:ListItem>
                                    <asp:ListItem>9:00 AM</asp:ListItem>
                                    <asp:ListItem>10:00 AM</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="drdCancha" 
                                CssClass="failureNotification" ErrorMessage="Debe de ingresar una fecha." ToolTip="La fecha es requerida." 
                                ValidationGroup="RegisterUserValidationGroup"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="Label1" runat="server" AssociatedControlID="drdParticipantes" CssClass="col-sm-3 control-label">Participantes:</asp:Label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="drdParticipantes" runat="server" 
                                    DataSourceID="ParticipantesDS" DataTextField="descripcion" 
                                    DataValueField="id_PxD" CssClass="form-control input-md">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="ParticipantesDS" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:JuguemosConnectionString %>" 
                                    SelectCommand="SELECT * FROM [ParticipantesXdeporte] WHERE ([id_deporte] = @id_deporte)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="drdDeportes" DefaultValue="1" 
                                            Name="id_deporte" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="drdDeportes" 
                                CssClass="failureNotification" ErrorMessage="Debe de ingresar una fecha." ToolTip="La fecha es requerida." 
                                ValidationGroup="RegisterUserValidationGroup"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="purchaseLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title" id="purchaseLabel">Purchase</h4>
                                    </div>
                                    <div class="modal-body">
                                        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" 
                                            BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" 
                                            ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="100%">
                                            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
                                                VerticalAlign="Bottom" />
                                            <OtherMonthDayStyle ForeColor="#999999" />
                                            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                            <TitleStyle BackColor="#CCCCCC" BorderColor="White" BorderWidth="1px" 
                                                Font-Bold="True" Font-Size="12pt" ForeColor="#3399F3" />
                                            <TodayDayStyle BackColor="#CCCCCC" />
                                       </asp:Calendar>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>                    
                                    </div>
                                </div>
                            </div>
                        </div>
                    
                    </form>
                    </fieldset >

                    <fieldset class="col-sm-12">
                        <legend>Restricciones (Opcionales)</legend>
                    
                    <form class="form-horizontal" action="">                    
                        
                        <div class="form-group">
                            <asp:Label ID="lblMin" runat="server" AssociatedControlID="txtMin" CssClass="col-sm-3 control-label">(Edad) Min:</asp:Label>
                            <div class="col-lg-3">
                                <asp:TextBox ID="txtMin" runat="server" CssClass="textEntry form-control"></asp:TextBox>
                            </div>
                            
                            <asp:Label ID="lblMax" runat="server" AssociatedControlID="txtMax" CssClass="col-sm-3 control-label">Max:</asp:Label>
                            <div class="col-lg-3">
                                <asp:TextBox ID="txtMax" runat="server" CssClass="textEntry form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="Label2" runat="server" AssociatedControlID="drdParticipantes" CssClass="col-sm-3 control-label">Participantes:</asp:Label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ResGeneroDS" 
                                    DataTextField="descripcion" DataValueField="id_pg" CssClass="form-control input-md">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="ResGeneroDS" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:JuguemosConnectionString %>" 
                                    SelectCommand="SELECT * FROM [ParamGenero]" ></asp:SqlDataSource>
                            </div>
                        </div>
                    </form>
                    </fieldset >

                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-9">
                      <button type="submit" class="btn btn-primary">Crear Evento</button>
                    </div>
                </div>   
    
            
        </div>
            <div class="tab-pane" id="mensajes"><br />
                <p>Ver los mensajes de cada quien</p>
            </div>
        </div>
    </div>
    
</div>
</asp:Content>

