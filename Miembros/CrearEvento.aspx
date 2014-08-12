<%@ Page Title="Crear Eventos" Language="VB" MasterPageFile="~/Miembros/Miembro.master" AutoEventWireup="false" CodeFile="CrearEvento.aspx.vb" Inherits="Miembros_CrearEvento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
 <body id="crear">  
 <asp:LoginName ID="LoginName1" runat="server" Visible="false" />
     <asp:Label ID="lblUsuario" runat="server" Text="Label" Visible="false"></asp:Label>
     <fieldset class="col-sm-8 col-lg-offset-1">

  
                      
            <form class="form-horizontal" action="">
<legend>Detalles del Evento</legend>
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
                            DataTextField="descripcion" DataValueField="id_cancha" 
                            CssClass="form-control input-md" AutoPostBack="True">
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
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-calendar"></span></button>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblHora" runat="server" AssociatedControlID="drdHora" CssClass="col-sm-3 control-label">Hora:</asp:Label>
                    <div class="col-sm-9">
                        <asp:DropDownList ID="drdHora" runat="server" CssClass="form-control input-md" 
                            DataSourceID="HoraDS" DataTextField="hora" DataValueField="hora" 
                            ToolTip="Llenar fecha y cancha">
                            
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="HoraDS" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:JuguemosConnectionString %>" 
                            
                            SelectCommand="SELECT hora FROM horas_diponibles WHERE (id_hora NOT IN (SELECT DATEPART(HOUR, ce.hora) AS Expr1 FROM Crear_Evento AS ce INNER JOIN Cancha AS c ON ce.id_cancha = c.id_cancha INNER JOIN EstadoEvento AS ee ON ce.id_evento = ee.id_evento WHERE (ce.id_cancha = @cancha) AND (ce.fecha = @fecha) AND (ee.estado = 1)))">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="drdCancha" Name="cancha" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="txtFecha" Name="fecha" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="drdCancha" 
                        CssClass="failureNotification" ErrorMessage="Debe de ingresar una fecha." ToolTip="La fecha es requerida." 
                        ValidationGroup="RegisterUserValidationGroup"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" AssociatedControlID="drdParticipantes" CssClass="col-sm-3 control-label">Participantes:</asp:Label>
                    <div class="col-sm-9">
                        <asp:DropDownList ID="drdParticipantes" runat="server" 
                            DataSourceID="ParticipantesDS" DataTextField="cantidad" 
                            DataValueField="cantidad" CssClass="form-control input-md" 
                            AutoPostBack="True">
                        </asp:DropDownList>
                                
                        <asp:SqlDataSource ID="ParticipantesDS" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:JuguemosConnectionString %>" 
                            SelectCommand="SELECT * FROM [ParticipantesXdeporte] WHERE ([id_deporte] = @id_deporte)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="drdDeportes" Name="id_deporte" 
                                    PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                                
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="drdDeportes" 
                        CssClass="failureNotification" ErrorMessage="Debe de ingresar una fecha." ToolTip="La fecha es requerida." 
                        ValidationGroup="RegisterUserValidationGroup"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" >
                    <div class="modal-dialog">
                        <div class="modal-content">
                                    
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
                                <asp:Button ID="btnCal" runat="server" Text="Cerrar" CssClass="btn btn-default" data-dismiss="modal"/>
                                                            
                            </div>
                        </div>
                    </div>
                </div>
                    
                <div class="panel-group" id="accordion">
                            
                    
                    <legend>       
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">                    
                        Restricciones (Opcionales) <span class="glyphicon glyphicon-chevron-down pull-right"></span>
                    </a></legend> 
                             
                               
                    <div id="collapseOne" class="panel-collapse collapse">
                        <div class="panel-body">

                            <div class="form-group">
                                <asp:Label ID="lblMin" runat="server" AssociatedControlID="txtMin" CssClass="col-sm-3 control-label">(Edad) Min:</asp:Label>
                                <div class="col-lg-3">
                                    <asp:TextBox ID="txtMin" runat="server" CssClass="textEntry form-control"></asp:TextBox>
                                </div>
                            
                                <asp:Label ID="lblMax" runat="server" AssociatedControlID="txtMax" CssClass="col-sm-3 control-label">Max:</asp:Label>
                                <div class="col-lg-3">
                                    <asp:TextBox ID="txtMax" runat="server" CssClass="textEntry form-control"></asp:TextBox>
                                <br />   
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label2" runat="server" AssociatedControlID="drdParam" CssClass="col-sm-3 control-label">Participantes:</asp:Label>
                                <div class="col-sm-9">
                                            
                                    <asp:DropDownList ID="drdParam" runat="server" CssClass="form-control input-md">
                                        <asp:ListItem Value="Mixto">Mixto</asp:ListItem>
                                        <asp:ListItem Value="Hombres">Solo Hombres</asp:ListItem>
                                        <asp:ListItem Value="Mujeres">Solo Mujeres</asp:ListItem>                                                    
                                    </asp:DropDownList>    
                                                
                                </div>
                            </div>
                                    

                        </div>
                    </div>
                
                 
                <div class="col-sm-9 col-sm-offset-3 ">                          
                    <asp:Button ID="btnCrear" runat="server" Text="Crear Evento" CssClass="btn btn-primary"  />
                </div>
                        
            </form>
     </fieldset >
                   
 </body> 
</asp:Content>

