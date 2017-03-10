<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Endereco"%>
<%@page import="modelo.Usuario"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
    <head>
        <link rel="shortcut icon" href="images/i.ico" >
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

    <body>
        <div class="main-body">	
            <div class="container">
                <div class="row">               
                    <div class="main-page">
                        <aside class="main-navigation">
                            <div class="main-menu">
                                <div class="menu-container">
                                    <div class="block-keep-ratio block-keep-ratio-2-1 block-width-full homedata">
                                        <a><span class="main-menu-link-text"><font color="#FFFFFF" size="3"><b><script src="js/saudacao.js"></script>Bom Dia - 10 de Fevereiro de 2017<br> Bem vindo ao VendeMais, Visitante</b></font> </span>
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
                                        <a href="contact.html" class="main-menu-link contact block-keep-ratio__content flexbox-center">
                                            <i class="fa fa-envelope-o fa-4x main-menu-link-icon"></i>
                                            CONTATO
                                        </a>                                
                                    </div>

                                </div>

                                <div class="menu-container">
                                    <div class="box bottom-main block-keep-ratio  block-width-full">

                                        <ul class="info info-ul">
                                            <li><a href="#" class="about_proin">Celulares e Telefones</a></li>
                                            <li><a href="#" class="about_proin">Eletr�nicos, �udio e V�deo</a></li>
                                            <li><a href="#" class="about_proin">Brinquedos e Hobbies</a></li>
                                            <li><a href="#" class="about_proin">Cal�ados, Roupas e Bolsas</a></li>
                                            <li><a href="#" class="about_proin">Filmes e Seriados</a></li>
                                            <li><a href="#" class="about_proin">Instrumentos Musicais</a></li>
                                            <li><a href="#" class="about_proin">Sa�de e Beleza</a></li>
                                            <li><a href="#" class="about_proin">M�sica</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div> <!-- main-menu -->
                        </aside> <!-- main-navigation -->

                        <div class="content-main">
                            <div class="row margin-b-30">
                                <div class="col-xs-12 col-sm-12 col-md-12 biliend">
                                    <div class="row margin-b-30">
                                        <div class="col-xs-12 col-sm-12 col-md-12 biliend">
                                            <div class="banner-2-container">
                                                <div class="aenean">
                                                    <h4>Aqui voc� vende muito mais!</h4>
                                                    <h3>VendeMais</h3>
                                                </div>    
                                            </div>                                
                                        </div>
                                    </div>

                                    
                                </div>
                            
                                        
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="gallery_title">
                                        <div class="col-xs-12 col-sm-12 col-md-12 biliend">
                                            
                                              
                                                    
                                                    <hr>
                                    <h2 class="intro-text text-center">Dados da Conta</h2>
                                    <hr>

                                    <table align='center'>
                                        <tbody>
                                            <%
                                                    Usuario usuario = (Usuario) request.getAttribute("resultado");
                                                    if (usuario != null) {
                                            %>
                                            <tr>
                                                <td width=20%><label for="nome">Nome: </label></td>
                                                <td><%=usuario.getNome()%></td>
                                            </tr>
                                            <tr>
                                                <td><label for="telefone">Telefone: </label></td>
                                                <td><%=usuario.getTelefone()%></td>
                                            </tr>
                                            <tr>
                                                <td><label for="email">E-mail</label></td>
                                                <td><%=usuario.getEmail()%></td>
                                            </tr>
                                            <tr>
                                                <td><label for="senha">Senha: </label></td>
                                                <td>********</td>
                                            </tr>

                                        </tbody>
                                    </table>
                                    <table align='center'>
                                        <tr>
                                            <td>
                                                <form action="recuperarConta" method="get">
                                                    <input hidden type="text" name="telefone" value="<%=usuario.getTelefone()%>">
                                                    <input hidden type="text" name="email" value="<%=usuario.getEmail()%>"> 
                                                    <input hidden type="password" name="senha" value="<%=usuario.getSenha()%>"> 
                                                    <input type="image" src="images/edit.jpg">
                                                </form>
                                            </td>
                                        </tr>
                                    </table>
                                    <%
                                          
                                    %>
                                                   
                                            </div>                                
                                        </div>
                                    </div>
                                        
                                    <div class="col-xs-12 col-sm-12 col-md-12 biliend">
                                        
                                    <div class="row margin-b-30">
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="gallery_title">
                                        <div class="col-xs-12 col-sm-12 col-md-12 biliend">
                                            
                                              
                                                    
                                                    <hr>
                                    <h2 class="intro-text text-center">Dados da Conta</h2>
                                    <hr>

                                    <table align='center'>
                                        <tbody>
                                            <%
                                                   
                                            %>
                                            <tr>
                                                <td width=20%><label for="nome">Nome: </label></td>
                                                <td><%=usuario.getNome()%></td>
                                            </tr>
                                            <tr>
                                                <td><label for="telefone">Telefone: </label></td>
                                                <td><%=usuario.getTelefone()%></td>
                                            </tr>
                                            <tr>
                                                <td><label for="email">E-mail</label></td>
                                                <td><%=usuario.getEmail()%></td>
                                            </tr>
                                            <tr>
                                                <td><label for="senha">Senha: </label></td>
                                                <td>********</td>
                                            </tr>

                                        </tbody>
                                    </table>
                                    <table align='center'>
                                        <tr>
                                            <td>
                                                <form action="recuperarConta" method="get">
                                                    <input hidden type="text" name="telefone" value="<%=usuario.getTelefone()%>">
                                                    <input hidden type="text" name="email" value="<%=usuario.getEmail()%>"> 
                                                    <input hidden type="password" name="senha" value="<%=usuario.getSenha()%>"> 
                                                    <input type="image" src="images/edit.jpg">
                                                </form>
                                            </td>
                                        </tr>
                                    </table>
                                    <%
                                            }
                                    %>
                                                   
                                            </div>                                
                                        </div>
                                    </div>
                                    </div>

                                    
                                </div></div>
                             
                             
                        </div> 
                    </div> 
                </div>            
                <footer class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 footer">
                        <p class="copyright">Copyright � 2017 Vende Mais</p>
                    </div>    
                </footer>  <!-- .row -->      
            </div> <!-- .container -->
        </div> <!-- .main-body -->

        <!-- JavaScript -->
        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

    


</body>
</html>