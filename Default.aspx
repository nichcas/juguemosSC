<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent" >
    <body id="inicio">
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
              <h1>Another example headline.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <center><img src="imagenes/Carousel6.fw.png" alt="Third slide" /></center>
          <div class="container">
            <div class="carousel-caption">
              <h1>One more for good measure.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
      <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
    </div><!-- /.carousel -->
        <br /><br />
        <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-danger btn-sm" 
            NavigateUrl="~/Admin/Default.aspx" >HyperLink</asp:HyperLink>
</body>

</asp:Content>