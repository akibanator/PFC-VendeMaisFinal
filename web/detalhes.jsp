<%@page import="modelo.Usuario"%>
<%@page import="modelo.Anuncio"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Vende Mais</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">        
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,400italic">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/style3.css">
        <link rel="shortcut icon" href="images/i.ico">    
    </head>

    <body class="contact-page">
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
                                                                        <em>1-8 Characters</em>
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

                                <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-left  about-main">                                    
                                    <a href="login.jsp" class="main-menu-link about block-keep-ratio__content flexbox-center">
                                        <p align="center"><img src="images/corp.png" height="60" width="60"></p>
                                        ACESSO CORPORATIVO
                                    </a>                                    
                                </div>
                                <%}%>
                            </div> <!-- main-menu -->
                        </aside> <!-- main-navigation -->

                        <div class="content-main contact-content">
                            <div class="contact-content-upper">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="gallery_title">
                                            <h3>VENDEMAIS</h3>
                                            <h4>DETALHES DO PRODUTO</h4>
                                        </div>    
                                    </div>                            
                                </div>
                                <%
                                    Anuncio anuncio = (Anuncio) request.getAttribute("resultado");
                                    if (anuncio != null) {
                                %>   
                                <div class="row">  
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">        
                                        <div class="row">
                                            <div class="preview col-md-6">

                                                <div class="preview-pic tab-content">
                                                    <p align="center"><div class="tab-pane" id="pic-1"><img src="images/img.png"  height="300" width="200"></div></p>
                                                    <div class="tab-pane" id="pic-2"><img src="images/img.png" height="300" width="200"></div>
                                                    <div class="tab-pane" id="pic-3"><img src="images/img.png" height="300" width="200"></div>
                                                    <div class="tab-pane" id="pic-4"><img src="images/img.png" height="300" width="200"></div>
                                                    <div class="tab-pane active" id="pic-5"><img src="images/img.png" height="300" width="200"></div>
                                                </div>
                                                <ul class="preview-thumbnail nav nav-tabs">
                                                    <li class=""><a data-target="#pic-1" data-toggle="tab" aria-expanded="false"><img src="images/img.png" height="60" width="60" ></a></li>
                                                    <li class=""><a data-target="#pic-2" data-toggle="tab" aria-expanded="false"><img src="images/img.png" height="60" width="60"></a></li>
                                                    <li><a data-target="#pic-3" data-toggle="tab"><img src="images/img.png" height="60" width="60"></a></li>
                                                    <li class=""><a data-target="#pic-4" data-toggle="tab" aria-expanded="false"><img src="images/img.png" height="60" width="60"></a></li>
                                                    <li class="active"><a data-target="#pic-5" data-toggle="tab" aria-expanded="true"><img src="images/img.png" height="60" width="60"></a></li>
                                                </ul>


                                            </div>
                                            <div class="col-xs-5" style="border:0px solid gray">
                                                <!-- Datos del vendedor y titulo del producto -->
                                                <h6 class="title-price"><small>PRODUTO: </small></h6>
                                                <h3 style="margin-top:0px;"><%=anuncio.getTitulo()%></h3>                                               

                                                <!-- Preços -->
                                                <h6 class="title-price"><small>PREÇO: </small></h6>
                                                <h3 style="margin-top:0px;">R$ <%=anuncio.getPreco()%></h3>

                                                <div class="section" style="padding-bottom:20px;">
                                                    <h6 class="title-attr"><small>QUANTIDADE DISPONÍVEL: <%=anuncio.getQuantidade()%></small></h6>
                                                </div>
                                                
                                                <!-- Botones de compra -->
                                                <div class="section" style="padding-bottom:20px;">
                                                    <form action="comprar" method="post">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <input hidden type="text" id="id" name="id" value="<%=anuncio.getId()%>">
                                                                    <input type="submit" class="btn btn-success" value="COMPRAR">
                                                                </td>
                                                            </tr>
                                                        </table> 
                                                    </form>                                                    
                                                </div>                                        
                                            </div>                              

                                            <div class="container-fluid">		
                                                <div class="col-md-12 product-info">
                                                    <ul id="myTab" class="nav nav-tabs nav_tabs">
                                                        <li class="active"><a href="#service-one" data-toggle="tab">DESCRIÇÃO</a></li>
                                                        <li><a href="#service-two" data-toggle="tab">CARACTERISTICAS</a></li>
                                                        <li><a href="#service-three" data-toggle="tab">ENVIO</a></li>
                                                    </ul>
                                                    
                                                    <div id="myTabContent" class="tab-content">
                                                        <div class="tab-pane fade in active" id="service-one">
                                                            <section class="container product-info">
                                                            <%=anuncio.getDescricao()%>
                                                            </section>
                                                        </div>
                                                        <div class="tab-pane fade" id="service-two">

                                                            <section class="container product-info">
                                                                <li><b>Altura (em cm.): </b><%=anuncio.getAltura()%></li>
                                                                <li><b>Largura (em cm.): </b><%=anuncio.getLargura()%></li>
                                                                <li><b>Peso (em gramas): </b><%=anuncio.getPeso()%></li>
                                                                <li><b>Estado: </b><%=anuncio.getEstado()%></li>                                                               
                                                            </section>

                                                        </div>
                                                        <div class="tab-pane fade" id="service-three">
                                                            <section class="container product-info">
                                                                <li><b>Forma de Envio: </b><%=anuncio.getFormaEnvio()%></li>
                                                                <li><b>Valor do Frete: </b><%=anuncio.getValorFrete()%></li>
                                                            </section>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                </div>
                                            </div>	
                                        </div>    
                                    </div>
                                </div>
                                <%}%>
                            </div>
                        </div>
                    </div>
                </div>
                <footer class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 footer">
                        <p class="copyright">Copyright © 2017 Vende Mais</p>
                    </div>    
                </footer>
            </div>
        </div>

            
    </body>
</html>