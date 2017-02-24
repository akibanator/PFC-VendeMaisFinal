<%-- 
    Document   : realizarCompra
    Created on : 24/02/2017, 15:13:13
    Author     : ailto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Compra"%>
<%@page import="modelo.Anuncio"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en"><head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,400italic">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css">    
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <!--
        Accord Template
        http://www.templatemo.com/tm-478-accord
        -->   
        <title>Accord - Contact</title>
        <script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/28/2/intl/pt_br/common.js"></script><script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/28/2/intl/pt_br/map.js"></script><script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/28/2/intl/pt_br/util.js"></script><script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/28/2/intl/pt_br/onion.js"></script><script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/28/2/intl/pt_br/stats.js"></script><script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/28/2/intl/pt_br/controls.js"></script><script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/28/2/intl/pt_br/marker.js"></script></head>

    <body class="contact-page">
        <div class="main-body">
            <div class="container">
                <div class="row">

                    <div class="main-page">
                        <aside class="main-navigation">
                            <div class="main-menu">

                                <div class="menu-container">
                                    <div class="block-keep-ratio block-keep-ratio-2-1 block-width-full home">                                    
                                        <a href="index.html" class="block-keep-ratio__content  main-menu-link">
                                            <span class="main-menu-link-text">
                                                HOME    
                                            </span>                                        
                                        </a>
                                    </div>                                
                                </div>

                                <div class="menu-container">                                
                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-left  about-main">                                    
                                        <a href="about.html" class="main-menu-link about block-keep-ratio__content flexbox-center">
                                            <i class="fa fa-user fa-4x main-menu-link-icon"></i>
                                            ABOUT
                                        </a>                                    
                                    </div>

                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-right  contact-main">
                                        <a href="contact.html" class="main-menu-link contact block-keep-ratio__content flexbox-center">
                                            <i class="fa fa-envelope-o fa-4x main-menu-link-icon"></i>
                                            CONTACT
                                        </a>                                
                                    </div>    
                                </div>   

                                <div class="menu-container">
                                    <div class="block-keep-ratio block-keep-ratio-1-1 block-keep-ratio-md-2-1 block-width-full gallery">                                    
                                        <a href="gallery.html" class="main-menu-link  block-keep-ratio__content">
                                            <span class="main-menu-link-text">
                                                GALLERY    
                                            </span>                                            
                                        </a>                                    
                                    </div>                                
                                </div>

                                <!-- sidebar carousel -->
                                <div class="menu-container">
                                    <div class="mauris">
                                        <div id="carousel-menu" class="carousel slide" data-ride="carousel">
                                            <!-- Wrapper for slides -->
                                            <div class="carousel-inner" role="listbox">
                                                <div class="item active">
                                                    <img src="images/slider-img-1.png" alt="slider">
                                                    <div class="carousel-caption menu-caption">
                                                        mauris vita
                                                    </div>
                                                </div>
                                                <div class="item">
                                                    <img src="images/menu-bg-home.png" alt="slider">
                                                    <div class="carousel-caption menu-caption">
                                                        lorem ipsum
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Controls -->
                                            <a class="left carousel-control" href="#carousel-menu" role="button" data-slide="prev">
                                                <span class="fa fa-caret-left" aria-hidden="true"></span>
                                                <span class="sr-only">Previous</span>
                                            </a>
                                            <a class="right carousel-control" href="#carousel-menu" role="button" data-slide="next">
                                                <span class="fa fa-caret-right" aria-hidden="true"></span>
                                                <span class="sr-only">Next</span>
                                            </a>
                                        </div>
                                    </div> <!-- .mauris -->
                                </div>
                            </div> <!-- main-menu -->
                        </aside> <!-- main-navigation -->

                        <div class="content-main contact-content">
                            <div class="contact-content-upper">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="gallery_title">
                                            <h3>ACCORD</h3>
                                            <h4>Proin gravida nibhISI</h4>
                                        </div>    
                                    </div>                            
                                </div>

                                <div class="row">  
                                    <div class="col-sm-12 col-md-6 contact_left">   


                                        <hr>
                                        <h2 class="intro-text text-center">VERIFIQUE OS DADOS DA COMPRA</h2>
                                        <hr>
                                        <%
                                            Compra compra = (Compra) request.getAttribute("resultadoC");
                                            if (compra != null) {
                                                Anuncio anuncio = (Anuncio) request.getAttribute("resultadoA");
                                                if (anuncio != null) {
                                        %>
                                        <form role="form" action="finalizarCompra" method="POST" >
                                            <input hidden type="text" name="idAnuncio" value="<%=anuncio.getId()%>">

                                            <table width=60% border="1">
                                                <tbody>
                                                    <tr>
                                                        <td><label for="titulo">Titulo: </label></td>
                                                        <td colspan="3"><%=anuncio.getTitulo()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td valign=top><label for="descricao">Descrição: </label></td>
                                                        <td colspan="3"><%=anuncio.getDescricao()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3"><label for="quantidade">Quantidade disponivel no estoque:</label></td>
                                                        <td><%=anuncio.getQuantidade()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3"><label for="quantidadeDesejada">Quantidade Desejada: </label></td>
                                                        <td><%=compra.getQuantidade()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td><label for="estado">Estado: </label></td>
                                                        <td><%=anuncio.getLargura()%></td>
                                                        <td width=10%><label for="peso">Peso: </label></td>
                                                        <td width=30%><%=anuncio.getPeso()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td><label for="altura">Altura: </label></td>
                                                        <td><%=anuncio.getAltura()%></td>
                                                        <td><label for="largura">Largura: </label></td>
                                                        <td><%=anuncio.getLargura()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td><label for="categoria">Categoria: </label></td>
                                                        <td><%=anuncio.getCategoria()%></td>
                                                        <td><label for="subcategoria">Subcategoria: </label></td>
                                                        <td><%=anuncio.getSubcategoria()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td><label for="preco">Preço: </label></td>
                                                        <td><%=anuncio.getPreco()%></td>
                                                        <td><label for="total">total: </label></td>
                                                        <td><%=compra.getTotal()%></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <input hidden type="text" name="idAnuncio" value="<%=anuncio.getId()%>">
                                            <input hidden type="text" name="titulo" value="<%=anuncio.getTitulo()%>">
                                            <input hidden type="text" name="descricao" value="<%=anuncio.getDescricao()%>">
                                            <input hidden type="text" name="quantidade" value="<%=anuncio.getQuantidade()%>">
                                            <input hidden type="text" name="preco" value="<%=anuncio.getPreco()%>">
                                            <input hidden type="text" name="estado" value="<%=anuncio.getEstado()%>">
                                            <input hidden type="text" name="peso" value="<%=anuncio.getPeso()%>">
                                            <input hidden type="text" name="altura" value="<%=anuncio.getAltura()%>">
                                            <input hidden type="text" name="largura" value="<%=anuncio.getLargura()%>">
                                            <input hidden type="text" name="categoria" value="<%=anuncio.getCategoria()%>">
                                            <input hidden type="text" name="subcategoria" value="<%=anuncio.getSubcategoria()%>">
                                            <input hidden type="text" name="total" value="<%=compra.getTotal()%>">
                                            <input hidden type="text" name="qtdDesejada" value="<%=compra.getQuantidade()%>">
                                            <input hidden type="text" name="vendedor" value="<%=anuncio.getVendedor()%>">
                                            <br><input type="submit" class="btn btn-login" value="CONFIRMA">
                                        </form>

                                        <%
                                                }
                                            }
                                        %>
                                        <br><a href="recuperarCompra">CANCELAR</a>

                                    </div> <!-- .contact-left -->

                                </div> <!-- .row -->
                            </div>



                        </div> <!-- .contact-content -->
                    </div> <!-- .main-page -->
                </div> <!-- .row -->

                <footer class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 footer">
                        <p class="copyright">Copyright © 2016 Company Name</p>
                    </div>    
                </footer>  <!-- .row -->   

            </div> <!-- .container -->
        </div> <!-- .main-body -->

        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/bootstrap.min.js"></script>



    </body></html>

