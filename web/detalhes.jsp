<%@page import="modelo.Anuncio"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Vende Mais</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">        
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,400italic">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/style3.css">
        <link rel="shortcut icon" href="images/i.ico">    
    </head>

    <body class="contact-page">
        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <div class="main-body">
            <div class="container">
                <div class="row">
                    <div class="main-page">
                        <aside class="main-navigation">
                            <div class="main-menu">
                                
                                <div class="menu-container">
                                    <div class="block-keep-ratio block-keep-ratio-2-1 block-width-full homedata">
                                        <a><span class="main-menu-link-text"><font color="#FFFFFF" size="3"><b><script src="js/saudacao.js"></script><br></b></font> </span>
                                        </a>
                                    </div>
                                </div>
                                
                                <div class="menu-container">  
                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-left  about-main">                                    
                                        <a href="index.jsp" class="main-menu-link about block-keep-ratio__content flexbox-center">
                                            <p align="center"><img src="images/home.png" height="60" width="60"></p>
                                            HOME
                                        </a>                                    
                                    </div>                                    
                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-right  contact-main">
                                        <a href="contact.jsp" class="main-menu-link contact block-keep-ratio__content flexbox-center">
                                            <i class="fa fa-envelope-o fa-4x main-menu-link-icon"></i>
                                            CONTATO
                                        </a>                                
                                    </div>                                    
                                </div>
                                
                                <div class="menu-container">                                
                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-left  about-main">                                    
                                        <a href="consultarConta" class="main-menu-link about block-keep-ratio__content flexbox-center">
                                            <i class="fa fa-user fa-4x main-menu-link-icon"></i>
                                            CONTA
                                        </a>                                    
                                    </div>
                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-right  contact-main">
                                        <a href="logout" class="main-menu-link contact block-keep-ratio__content flexbox-center">
                                            <p align="center"><img src="images/logout.png" height="60" width="60"></p>
                                            LOGOUT
                                        </a>                                
                                    </div>
                                </div> 

                                <div class="menu-container">  
                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-right  contact-main">
                                        <a href="historicoCompra" class="main-menu-link contact block-keep-ratio__content flexbox-center">
                                            <p align="center"><img src="images/compra.png" height="60" width="60"></p>
                                            COMPRAS
                                        </a>                                
                                    </div> 

                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-left  about-main">                                    
                                        <a href="historicoVenda" class="main-menu-link about block-keep-ratio__content flexbox-center">
                                            <p align="center"><img src="images/venda.png" height="60" width="60"></p>
                                            VENDAS
                                        </a>                                    
                                    </div>   
                                </div> 
        
                                <div class="menu-container">
                                    <div class="block-keep-ratio block-keep-ratio-2-1 block-width-full home">
                                        <a href="index.jsp" class="block-keep-ratio__content  main-menu-link"> <span class="main-menu-link-text"></span>
                                        </a>
                                    </div>
                                </div>
                            </div> <!-- main-menu -->
                        </aside> 

                        <div class="content-main contact-content">
                            <div class="contact-content-upper">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="gallery_title">
                                            <h3>VENDEMAIS</h3>
                                            <h4>DETALHES DA z</h4>
                                        </div>    
                                    </div>                            
                                </div>
                                <%
                                    Anuncio anuncio = (Anuncio) request.getAttribute("resultado");
                                    if (anuncio != null) {
                                %>   
                                <div class="row">  
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">        
                                        <div class="row">
                                            <div class="preview col-md-6">

                                                <div class="preview-pic tab-content">
                                                    <p align="center"><div class="tab-pane" id="pic-1"><img src="images/venda.png"  height="300" width="200"></div></p>
                                                    <div class="tab-pane" id="pic-2"><img src="http://placekitten.com/400/252" height="300" width="200"></div>
                                                    <div class="tab-pane" id="pic-3"><img src="http://placekitten.com/400/252" height="300" width="200"></div>
                                                    <div class="tab-pane" id="pic-4"><img src="http://placekitten.com/400/252" height="300" width="200"></div>
                                                    <div class="tab-pane active" id="pic-5"><img src="http://placekitten.com/400/252" height="300" width="200"></div>
                                                </div>
                                                <ul class="preview-thumbnail nav nav-tabs">
                                                    <li class=""><a data-target="#pic-1" data-toggle="tab" aria-expanded="false"><img src="images/venda.png" height="60" width="60" ></a></li>
                                                    <li class=""><a data-target="#pic-2" data-toggle="tab" aria-expanded="false"><img src="http://placekitten.com/200/126" height="60" width="60"></a></li>
                                                    <li><a data-target="#pic-3" data-toggle="tab"><img src="http://placekitten.com/200/126" height="60" width="60"></a></li>
                                                    <li class=""><a data-target="#pic-4" data-toggle="tab" aria-expanded="false"><img src="http://placekitten.com/200/126" height="60" width="60"></a></li>
                                                    <li class="active"><a data-target="#pic-5" data-toggle="tab" aria-expanded="true"><img src="http://placekitten.com/200/126" height="60" width="60"></a></li>
                                                </ul>


                                            </div>
                                            <div class="col-xs-5" style="border:0px solid gray">
                                                <!-- Datos del vendedor y titulo del producto -->
                                                <h6 class="title-price"><small>PRODUTO: </small></h6>
                                                <h3 style="margin-top:0px;"><%=anuncio.getTitulo()%></h3>                                               

                                                <!-- Preços -->
                                                <h6 class="title-price"><small>PREÇO: </small></h6>
                                                <h3 style="margin-top:0px;">R$ <%=anuncio.getPreco()%></h3>

                                                <div class="section" style="padding-bottom:20px;">
                                                    <h6 class="title-attr"><small>QUANTIDADE DISPONÍVEL: <%=anuncio.getQuantidade()%></small></h6>
                                                </div>
                                                
                                                <!-- Botones de compra -->
                                                <div class="section" style="padding-bottom:20px;">
                                                    <form action="comprar" method="post">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <input hidden type="text" id="id" name="id" value="<%=anuncio.getId()%>">
                                                                    <input type="submit" class="btn btn-success" value="COMPRAR">
                                                                </td>
                                                            </tr>
                                                        </table> 
                                                    </form>                                                    
                                                </div>                                        
                                            </div>                              

                                            <div class="container-fluid">		
                                                <div class="col-md-12 product-info">
                                                    <ul id="myTab" class="nav nav-tabs nav_tabs">
                                                        <li class="active"><a href="#service-one" data-toggle="tab">DESCRIÇÃO</a></li>
                                                        <li><a href="#service-two" data-toggle="tab">CARACTERISTICAS</a></li>
                                                        <li><a href="#service-three" data-toggle="tab">ENVIO</a></li>
                                                    </ul>
                                                    
                                                    <div id="myTabContent" class="tab-content">
                                                        <div class="tab-pane fade in active" id="service-one">
                                                            <section class="container product-info">
                                                            <%=anuncio.getDescricao()%>
                                                            </section>
                                                        </div>
                                                        <div class="tab-pane fade" id="service-two">

                                                            <section class="container product-info">
                                                                <li><b>Altura (em cm.): </b><%=anuncio.getAltura()%></li>
                                                                <li><b>Largura (em cm.): </b><%=anuncio.getLargura()%></li>
                                                                <li><b>Peso (em gramas): </b><%=anuncio.getPeso()%></li>
                                                                <li><b>Estado: </b><%=anuncio.getEstado()%></li>                                                               
                                                            </section>

                                                        </div>
                                                        <div class="tab-pane fade" id="service-three">
                                                            <section class="container product-info">
                                                                <li><b>Forma de Envio: </b><%=anuncio.getFormaEnvio()%></li>
                                                                <li><b>Valor do Frete: </b><%=anuncio.getValorFrete()%></li>
                                                            </section>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                </div>
                                            </div>	
                                        </div>    
                                    </div>
                                </div>
                                <%}%>
                            </div>
                        </div>
                    </div>
                </div>
                <footer class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 footer">
                        <p class="copyright">Copyright © 2016 Company Name</p>
                    </div>    
                </footer>
            </div>
        </div>

            
    </body>
</html>