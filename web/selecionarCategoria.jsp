<%@page import="modelo.Usuario"%>
<%@page import="modelo.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<html lang="en"><head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,400italic">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css">    
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="shortcut icon" href="images/i.ico">
        <title>VendeMais</title>
    </head>
    <body>
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
                                </div>

                                <div class="menu-container">  

                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-left  about-main">                                    
                                        <a href="historicoVenda" class="main-menu-link about block-keep-ratio__content flexbox-center">
                                            <p align="center"><img src="images/venda.png" height="60" width="60"></p>
                                            VISÃO GERAL
                                        </a>                                    
                                    </div>

                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-right  contact-main">                                    
                                        <a href="historicoVenda" class="main-menu-link contact block-keep-ratio__content flexbox-center">
                                            <p align="center"><img src="images/5.png" height="60" width="60"></p>
                                            HISTÓRICO
                                        </a>                                    
                                    </div>
                                </div> 

                                <div class="menu-container">  
                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-left  about-main">
                                        <a href="anuncioAbertoVendedor" class="main-menu-link contact block-keep-ratio__content flexbox-center">
                                            <p align="center"><img src="images/1.ico" height="60" width="60"></p>
                                            ANUNCIOS ABERTOS
                                        </a>                                
                                    </div>

                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-right  contact-main">
                                        <a href="anuncioEncerradoVendedor" class="main-menu-link about block-keep-ratio__content flexbox-center">
                                            <p align="center"><img src="images/2.png" height="60" width="60"></p>
                                            ANUNCIOS ENCERRADOS
                                        </a>                                
                                    </div>
                                </div> 
                            </div>
                        </aside> <!-- main-navigation -->

                        <div class="content-main">
                            <div class="row margin-b-30">
                                <div class="col-xs-12 col-sm-12 col-md-12 biliend">
                                    <div class="row margin-b-30">
                                        <div class="col-xs-12 col-sm-12 col-md-12 biliend">
                                            <div class="banner-2-container">
                                                <div class="aenean">
                                                    <h4>Aqui você vende muito mais!</h4>
                                                    <h3>VendeMais</h3>
                                                </div>    
                                            </div>                                
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="content-main contact-content">
                                <div class="contact-content-upper">
                                    Selecione uma categoria
                                </div>
                            </div>
                            
                            <div class="row margin-b-30"></div>
                            <%
                                List<Categoria> todosCategorias = (List<Categoria>) request.getAttribute("resultadoC");
                                if (todosCategorias != null) {                                                                    
                                    for (Categoria categoria : todosCategorias) {
                            %>
                            <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-left  about-main">                                    
                                <form role="form" action="selecionarEndereco1" method="get" class="main-menu-link categoria block-keep-ratio__content flexbox-center">
                                    <input hidden type="text" id="categoria" value="<%=categoria.getId()%>" name="categoria">
                                    <p align="center"><img src="images/home.png" height="60" width="60"></p>
                                    <input class="about_proin" style="border:0;background-color:rgba(0,0,0,0);" type="submit" value="<%=categoria.getNome()%>">
                                </form>                                
                            </div>
                            <%}}%>                                
                            <div class="row"></div> <!-- row -->
                        </div> <!-- .content-main -->
                    </div> <!-- .main-page -->
                </div> <!-- .row -->           
                <footer class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 footer">
                        <p class="copyright">Copyright © 2017 Vende Mais</p>
                    </div>    
                </footer>  <!-- .row -->      
            </div> <!-- .container -->
        </div> <!-- .main-body -->




    </body></html>