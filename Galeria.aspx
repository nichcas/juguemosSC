<%@ Page Title="Galeria" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="About.aspx.vb" Inherits="About" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
   

    <link rel="stylesheet" href="css/blueimp-gallery.min.css">

</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
<body id="galeria">
    <div class="container">
   <div class="col-lg-12">
   <h2>
        Galeria
        
    </h2>
    <hr />
    
    
    <div id="blueimp-gallery" class="blueimp-gallery">
    <div class="slides"></div>
    <h3 class="title"></h3>
    <a class="prev">‹</a>
    <a class="next">›</a>
    <a class="close">×</a>
    <a class="play-pause"></a>
    <ol class="indicator"></ol>
    </div>
     
      <div id="links">
    <div class="row">
        
            <a href="galeria/foto17.JPG" class="col-xs-12 col-sm-6 col-md-3">
                <img src="galeria/foto17.JPG" width="100%" height="200">
            </a>

            <a href="galeria/foto21.JPG" class="col-xs-12 col-sm-6 col-md-3">
                <img src="galeria/foto21.jpg"  width="100%" height="200"/>
            </a>

            <a href="galeria/foto18.JPG" class="col-xs-12 col-sm-6 col-md-3">
                <img src="galeria/foto18.jpg"  width="100%" height="200"/>
            </a>

            <a href="galeria/foto19.JPG" class="col-xs-12 col-sm-6 col-md-3">
                <img src="galeria/foto19.jpg"  width="100%" height="200"/>
            </a>
    </div><br />
    <div class="row">

            <a href="galeria/foto20.JPG" class="col-xs-6 col-sm-3">
                <img src="galeria/foto20.jpg"  width="100%" height="200"/>
            </a>
            
            <a href="galeria/foto9.JPG" class="col-xs-6 col-sm-3">
                <img src="galeria/foto9.JPG"  width="100%" height="200">
            </a>
    
            <a href="galeria/foto10.JPG" class="col-xs-6 col-sm-3">
                <img src="galeria/foto10.JPG"  width="100%" height="200">
            </a>

            <a href="galeria/foto11.JPG" class="col-xs-6 col-sm-3">
                <img src="galeria/foto11.JPG"  width="100%" height="200">
            </a>
    </div><br />
    <div class="row">
            <a href="galeria/foto12.JPG" class="col-xs-6 col-sm-3">
                <img src="galeria/foto12.JPG"  width="100%" height="200">
            </a>

            <a href="galeria/foto13.JPG" class="col-xs-6 col-sm-3">
                <img src="galeria/foto13.JPG"  width="100%" height="200">
            </a>

            <a href="galeria/foto14.JPG" class="col-xs-6 col-sm-3">
                <img src="galeria/foto14.JPG" width="100%" height="200">
            </a>

            <a href="galeria/foto15.JPG" class="col-xs-6 col-sm-3">
                <img src="galeria/foto15.JPG"  width="100%" height="200">
            </a>
    </div><br />
    <div class="row">
            <a href="galeria/foto22.JPG" class="col-xs-6 col-sm-3">
                <img src="galeria/foto22.JPG"  width="100%" height="200">
            </a>

            <a href="galeria/foto23.JPG" class="col-xs-6 col-sm-3">
                <img src="galeria/foto23.JPG"  width="100%" height="200">
            </a>

            <a href="galeria/foto24.JPG" class="col-xs-6 col-sm-3">
                <img src="galeria/foto24.JPG"  width="100%" height="200">
            </a>
            
            <a href="galeria/restaurante.jpg" class="col-xs-6 col-sm-3">
                <img src="galeria/restaurante.jpg"  width="100%" height="200">
            </a>
   
   </div>

    </div>

    <div id="Div1" class="blueimp-gallery blueimp-gallery-controls">
    <div class="slides"></div>
    <h3 class="title"></h3>
    <a class="prev">‹</a>
    <a class="next">›</a>
    <a class="close">×</a>
    <a class="play-pause"></a>
    <ol class="indicator"></ol>
  </div>
  </div>

    <script src="js/blueimp-gallery.min.js"></script>

     <script>
         document.getElementById('links').onclick = function (event) {
             event = event || window.event;
             var target = event.target || event.srcElement,
        link = target.src ? target.parentNode : target,
        options = { index: link, event: event },
        links = this.getElementsByTagName('a');
             blueimp.Gallery(links, options);
         };
     </script>

 
 </div>
  </body>
</asp:Content>