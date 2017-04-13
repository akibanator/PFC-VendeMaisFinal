<%@page import="modelo.Vendedor"%>
<%@page import="modelo.Comprador"%>
<%@page import="modelo.Historico"%>
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
                                        <a><span class="main-menu-link-text"><font color="#FFFFFF" size="3"><b><script src="js/saudacao.js"></script><br></b></font> </span>
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
                        </aside>

                        <div class="content-main">
                            <div class="row margin-b-30">
                                <div class="col-xs-12 col-sm-12 col-md-12 biliend">
                                    <div class="row margin-b-30">
                                        <div class="col-xs-12 col-sm-12 col-md-12 biliend">
                                            <div class="banner-2-container">
                                                <div class="aenean">
                                                    <h4>HISTÓRICO DE VENDAS</h4>
                                                    <h3>VendeMais</h3>
                                                </div>    
                                            </div>                                
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
                                List<Historico> todasVendas = (List<Historico>) request.getAttribute("resultado");
                                if (todasVendas != null) {
                                    for (Historico historico : todasVendas) {
                            %>
                            <div class="content-main contact-content">
                                <div class="contact-content-upper">
                                    <div class="row">                                        
                                        <table>
                                            <tr>
                                                <td colspan="4"><b>VENDA #<%=historico.getId()%> - <%=historico.getData_compra()%></b></td>
                                            </tr>
                                            <tr>   
                                                <td width="25%"><b>Produto #<%=historico.getAnuncio().getId()%></b></td>
                                                <td width="25%"><b>Comprador</b></td>                                                
                                                <td width="25%"><b>Status</b></td>
                                                <td width="25%"><b><button type="button" data-toggle="modal" data-target="#myModal<%=historico.getId()%>">+Detalhes</button></p>
                                                        <!-- Modal -->
                                                        <div class="modal fade" id="myModal<%=historico.getId()%>" role="dialog">
                                                            <div class="modal1-dialog modal-sm">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                        <h4 class="modal-title">Detalhes do Produto</h4>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <div class="row">  
                                                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">        
                                                                                <div class="row">
                                                                                    <div class="preview col-md-6">

                                                                                        <div class="preview-pic tab-content">
                                                                                            <p align="center"><div class="tab-pane" id="pic-1"><img src="images/venda.png"  height="300" width="200"></div></p>
                                                                                            <div class="tab-pane" id="pic-2"><img src="http://placekitten.com/400/252" height="300" width="200"></div>
                                                                                            <div class="tab-pane" id="pic-3"><img src="http://placekitten.com/400/252" height="300" width="200"></div>
                                                                                            <div class="tab-pane" id="pic-4"><img src="http://placekitten.com/400/252" height="300" width="200"></div>
                                                                                            <div class="tab-pane active" id="pic-5"><img src="http://placekitten.com/400/252" height="300" width="200"></div>
                                                                                        </div>
                                                                                        <ul class="preview-thumbnail nav nav-tabs">
                                                                                            <li class=""><a data-target="#pic-1" data-toggle="tab" aria-expanded="false"><img src="images/venda.png" height="60" width="60" ></a></li>
                                                                                            <li class=""><a data-target="#pic-2" data-toggle="tab" aria-expanded="false"><img src="http://placekitten.com/200/126" height="60" width="60"></a></li>
                                                                                            <li><a data-target="#pic-3" data-toggle="tab"><img src="http://placekitten.com/200/126" height="60" width="60"></a></li>
                                                                                            <li class=""><a data-target="#pic-4" data-toggle="tab" aria-expanded="false"><img src="http://placekitten.com/200/126" height="60" width="60"></a></li>
                                                                                            <li class="active"><a data-target="#pic-5" data-toggle="tab" aria-expanded="true"><img src="http://placekitten.com/200/126" height="60" width="60"></a></li>
                                                                                        </ul>


                                                                                    </div>
                                                                                    <div class="col-xs-5" style="border:0px solid gray">
                                                                                        <h6 class="title-price"><small>PRODUTO: </small></h6>
                                                                                        <h3 style="margin-top:0px;"><%=historico.getAnuncio().getTitulo()%></h3>                                               

                                                                                        <h6 class="title-price"><small>PREÇO UNITARIO: </small></h6>
                                                                                        <h3 style="margin-top:0px;">R$ <%=historico.getAnuncio().getPreco()%></h3>

                                                                                        <h6 class="title-price"><small>QUANTIDADE VENDIDA: </small></h6>
                                                                                        <h3 style="margin-top:0px;"><%=historico.getQuantidadeComprada()%></h3>    

                                                                                        <h6 class="title-price"><small>SUBTOTAL: </small></h6>
                                                                                        <h3 style="margin-top:0px;">R$ <%=historico.getSubtotal()%></h3> 

                                                                                        <h6 class="title-price"><small>TOTAL: (SUBTOTAL + FRETE) </small></h6>
                                                                                        <h3 style="margin-top:0px;">R$ <%=historico.getTotal()%></h3> 
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
                                                                                                        <%=historico.getAnuncio().getDescricao()%>
                                                                                                    </section>
                                                                                                </div>
                                                                                                <div class="tab-pane fade" id="service-two">

                                                                                                    <section class="container product-info">
                                                                                                        <li><b>Altura (em cm.): </b><%=historico.getAnuncio().getAltura()%></li>
                                                                                                        <li><b>Largura (em cm.): </b><%=historico.getAnuncio().getLargura()%></li>
                                                                                                        <li><b>Peso (em gramas): </b><%=historico.getAnuncio().getPeso()%></li>
                                                                                                        <li><b>Estado: </b><%=historico.getAnuncio().getEstado()%></li>                                                               
                                                                                                    </section>

                                                                                                </div>
                                                                                                <div class="tab-pane fade" id="service-three">
                                                                                                    <section class="container product-info">
                                                                                                        <li><b>Forma de Envio: </b><%=historico.getAnuncio().getFormaEnvio()%></li>
                                                                                                        <li><b>Valor do Frete: </b><%=historico.getAnuncio().getValorFrete()%></li>
                                                                                                    </section>
                                                                                                </div>
                                                                                            </div>
                                                                                            <hr>
                                                                                        </div>
                                                                                    </div>	
                                                                                </div>    
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>    </b></td>
                                            </tr>
                                            <tr>
                                                <td><%=historico.getAnuncio().getTitulo()%></td>
                                                <td><%=historico.getComprador().getNome()%></td>                                            
                                                <td width="25%">Pago: Sim</td>
                                                <td width="25%"></td>
                                            </tr>
                                            <tr>
                                                <td>Total da Venda: <%=historico.getTotal()%></td>
                                                <td><%=historico.getComprador().getTelefone()%></td>                                            
                                                <td width="25%">Entregue: Sim</td>
                                                <td width="25%"></td>
                                            </tr>
                                        </table>                                                                     
                                    </div>
                                </div>
                            </div>
                            <div class="row margin-b-30"></div>
                            <%
                                    }
                                }
                            %>                            
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 footer">
                            <p class="copyright">Copyright © 2017 Vende Mais</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>