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
                                        <a href="selecionarEndereco" class="main-menu-link contact block-keep-ratio__content flexbox-center">
                                            <p align="center"><img src="images/add2.png" height="60" width="60"></p>
                                            NOVO ANUNCIO
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
                                                <td colspan="4"><b>COMPRA ID#<%=historico.getId()%> - <%=historico.getData_compra()%></b></td>
                                            </tr>
                                            <tr>   
                                                <td width="25%"><b>Produto ID#<%=historico.getAnuncio().getId()%></b></td>
                                                <td width="25%"><b>Comprador</b></td>                                                
                                                <td width="25%"><b>Status</b></td>
                                                <td width="25%"></td>                                                
                                            </tr>
                                            <tr>
                                                <td><%=historico.getAnuncio().getTitulo()%></td>
                                                <td><%=historico.getComprador().getNome()%></td>                                            
                                                <td width="25%">Pago: Sim</td>
                                                <td width="25%"><b><button type="button" data-toggle="modal" data-target="#myModal1<%=historico.getId()%>">Detalhes da Venda</button></b>                                                        
                                                    <div class="modal fade" id="myModal1<%=historico.getId()%>" role="dialog">
                                                        <div class="modal1-dialog modal-sm">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                    <h4 class="modal-title">Detalhes da Venda</h4>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <div class="tab-pane" role="tabpanel" id="complete">
                                                                        <form role="form">
                                                                            <div class="step44">                                                                
                                                                                <table width="620" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="border-radius: 5px;">
                                                                                    <tbody>                      
                                                                                        <tr>
                                                                                            <td valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:25px 20px 0px 20px">
                                                                                                <h2 style="color: #848484; font-family: arial,sans-serif; font-weight: 200;">DETALHES DO VENDEDOR</h2>                                                                             
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
                                                                                                                            <td width="200" align="left" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 0px 5px"><strong>Metodo de envio: </strong></td>
                                                                                                                            <td colspan="4" align="left" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 0px 5px"><%=historico.getAnuncio().getFormaEnvio()%></td> 
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
                                                                                                                            <td width="200" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 5px 5px"><strong>Total da Venda: </strong></td>
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
                                                <td><b>Total da Venda: </b><%=historico.getTotal()%></td>
                                                <td><b>Tel.:</b><%=historico.getComprador().getTelefone()%></td>
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