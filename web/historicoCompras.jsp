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
        <link rel="stylesheet" type="text/css" href="css/style3.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
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
                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-right  contact-main">
                                        <a href="contact.jsp" class="main-menu-link contact block-keep-ratio__content flexbox-center">
                                            <i class="fa fa-envelope-o fa-4x main-menu-link-icon"></i>
                                            CONTATO
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
                                        <a href="anuncioAbertoVendedor" class="main-menu-link about block-keep-ratio__content flexbox-center">
                                            <p align="center"><img src="images/venda.png" height="60" width="60"></p>
                                            VENDAS
                                        </a>                                    
                                    </div>   
                                </div> 

                                <div class="menu-container">
                                    <div class="block-keep-ratio block-keep-ratio-2-1 block-width-full home">
                                        <a href="anuncieconosco.jsp" class="block-keep-ratio__content  main-menu-link"> <span class="main-menu-link-text"></span>
                                        </a>
                                    </div>
                                </div>
                            </div> <!-- main-menu -->
                        </aside>

                        <div class="content-main">
                            <div class="row margin-b-30">
                                <div class="col-xs-12 col-sm-12 col-md-12 biliend">
                                    <div class="row margin-b-30">
                                        <div class="col-xs-12 col-sm-12 col-md-12 biliend">
                                            <div class="banner-2-container">
                                                <div class="aenean">
                                                    <h4>HISTÓRICO DE COMPRAS</h4>
                                                    <h3>VendeMais</h3>
                                                </div>    
                                            </div>                                
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
                                List<Historico> todasCompras = (List<Historico>) request.getAttribute("resultado");
                                if (todasCompras != null) {
                                    for (Historico historico : todasCompras) {
                            %>
                            <div class="content-main contact-content">
                                <div class="contact-content-upper">
                                    <div class="row">                                        
                                        <table>
                                            <tr>
                                                <td colspan="4"><b>COMPRA ID#<%=historico.getId()%> - <%=historico.getData_compra()%></b></td>
                                            </tr>
                                            <tr>   
                                                <td width="25%"><b>Produto ID#<%=historico.getAnuncio().getId()%></b></td>
                                                <td width="25%"><b>Comprador</b></td>                                                
                                                <td width="25%"><b>Status</b></td>
                                                <td width="25%"><b><button type="button" data-toggle="modal" data-target="#myModal<%=historico.getId()%>">Detalhes do Produto</button></b>
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

                                                                                    <h6 class="title-price"><small>QUANTIDADE COMPRADA: </small></h6>
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
                                                    </div> 
                                                </td>                                                
                                            </tr>
                                            <tr>
                                                <td><%=historico.getAnuncio().getTitulo()%></td>
                                                <td><%=historico.getComprador().getNome()%></td>                                            
                                                <td width="25%">Pago: Sim</td>
                                                <td width="25%"><b><button type="button" data-toggle="modal" data-target="#myModal1<%=historico.getId()%>">Detalhes da Compra</button></b>                                                        
                                                    <div class="modal fade" id="myModal1<%=historico.getId()%>" role="dialog">
                                                        <div class="modal1-dialog modal-sm">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                    <h4 class="modal-title">Detalhes da Compra</h4>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <div class="tab-pane" role="tabpanel" id="complete">
                                                                        <form role="form" action="finalizarCompra" method="POST">
                                                                            <div class="step44">                                                                
                                                                                <table width="620" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="border-radius: 5px;">
                                                                                    <tbody>                      
                                                                                        <tr>
                                                                                            <td valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:25px 20px 0px 20px">
                                                                                                <h2 style="color: #848484; font-family: arial,sans-serif; font-weight: 200;">DETALHES DO COMPRADOR</h2>                                                                             
                                                                                            </td>
                                                                                        </tr>

                                                                                        <tr>
                                                                                            <td style="color:#404041;font-size:12px;line-height:16px;padding:10px 16px 20px 18px">
                                                                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" style="border-radius:5px;border:solid 1px #e5e5e5">
                                                                                                    <tbody>
                                                                                                        <tr>
                                                                                                            <td>
                                                                                                                <table border="0" cellspacing="0" cellpadding="0" width="100%">
                                                                                                                    <tbody>                                                                                                        
                                                                                                                        <tr>
                                                                                                                            <td width="15">&nbsp;</td>
                                                                                                                            <td width="200" align="left" valign="top" style="color:#404041;font-size:12px;padding:10px 0px 0px 5px"><strong>Comprador: </strong></td>
                                                                                                                            <td colspan="4" align="left" valign="top" width="115" style="color:#ff6600;font-size:12px;padding:10px 5px 0px 5px"><%=historico.getComprador().getNome()%></td>
                                                                                                                        </tr>
                                                                                                                        <tr>
                                                                                                                            <td width="15">&nbsp;</td>
                                                                                                                            <td width="200" align="left" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 0px 5px"><strong>Email: </strong></td>
                                                                                                                            <td colspan="4" align="left" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 0px 5px"><%=historico.getComprador().getEmail()%></td> 
                                                                                                                        </tr>
                                                                                                                        <tr>
                                                                                                                            <td width="15">&nbsp;</td>
                                                                                                                            <td width="200" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 5px 5px"><strong>Telefone: </strong></td>
                                                                                                                            <td colspan="4" align="left" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 5px 5px"><%=historico.getComprador().getTelefone()%></td>                                                                                                             
                                                                                                                        </tr>
                                                                                                                        <tr>
                                                                                                                            <td width="15">&nbsp;</td>
                                                                                                                            <td width="200" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 5px 5px"><strong>Endereço para Envio: </strong></td>
                                                                                                                            <td colspan="4" align="left" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 5px 5px"><%=historico.getEnderecoEnvio()%></td>                                                                                                             
                                                                                                                        </tr>
                                                                                                                    </tbody>
                                                                                                                </table>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:25px 20px 0px 20px">
                                                                                                <h2 style="color: #848484; font-family: arial,sans-serif; font-weight: 200;">DETALHES DO PRODUTO</h2>                                                                                                                                                                
                                                                                            </td>
                                                                                        </tr>

                                                                                        <tr>
                                                                                            <td style="color:#404041;font-size:12px;line-height:16px;padding:10px 16px 20px 18px">
                                                                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" style="border-radius:5px;border:solid 1px #e5e5e5">
                                                                                                    <tbody>
                                                                                                        <tr>
                                                                                                            <td>
                                                                                                                <table border="0" cellspacing="0" cellpadding="0" width="100%">
                                                                                                                    <tbody>
                                                                                                                        <tr>
                                                                                                                            <td width="15">&nbsp;</td>
                                                                                                                            <td colspan="5" align="left" valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:5px 10px 3px 5px;border-bottom:solid 1px #e5e5e5">			
                                                                                                                                <strong>PRODUTO</strong>
                                                                                                                            </td>
                                                                                                                            <td width="85" align="right" style="color:#404041;font-size:12px;line-height:16px;padding:5px 10px 3px 5px;border-bottom:solid 1px #e5e5e5">
                                                                                                                                <strong>QUANTIDADE</strong>
                                                                                                                            </td>
                                                                                                                            <td width="60" align="right" style="color:#404041;font-size:12px;line-height:16px;padding:5px 10px 3px 5px;border-bottom:solid 1px #e5e5e5">
                                                                                                                                <strong>SUBTOTAL</strong>
                                                                                                                            </td>
                                                                                                                        </tr>
                                                                                                                        <tr>
                                                                                                                            <td width="15">&nbsp;</td>
                                                                                                                            <td colspan="5" align="left" valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:5px 5px 3px 5px;border-bottom:dashed 1px #e5e5e5"><%=historico.getAnuncio().getTitulo()%></td>
                                                                                                                            <td width="85" align="right" valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:5px 5px 3px 5px;border-bottom:dashed 1px #e5e5e5"><%=historico.getQuantidadeComprada()%></td>
                                                                                                                            <td width="60" align="right" valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:5px 5px 3px 5px;border-bottom:dashed 1px #e5e5e5">R$ <%=historico.getSubtotal()%></td>
                                                                                                                        </tr>
                                                                                                                        <tr>
                                                                                                                            <td width="15">&nbsp;</td>
                                                                                                                            <td width="200" align="left" valign="top" style="color:#404041;font-size:12px;padding:10px 0px 0px 5px"><strong>Vendedor: </strong></td>
                                                                                                                            <td colspan="4" align="left" valign="top" width="115" style="color:#ff6600;font-size:12px;padding:10px 5px 0px 5px"><%=historico.getVendedor().getNome()%></td>
                                                                                                                        </tr>
                                                                                                                        <tr>
                                                                                                                            <td width="15">&nbsp;</td>
                                                                                                                            <td width="200" align="left" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 0px 5px"><strong>Email: </strong></td>
                                                                                                                            <td colspan="4" align="left" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 0px 5px"><%=historico.getVendedor().getEmail()%></td> 
                                                                                                                        </tr>
                                                                                                                        <tr>
                                                                                                                            <td width="15">&nbsp;</td>
                                                                                                                            <td width="200" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 5px 5px"><strong>Telefone: </strong></td>
                                                                                                                            <td colspan="4" align="left" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 5px 5px"><%=historico.getVendedor().getTelefone()%></td>                                                                                                             
                                                                                                                        </tr>
                                                                                                                        <tr>
                                                                                                                            <td width="15">&nbsp;</td>
                                                                                                                            <td width="200" align="left" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 0px 5px"><strong>Metodo de envio: </strong></td>
                                                                                                                            <td colspan="4" align="left" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 0px 5px"><%=historico.getAnuncio().getFormaEnvio()%></td> 
                                                                                                                        </tr>                                
                                                                                                                    </tbody>
                                                                                                                </table>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>

                                                                                        <tr>
                                                                                            <td valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:25px 20px 0px 20px">
                                                                                                <h2 style="color: #848484; font-family: arial,sans-serif; font-weight: 200;">DETALHES DE PAGAMENTO</h2>                                                                                                                                                                
                                                                                            </td>
                                                                                        </tr>

                                                                                        <tr>
                                                                                            <td style="color:#404041;font-size:12px;line-height:16px;padding:10px 16px 20px 18px">
                                                                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" style="border-radius:5px;border:solid 1px #e5e5e5">
                                                                                                    <tbody>
                                                                                                        <tr>
                                                                                                            <td>
                                                                                                                <table border="0" cellspacing="0" cellpadding="0" width="100%">
                                                                                                                    <tbody>                                                                                                        
                                                                                                                        <tr>
                                                                                                                            <td width="15">&nbsp;</td>
                                                                                                                            <td width="200" align="left" valign="top" style="color:#404041;font-size:12px;padding:10px 0px 0px 5px"><strong>Forma de Pagamento: </strong></td>
                                                                                                                            <td colspan="4" align="left" valign="top" width="115" style="color:#ff6600;font-size:12px;padding:10px 5px 0px 5px">Crédito</td>
                                                                                                                        </tr>
                                                                                                                        <tr>
                                                                                                                            <td width="15">&nbsp;</td>
                                                                                                                            <td width="200" align="left" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 0px 5px"><strong>SubTotal: </strong></td>
                                                                                                                            <td colspan="4" align="left" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 0px 5px">R$ <%=historico.getSubtotal()%></td> 
                                                                                                                        </tr>
                                                                                                                        <tr>
                                                                                                                            <td width="15">&nbsp;</td>
                                                                                                                            <td width="200" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 5px 5px"><strong>Valor frete: </strong></td>
                                                                                                                            <td colspan="4" align="left" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 5px 5px">R$ <%=historico.getAnuncio().getValorFrete()%></td>                                                                                                             
                                                                                                                        </tr>
                                                                                                                        <tr>
                                                                                                                            <td width="15">&nbsp;</td>
                                                                                                                            <td width="200" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 5px 5px"><strong>Total: </strong></td>
                                                                                                                            <td colspan="4" align="left" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 5px 5px">R$ <%=historico.getTotal()%></td>                                                                                                             
                                                                                                                        </tr>
                                                                                                                    </tbody>
                                                                                                                </table>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>  
                                                                            </div>                                                            
                                                                        </form>                                
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>    
                                                </td>
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
                                }else{
                           %>
                            <div class="content-main contact-content">
                                <div class="contact-content-upper">
                                    <div class="row">
                                        Você não possui nenhuma compra
                                    </div>
                                </div>
                            </div>
                            <%
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