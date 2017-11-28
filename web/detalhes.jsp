<%@page import="modelo.Relatorio"%>
<%@page import="modelo.Compra"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.Anuncio"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,400italic">
        <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/style3.css">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="shortcut icon" href="images/i.ico" >
        <SCRIPT src="js/jquery.maskedinput-1.3.min.js"></SCRIPT>
        <link rel="shortcut icon" href="images/i.ico" >    
        <title>VendeMais</title>
        <style>
            .animated {
                -webkit-transition: height 0.2s;
                -moz-transition: height 0.2s;
                transition: height 0.2s;
            }

            .stars
            {
                margin: 20px 0;
                font-size: 24px;
                color: #190707;
            }
            .thumbnail {
                padding:0px;
            }
            .panel {
                position:relative;
            }
            .panel>.panel-heading:after,.panel>.panel-heading:before{
                position:absolute;
                top:11px;left:-16px;
                right:100%;
                width:0;
                height:0;
                display:block;
                content:" ";
                border-color:transparent;
                border-style:solid solid outset;
                pointer-events:none;
            }
            .panel>.panel-heading:after{
                border-width:7px;
                border-right-color:#f7f7f7;
                margin-top:1px;
                margin-left:2px;
            }
            .panel>.panel-heading:before{
                border-right-color:#ddd;
                border-width:8px;
            }        
        </style>
    </head>
    <body class="contact-page">

        <SCRIPT src="js/validacaoInputs.js"></SCRIPT>
        <script src="js/jquery.js"></script>
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
                                <%;
                                } else {%>
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
                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-left  contact-main">
                                        <a href="relatorioGeral.jsp" class="main-menu-link about block-keep-ratio__content flexbox-center">
                                            <p align="center"><img src="images/estatistica.png" height="60" width="60"></p>
                                            ESTATÍSTICA
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
                                                    <p align="center">
                                                    <div class="tab-pane active" id="pic-1"><img src="BancoImagens/<%=anuncio.getPic1()%>"  height="300" width="200"></div></p>
                                                    <div class="tab-pane" id="pic-2"><img src="BancoImagens/<%=anuncio.getPic2()%>" height="300" width="200"></div>
                                                    <div class="tab-pane" id="pic-3"><img src="BancoImagens/<%=anuncio.getPic3()%>" height="300" width="200"></div>
                                                    <div class="tab-pane" id="pic-4"><img src="BancoImagens/<%=anuncio.getPic4()%>" height="300" width="200"></div>
                                                    <div class="tab-pane" id="pic-5"><img src="BancoImagens/<%=anuncio.getPic5()%>" height="300" width="200"></div>
                                                </div>
                                                <ul class="preview-thumbnail nav nav-tabs">
                                                    <li class="active"><a data-target="#pic-1" data-toggle="tab" aria-expanded="false"><img src="BancoImagens/<%=anuncio.getPic1()%>" height="60" width="60" ></a></li>
                                                    <li class=""><a data-target="#pic-2" data-toggle="tab" aria-expanded="false"><img src="BancoImagens/<%=anuncio.getPic2()%>" height="60" width="60"></a></li>
                                                    <li><a data-target="#pic-3" data-toggle="tab"><img src="BancoImagens/<%=anuncio.getPic3()%>" height="60" width="60"></a></li>
                                                    <li class=""><a data-target="#pic-4" data-toggle="tab" aria-expanded="false"><img src="BancoImagens/<%=anuncio.getPic4()%>" height="60" width="60"></a></li>
                                                    <li class=""><a data-target="#pic-5" data-toggle="tab" aria-expanded="true"><img src="BancoImagens/<%=anuncio.getPic5()%>" height="60" width="60"></a></li>
                                                </ul>
                                            </div>
                                            <div class="col-xs-5" style="border:0px solid gray">
                                                <!-- Datos del vendedor y titulo del producto -->
                                                <h6 class="title-price"><small>PRODUTO: </small></h6>
                                                <h3 style="margin-top:0px;"><%=anuncio.getTitulo()%></h3>                                               

                                                <h6 class="title-price"><small>PREÇO: </small></h6>
                                                <h3 style="margin-top:0px;">R$ <%=anuncio.getPreco()%></h3>
                                                
                                                <h6 class="title-price"><small>CLASSIFICAÇÃO: </small></h6>
                                                <%
                                                    Compra nota = (Compra) request.getAttribute("resultado1");
                                                    if (nota != null) {%>
                                                <h3 style="margin-top:0px;"><% if (nota.getMediaNota() == 0.0) {%>Nenhuma classificação foi feita ainda<%}else{%><%=nota.getMediaNota()%><br><span class="stars starrr" data-rating="<%=nota.getMediaNota()%>"></span><%}%></h3>
                                                <%} else {%>
                                                <h3 style="margin-top:0px;">CLASSIFICAÇÃO: Nenhuma classificação foi feita ainda</small></h6><%}%>                                               
                                     
                                                <h6 class="title-price"><small>QUANTIDADE: </small></h6>
                                                <h3 style="margin-top:0px;"><%=anuncio.getQuantidade()%></h3>

                                                <%if (anuncio.getFormapag().equals("negociar direto com comprador")){%>                                                
                                                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">Negociação direta</button>
                                                <div class="modal fade" id="myModal" role="dialog">
                                                    <div class="modal-dialog modal-sm">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                <h4 class="modal-title">Contato do Vendedor</h4>
                                                            </div>                                                   
                                                            <div class="modal-body">
                                                                <p align="justify">Parece que você se interessou por este anuncio. Este anuncio permite apenas negociação direta com o vendedor. Segue informações para contato:</p>
                                                                <div class="control-group">
                                                                    <br>
                                                                    <label class="control-label">Vendedor:  </label>
                                                                    <%=anuncio.getVendedor().getNome()%>
                                                                </div>
                                                                <div class="control-group">
                                                                    <label class="control-label">Telefone:  </label>
                                                                    <%=anuncio.getVendedor().getTelefone()%>
                                                                </div>
                                                                <div class="control-group">
                                                                    <label class="control-label">E-mail:  </label>
                                                                    <%=anuncio.getVendedor().getEmail()%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%}else{%>
                                                <br>
                                                <form action="comprar" method="post">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <input hidden type="text" id="id" name="id" value="<%=anuncio.getId()%>">
                                                                <input hidden type="text" id="vendedor" name="vendedor" value="<%=anuncio.getVendedor().getId()%>">
                                                                <input type="submit" class="btn btn-success" value="COMPRAR">
                                                            </td>
                                                        </tr>
                                                    </table> 
                                                </form>                                          
                                                <%}%>
                                            </div>                              

                                            <div class="container-fluid">		
                                                <div class="col-md-12 product-info">
                                                    <ul id="myTab" class="nav nav-tabs nav_tabs">
                                                        <li class="active"><a href="#service-one" data-toggle="tab">DESCRIÇÃO</a></li>
                                                        <li><a href="#service-two" data-toggle="tab">CARACTERISTICAS</a></li>
                                                        <li><a href="#service-three" data-toggle="tab">ENVIO</a></li>
                                                        <li><a href="#service-five" data-toggle="tab">CLASSIFICAÇÃO</a></li>
                                                    </ul>

                                                    <div id="myTabContent" class="tab-content">
                                                        <div class="tab-pane fade in active" id="service-one">
                                                            <section class="container product-info">
                                                                <%=anuncio.getDescricao()%>
                                                            </section>
                                                        </div>
                                                        <div class="tab-pane fade" id="service-two">
                                                            <section class="container product-info">
                                                                <li><b>Altura (em cm.): </b><%if ("".equals(anuncio.getAltura()) | "0".equals(anuncio.getAltura())) {%>Não informado<%} else {%><%=anuncio.getAltura()%><%}%></li>
                                                                <li><b>Largura (em cm.): </b><%if ("".equals(anuncio.getLargura()) | "0".equals(anuncio.getLargura())) {%>Não informado<%} else {%><%=anuncio.getLargura()%><%}%></li>
                                                                <li><b>Peso (em gramas): </b><%if ("".equals(anuncio.getPeso()) | "0".equals(anuncio.getPeso())) {%>Não informado<%} else {%><%=anuncio.getPeso()%><%}%></li>
                                                                <li><b>Estado do produto: </b><%=anuncio.getEstadoprod()%></li>   
                                                                <li><b>Cor: </b><%if ("".equals(anuncio.getCor()) | "0".equals(anuncio.getCor())) {%>Não informado<%} else {%><%=anuncio.getCor()%><%}%></li>
                                                                    <% if (anuncio.getCategoria().getId() == 2) {%>             
                                                                <li><b>Área Útil(m²): </b><%if ("".equals(anuncio.getArea()) | "0".equals(anuncio.getArea())) {%>Não informado<%} else {%><%=anuncio.getArea()%><%}%></li>
                                                                <li><b>Área Total(m²): </b><%if ("".equals(anuncio.getAreatotal()) | "0".equals(anuncio.getAreatotal())) {%>Não informado<%} else {%><%=anuncio.getAreatotal()%><%}%></li>
                                                                LOCALIZAÇÃO 
                                                                <li><b>CEP: </b><%if ("".equals(anuncio.getCep()) | "0".equals(anuncio.getCep())) {%>Não informado<%} else {%><%=anuncio.getCep()%><%}%></li>
                                                                <li><b>Bairro: </b><%if ("".equals(anuncio.getBairro()) | "0".equals(anuncio.getBairro())) {%>Não informado<%} else {%><%=anuncio.getBairro()%><%}%></li>
                                                                <li><b>Cidade: </b><%if ("".equals(anuncio.getCidade()) | "0".equals(anuncio.getCidade())) {%>Não informado<%} else {%><%=anuncio.getCidade()%><%}%></li>
                                                                <li><b>Estado: </b><%if ("".equals(anuncio.getEstado()) | "0".equals(anuncio.getEstado())) {%>Não informado<%} else {%><%=anuncio.getEstado()%><%}%></li>
                                                                <li><b>Rua: </b><%if ("".equals(anuncio.getRua()) | "0".equals(anuncio.getRua())) {%>Não informado<%} else {%><%=anuncio.getRua()%><%}%></li>
                                                                <li><b>Possui vaga para Estacionamento: </b><%if ("".equals(anuncio.getVaga()) | "0".equals(anuncio.getVaga())) {%>Não informado<%} else {%><%=anuncio.getVaga()%><%}%></li>
                                                                    <%} else {
                                                                        }%>
                                                                <br><b>OBSERVAÇÕES:</b><%if ("".equals(anuncio.getObservacoes()) | "0".equals(anuncio.getObservacoes())) {%>Nenhuma observação<%} else {%><%=anuncio.getObservacoes()%><%}%>
                                                            </section>
                                                        </div>
                                                        <div class="tab-pane fade" id="service-three">
                                                            <section class="container product-info">
                                                                <li><b>Forma de Envio: </b><%=anuncio.getFormaEnvio()%></li>
                                                                <li><b>Prazo estimado para entrega: </b><%if (anuncio.getPrazo_entrega()!=0){%><%=anuncio.getPrazo_entrega()%> dias<%}else{%>Não informado<%}%></li>
                                                                <li><b>Valor do Frete: </b><%if (anuncio.getValorFrete()!=0){%><%=anuncio.getValorFrete()%><%}else{%>Não informado<%}%></li></li>
                                                            </section>
                                                        </div>
                                                        <div class="tab-pane fade" id="service-five">
                                                            <section class="container product-info">                                                                
                                                                COMENTARIOS:
                                                                <%
                                                                    List<Compra> todasCompras = (List<Compra>) request.getAttribute("resultado2");
                                                                    if (todasCompras != null) {
                                                                        for (Compra compra : todasCompras) {
                                                                %>
                                                                <script>(function(e){var t, o = {className:"autosizejs", append:"", callback:!1, resizeDelay:10}, i = '<textarea tabindex="-1" style="position:absolute; top:-999px; left:0; right:auto; bottom:auto; border:0; padding: 0; -moz-box-sizing:content-box; -webkit-box-sizing:content-box; box-sizing:content-box; word-wrap:break-word; height:0 !important; min-height:0 !important; overflow:hidden; transition:none; -webkit-transition:none; -moz-transition:none;"/>', n = ["fontFamily", "fontSize", "fontWeight", "fontStyle", "letterSpacing", "textTransform", "wordSpacing", "textIndent"], s = e(i).data("autosize", !0)[0]; s.style.lineHeight = "99px", "99px" === e(s).css("lineHeight") && n.push("lineHeight"), s.style.lineHeight = "", e.fn.autosize = function(i){return this.length?(i = e.extend({}, o, i || {}), s.parentNode !== document.body && e(document.body).append(s), this.each(function(){function o(){var t, o; "getComputedStyle"in window?(t = window.getComputedStyle(u, null), o = u.getBoundingClientRect().width, e.each(["paddingLeft", "paddingRight", "borderLeftWidth", "borderRightWidth"], function(e, i){o -= parseInt(t[i], 10)}), s.style.width = o + "px"):s.style.width = Math.max(p.width(), 0) + "px"}function a(){var a = {}; if (t = u, s.className = i.className, d = parseInt(p.css("maxHeight"), 10), e.each(n, function(e, t){a[t] = p.css(t)}), e(s).css(a), o(), window.chrome){var r = u.style.width; u.style.width = "0px", u.offsetWidth, u.style.width = r}}function r(){var e, n; t !== u?a():o(), s.value = u.value + i.append, s.style.overflowY = u.style.overflowY, n = parseInt(u.style.height, 10), s.scrollTop = 0, s.scrollTop = 9e4, e = s.scrollTop, d && e > d?(u.style.overflowY = "scroll", e = d):(u.style.overflowY = "hidden", c > e && (e = c)), e += w, n !== e && (u.style.height = e + "px", f && i.callback.call(u, u))}function l(){clearTimeout(h), h = setTimeout(function(){var e = p.width(); e !== g && (g = e, r())}, parseInt(i.resizeDelay, 10))}var d, c, h, u = this, p = e(u), w = 0, f = e.isFunction(i.callback), z = {height:u.style.height, overflow:u.style.overflow, overflowY:u.style.overflowY, wordWrap:u.style.wordWrap, resize:u.style.resize}, g = p.width(); p.data("autosize") || (p.data("autosize", !0), ("border-box" === p.css("box-sizing") || "border-box" === p.css("-moz-box-sizing") || "border-box" === p.css("-webkit-box-sizing")) && (w = p.outerHeight() - p.height()), c = Math.max(parseInt(p.css("minHeight"), 10) - w || 0, p.height()), p.css({overflow:"hidden", overflowY:"hidden", wordWrap:"break-word", resize:"none" === p.css("resize") || "vertical" === p.css("resize")?"none":"horizontal"}), "onpropertychange"in u?"oninput"in u?p.on("input.autosize keyup.autosize", r):p.on("propertychange.autosize", function(){"value" === event.propertyName && r()}):p.on("input.autosize", r), i.resizeDelay !== !1 && e(window).on("resize.autosize", l), p.on("autosize.resize", r), p.on("autosize.resizeIncludeStyle", function(){t = null, r()}), p.on("autosize.destroy", function(){t = null, clearTimeout(h), e(window).off("resize", l), p.off("autosize").off(".autosize").css(z).removeData("autosize")}), r())})):this}})(window.jQuery || window.$);
                                                                    var __slice = [].slice; (function(e, t){var n; n = function(){function t(t, n){var r, i, s, o = this; this.options = e.extend({}, this.defaults, n); this.$el = t; s = this.defaults; for (r in s){i = s[r]; if (this.$el.data(r) != null){this.options[r] = this.$el.data(r)}}this.createStars(); this.syncRating(); this.$el.on("mouseover.starrr", "span", function(e){return o.syncRating(o.$el.find("span").index(e.currentTarget) + 1)}); this.$el.on("mouseout.starrr", function(){return o.syncRating()}); this.$el.on("click.starrr", "span", function(e){return o.setRating(o.$el.find("span").index(e.currentTarget) + 1)}); this.$el.on("starrr:change", this.options.change)}t.prototype.defaults = {rating:void 0, numStars:5, change:function(e, t){}}; t.prototype.createStars = function(){var e, t, n; n = []; for (e = 1, t = this.options.numStars; 1 <= t?e <= t:e >= t; 1 <= t?e++:e--){n.push(this.$el.append("<span class='glyphicon .glyphicon-star-empty'></span>"))}return n}; t.prototype.setRating = function(e){if (this.options.rating === e){e = void 0}this.options.rating = e; this.syncRating(); return this.$el.trigger("starrr:change", e)}; t.prototype.syncRating = function(e){var t, n, r, i; e || (e = this.options.rating); if (e){for (t = n = 0, i = e - 1; 0 <= i?n <= i:n >= i; t = 0 <= i?++n:--n){this.$el.find("span").eq(t).removeClass("glyphicon-star-empty").addClass("glyphicon-star")}}if (e && e < 5){for (t = r = e; e <= 4?r <= 4:r >= 4; t = e <= 4?++r:--r){this.$el.find("span").eq(t).removeClass("glyphicon-star").addClass("glyphicon-star-empty")}}if (!e){return this.$el.find("span").removeClass("glyphicon-star").addClass("glyphicon-star-empty")}}; return t}(); return e.fn.extend({starrr:function(){var t, r; r = arguments[0], t = 2 <= arguments.length?__slice.call(arguments, 1):[]; return this.each(function(){var i; i = e(this).data("star-rating"); if (!i){e(this).data("star-rating", i = new n(e(this), r))}if (typeof r === "string"){return i[r].apply(i, t)}})}})})(window.jQuery, window); $(function(){return $(".starrr").starrr()})

                                                                            $(function(){

                                                                            $('#new-review').autosize({append: "\n"});
                                                                            var reviewBox = $('#post-review-box');
                                                                            var newReview = $('#new-review');
                                                                            var openReviewBtn = $('#open-review-box');
                                                                            var closeReviewBtn = $('#close-review-box');
                                                                            var ratingsField = $('#ratings-hidden<%=compra.getId()%>');
                                                                            openReviewBtn.click(function(e)
                                                                            {
                                                                            reviewBox.slideDown(400, function()
                                                                            {
                                                                            $('#new-review').trigger('autosize.resize');
                                                                            newReview.focus();
                                                                            });
                                                                            openReviewBtn.fadeOut(100);
                                                                            closeReviewBtn.show();
                                                                            });
                                                                            closeReviewBtn.click(function(e)
                                                                            {
                                                                            e.preventDefault();
                                                                            reviewBox.slideUp(300, function()
                                                                            {
                                                                            newReview.focus();
                                                                            openReviewBtn.fadeIn(200);
                                                                            });
                                                                            closeReviewBtn.hide();
                                                                            });
                                                                            $('.starrr1').on('starrr:change', function(e, value){
                                                                            ratingsField.val(value);
                                                                            });
                                                                            $('.starrr').on('starrr:change', function(e, value){
                                                                            ratingsField.val(value);
                                                                            });
                                                                            });
                                                                </script>
                                                                <div class="row">   
                                                                    <div class="col-sm-1">
                                                                        <div class="thumbnail">
                                                                            <img class="img-responsive user-photo" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
                                                                        </div><!-- /thumbnail -->
                                                                    </div><!-- /col-sm-1 -->

                                                                    <div class="col-sm-5">
                                                                        <div class="panel panel-default">
                                                                            <div class="panel-heading">
                                                                                <table width="100%">
                                                                                    <tr>
                                                                                        <td><%=compra.getComprador().getNome()%> as <%=compra.getData_classificacao()%></td>
                                                                                        <td align="right"><span class="stars starrr" data-rating="<%=compra.getNota()%>"></span></td>
                                                                                        <td align="right"><%=compra.getNota()%></td>
                                                                                    </tr>
                                                                                </table>
                                                                            </div>
                                                                            <div class="panel-body">
                                                                                <%=compra.getComentario()%>                                                                              
                                                                            </div><!-- /panel-body -->
                                                                        </div><!-- /panel panel-default -->
                                                                    </div><!-- /col-sm-5 -->
                                                                </div>

                                                                <%}
                                                                } else {%>
                                                                Nenhum comentario encontrado<%}%>
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