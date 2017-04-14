<%@page import="modelo.Anuncio"%>
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
                                                    <h4>Anuncios</h4>
                                                    <h3>VendeMais</h3>
                                                </div>    
                                            </div>                                
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <%
                                List<Anuncio> todosAnuncios = (List<Anuncio>) request.getAttribute("resultado");
                                if (todosAnuncios != null) {
                                    for (Anuncio anuncio : todosAnuncios) {                                                                                                            
                            %>
                            <div class="content-main contact-content">
                                <div class="contact-content-upper">
                                    <div class="row">                                        
                                        <table>
                                            <tr>
                                                <td colspan="4"><b>ANUNCIO #<%=anuncio.getId()%> - CADASTRADA EM: <%=anuncio.getData_cadastro()%></b></td>
                                            </tr>
                                            <tr>   
                                                <td width="30%"><b>Titulo: </b>
                                                    <%
                                                        int maxSize = 30;

                                                        String titulo = anuncio.getTitulo();
                                                        out.println(titulo.length() <= maxSize ? titulo : titulo.substring(0, maxSize).concat("..."));
                                                    %>
                                                </td>
                                                <td width="40%"><b>Quantidade Disponivel a venda:</b> <%=anuncio.getQuantidade()%></td>   
                                                <td width="25%"><b><button type="button" data-toggle="modal" data-target="#myModal<%=anuncio.getId()%>">Detalhes do Produto</button></b>
                                                    <div class="modal fade" id="myModal<%=anuncio.getId()%>" role="dialog">
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
                                                                                    <h3 style="margin-top:0px;"><%=anuncio.getTitulo()%></h3>                                               

                                                                                    <h6 class="title-price"><small>PREÇO UNITARIO: </small></h6>
                                                                                    <h3 style="margin-top:0px;">R$ <%=anuncio.getPreco()%></h3>
                                                                                    
                                                                                    <h6 class="title-price"><small>QUANTIDADE DISPONIVEL: </small></h6>
                                                                                    <h3 style="margin-top:0px;"><%=anuncio.getQuantidade()%></h3>
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
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div> 
                                                </td>
                                            </tr>                                            
                                            <tr>
                                                <td><b>Situação: </b><%if (anuncio.getAtivo()==1){%><% out.print("Disponivel á venda"); %><%}else{%><% out.print("Encerrado"); %><%}%></td>
                                                <td><b>Preço (por un.): </b><%=anuncio.getPreco()%></td>                                            
                                                <td></td>                                               
                                            </tr>
                                        </table>                                                                     
                                    </div>
                                </div>
                            </div>
                            <div class="row margin-b-30"></div>
                            <% }} %>                           
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