<%@ Page Title="Inicio" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent" >
    <body>
    <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-danger btn-block" 
            NavigateUrl="~/Admin/Default.aspx" >Área Administrativa</asp:HyperLink>
            <br />
     <!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
        <div class="item active">
            <center><img src="imagenes/Carousel4.fw.png" alt="First slide" /></center>
          <div class="container">
            <div class="carousel-caption">
              <h1>¿No tiene con quien practicar deportes?</h1>
              <p>Encuentre ahora mismo un partido al cual le gustaría incorporarse</p>
              <p><a class="btn btn-lg btn-primary" href="Account/Register.aspx" role="button">Registrese Hoy</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <center><img src="imagenes/Carousel5.fw.png" alt="Second slide" /></center>
          <div class="container">
            <div class="carousel-caption">
              <h1>¿Con cuáles actividades contamos?</h1>
              <p>Visite nuestra galería de fotos.</p>
              <p><a class="btn btn-lg btn-primary" href="Galerias.aspx" role="button">Ver Galería</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <center><img src="imagenes/Carousel6.fw.png" alt="Third slide" /></center>
          <div class="container">
            <div class="carousel-caption">
              <h1>¿Desea más información?</h1>
              <p>Mándenos sus consultas mediante el formulario de contáctenos.</p>
              <p><a class="btn btn-lg btn-primary" href="Contact.aspx" role="button">Browse gallery</a></p>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
      <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
    </div><!-- /.carousel -->
        
        
</body>

</asp:Content>