<%@page import="modelo.Usuario"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,400italic">
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="../font-awesome/css/font-awesome.min.css">    
        <link rel="stylesheet" type="text/css" href="../css/style.css">
        <link rel="shortcut icon" href="../images/i.ico">
        <title>VendeMais</title>
    </head>

    <body>
        <script src="../js/jquery-1.11.3.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <div class="main-body">	
            <div class="container">
                <div class="row">               
                    <div class="main-page">
                        <aside class="main-navigation">
                            <div class="main-menu">

                                <div class="menu-container">
                                    <div class="block-keep-ratio block-keep-ratio-2-1 block-width-full homedata">

                                        <a><span class="main-menu-link-text"><font color="#FFFFFF" size="3"><b><script src="../js/saudacao.js"></script><br>
                                                        <%  Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
                                                            if (usuario != null) {%>
                                                        <%=usuario.getNome()%>
                                                        <%;
                                                        } else {%>
                                                    Visitante
                                                    <%;
                                                        }%></b></font> 
                                            </span>
                                        </a>
                                    </div>
                                </div>

                                <div class="menu-container">  
                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-left  about-main">                                    
                                        <a href="Corporativo.jsp" class="main-menu-link about block-keep-ratio__content flexbox-center">
                                            <p align="center"><img src="../images/home.png" height="60" width="60"></p>
                                            HOME
                                        </a>                                    
                                    </div>
                                    
                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-right  about-main">                                    
                                        <a href="#" class="main-menu-link about block-keep-ratio__content flexbox-center">
                                            <p align="center"><img src="../images/report.ico" height="60" width="60"></p>
                                            ALERTAS
                                        </a>                                    
                                    </div>                                    
                                </div>

                                <div class="menu-container">                                
                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-left  about-main">                                    
                                        <a href="../consultarConta" class="main-menu-link about block-keep-ratio__content flexbox-center">
                                            <i class="fa fa-user fa-4x main-menu-link-icon"></i>
                                            CONTA
                                        </a>                                    
                                    </div>

                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-right  contact-main">
                                        <a href="../logout" class="main-menu-link about block-keep-ratio__content flexbox-center">
                                            <p align="center"><img src="../images/logout.png" height="60" width="60"></p>
                                            LOGOUT
                                        </a>                                
                                    </div>
                                </div> 

                                <div class="menu-container">  
                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-right  contact-main">
                                        <a href="../consultarCategoria" class="main-menu-link about block-keep-ratio__content flexbox-center">
                                            <p align="center"><img src="../images/categoria.png" height="60" width="60"></p>
                                            CATEGORIAS
                                        </a>                                
                                    </div>  
                                </div> 
                            </div> <!-- main-menu -->
                        </aside> <!-- main-navigation -->

                        <div class="content-main">
                            <div class="row margin-b-30">
                                <div class="col-xs-12 col-sm-12 col-md-12 biliend">
                                    <div class="banner-2-container">
                                        <div class="aenean">
                                            <h4>corporativo</h4>
                                            <h3>VendeMais</h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row margin-b-30">
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                    <div class="box london">
                                        <div class="box-icon">
                                            <img src="../images/home-img-2.jpg" alt="Image" class="img-responsive">
                                        </div>
                                        <div class="info float-container">
                                            <div class="col-sm-12 london-title">
                                                <h3 class="text-uppercase">CONTROLE SEUS PRODUTOS</h3>
                                                <h4 class="text-uppercase">GERENCIAMENTO DE CATEGORIAS DISPONIVEIS</h4>
                                            </div>
                                            <p align="justify">Bem - vindo caro colaborador, este acesso lhe possibilida gerenciar as categorias e subcategorias dos anuncios</p><hr>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                    <div class="box paris">
                                        <div class="box-icon">
                                            <img src="../images/msg.jpg" alt="Image" class="img-responsive">
                                        </div>
                                        <div class="info float-container">
                                            <div class="col-sm-12 london-title paris-title">
                                                <h3 class="text-uppercase">MENSAGENS DOS SEUS CLIENTES</h3>
                                                <h4 class="text-uppercase">FIQUE ATENTO AOS ALERTAS</h4>
                                            </div>
                                            <p align="justify">Caro colaborador, fique atento aos alertas. Os clientes podem lhe enviar qualquer tipo de report, seja dúvida, reclamação ou até mesmo agradecimentos.</p><hr>
                                        </div>
                                    </div>
                                </div>
                            </div> <!-- row -->
                        </div> <!-- .content-main -->
                    </div> <!-- .main-page -->
                </div> <!-- .row -->           
                <footer class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 footer">
                        <p class="copyright">Copyright © 2016 Company Name</p>
                    </div>    
                </footer>  <!-- .row -->      
            </div> <!-- .container -->
        </div> <!-- .main-body -->
    </body>
</html>