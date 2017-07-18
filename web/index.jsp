<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,400italic">        
        <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/business-casual.css" rel="stylesheet">
        <link rel="shortcut icon" href="images/i.ico" >
        <SCRIPT src="js/jquery-1.5.2.min.js"></SCRIPT>
	<SCRIPT src="js/jquery.maskedinput-1.3.min.js"></SCRIPT>
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
                                        <a href="contact.jsp" class="main-menu-link contact block-keep-ratio__content flexbox-center">
                                            <i class="fa fa-envelope-o fa-4x main-menu-link-icon"></i>
                                            CONTATO
                                        </a>                                
                                    </div>                                    
                                </div>
                                <%if (usuario == null) {%>
                                <div class="menu-container">      
                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-left  about-main">                                    
                                        <a href="#signup" data-toggle="modal" data-target=".bs-modal-sm" class="main-menu-link about block-keep-ratio__content flexbox-center">
                                            <p align="center"><img src="images/login.png" height="60" width="60"></p>
                                            LOGIN                                            
                                        </a>                                    
                                    </div>
                                    <div class="modal fade bs-modal-sm" id="myModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" style="display: none;">
                                        <div class="modal-dialog modal-sm">
                                            <div class="modal-content">
                                                <br>
                                                <div class="bs-example bs-example-tabs">
                                                    <ul id="myTab" class="nav nav-tabs">
                                                        <li class="active"><a href="#signin" data-toggle="tab">Entrar</a></li>
                                                        <li class=""><a href="#signup" data-toggle="tab">Registrar-se</a></li>
                                                    </ul>
                                                </div>
                                                <div class="modal-body">
                                                    <div id="myTabContent" class="tab-content">
                                                        <div class="tab-pane fade active in" id="signin">
                                                            <form role="form" class="form-horizontal" action="login" method="post">
                                                                <fieldset>                                                                    
                                                                    <div class="control-group">
                                                                        <label class="control-label" for="usuario">Usuario: </label>
                                                                        <input required="" id="usuario" name="usuario" type="text" class="form-control">                                                                        
                                                                    </div>
                                                                    <div class="control-group">
                                                                        <label class="control-label" for="senha">Senha: </label>
                                                                        <input required="" id="senha" name="senha" maxlength="8" class="form-control" type="password">
                                                                    </div>
                                                                    <br>
                                                                    <div class="control-group" align="center">
                                                                        <label class="control-label" for="signin"></label>                                                                                                                                               
                                                                        <table align='center'>
                                                                            <tr>
                                                                                <td>
                                                                                    <input type="submit" id="confirmsignup" name="confirmsignup" class="btn btn-success" value="ENTRAR">
                                                                                </td>
                                                                                <td>
                                                                                    <button type="button" class="btn btn-login" data-dismiss="modal">CANCELAR</button>
                                                                                </td>
                                                                            </tr>
                                                                        </table>                                                                        
                                                                    </div>
                                                                </fieldset>
                                                            </form>
                                                        </div>
                                                        <div class="tab-pane fade" id="signup">
                                                            <form role="form" action="cadastrarConta" method="post">     
                                                                    <div class="control-group">
                                                                        <label class="control-label" for="email">Email:</label>                                                                        
                                                                        <input id="email" name="email" class="form-control" type="text" required="">
                                                                    </div>
                                                                    <div class="control-group">
                                                                        <label class="control-label" for="nome">Nome Completo: </label>
                                                                        <input id="nome" name="nome" class="form-control" maxlength="100" type="text" required="">
                                                                    </div>
                                                                    <div class="control-group">
                                                                        <label class="control-label" for="cpf">CPF:  </label>
                                                                        <input id="cpf" name="cpf" class="form-control" maxlength="14" type="text" required>                                                                         
                                                                    </div>
                                                                    <div class="control-group">
                                                                        <label class="control-label" for="telefone">Telefone: </label>
                                                                        <input id="telefone" name="telefone" class="form-control" type="text" required="">
                                                                    </div>
                                                                    <div class="control-group">
                                                                        <label class="control-label" for="senha">Senha: </label>
                                                                        <input id="senha" name="senha" class="form-control" maxlength="8" minlength="6" type="password" required="">
                                                                        <em>6-8 Characters</em>
                                                                    </div>                                                                
                                                                    <br>    
                                                                    <div class="control-group" align="center">
                                                                        <label class="control-label" for="confirmsignup"></label>
                                                                        <div class="controls">                                                                            
                                                                            <table align='center'>
                                                                                <tr>
                                                                                    <td>
                                                                                        <input type="submit"  class="btn btn-success" value="CADASTRAR">
                                                                                    </td>
                                                                                    <td>
                                                                                        <button type="button" class="btn btn-login" data-dismiss="modal">CANCELAR</button>
                                                                                    </td>
                                                                                </tr>
                                                                            </table> 
                                                                        </div>
                                                                    </div>                                                              
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-right  contact-main">
                                        <a href="login.jsp" class="main-menu-link contact block-keep-ratio__content flexbox-center">
                                            <p align="center"><img src="images/corp.png" height="60" width="60"></p>                                            
                                            ACESSO CORPORATIVO
                                        </a>                                
                                    </div>
                                </div>
                                
                                <div class="menu-container">
                                    <div class="box bottom-main block-keep-ratio  block-width-full">

                                        <ul class="info info-ul">
                                            <li style="line-height:16px;padding:5px 5px 3px 5px;"><form role="form" action="pesquisa" method="get">
                                                    <input hidden type="text" id="palavra" value="celular" name="palavra">
                                                    <input class="about_proin" style="border:0;background-color:white;" type="submit"  id="palavra" value="Celulares e Telefones">
                                                </form>
                                            </li>
                                            <li style="line-height:16px;padding:5px 5px 3px 5px;"><form role="form" action="pesquisa" method="get">
                                                    <input hidden type="text" id="palavra" value="eletronico" name="palavra">
                                                    <input class="about_proin" style="border:0;background-color:white;" type="submit"  id="palavra" value="Eletrônicos, Áudio e Vídeo">
                                                </form>
                                            </li>
                                            <li style="line-height:16px;padding:5px 5px 3px 5px;"><form role="form" action="pesquisa" method="get">
                                                    <input hidden type="text" id="palavra" value="brinquedo" name="palavra">
                                                    <input class="about_proin" style="border:0;background-color:white;" type="submit"  id="palavra" value="Brinquedos e Hobbies">
                                                </form>
                                            </li>
                                            <li style="line-height:16px;padding:5px 5px 3px 5px;"><form role="form" action="pesquisa" method="get">
                                                    <input hidden type="text" id="palavra" value="calçado" name="palavra">
                                                    <input class="about_proin" style="border:0;background-color:white;" type="submit"  id="palavra" value="Calçados, Roupas e Bolsas">
                                                </form>
                                            </li>
                                            <li style="line-height:16px;padding:5px 5px 3px 5px;"><form role="form" action="pesquisa" method="get">
                                                    <input hidden type="text" id="palavra" value="filme" name="palavra">
                                                    <input class="about_proin" style="border:0;background-color:white;" type="submit"  id="palavra" value="Filmes e Seriados">
                                                </form>
                                            </li>
                                            <li style="line-height:16px;padding:5px 5px 3px 5px;"><form role="form" action="pesquisa" method="get">
                                                    <input hidden type="text" id="palavra" value="musica" name="palavra">
                                                    <input class="about_proin" style="border:0;background-color:white;" type="submit"  id="palavra" value="Instrumentos Musicais">
                                                </form>
                                            </li>
                                            <li style="line-height:16px;padding:5px 5px 3px 5px;"><form role="form" action="pesquisa" method="get">
                                                    <input hidden type="text" id="palavra" value="saude" name="palavra">
                                                    <input class="about_proin" style="border:0;background-color:white;" type="submit"  id="palavra" value="Saúde e Beleza">
                                                </form>
                                            </li>
                                            <li style="line-height:16px;padding:5px 5px 3px 5px;"><form role="form" action="pesquisa" method="get">
                                                    <input hidden type="text" id="palavra" value="musica" name="palavra">
                                                    <input class="about_proin" style="border:0;background-color:white;" type="submit"  id="palavra" value="Música">
                                                </form>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="menu-container">
                                    <div class="block-keep-ratio block-keep-ratio-2-1 block-width-full home">
                                        <a href="anuncieconosco.jsp" class="block-keep-ratio__content  main-menu-link"> <span class="main-menu-link-text"></span>
                                        </a>
                                    </div>
                                </div>
                                <%;}else{%>
                                <div class="menu-container">                                
                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-left  about-main">                                    
                                        <a href="consultarConta" class="main-menu-link contact block-keep-ratio__content flexbox-center">
                                            <i class="fa fa-user fa-4x main-menu-link-icon"></i>
                                            CONTA
                                        </a>                                    
                                    </div>
                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-right  contact-main">
                                        <a href="logout" class="main-menu-link about block-keep-ratio__content flexbox-center">
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
                                        <a href="anuncioAbertoVendedor" class="main-menu-link about block-keep-ratio__content flexbox-center">
                                            <p align="center"><img src="images/venda.png" height="60" width="60"></p>
                                            VENDAS
                                        </a>                                    
                                    </div>   
                                </div> 
                                
                                <div class="menu-container">
                                    <div class="box bottom-main block-keep-ratio  block-width-full">

                                        <ul class="info info-ul">
                                            <li style="line-height:16px;padding:5px 5px 3px 5px;"><form role="form" action="pesquisa" method="get">
                                                    <input hidden type="text" id="palavra" value="celular" name="palavra">
                                                    <input class="about_proin" style="border:0;background-color:white;" type="submit"  id="palavra" value="Celulares e Telefones">
                                                </form>
                                            </li>
                                            <li style="line-height:16px;padding:5px 5px 3px 5px;"><form role="form" action="pesquisa" method="get">
                                                    <input hidden type="text" id="palavra" value="eletronico" name="palavra">
                                                    <input class="about_proin" style="border:0;background-color:white;" type="submit"  id="palavra" value="Eletrônicos, Áudio e Vídeo">
                                                </form>
                                            </li>
                                            <li style="line-height:16px;padding:5px 5px 3px 5px;"><form role="form" action="pesquisa" method="get">
                                                    <input hidden type="text" id="palavra" value="brinquedo" name="palavra">
                                                    <input class="about_proin" style="border:0;background-color:white;" type="submit"  id="palavra" value="Brinquedos e Hobbies">
                                                </form>
                                            </li>
                                            <li style="line-height:16px;padding:5px 5px 3px 5px;"><form role="form" action="pesquisa" method="get">
                                                    <input hidden type="text" id="palavra" value="calçado" name="palavra">
                                                    <input class="about_proin" style="border:0;background-color:white;" type="submit"  id="palavra" value="Calçados, Roupas e Bolsas">
                                                </form>
                                            </li>
                                            <li style="line-height:16px;padding:5px 5px 3px 5px;"><form role="form" action="pesquisa" method="get">
                                                    <input hidden type="text" id="palavra" value="filme" name="palavra">
                                                    <input class="about_proin" style="border:0;background-color:white;" type="submit"  id="palavra" value="Filmes e Seriados">
                                                </form>
                                            </li>
                                            <li style="line-height:16px;padding:5px 5px 3px 5px;"><form role="form" action="pesquisa" method="get">
                                                    <input hidden type="text" id="palavra" value="musica" name="palavra">
                                                    <input class="about_proin" style="border:0;background-color:white;" type="submit"  id="palavra" value="Instrumentos Musicais">
                                                </form>
                                            </li>
                                            <li style="line-height:16px;padding:5px 5px 3px 5px;"><form role="form" action="pesquisa" method="get">
                                                    <input hidden type="text" id="palavra" value="saude" name="palavra">
                                                    <input class="about_proin" style="border:0;background-color:white;" type="submit"  id="palavra" value="Saúde e Beleza">
                                                </form>
                                            </li>
                                            <li style="line-height:16px;padding:5px 5px 3px 5px;"><form role="form" action="pesquisa" method="get">
                                                    <input hidden type="text" id="palavra" value="musica" name="palavra">
                                                    <input class="about_proin" style="border:0;background-color:white;" type="submit"  id="palavra" value="Música">
                                                </form>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="menu-container">
                                    <div class="block-keep-ratio block-keep-ratio-2-1 block-width-full home">
                                        <a href="anuncieconosco.jsp" class="block-keep-ratio__content  main-menu-link"> <span class="main-menu-link-text"></span>
                                        </a>
                                    </div>
                                </div>                               
                                <%}%>
                            </div> <!-- main-menu -->
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
                                    <form role="form" action="pesquisa" method="get">
                                        <table align="center">
                                            <tbody><tr>
                                                    <td><input type="text" size="120" class="form-control" id="palavra" name="palavra" placeholder="PESQUISA POR PALAVRA CHAVE..."></td>
                                                    <td><input type="image" src="images/pesquisa.png" height="45" width="45"></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </form>
                                </div>
                            </div>
                            <div class="row margin-b-30">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <div class="box bottom-main">
                                        <div class="info float-container">
                                            <div class="col-sm-12 bottom-title">
                                                <h3 class="text-uppercase">Variedade em produtos</h3>
                                                <h4 class="text-uppercase">Você só encontra aqui!</h4>
                                            </div>
                                            <div class="row">
                                                <div class="col-xxs-12 col-xs-6 col-sm-6 col-md-4 col-lg-4">
                                                    <div class="bottom-img">
                                                        <img src="images/home-img-4.jpg" alt="Image">
                                                        <p class="first">Veículos</p>    
                                                    </div>                                      
                                                </div>
                                                <div class="col-xxs-12 col-xs-6 col-sm-6 col-md-4 col-lg-4">
                                                    <div class="bottom-img">
                                                        <img src="images/home-img-5.jpg" alt="Image">
                                                        <p class="second">Imóveis</p>    
                                                    </div>                                      
                                                </div>
                                                <div class="col-xxs-12 col-xs-6 col-sm-6 col-md-4 col-lg-4">
                                                    <div class="bottom-img">
                                                        <img src="images/home-img-7.jpg" alt="Image">
                                                        <p class="third">Smartphones</p>    
                                                    </div>                                      
                                                </div>
                                            </div>
                                            <p class="bottom-desc">A Vende Mais conta com uma grande variedade de produtos. Estamos trazendo sempre os melhores produtos pra você e garantimos segurança em suas compras e vendas.</p><hr>
                                            <div class="col-sm-12 location-main"> 
                                                <div class="pull-right bottom-user">
                                                    <a href="anuncioEmAberto"><i class="fa fa-caret-right"></i><span>Ver produtos...</span></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div> <!-- row -->
                            <div class="row">

                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                    <div class="box london">
                                        <div class="box-icon">
                                            <img src="images/home-img-2.jpg" alt="Image" class="img-responsive" height="767" width="388">
                                        </div>
                                        <div class="info float-container">
                                            <div class="col-sm-12 london-title">
                                                <h3 class="text-uppercase">Tecnologia e Informática</h3>
                                            </div>
                                            <p>Aqui você encontra tudo sobre informatica e tecnologia: impressoras, computadores, notebooks, teclados, mouses, monitores, precessadores e entre outras variedades!</p><hr>
                                            <div class="col-sm-12 location-main"> 
                                                <div class="col-sm-12 location-main"> 
                                                    <div class="pull-right bottom-user">
                                                        <a href="#"><i class="fa fa-caret-right"></i><span>Ver Mais...</span></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div><div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                    <div class="box paris">
                                        <div class="box-icon">
                                            <img src="images/home-img-3.jpg" alt="Image" class="img-responsive" height="767" width="388">
                                        </div>
                                        <div class="info float-container">
                                            <div class="col-sm-12 london-title paris-title">
                                                <h3 class="text-uppercase">eletrodomésticos para toda a sua casa</h3>
                                            </div>
                                            <p>Aqui você encontra tudo para sua casa: geladeira, microondas, fogão, aspirador de pó, liquidificador, batedeira, cafeteira e outras variedades!</p><hr>
                                            <div class="col-sm-12 location-main"> 
                                                <div class="pull-right bottom-user">
                                                    <a href="#"><i class="fa fa-caret-right"></i><span>Ver Mais...</span></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div> <!-- row -->
                        </div> <!-- .content-main -->
                    </div> <!-- .main-page -->
                </div> <!-- .row -->     
                
                <SCRIPT src="js/validacaoInputs.js"></SCRIPT>
                <script src="js/jquery.js"></script>
                <script src="js/bootstrap.min.js"></script>
                
                <footer class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 footer">
                        <p class="copyright">Copyright © 2017 Vende Mais</p>
                    </div>    
                </footer>  <!-- .row -->      
            </div> <!-- .container -->
        </div> <!-- .main-body -->
        
    </body>
</html>

