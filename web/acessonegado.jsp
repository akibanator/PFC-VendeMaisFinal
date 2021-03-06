<%@page import="modelo.Usuario"%>
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

    <body>
        <div class="main-body">
            <div class="container">
                <div class="row">
                    <div class="main-page">
                        <aside class="main-navigation">
                            <div class="main-menu">                                
                                <div class="menu-container">
                                    <div class="block-keep-ratio block-keep-ratio-2-1 block-width-full homedata">
                                        <a><span class="main-menu-link-text"><font color="#FFFFFF" size="3"><b><script src="js/saudacao.js"></script><br>
                                                        <%  Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
                                                            if (usuario != null) {%>
                                                        <%=usuario.getNome()%>
                                                        <%;}else{%>
                                                    Visitante
                                                    <%;}%></b></font> 
                                            </span>
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
                                        <a href="contact.jsp" class="main-menu-link about block-keep-ratio__content flexbox-center">
                                            <i class="fa fa-envelope-o fa-4x main-menu-link-icon"></i>
                                            CONTATO
                                        </a>                                
                                    </div>                                    
                                </div>

                                <div class="menu-container">
                                    <div class="block-keep-ratio block-keep-ratio-2-1 block-width-full home">
                                        <a href="anuncieconosco.jsp" class="block-keep-ratio__content  main-menu-link"> <span class="main-menu-link-text"></span>
                                        </a>
                                    </div>
                                </div>
                            </div> <!-- main-menu -->
                        </aside>
                        <!-- main-navigation -->

                        <div class="content-main">
                            <div class="row margin-b-30">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <div class="banner-main-home">
                                        <div class="banner-main-home-text">
                                            <div class="heading">
                                                <h1>VENDE+</h1>
                                                <p class="text-uppercase">Aqui voc� vende muito mais!</p>
                                            </div>
                                            <div class="desc">
                                                <p>ACESSO NEGADO!</p><br> 
                                            </div>
                                        </div>
                                        <img src="images/2.png" alt="Image" class="img-responsive">
                                    </div>
                                </div>
                            </div>
                            <div class="row margin-b-30">


                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">

                                </div>
                            </div>



                        </div>
                        <!-- .content-main -->
                    </div>
                    <!-- .main-page -->
                </div>
                <!-- .row -->
                <footer class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 footer">
                        <p class="copyright">Copyright � 2017 Vende Mais</p>
                    </div>
                </footer>
                <!-- .row -->
            </div>
            <!-- .container -->
        </div>
        <!-- .main-body -->

        <!-- JavaScript -->
        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/bootstrap.min.js"></script>



    </body></html>