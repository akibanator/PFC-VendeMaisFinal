<%@page import="modelo.Anuncio"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,400italic">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="shortcut icon" href="images/i.ico" >
        <title>VendeMais</title>
    </head>

    <body class="">
        <div class="main-body">
            <div class="container">
                <div class="row">

                    <div class="main-page">
                        <aside class="main-navigation">
                            <div class="main-menu">
                                <div class="menu-container">
                                    <div class="block-keep-ratio block-keep-ratio-2-1 block-width-full homedata">
                                        <a><span class="main-menu-link-text"><font color="#FFFFFF" size="3"><b><script src="js/saudacao.js"></script><br> Bem vindo ao VendeMais, Visitante</b></font> </span>
                                        </a>
                                    </div>
                                </div>
                                <div class="menu-container">
                                    <div class="block-keep-ratio block-keep-ratio-2-1 block-width-full home">
                                        <a href="index.jsp" class="block-keep-ratio__content  main-menu-link"> <span class="main-menu-link-text"> HOME </span>
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
                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-right  contact-main">
                                        <a href="contact.jsp" class="main-menu-link contact block-keep-ratio__content flexbox-center">
                                            <i class="fa fa-envelope-o fa-4x main-menu-link-icon"></i>
                                            CONTATO
                                        </a>                                
                                    </div>

                                </div>

                                <div class="menu-container">
                                    <div class="box bottom-main block-keep-ratio  block-width-full">

                                        <ul class="info info-ul">
                                            <li><a href="#" class="about_proin">Celulares e Telefones</a></li>
                                            <li><a href="#" class="about_proin">Eletrônicos, Áudio e Vídeo</a></li>
                                            <li><a href="#" class="about_proin">Brinquedos e Hobbies</a></li>
                                            <li><a href="#" class="about_proin">Calçados, Roupas e Bolsas</a></li>
                                            <li><a href="#" class="about_proin">Filmes e Seriados</a></li>
                                            <li><a href="#" class="about_proin">Instrumentos Musicais</a></li>
                                            <li><a href="#" class="about_proin">Saúde e Beleza</a></li>
                                            <li><a href="#" class="about_proin">Música</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div> <!-- main-menu -->
                        </aside> <!-- main-navigation -->

                        <!-- #myModal -->
                        <div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-body">
                                        <img src="images/venda.png" alt="Image" class="img-responsive">
                                    </div> <!-- .modal-body -->
                                </div> <!-- .modal-content -->
                            </div> <!-- .modal-dialog -->
                        </div>

                        <div id="myModal2" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-body">
                                        <img src="images/about-img-3.jpg" alt="Image" class="img-responsive">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="myModal3" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-body">
                                        <img src="images/about-img-4.jpg" alt="Image" class="img-responsive">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="content-main">
                            <div class="row">


                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                                    <div class="row margin-b-30">
                                        <div class="col-xs-12 col-sm-12 col-md-12 biliend">
                                            <div class="banner-2-container">
                                                <div class="aenean">
                                                    <h4>Resultados da pesquisa</h4>
                                                    <h3>VendeMais</h3>
                                                </div>    
                                            </div>                                
                                        </div>
                                    </div>

                                    <form role="form" action="pesquisa" method="post">
                                        <table align="center">
                                            <tbody><tr>
                                                    <td><input type="text" size="120" class="form-control" id="pesquisa" name="pesquisa" placeholder="PESQUISA POR PALAVRA CHAVE..."></td>
                                                    <td><input type="image" src="images/pesquisa.png" height="45" width="45"></td>
                                                </tr>
                                            </tbody></table>
                                    </form>

                                </div>

                            </div> <!-- .banner-main-about -->
                            <div class="row about-box-main">
                                <div class="col-sm-4 col-lg-4 col-md-4">
                                    <div class="col-item">
                                        <div class="photo">
                                            <img src="images/xbox.png" class="img-responsive" alt="a">
                                        </div>
                                        <div class="info">
                                            <div class="row">
                                                <div class="price col-md-6">
                                                    <h5>X-BOX ONE</h5>
                                                    <h5 class="price-text-color">R$ 1240,00</h5>
                                                </div>
                                                <div class="rating hidden-sm col-md-6">
                                                    <i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                                    </i><i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                                    </i><i class="fa fa-star"></i>
                                                </div>
                                            </div>
                                            <div class="separator clear-left">
                                                <p class="btn-add">
                                                    <i class="fa fa-shopping-cart"></i><a href="compra.jsp" class="hidden-sm">Comprar</a></p>
                                                <p class="btn-details">
                                                    <i class="fa fa-list"></i><a href="detalhes.jsp" class="hidden-sm">+ Detalhes</a></p>
                                            </div>
                                            <div class="clearfix">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-4 col-lg-4 col-md-4">
                                    <div class="col-item">
                                        <div class="photo">
                                            <img src="http://placehold.it/350x260" class="img-responsive" alt="a">
                                        </div>
                                        <div class="info">
                                            <div class="row">
                                                <div class="price col-md-6">
                                                    <h5> Sample Product</h5>
                                                    <h5 class="price-text-color">$199.99</h5>
                                                </div>
                                                <div class="rating hidden-sm col-md-6">
                                                    <i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                                    </i><i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                                    </i><i class="fa fa-star"></i>
                                                </div>
                                            </div>
                                            <div class="separator clear-left">
                                                <p class="btn-add">
                                                    <i class="fa fa-shopping-cart"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">Add to cart</a></p>
                                                <p class="btn-details">
                                                    <i class="fa fa-list"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">More details</a></p>
                                            </div>
                                            <div class="clearfix">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-4 col-lg-4 col-md-4">
                                    <div class="col-item">
                                        <div class="photo">
                                            <img src="http://placehold.it/350x260" class="img-responsive" alt="a">
                                        </div>
                                        <div class="info">
                                            <div class="row">
                                                <div class="price col-md-6">
                                                    <h5> Sample Product</h5>
                                                    <h5 class="price-text-color">$199.99</h5>
                                                </div>
                                                <div class="rating hidden-sm col-md-6">
                                                    <i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                                    </i><i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                                    </i><i class="fa fa-star"></i>
                                                </div>
                                            </div>
                                            <div class="separator clear-left">
                                                <p class="btn-add">
                                                    <i class="fa fa-shopping-cart"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">Add to cart</a></p>
                                                <p class="btn-details">
                                                    <i class="fa fa-list"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">More details</a></p>
                                            </div>
                                            <div class="clearfix">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row margin-b-30">
                                <div class="col-xs-12 col-sm-12 col-md-12 biliend">

                                </div>
                            </div>
                            <div class="row about-box-main">





                                <div class="col-sm-4 col-lg-4 col-md-4">
                                    <div class="col-item">
                                        <div class="photo">
                                            <img src="http://placehold.it/350x260" class="img-responsive" alt="a">
                                        </div>
                                        <div class="info">
                                            <div class="row">
                                                <div class="price col-md-6">
                                                    <h5> Sample Product</h5>
                                                    <h5 class="price-text-color">$199.99</h5>
                                                </div>
                                                <div class="rating hidden-sm col-md-6">
                                                    <i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                                    </i><i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                                    </i><i class="fa fa-star"></i>
                                                </div>
                                            </div>
                                            <div class="separator clear-left">
                                                <p class="btn-add">
                                                    <i class="fa fa-shopping-cart"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">Add to cart</a></p>
                                                <p class="btn-details">
                                                    <i class="fa fa-list"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">More details</a></p>
                                            </div>
                                            <div class="clearfix">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-4 col-lg-4 col-md-4">
                                    <div class="col-item">
                                        <div class="photo">
                                            <img src="http://placehold.it/350x260" class="img-responsive" alt="a">
                                        </div>
                                        <div class="info">
                                            <div class="row">
                                                <div class="price col-md-6">
                                                    <h5> Sample Product</h5>
                                                    <h5 class="price-text-color">$199.99</h5>
                                                </div>
                                                <div class="rating hidden-sm col-md-6">
                                                    <i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                                    </i><i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                                    </i><i class="fa fa-star"></i>
                                                </div>
                                            </div>
                                            <div class="separator clear-left">
                                                <p class="btn-add">
                                                    <i class="fa fa-shopping-cart"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">Add to cart</a></p>
                                                <p class="btn-details">
                                                    <i class="fa fa-list"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">More details</a></p>
                                            </div>
                                            <div class="clearfix">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-4 col-lg-4 col-md-4">
                                    <div class="col-item">
                                        <div class="photo">
                                            <img src="http://placehold.it/350x260" class="img-responsive" alt="a">
                                        </div>
                                        <div class="info">
                                            <div class="row">
                                                <div class="price col-md-6">
                                                    <h5> Sample Product</h5>
                                                    <h5 class="price-text-color">$199.99</h5>
                                                </div>
                                                <div class="rating hidden-sm col-md-6">
                                                    <i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                                    </i><i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                                    </i><i class="fa fa-star"></i>
                                                </div>
                                            </div>
                                            <div class="separator clear-left">
                                                <p class="btn-add">
                                                    <i class="fa fa-shopping-cart"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">Add to cart</a></p>
                                                <p class="btn-details">
                                                    <i class="fa fa-list"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">More details</a></p>
                                            </div>
                                            <div class="clearfix">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div><div class="row margin-b-30">
                                <div class="col-xs-12 col-sm-12 col-md-12 biliend">

                                </div>
                            </div><div class="row about-box-main">





                                <div class="col-sm-4 col-lg-4 col-md-4">
                                    <div class="col-item">
                                        <div class="photo">
                                            <img src="http://placehold.it/350x260" class="img-responsive" alt="a">
                                        </div>
                                        <div class="info">
                                            <div class="row">
                                                <div class="price col-md-6">
                                                    <h5> Sample Product</h5>
                                                    <h5 class="price-text-color">$199.99</h5>
                                                </div>
                                                <div class="rating hidden-sm col-md-6">
                                                    <i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                                    </i><i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                                    </i><i class="fa fa-star"></i>
                                                </div>
                                            </div>
                                            <div class="separator clear-left">
                                                <p class="btn-add">
                                                    <i class="fa fa-shopping-cart"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">Add to cart</a></p>
                                                <p class="btn-details">
                                                    <i class="fa fa-list"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">More details</a></p>
                                            </div>
                                            <div class="clearfix">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-4 col-lg-4 col-md-4">
                                    <div class="col-item">
                                        <div class="photo">
                                            <img src="http://placehold.it/350x260" class="img-responsive" alt="a">
                                        </div>
                                        <div class="info">
                                            <div class="row">
                                                <div class="price col-md-6">
                                                    <h5> Sample Product</h5>
                                                    <h5 class="price-text-color">$199.99</h5>
                                                </div>
                                                <div class="rating hidden-sm col-md-6">
                                                    <i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                                    </i><i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                                    </i><i class="fa fa-star"></i>
                                                </div>
                                            </div>
                                            <div class="separator clear-left">
                                                <p class="btn-add">
                                                    <i class="fa fa-shopping-cart"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">Add to cart</a></p>
                                                <p class="btn-details">
                                                    <i class="fa fa-list"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">More details</a></p>
                                            </div>
                                            <div class="clearfix">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-4 col-lg-4 col-md-4">
                                    <div class="col-item">
                                        <div class="photo">
                                            <img src="http://placehold.it/350x260" class="img-responsive" alt="a">
                                        </div>
                                        <div class="info">
                                            <div class="row">
                                                <div class="price col-md-6">
                                                    <h5> Sample Product</h5>
                                                    <h5 class="price-text-color">$199.99</h5>
                                                </div>
                                                <div class="rating hidden-sm col-md-6">
                                                    <i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                                    </i><i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                                    </i><i class="fa fa-star"></i>
                                                </div>
                                            </div>
                                            <div class="separator clear-left">
                                                <p class="btn-add">
                                                    <i class="fa fa-shopping-cart"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">Add to cart</a></p>
                                                <p class="btn-details">
                                                    <i class="fa fa-list"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">More details</a></p>
                                            </div>
                                            <div class="clearfix">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div></div>
                    </div>
                </div>
                <footer class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 footer">
                        <p class="copyright">Copyright © 2017 Vende Mais</p>
                    </div>    
                </footer>            
            </div>
        </div>

        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/bootstrap.min.js"></script>



    </body></html>