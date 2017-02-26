<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%@page import="modelo.Endereco"%>

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
                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-left  about-main">                                    
                                        <a href="consultarConta" class="main-menu-link about block-keep-ratio__content flexbox-center">
                                            <i class="fa fa-user fa-4x main-menu-link-icon"></i>
                                            CONTA
                                        </a>                                    
                                    </div>

                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-right  contact-main">
                                        <a href="contact.html" class="main-menu-link contact block-keep-ratio__content flexbox-center">
                                            <i class="fa fa-envelope-o fa-4x main-menu-link-icon"></i>
                                            CONTATO
                                        </a>                                
                                    </div>    
                                </div> 

                                <div class="menu-container">
                                    <div
                                        class="block-keep-ratio block-keep-ratio-1-1 block-keep-ratio-md-2-1 block-width-full gallery">
                                        <a href="gallery.html"
                                           class="main-menu-link  block-keep-ratio__content"> <span
                                                class="main-menu-link-text"> GALLERY </span>
                                        </a>
                                    </div>
                                </div>

                                <!-- sidebar carousel -->
                                <div class="menu-container">
                                    <div class="mauris">
                                        <div id="carousel-menu" class="carousel slide"
                                             data-ride="carousel">
                                            <!-- Wrapper for slides -->
                                            <div class="carousel-inner" role="listbox">
                                                <div class="item active">
                                                    <img src="images/slider-img-1.png" alt="slider">
                                                    <div class="carousel-caption menu-caption">mauris vita
                                                    </div>
                                                </div>
                                                <div class="item">
                                                    <img src="images/menu-bg-home.png" alt="slider">
                                                    <div class="carousel-caption menu-caption">lorem ipsum
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Controls -->
                                            <a class="left carousel-control" href="#carousel-menu"
                                               role="button" data-slide="prev"> <span
                                                    class="fa fa-caret-left" aria-hidden="true"></span> <span
                                                    class="sr-only">Previous</span>
                                            </a> <a class="right carousel-control" href="#carousel-menu"
                                                    role="button" data-slide="next"> <span
                                                    class="fa fa-caret-right" aria-hidden="true"></span> <span
                                                    class="sr-only">Next</span>
                                            </a>
                                        </div>
                                    </div>
                                    <!-- .mauris -->
                                </div>
                            </div>
                            <!-- main-menu --> </aside>
                        <!-- main-navigation -->

                        <div class="content-main contact-content">
                            <div class="contact-content-upper">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="gallery_title">
                                            <h3>Editar Endereço</h3>
                                            <h4>VendeMais</h4>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-sm-12 col-md-6 contact_left">

                                        <%
                                                Endereco endereco = (Endereco) request.getAttribute("resultado");
                                                if (endereco != null) {
                                        %>
                                        <form role="form" action="alterarEndereco" method="POST">
                                            <input hidden type="text" name="idEndereco"
                                                   value="<%=endereco.getId()%>">
                                            <table width=40%>
                                                <tbody>
                                                    <tr>
                                                        <td width=10%><label for="cep">CEP:</label>
                                                        <td width=25%><input size="9" type="text" name="cep"
                                                                             value="<%=endereco.getCep()%>" id="cep" cep required
                                                                             onblur="pesquisacep(this.value);">
                                                        <td width=10%><label for="numero">Numero:</label></td>
                                                        <td><input size="4" type="text" name="numero"
                                                                   value="<%=endereco.getNumero()%>" id="numero" numero
                                                                   required></td>


                                                    </tr>
                                                    <tr>
                                                        <td colspan="1"><label for="rua">Rua:</label></td>
                                                        <td colspan="5"><input size="54" type="text"
                                                                               name="rua" value="<%=endereco.getRua()%>" id="rua" rua
                                                                               required></td>

                                                    </tr>
                                                    <tr>
                                                        <td><label for="cidade">Cidade:</label></td>
                                                        <td><input size="20" type="text" name="cidade"
                                                                   value="<%=endereco.getCidade()%>" id="cidade" cidade
                                                                   required></td>
                                                        <td><label for="uf">Estado </label></td>
                                                        <td><select type="text" name="uf" id="uf" uf required />
                                                <option value="<%=endereco.getEstado()%>"><%=endereco.getEstado()%></option>
                                                <option value="AC">AC</option>
                                                <option value="AL">AL</option>
                                                <option value="AM">AM</option>
                                                <option value="AP">AP</option>
                                                <option value="BA">BA</option>
                                                <option value="CE">CE</option>
                                                <option value="DF">DF</option>
                                                <option value="ES">ES</option>
                                                <option value="GO">GO</option>
                                                <option value="MA">MA</option>
                                                <option value="MT">MT</option>
                                                <option value="MS">MS</option>
                                                <option value="MG">MG</option>
                                                <option value="PA">PA</option>
                                                <option value="PB">PB</option>
                                                <option value="PR">PR</option>
                                                <option value="PE">PE</option>
                                                <option value="PI">PI</option>
                                                <option value="RJ">RJ</option>
                                                <option value="RN">RN</option>
                                                <option value="RO">RO</option>
                                                <option value="RS">RS</option>
                                                <option value="RR">RR</option>
                                                <option value="SC">SC</option>
                                                <option value="SE">SE</option>
                                                <option value="SP">SP</option>
                                                <option value="TO">TO</option> </select></td>

                                                </tr>
                                                <tr>
                                                    <td><label for="complemento">Complemento:</label></td>
                                                    <td><input size="20 " type="text" name="complemento"
                                                               value="<%=endereco.getComplemento()%>"></td>
                                                    <td><label for="bairro">Bairro:</label></td>
                                                    <td><input size="18" type="text" name="bairro"
                                                               value="<%=endereco.getBairro()%>" id=bairro required></td>
                                                </tr>
                                                </tbody>
                                            </table>

                                            <br>
                                            <input type="submit" class="btn btn-login" value="SALVAR">
                                        </form>
                                        <%
                                                }
                                        %>
                                        <p>
                                            <a href="consultarConta">CANCELAR</a>
                                        </p>

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