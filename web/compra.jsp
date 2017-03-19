<%@page import="modelo.Endereco"%>
<%@page import="java.util.List"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,400italic">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/style1.css">
        <link rel="stylesheet" type="text/css" href="css/style2.css">
        <link rel="stylesheet" type="text/css" href="css/style3.css">
        <link rel="shortcut icon" href="images/i.ico">
        <script type="text/javascript" src="//code.jquery.com/jquery-1.10.2.min.js"></script>
        <script type="text/javascript"></script>
        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.maskedinput-1.3.min.js"></script>
        <script src="js/validacaoEndereco.js"></script>
        <script src="js/compra.js"></script>
        <script src="js/compra_1.js"></script>
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
                                        <a href="contact.jsp" class="main-menu-link contact block-keep-ratio__content flexbox-center">
                                            <i class="fa fa-envelope-o fa-4x main-menu-link-icon"></i>
                                            CONTATO
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
                                                    <h4>CONTA</h4>
                                                    <h3>VendeMais</h3>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="content-main contact-content">
                                <div class="contact-content-upper">
                                    <div class="row">
                                        <section>
                                            <div class="wizard">
                                                <div class="wizard-inner">
                                                    <div class="connecting-line"></div>
                                                    <ul class="nav nav-tabs" role="tablist">

                                                        <li role="presentation" class="active">
                                                            <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="" data-original-title="PRODUTO" aria-expanded="true">
                                                                <span class="round-tab">
                                                                    <p align="center"><img src="images/p1.png" height="60" width="60"></p>
                                                                </span>
                                                            </a>
                                                        </li>

                                                        <li role="presentation" class="disabled">
                                                            <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="" data-original-title="ENVIO" aria-expanded="false">
                                                                <span class="round-tab">
                                                                    <p align="center"><img src="images/p2.png" height="60" width="60"></p>
                                                                </span>
                                                            </a>
                                                        </li>
                                                        <li role="presentation" class="disabled">
                                                            <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" title="" data-original-title="FORMA DE PAGAMENTO" aria-expanded="false">
                                                                <span class="round-tab">
                                                                    <p align="center"><img src="images/p3.png" height="60" width="60"></p>
                                                                </span>
                                                            </a>
                                                        </li>

                                                        <li role="presentation" class="disabled">
                                                            <a href="#complete" data-toggle="tab" aria-controls="complete" role="tab" title="" data-original-title="REVISAR E CONCLUIR" aria-expanded="false">
                                                                <span class="round-tab">
                                                                    <p align="center"><img src="images/p4.png" height="60" width="60"></p>
                                                                </span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>

                                                <form role="form">
                                                    <div class="tab-content">
                                                        <div class="tab-pane active" role="tabpanel" id="step1">
                                                            <div class="step1">
                                                                <div class="row">
                                                                    <div class="preview col-md-6">
                                                                        <p align="center"><img src="images/xbox.png" height="300" width="200"></p>
                                                                    </div>
                                                                    <div class="col-xs-5">
                                                                        <h2>Dados do Produto</h2>
                                                                        <br>                                        
                                                                        <label for="produto">Produto: </label>sadsdadsddsdas
                                                                        <br>        
                                                                        <label for="quantidadeDesejada">Quantidade a ser comprada: </label>12
                                                                        <br>
                                                                        <label for="preco">Valor Unitario: </label>120.00
                                                                        <br>
                                                                        <label for="subtotal">Subtotal: </label>130.00
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <ul class="list-inline pull-right">
                                                                <li><button type="button" class="btn btn-primary next-step">CONTINUAR</button></li>
                                                            </ul>
                                                        </div>
                                                        <div class="tab-pane" role="tabpanel" id="step2">
                                                            <div class="step2">                                                                
                                                                <div class="row" align="center">
                                                                    <label for="endereco">Endereço de Venda:  </label>
                                                                    <a href="consultarConta">(Cadastrar um endereço)</a>
                                                                    <%
                                                                        List<Endereco> todosEnderecos = (List<Endereco>) request.getAttribute("resultadoE");
                                                                        if (todosEnderecos != null) {
                                                                            for (Endereco endereco : todosEnderecos) {

                                                                    %>
                                                                    <p><input type="radio" name="endereco" value="<%=endereco.getId()%>"id=endereco required> <%=endereco.getRua()%> <%=endereco.getNumero()%>, CEP <%=endereco.getCep()%> <a href="consultarConta"> Modificar</a> </p>                                                       
                                                                        <%
                                                                                }
                                                                            }
                                                                        %>

                                                                    <br>
                                                                </div>


                                                            </div>
                                                            <ul class="list-inline pull-right">
                                                                <li><button type="button" class="btn btn-default prev-step">VOLTAR</button></li>
                                                                <li><button type="button" class="btn btn-primary next-step">CONTINUAR</button></li>
                                                            </ul>
                                                        </div>
                                                        <div class="tab-pane" role="tabpanel" id="step3">
                                                            <div class="step3">

                                                                <div class="row">



                                                                    <!-- CREDIT CARD FORM STARTS HERE -->
                                                                    <div class="panel panel-default credit-card-box">
                                                                        <div class="panel-heading display-table">
                                                                            <div class="row display-tr">

                                                                                <div class="display-td">                            
                                                                                    <img class="img-responsive pull-right" src="http://ateliedarevisao.com.br/wp-content/uploads/2016/03/cartoes-credito.png">
                                                                                </div>
                                                                            </div>                    
                                                                        </div>
                                                                        <div class="panel-body">

                                                                            <div class="row">
                                                                                <div class="col-xs-12">
                                                                                    <div class="form-group">
                                                                                        <label for="titular">Titular do Cartão: </label>                                                                                        
                                                                                        <input type="text"  class="form-control" id="titular" name="titular" required class="input-xlarge">                                                                                        
                                                                                    </div>                            
                                                                                </div>                                                                                
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col-xs-12">
                                                                                    <div class="form-group">
                                                                                        <label for="numero">Número do Cartão: </label>
                                                                                        <input type="text" class="form-control" id="numero" name="numero">
                                                                                        <label for="cardCVC">CV CODE</label>
                                                                                        <input type="tel" class="form-control" name="cardCVC" placeholder="CVC" autocomplete="cc-csc" required="" aria-required="true">
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <div class="row">
                                                                                <div class="col-xs-7 col-md-7">
                                                                                    <div class="control-group">

                                                                                        <label class="control-label" for="password">Card Expiry Date</label>
                                                                                        <div class="controls">
                                                                                            <select class="form-control" name="expiry_month" id="expiry_month">
                                                                                                <option></option>
                                                                                                <option value="01">Jan (01)</option>
                                                                                                <option value="02">Feb (02)</option>
                                                                                                <option value="03">Mar (03)</option>
                                                                                                <option value="04">Apr (04)</option>
                                                                                                <option value="05">May (05)</option>
                                                                                                <option value="06">June (06)</option>
                                                                                                <option value="07">July (07)</option>
                                                                                                <option value="08">Aug (08)</option>
                                                                                                <option value="09">Sep (09)</option>
                                                                                                <option value="10">Oct (10)</option>1
                                                                                                <option value="11">Nov (11)</option>
                                                                                                <option value="12">Dec (12)</option>
                                                                                            </select>
                                                                                            <select class="form-control" name="expiry_year">
                                                                                                <option value="13">2013</option>
                                                                                                <option value="14">2014</option>
                                                                                                <option value="15">2015</option>
                                                                                                <option value="16">2016</option>
                                                                                                <option value="17">2017</option>
                                                                                                <option value="18">2018</option>
                                                                                                <option value="19">2019</option>
                                                                                                <option value="20">2020</option>
                                                                                                <option value="21">2021</option>
                                                                                                <option value="22">2022</option>
                                                                                                <option value="23">2023</option>
                                                                                            </select>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>

                                                                            </div>
                                                                            <div class="row"></div>
                                                                        </div>
                                                                    </div>            
                                                                </div>
                                                            </div>
                                                            <ul class="list-inline pull-right">
                                                                <li><button type="button" class="btn btn-default prev-step">VOLTAR</button></li>
                                                                <li><button type="button" class="btn btn-primary next-step">CONTINUAR</button></li>
                                                            </ul>
                                                        </div>
                                                        <div class="tab-pane" role="tabpanel" id="complete">
                                                            <div class="step44">
                                                                <form role="form">

                                                                    <table width="620" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="border-radius: 5px;">
                                                                        <tbody>
                                                                            <tr>

                                                                            </tr>
                                                                            <tr>
                                                                                <td valign="top" style="color:#404041;line-height:16px;padding:25px 20px 0px 20px">
                                                                                    <p>
                                                                                    </p><section style="position: relative;clear: both;margin: 5px 0;height: 1px;border-top: 1px solid #cbcbcb;margin-bottom: 25px;margin-top: 10px;text-align: center;">
                                                                                        <h3 align="center" style="margin-top: -12px;background-color: #FFF;clear: both;width: 180px;margin-right: auto;margin-left: auto;padding-left: 15px;padding-right: 15px; font-family: arial,sans-serif;">
                                                                                            <span>CONFIRMAR PEDIDO</span>
                                                                                        </h3>
                                                                                    </section>

                                                                                    <br>			
                                                                                    <table width="620" border="0" cellspacing="0" cellpadding="0" style="border-bottom:solid 1px #e5e5e5">
                                                                                        <tbody>
                                                                                            <tr>
                                                                                                <td align="left" valign="top" style="padding:0px 5px 0px 5px">
                                                                                                    <table height="20px" width="100%" border="0" cellpadding="0" cellspacing="0">
                                                                                                        <tbody>

                                                                                                            <tr>
                                                                                                                <td height="10px" valign="top" style="color:#404041;font-size:13px;padding:5px 5px 0px 20px">
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td valign="top" style="color:#404041;font-size:13px;padding:5px 5px 0px 20px">
                                                                                                                    <strong>Nº Pedido: </strong> 
                                                                                                                    12345
                                                                                                                </td>
                                                                                                            </tr>

                                                                                                            <tr>
                                                                                                                <td valign="top" style="color:#404041;font-size:13px;padding:5px 5px 0px 20px">
                                                                                                                    <strong>Data: </strong>19/03/2017</td>
                                                                                                            </tr>
                                                                                                        </tbody>
                                                                                                    </table>
                                                                                                </td>
                                                                                                <td align="left" valign="top" style="padding:0px 5px 0px 5px">
                                                                                                    <table width="100%" border="0" cellpadding="3" cellspacing="3" style="border-right:solid 1px #e5e5e5" height="146">
                                                                                                        <tbody>
                                                                                                            <tr>
                                                                                                                <td height="16" valign="top" style="color:#404041;font-size:13px;padding:15px 5px 0px 5px">
                                                                                                                    <strong>Endereço de Envio: </strong>

                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td valign="top" style="color:#404041;font-size:12px;padding:0px 5px 0px 5px">
                                                                                                                    <p>
                                                                                                                        21 Random street<br>
                                                                                                                        Random Area<br>
                                                                                                                        Random Town<br>
                                                                                                                        1234<br>
                                                                                                                    </p>

                                                                                                                </td>
                                                                                                            </tr>




                                                                                                        </tbody>
                                                                                                    </table>
                                                                                                </td>
                                                                                                <td align="left" valign="top" style="padding:0px 5px 0px 5px">

                                                                                                </td>
                                                                                                <td align="left" valign="top" style="padding:0px 5px 0px 0px">
                                                                                                    <table height="140" width="100%" border="0" cellpadding="3" cellspacing="3">
                                                                                                        <tbody>
                                                                                                            <tr>
                                                                                                                <td height="16" valign="top" style="color:#404041;font-size:13px;padding:15px 5px 0px 5px">
                                                                                                                    <strong>E-mail: </strong>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:0px 5px 0px 5px">
                                                                                                                    <p>celinex.mayumi@hotmail.com</p>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>

                                                                                                                <td style="color:#404041;font-size:13px;padding:15px 5px 0px 5px" valign="top" height="16">
                                                                                                                    <strong>Telefone:</strong>
                                                                                                                </td></tr><tr>
                                                                                                                <td valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:0px 5px 0px 5px">
                                                                                                                    <p>celinex.mayumi@hotmail.com</p>
                                                                                                                </td>
                                                                                                            </tr></tbody>
                                                                                                    </table>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </tbody>
                                                                                    </table></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:25px 20px 0px 20px">
                                                                                    <p>
                                                                                        <span></span></p><h2 style="color: #848484; font-family: arial,sans-serif; font-weight: 200;">DETALHES DO PRODUTO</h2>
                                                                                    <p></p>
                                                                                    <p>Obrigado por comprar conosco!<br>
                                                                                        <br>
                                                                                        Recebemos seu pedido e nós o notificaremos assim que recebermos seu pagamento.</p>
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
                                                                                                                <td width="15">&nbsp;
                                                                                                                </td>
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
                                                                                                                <td width="15">&nbsp;
                                                                                                                </td>
                                                                                                                <td colspan="5" align="left" valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:5px 5px 3px 5px;border-bottom:dashed 1px #e5e5e5">
                                                                                                                    Samsung SL-C410W Colour Laser Printer 
                                                                                                                </td>
                                                                                                                <td width="85" align="right" valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:5px 5px 3px 5px;border-bottom:dashed 1px #e5e5e5">
                                                                                                                    1
                                                                                                                </td>
                                                                                                                <td width="60" align="right" valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:5px 5px 3px 5px;border-bottom:dashed 1px #e5e5e5">
                                                                                                                    $1,234.00
                                                                                                                </td>
                                                                                                            </tr>


                                                                                                            <tr>
                                                                                                                <td width="15">&nbsp;
                                                                                                                </td>
                                                                                                                <td width="200" align="left" valign="top" style="color:#404041;font-size:12px;padding:10px 0px 0px 5px">
                                                                                                                    <strong>Vendedor: </strong>
                                                                                                                </td>
                                                                                                                <td colspan="4" align="left" valign="top" width="115" style="color:#ff6600;font-size:12px;padding:10px 5px 0px 5px">

                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td width="15">&nbsp;
                                                                                                                </td>
                                                                                                                <td width="200" align="left" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 0px 5px">
                                                                                                                    <strong>Metodo de envio: </strong>
                                                                                                                </td>
                                                                                                                <td colspan="4" align="left" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 0px 5px">Correio</td> 
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td width="15">&nbsp;
                                                                                                                </td>
                                                                                                                <td width="200" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 5px 5px">
                                                                                                                    <strong>Prazo de Entrega: </strong>
                                                                                                                </td>
                                                                                                                <td colspan="4" align="left" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 5px 5px">
                                                                                                                    1 - 2 Semanas													</td>
                                                                                                                <td width="85" align="right">&nbsp;
                                                                                                                </td>
                                                                                                                <td width="60" align="right">&nbsp;
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </tbody>
                                                                                                    </table>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>

                                                                            <tr align="left">
                                                                                <td style="color:#404041;font-size:12px;line-height:16px;padding:10px 16px 20px 18px">
                                                                                    <span><h2 style="color: #848484; font-family: arial,sans-serif; font-weight: 200;">DETALHES DE PAGAMENTO</h2></span><table width="0" border="0" align="left" cellpadding="0" cellspacing="0">



                                                                                        <tbody>
                                                                                            <tr>
                                                                                                <td width="0" align="left" valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:0px 0px 3px 0px">
                                                                                                    <strong>Forma de Pagamento:</strong> 
                                                                                                </td>
                                                                                                <td width="0" align="right" valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:0px 5px 3px 5px">
                                                                                                    Bank 1
                                                                                                </td>
                                                                                            </tr>

                                                                                            <tr>
                                                                                                <td align="left" valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:5px 0px 3px 0px;">
                                                                                                    <strong>Cartão: </strong>
                                                                                                </td>
                                                                                                <td width="62" align="right" valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:5px 5px 3px 5px;">
                                                                                                    123456789
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td align="left" valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:5px 0px 3px 0px;">
                                                                                                    <strong>Titular: </strong>
                                                                                                </td>
                                                                                                <td width="120" align="right" valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:5px 5px 3px 5px;">
                                                                                                    Bank Area
                                                                                                </td>
                                                                                            </tr>							

                                                                                        </tbody>




                                                                                    </table>

                                                                                    <table width="0" border="0" align="right" cellpadding="0" cellspacing="0">
                                                                                        <tbody>
                                                                                            <tr>


                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td width="0" align="left" valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:15px 0px 3px 0px">
                                                                                                    <strong>Sub-total:</strong> 
                                                                                                    <span style="font-size:11px;color:#666666"></span>
                                                                                                </td>
                                                                                                <td width="0" align="right" valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:15px 5px 3px 5px">
                                                                                                    $1,234.00
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>


                                                                                            </tr>

                                                                                            <tr>
                                                                                                <td align="left" valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:5px 0px 3px 0px;border-bottom:solid 1px #999999">
                                                                                                    <strong>Valor de Envio: </strong>
                                                                                                </td>
                                                                                                <td width="62" align="right" valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:5px 5px 3px 5px;border-bottom:solid 1px #999999">
                                                                                                    $0.00
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td align="left" valign="bottom" style="color:#404041;font-size:13px;line-height:16px;padding:5px 0px 3px 0px">
                                                                                                    <strong>Valor Total: </strong>
                                                                                                </td>
                                                                                                <td width="62" align="right" valign="bottom" style="color:#339933;font-size:13px;line-height:16px;padding:5px 5px 3px 5px">
                                                                                                    <strong>$1,234.00</strong>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </tbody>


                                                                                    </table>
                                                                                </td>
                                                                            </tr>

                                                                            <tr>
                                                                                <td>
                                                                                    <table width="550" border="0" cellspacing="0" cellpadding="0">
                                                                                        <tbody>
                                                                                            <tr>

                                                                                            </tr>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>

                                                                            <tr>
                                                                                <td>
                                                                                    <table width="510" border="0" cellspacing="0" cellpadding="0">
                                                                                        <tbody>
                                                                                            <tr>
                                                                                                <td style="color:#404041;font-size:12px;line-height:16px;padding:5px 15px 10px 10px">										

                                                                                                </td>
                                                                                            </tr>

                                                                                        </tbody>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </form>
                                                            </div>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                </form>
                                            </div>
                                        </section>
                                    </div>
                                </div>
                            </div>
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