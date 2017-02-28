<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%@page import="modelo.Historico"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Endereco"%>
<%@page import="modelo.Usuario"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
    <head>
        <link type="text/css" rel="stylesheet"
              href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" type="text/css"
              href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,400italic">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css"
              href="font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="shortcut icon" href="images/i.ico" >
        <!--
        Accord Template
        http://www.templatemo.com/tm-478-accord
        -->
        <title>Accord - Contact</title>
    </head>

    <body class="contact-page">
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
                                    
                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-right  contact-main">
                                        <a href="historicoCompra" class="main-menu-link about block-keep-ratio__content flexbox-center">
                                            <p align="center"><img src="images/compra.png" height="60" width="60"></p>
                                            VISÃO GERAL
                                        </a>                                
                                    </div>
                                    
                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-left  about-main">                                    
                                        <a href="historicoCompra" class="main-menu-link contact block-keep-ratio__content flexbox-center">
                                            <p align="center"><img src="images/5.png" height="60" width="60"></p>
                                            HISTÓRICO
                                        </a>                                    
                                    </div>
                                </div>
                            </div>
                            <!-- main-menu --> </aside>
                        <!-- main-navigation -->

                        <div class="content-main contact-content">
                            <div class="contact-content-upper">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="gallery_title">
                                            <h3>Histórico - Compras</h3>
                                            <h4>VendeMais</h4>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-sm-12 col-md-6 contact_left">

                                        <%
                                            List<Historico> todasCompras = (List<Historico>) request.getAttribute("resultado");
                                            if (todasCompras != null) {
                                                for (Historico historico : todasCompras) {
                                        %>
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td><label for="total">Total da Compra: </label></td>
                                                    <td><%=historico.getTotal()%></td>
                                                </tr>
                                                <tr>
                                                    <td><label for="quantidade">Quantidade
                                                            Comprada: </label></td>
                                                    <td><%=historico.getQuantidade()%></td>
                                                </tr>
                                                <tr>
                                                    <td><label for="preco">Preço Unitário: </label></td>
                                                    <td><%=historico.getPreco_unitario()%></td>
                                                </tr>
                                                <tr>
                                                    <td><label for="data">Data da Compra: </label></td>
                                                    <td><%=historico.getData_compra()%></td>
                                                </tr>
                                                <tr>
                                                    <td><label for="produto">Produto: </label></td>
                                                    <td><%=historico.getProduto()%></td>
                                                </tr>
                                                <tr>
                                                    <td><label for="descricao">Descrição: </label></td>
                                                    <td><%=historico.getDescricao()%></td>
                                                </tr>
                                                <tr>
                                                    <td><label for="estado">Estado: </label></td>
                                                    <td><%=historico.getEstado()%></td>
                                                </tr>
                                                <tr>
                                                    <td><label for="vendedor">Vendedor: </label></td>
                                                    <td><%=historico.getVendedor()%></td>
                                                </tr>

                                            </tbody>
                                        </table>
                                        <hr>
                                        <br>
                                        <%
                                                }
                                            }
                                        %>
                                        <br>
                                        <a href="index.jsp">VOLTAR</a>

                                    </div>

                                </div>
                                <!-- .row -->
                            </div>



                        </div>
                        <!-- .contact-content -->
                    </div>
                    <!-- .main-page -->
                </div>
                <!-- .row -->

                <footer class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 footer">
                        <p class="copyright">Copyright © 2016 Company Name</p>
                    </div>
                </footer>
                <!-- .row -->

            </div>
            <!-- .container -->
        </div>
        <!-- .main-body -->

        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>