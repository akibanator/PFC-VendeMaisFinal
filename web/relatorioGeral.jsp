<%@page import="modelo.Relatorio"%>
<%@page import="modelo.Vendedor"%>
<%@page import="modelo.Comprador"%>
<%@page import="modelo.Compra"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Endereco"%>
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
        <link rel="stylesheet" type="text/css" href="css/style3.css">
        <link rel="shortcut icon" href="images/i.ico" >        
        <title>VendeMais</title>
        <style>
            table {
                font-family: arial, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }

            td, th {
                text-align: left;
                padding: 2px;                
            }         
        </style>
    </head>
    <body>
        <script type="text/javascript"></script>
        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
                                        <a href="login.jsp" class="main-menu-link about block-keep-ratio__content flexbox-center">
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
                                                    <input class="about_proin" style="border:0;background-color:white;" type="submit"  id="palavra" value="Eletr�nicos, �udio e V�deo">
                                                </form>
                                            </li>
                                            <li style="line-height:16px;padding:5px 5px 3px 5px;"><form role="form" action="pesquisa" method="get">
                                                    <input hidden type="text" id="palavra" value="brinquedo" name="palavra">
                                                    <input class="about_proin" style="border:0;background-color:white;" type="submit"  id="palavra" value="Brinquedos e Hobbies">
                                                </form>
                                            </li>
                                            <li style="line-height:16px;padding:5px 5px 3px 5px;"><form role="form" action="pesquisa" method="get">
                                                    <input hidden type="text" id="palavra" value="cal�ado" name="palavra">
                                                    <input class="about_proin" style="border:0;background-color:white;" type="submit"  id="palavra" value="Cal�ados, Roupas e Bolsas">
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
                                                    <input class="about_proin" style="border:0;background-color:white;" type="submit"  id="palavra" value="Sa�de e Beleza">
                                                </form>
                                            </li>
                                            <li style="line-height:16px;padding:5px 5px 3px 5px;"><form role="form" action="pesquisa" method="get">
                                                    <input hidden type="text" id="palavra" value="musica" name="palavra">
                                                    <input class="about_proin" style="border:0;background-color:white;" type="submit"  id="palavra" value="M�sica">
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
                                        <a href="consultarConta" class="main-menu-link about block-keep-ratio__content flexbox-center">
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
                                        <a href="historicoCompra" class="main-menu-link about block-keep-ratio__content flexbox-center">
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
                                                    <input class="about_proin" style="border:0;background-color:white;" type="submit"  id="palavra" value="Eletr�nicos, �udio e V�deo">
                                                </form>
                                            </li>
                                            <li style="line-height:16px;padding:5px 5px 3px 5px;"><form role="form" action="pesquisa" method="get">
                                                    <input hidden type="text" id="palavra" value="brinquedo" name="palavra">
                                                    <input class="about_proin" style="border:0;background-color:white;" type="submit"  id="palavra" value="Brinquedos e Hobbies">
                                                </form>
                                            </li>
                                            <li style="line-height:16px;padding:5px 5px 3px 5px;"><form role="form" action="pesquisa" method="get">
                                                    <input hidden type="text" id="palavra" value="cal�ado" name="palavra">
                                                    <input class="about_proin" style="border:0;background-color:white;" type="submit"  id="palavra" value="Cal�ados, Roupas e Bolsas">
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
                                                    <input class="about_proin" style="border:0;background-color:white;" type="submit"  id="palavra" value="Sa�de e Beleza">
                                                </form>
                                            </li>
                                            <li style="line-height:16px;padding:5px 5px 3px 5px;"><form role="form" action="pesquisa" method="get">
                                                    <input hidden type="text" id="palavra" value="musica" name="palavra">
                                                    <input class="about_proin" style="border:0;background-color:white;" type="submit"  id="palavra" value="M�sica">
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
                                    <div class="banner-2-container">
                                        <div class="aenean">
                                            <h4>RELAT�RIO GERAL</h4>
                                            <h3>VendeMais</h3>
                                        </div>    
                                    </div>                                
                                </div>
                            </div>
                            <div class="content-main contact-content">
                                <div class="contact-content-upper">
                                    <div class="row">
                                    <h3>RELAT�RIO DE COMPRAS</h3>
                                    <form role="form" action="filtrarrelatorio" method="POST">
                                        <table style="width:100%;border:1px;">
                                                <tr style='background-color: white;'>
                                                    <td width="20%" style="padding: 3px;" colspan="4"><b>ORDENAR POR: </b></td>
                                                </tr>
                                                <tr style='background-color: white;'>                                                
                                                    <td style="padding: 3px;"><input style="width:60px;font-size: 13px;" type="radio" id="ordem" name="ordem" value="data_compra"> data</td>
                                                    <td style="padding: 3px;"><input style="width:60px;font-size: 13px;" type="radio" id="ordem" name="ordem" value="quantidade"> quantidade</td>
                                                    <td style="padding: 3px;"><input style="width:60px;font-size: 13px;" type="radio" id="ordem" name="ordem" value="total"> total</td>
                                                    <td style="padding: 3px;"><input style="width:60px;font-size: 13px;" type="radio" id="ordem" name="ordem" value="nota"> classifica��o</td>
                                                </tr>
                                            </table>  
                                            <hr>
                                            <table style="width:100%;vertical-align:middle;border:0px;">
                                                <tr style='background-color: white;'>
                                                    <td style="padding: 3px;" colspan="9" width="15%"><b>FILTRAR RESULTADOS POR:</b></td> 
                                                </tr>
                                                <tr style='background-color: white;'>                                                   
                                                    <td style="padding: 3px;" width="15%">Data entre:</td>                                            
                                                    <td style="padding: 3px;" width="13%"><input style="width:150px;font-size: 13px;"  type="date" id="data1" name="data1"></td>
                                                    <td style="padding: 3px;" width="20"> a </td>
                                                    <td style="padding: 3px;" width="20"><input style="width:150px;font-size: 13px;" type="date" id="data2" name="data2"></td>
                                                    <td></td>
                                                    <td style="padding: 3px;" width="20%">Quantidade entre:</td>
                                                    <td style="padding: 3px;" width="20"><input style="width:60px;font-size: 13px;" type="number" id="quantidade1" name="quantidade1" ></td>
                                                    <td style="padding: 3px;" width="20">a</td>
                                                    <td style="padding: 3px;" width="20"><input style="width:60px;font-size: 13px;" type="number" id="quantidade2" name="quantidade2" ></td>
                                                    <td style="padding: 3px;" rowspan="2" align="center"><input style="width:150px;font-size: 13px;" hidden type="text" id="id" name="id" value="<%=usuario.getId()%>"><input type="submit" class="btn btn-primary btn-lg" value="EMITIR"></td>
                                                </tr>                                        
                                                <tr style='background-color: white;'>
                                                    <td style="padding: 3px;">Valor entre:</td>
                                                    <td style="padding: 3px;"><input style="width:150px;font-size: 13px;" type="number" id="valor1" name="valor1" ></td>
                                                    <td style="padding: 3px;">a</td>
                                                    <td style="padding: 3px;"><input style="width:150px;font-size: 13px;" type="number" id="valor2" name="valor2" ></td>
                                                    <td></td>                                                
                                                    <td style="padding: 3px;">Classifica��o entre:</td>
                                                    <td style="padding: 3px;"><input style="width:60px;font-size: 13px" type="number" id="classificacao1" name="classificacao1" ></td>
                                                    <td style="padding: 3px;">a</td>
                                                    <td style="padding: 3px;"><input style="width:60px;font-size: 13px" type="number" id="classificacao2" name="classificacao2" ></td>
                                                    <input style="width:60px;font-size: 13px;" hidden type="text" id="usuario" name="usuario" value="comprador_id" >
                                                </tr>                                                                               
                                            </table>
                                    </form>
                                                                              
                                    </div>
                                </div>
                            </div>  
                                    
                            <div class="row margin-b-30"></div>  
                            
                            <div class="content-main contact-content">
                                <div class="contact-content-upper">
                                    <div class="row">
                                        <h3>RELAT�RIO DE VENDAS</h3>
                                        <form role="form" action="filtrarrelatorio" method="POST">
                                            <table style="width:100%;border:1px;">
                                                <tr style='background-color: white;'>
                                                    <td width="20%" style="padding: 3px;" colspan="4"><b>ORDENAR POR: </b></td>
                                                </tr>
                                                <tr style='background-color: white;'>                                                
                                                    <td style="padding: 3px;"><input style="width:60px;font-size: 13px;" type="radio" id="ordem" name="ordem" value="data_compra"> data</td>
                                                    <td style="padding: 3px;"><input style="width:60px;font-size: 13px;" type="radio" id="ordem" name="ordem" value="quantidade"> quantidade</td>
                                                    <td style="padding: 3px;"><input style="width:60px;font-size: 13px;" type="radio" id="ordem" name="ordem" value="total"> total</td>
                                                    <td style="padding: 3px;"><input style="width:60px;font-size: 13px;" type="radio" id="ordem" name="ordem" value="nota"> classifica��o</td>
                                                </tr>
                                            </table>  
                                            <hr>
                                            <table style="width:100%;vertical-align:middle;border:0px;">
                                                <tr style='background-color: white;'>
                                                    <td style="padding: 3px;" colspan="9" width="15%"><b>FILTRAR RESULTADOS POR:</b></td> 
                                                </tr>
                                                <tr style='background-color: white;'>                                                   
                                                    <td style="padding: 3px;" width="15%">Data entre:</td>                                            
                                                    <td style="padding: 3px;" width="13%"><input style="width:150px;font-size: 13px;"  type="date" id="data1" name="data1"></td>
                                                    <td style="padding: 3px;" width="20"> a </td>
                                                    <td style="padding: 3px;" width="20"><input style="width:150px;font-size: 13px;" type="date" id="data2" name="data2"></td>
                                                    <td></td>
                                                    <td style="padding: 3px;" width="20%">Quantidade entre:</td>
                                                    <td style="padding: 3px;" width="20"><input style="width:60px;font-size: 13px;" type="number" id="quantidade1" name="quantidade1" ></td>
                                                    <td style="padding: 3px;" width="20">a</td>
                                                    <td style="padding: 3px;" width="20"><input style="width:60px;font-size: 13px;" type="number" id="quantidade2" name="quantidade2" ></td>
                                                    <td style="padding: 3px;" rowspan="2" align="center"><input style="width:150px;font-size: 13px;" hidden type="text" id="id" name="id" value="<%=usuario.getId()%>"><input type="submit" class="btn btn-primary btn-lg" value="EMITIR"></td>
                                                </tr>                                        
                                                <tr style='background-color: white;'>
                                                    <td style="padding: 3px;">Valor entre:</td>
                                                    <td style="padding: 3px;"><input style="width:150px;font-size: 13px;" type="number" id="valor1" name="valor1" ></td>
                                                    <td style="padding: 3px;">a</td>
                                                    <td style="padding: 3px;"><input style="width:150px;font-size: 13px;" type="number" id="valor2" name="valor2" ></td>
                                                    <td></td>                                                
                                                    <td style="padding: 3px;">Classifica��o entre:</td>
                                                    <td style="padding: 3px;"><input style="width:60px;font-size: 13px" type="number" id="classificacao1" name="classificacao1" ></td>
                                                    <td style="padding: 3px;">a</td>
                                                    <td style="padding: 3px;"><input style="width:60px;font-size: 13px" type="number" id="classificacao2" name="classificacao2" ></td>
                                                    <input style="width:60px;font-size: 13px;" hidden type="text" id="usuario" name="usuario" value="vendedor_id" >
                                                </tr>                                                                               
                                            </table>
                                        </form>                                                                        
                                    </div>
                                </div>
                            </div>   
                            
                            <div class="row margin-b-30"></div>     
                             <p class="copyright">Copyright � 2017 Vende Mais</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>