<%@ Page Title="Register" Language="VB" MasterPageFile="~/Account/Account.master" AutoEventWireup="false"
    CodeFile="Register.aspx.vb" Inherits="Account_Register" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

<div class="container">
    <div class="col-lg-12">
        <img src="../imagenes/bannerBolas1.fw.png" width="100%" />
        
    </div>
<div class=" col-lg-12">
    <center><h2 class="fondo-inverse">
        Crear cuenta nueva
    </h2></center>
    <center><p>
         Utilice el formulario a continuación para crear una cuenta. 
         Las contraseñas deben de tener un mínimo de<b> <%= Membership.MinRequiredPasswordLength %> </b>caracteres.
    </p></center>
    <form class="form-horizontal">

    <asp:CreateUserWizard ID="RegisterUser" runat="server" EnableViewState="false">
        <LayoutTemplate>
            <asp:PlaceHolder ID="wizardStepPlaceholder" runat="server"></asp:PlaceHolder>
            <asp:PlaceHolder ID="navigationPlaceholder" runat="server"></asp:PlaceHolder>
        </LayoutTemplate>
        <WizardSteps>
            <asp:CreateUserWizardStep ID="RegisterUserWizardStep" runat="server">
                <ContentTemplate>
                    
                    <span class="failureNotification">
                        <asp:Literal ID="ErrorMessage" runat="server"></asp:Literal>
                    </span>
                    <asp:ValidationSummary ID="RegisterUserValidationSummary" runat="server" CssClass="failureNotification" 
                         ValidationGroup="RegisterUserValidationGroup"/>
                    <div class="accountInfo">

            <fieldset class="register">
                    <legend>Información de la Cuenta</legend>

        <div class="col-sm-6">
        <div class="form-group">
          <asp:Label ID="lblNombre" runat="server" AssociatedControlID="UserName" CssClass="col-lg-3 control-label">Nombre:</asp:Label>
          <div class="col-lg-9">
               <asp:TextBox ID="UserName" runat="server" CssClass="textEntry form-control"></asp:TextBox>
               <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" 
               CssClass="failureNotification" ErrorMessage="User Name is required." ToolTip="User Name is required." 
               ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
          </div>
        </div>

        <div class="form-group">
          <asp:Label ID="lblApellido" runat="server" AssociatedControlID="txtApellido" CssClass="col-lg-3 control-label">Apellido:</asp:Label>
          <div class="col-lg-9">
               <asp:TextBox ID="txtApellido" runat="server" CssClass="textEntry form-control"></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtApellido" 
               CssClass="failureNotification" ErrorMessage="User Name is required." ToolTip="User Name is required." 
               ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
          </div>
        </div>

        <div class="form-group">
          <asp:Label ID="lblEmail" runat="server" AssociatedControlID="Email" CssClass="col-lg-3 control-label">Email:</asp:Label>
          <div class="col-lg-9">
               <asp:TextBox ID="Email" runat="server" CssClass="textEntry form-control"></asp:TextBox>
               <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" 
               CssClass="failureNotification" ErrorMessage="E-mail is required." ToolTip="E-mail is required." 
               ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
          </div>
        </div>

        <div class="form-group">
             <asp:Label ID="lblPassword" runat="server" AssociatedControlID="Password" CssClass="col-lg-3 control-label">Contraseña:</asp:Label>
             <div class="col-lg-9 clearfix">
                  <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry form-control" TextMode="Password"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" 
                  CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required." 
                  ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
             </div>
        </div>
         
        <div class="form-group">
             <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-lg-3 control-label">Confirmar Contraseña:</asp:Label>
             <div class="col-lg-9 clearfix">
                  <asp:TextBox ID="ConfirmPassword" runat="server" CssClass="passwordEntry form-control" TextMode="Password"></asp:TextBox>
                  <asp:RequiredFieldValidator ControlToValidate="ConfirmPassword" CssClass="failureNotification" Display="Dynamic" 
                     ErrorMessage="Confirm Password is required." ID="ConfirmPasswordRequired" runat="server" 
                     ToolTip="Confirm Password is required." ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                  <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                     CssClass="failureNotification" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match."
                     ValidationGroup="RegisterUserValidationGroup">*</asp:CompareValidator>
             </div>
        </div>
        </div>
        <div class="col-sm-6">
        
        <div class="form-group">
          <asp:Label ID="lblTel" runat="server" AssociatedControlID="txtTel" CssClass="col-lg-3 control-label">Teléfono:</asp:Label>
          <div class="col-lg-9">
               <asp:TextBox ID="txtTel" runat="server" CssClass="textEntry form-control"></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTel" 
               CssClass="failureNotification" ErrorMessage="User Name is required." ToolTip="User Name is required." 
               ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
          </div>
        </div>

        <div class="form-group">
            <asp:Label ID="lblGenero" runat="server" AssociatedControlID="drdGenero" CssClass="col-sm-3 control-label">Genero:</asp:Label>
            <div class="col-sm-9">
                <asp:DropDownList ID="drdGenero" runat="server"  CssClass="form-control input-md">
                    <asp:ListItem>Hombre</asp:ListItem>
                    <asp:ListItem>Mujer</asp:ListItem>                               
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="drdGenero" 
                    CssClass="failureNotification" ErrorMessage="Debe de ingresar una fecha." ToolTip="La fecha es requerida." 
                    ValidationGroup="RegisterUserValidationGroup"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <asp:Label ID="lblFecha" runat="server" AssociatedControlID="drdano" CssClass="col-sm-3 control-label">F. Nacimiento:</asp:Label>
            <div class="col-sm-3">
                <asp:DropDownList ID="drdano" runat="server"  CssClass="form-control input-md" placeholder="Usar el calendario">
                    <asp:ListItem>2014</asp:ListItem>
                    <asp:ListItem>2013</asp:ListItem>    
                    <asp:ListItem>2012</asp:ListItem>
                    <asp:ListItem>2010</asp:ListItem> 
                    <asp:ListItem>2009</asp:ListItem>
                    <asp:ListItem>2008</asp:ListItem> 
                    <asp:ListItem>2007</asp:ListItem>
                    <asp:ListItem>2006</asp:ListItem> 
                    <asp:ListItem>2005</asp:ListItem>
                    <asp:ListItem>2004</asp:ListItem>   
                    <asp:ListItem>2003</asp:ListItem>  
                    <asp:ListItem>2002</asp:ListItem>  
                    <asp:ListItem>2001</asp:ListItem>  
                    <asp:ListItem>2000</asp:ListItem>  
                    <asp:ListItem>1999</asp:ListItem>  
                    <asp:ListItem>1998</asp:ListItem>  
                    <asp:ListItem>1997</asp:ListItem>  
                    <asp:ListItem>1996</asp:ListItem>  
                    <asp:ListItem>1995</asp:ListItem>  
                    <asp:ListItem>1994</asp:ListItem>  
                    <asp:ListItem>1993</asp:ListItem>  
                    <asp:ListItem>1992</asp:ListItem>  
                    <asp:ListItem>1991</asp:ListItem>  
                    <asp:ListItem>1990</asp:ListItem>  
                    <asp:ListItem>1989</asp:ListItem>  
                    <asp:ListItem>1988</asp:ListItem>  
                    <asp:ListItem>1987</asp:ListItem>  
                    <asp:ListItem>1986</asp:ListItem>  
                    <asp:ListItem>1985</asp:ListItem>  
                    <asp:ListItem>1984</asp:ListItem>  
                    <asp:ListItem>1983</asp:ListItem>  
                    <asp:ListItem>1982</asp:ListItem>  
                    <asp:ListItem>1981</asp:ListItem>  
                    <asp:ListItem>1980</asp:ListItem>  
                    <asp:ListItem>1979</asp:ListItem>  
                    <asp:ListItem>1978</asp:ListItem>  
                    <asp:ListItem>1977</asp:ListItem>  
                    <asp:ListItem>1976</asp:ListItem>  
                    <asp:ListItem>1975</asp:ListItem>  
                    <asp:ListItem>1974</asp:ListItem>  
                    <asp:ListItem>1973</asp:ListItem>  
                    <asp:ListItem>1972</asp:ListItem>  
                    <asp:ListItem>1971</asp:ListItem>  
                    <asp:ListItem>1970</asp:ListItem>  
                    <asp:ListItem>1969</asp:ListItem>  
                    <asp:ListItem>1968</asp:ListItem>  
                    <asp:ListItem>1967</asp:ListItem>  
                    <asp:ListItem>1966</asp:ListItem>  
                    <asp:ListItem>1965</asp:ListItem>  
                    <asp:ListItem>1964</asp:ListItem>  
                    <asp:ListItem>1963</asp:ListItem>  
                    <asp:ListItem>1962</asp:ListItem>  
                    <asp:ListItem>1961</asp:ListItem>  
                    <asp:ListItem>1960</asp:ListItem>  
                    <asp:ListItem>1959</asp:ListItem>  
                    <asp:ListItem>1958</asp:ListItem>  
                    <asp:ListItem>1957</asp:ListItem>  
                    <asp:ListItem>1956</asp:ListItem>  
                    <asp:ListItem>1955</asp:ListItem>  
                    <asp:ListItem>1954</asp:ListItem>  
                    <asp:ListItem>1953</asp:ListItem>  
                    <asp:ListItem>1952</asp:ListItem>  
                    <asp:ListItem>1951</asp:ListItem>  
                    <asp:ListItem>1950</asp:ListItem>  
                    <asp:ListItem>1949</asp:ListItem>  
                    <asp:ListItem>1948</asp:ListItem>  
                    <asp:ListItem>1947</asp:ListItem>  
                    <asp:ListItem>1946</asp:ListItem>  
                    <asp:ListItem>1945</asp:ListItem>  
                    <asp:ListItem>1944</asp:ListItem>  
                    <asp:ListItem>1943</asp:ListItem>  
                    <asp:ListItem>1942</asp:ListItem>  
                    <asp:ListItem>1941</asp:ListItem>  
                    <asp:ListItem>1940</asp:ListItem>  
                    <asp:ListItem>1939</asp:ListItem>  
                    <asp:ListItem>1938</asp:ListItem>  
                    <asp:ListItem>1937</asp:ListItem>  
                    <asp:ListItem>1936</asp:ListItem>  
                    <asp:ListItem>1935</asp:ListItem>  
                    <asp:ListItem>1934</asp:ListItem>  
                    <asp:ListItem>1933</asp:ListItem>  
                    <asp:ListItem>1932</asp:ListItem>  
                    <asp:ListItem>1931</asp:ListItem>  
                    <asp:ListItem>1930</asp:ListItem>  
                    <asp:ListItem>1929</asp:ListItem>  
                    <asp:ListItem>1928</asp:ListItem>  
                    <asp:ListItem>1927</asp:ListItem>  
                    <asp:ListItem>1926</asp:ListItem>  
                    <asp:ListItem>1925</asp:ListItem>  
                    <asp:ListItem>1924</asp:ListItem>  
                    <asp:ListItem>1923</asp:ListItem>  
                    <asp:ListItem>1922</asp:ListItem>  
                    <asp:ListItem>1921</asp:ListItem>  
                    <asp:ListItem>1920</asp:ListItem>  
                         
                </asp:DropDownList>
                
                        
            </div>
            <div class="col-sm-3">
                <asp:DropDownList ID="DropDownList2" runat="server"  CssClass="form-control input-md">
                    <asp:ListItem>Enero</asp:ListItem>
                    <asp:ListItem>Febrero</asp:ListItem>
                    <asp:ListItem>Marzo</asp:ListItem>
                    <asp:ListItem>Abril</asp:ListItem> 
                    <asp:ListItem>Mayo</asp:ListItem>
                    <asp:ListItem>Junio</asp:ListItem> 
                    <asp:ListItem>Julio</asp:ListItem>
                    <asp:ListItem>Agosto</asp:ListItem> 
                    <asp:ListItem>Setiembre</asp:ListItem>
                    <asp:ListItem>Octubre</asp:ListItem> 
                    <asp:ListItem>Noviembre</asp:ListItem>
                    <asp:ListItem>Diciembre</asp:ListItem>                                
                </asp:DropDownList>
                            
            </div>
            <div class="col-sm-3">
                <asp:DropDownList ID="DropDownList3" runat="server"  CssClass="form-control input-md">
                    <asp:ListItem>1</asp:ListItem>  
                    <asp:ListItem>2</asp:ListItem>  
                    <asp:ListItem>3</asp:ListItem>  
                    <asp:ListItem>4</asp:ListItem>  
                    <asp:ListItem>5</asp:ListItem>  
                    <asp:ListItem>6</asp:ListItem>  
                    <asp:ListItem>7</asp:ListItem>  
                    <asp:ListItem>8</asp:ListItem>  
                    <asp:ListItem>9</asp:ListItem>  
                    <asp:ListItem>10</asp:ListItem>  
                    <asp:ListItem>11</asp:ListItem>  
                    <asp:ListItem>12</asp:ListItem>  
                    <asp:ListItem>13</asp:ListItem>  
                    <asp:ListItem>14</asp:ListItem>  
                    <asp:ListItem>15</asp:ListItem>  
                    <asp:ListItem>16</asp:ListItem>  
                    <asp:ListItem>17</asp:ListItem>  
                    <asp:ListItem>18</asp:ListItem>  
                    <asp:ListItem>19</asp:ListItem>  
                    <asp:ListItem>20</asp:ListItem>  
                    <asp:ListItem>21</asp:ListItem>  
                    <asp:ListItem>22</asp:ListItem>  
                    <asp:ListItem>23</asp:ListItem>  
                    <asp:ListItem>24</asp:ListItem>  
                    <asp:ListItem>25</asp:ListItem>  
                    <asp:ListItem>26</asp:ListItem>  
                    <asp:ListItem>27</asp:ListItem>  
                    <asp:ListItem>28</asp:ListItem>  
                    <asp:ListItem>29</asp:ListItem>  
                    <asp:ListItem>30</asp:ListItem>  
                    <asp:ListItem>31</asp:ListItem>                              
                </asp:DropDownList>
                <br />
            
            </div>
        </div>
        
        <div class="form-group">
            <asp:Label ID="Label1" runat="server" AssociatedControlID="drdano" CssClass="col-sm-3 control-label">Foto:</asp:Label>
            <div class="col-sm-9">
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="textEntry form-control" />
            <br />
            </div>
        </div>

        <div class="col-sm-3"></div>
        <div class="col-sm-9">
            <p class="submitButton">
                <asp:Button ID="CreateUserButton" runat="server" CssClass="btn btn-primary" CommandName="MoveNext" Text="Crear Usuario" 
                        ValidationGroup="RegisterUserValidationGroup"/>
            </p>
        </div>
        </div>   
            </fieldset>
                </ContentTemplate>
                       <CustomNavigationTemplate>
                       </CustomNavigationTemplate>
            </asp:CreateUserWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
    
    </form> 
    
    
    
    </div>
              
</div>    
</div>

</asp:Content>