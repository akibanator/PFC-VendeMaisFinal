<%@page import="modelo.Usuario"%>
<%@page import="modelo.Anuncio"%>
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
        <link rel="shortcut icon" href="images/i.ico">
        <title>VendeMais</title>
    </head>
    <body>
        <script src="js/ajax.js"></script>
        <script type="text/javascript" src="//code.jquery.com/jquery-1.10.2.min.js"></script>
        <script type="text/javascript"></script>
        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.maskedinput-1.3.min.js"></script>        
        <script src="js/compra.js"></script>
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
                                        <a href="historicoVenda" class="main-menu-link about block-keep-ratio__content flexbox-center">
                                            <p align="center"><img src="images/venda.png" height="60" width="60"></p>
                                            VENDAS
                                        </a>                                    
                                    </div>   
                                </div> 


                                <div class="menu-container">
                                    <div class="block-keep-ratio block-keep-ratio-2-1 block-width-full home">
                                        <a href="index.jsp" class="block-keep-ratio__content  main-menu-link"> <span class="main-menu-link-text"></span>
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
                                                    <h4>CONTA</h4>
                                                    <h3>VendeMais</h3>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
                                Anuncio anuncio = (Anuncio) request.getAttribute("resultado");
                                if (anuncio != null) {
                                    Usuario usuario = (Usuario) request.getAttribute("resultadoComprador");
                                    if (usuario != null) {
                                        Usuario vendedor = (Usuario) request.getAttribute("resultadoVendedor");
                                        if (vendedor != null) {
                            %>
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

                                                <div class="tab-content">

                                                    <div class="tab-pane active" role="tabpanel" id="step1">                                                        
                                                        <div class="step1">
                                                            <div class="row">
                                                                <div class="preview col-md-6">
                                                                    <p align="center"><img src="images/xbox.png" height="300" width="200"></p>
                                                                </div>
                                                                <div class="col-xs-5">
                                                                    <h2>Dados do Produto</h2>  

                                                                    <table style="width:100%">                                                                        
                                                                        <tr>
                                                                            <td>Produto</td>
                                                                            <td><%=anuncio.getTitulo()%></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>Qtd. disponivel: </td>
                                                                            <td><%=anuncio.getQuantidade()%></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>Qtd. desejada: </td>
                                                                            <td>
                                                                                <div class="col-lg-2" >
                                                                                    <script>
                                                                                        $(document).ready(function () {

                                                                                            var quantity = 1;
                                                                                            $('#quantity').val(quantity);
                                                                                            
                                                                                            $('.quantity-right-plus').click(function (e) {
                                                                                                e.preventDefault();
                                                                                                var quantity = parseInt($('#quantity').val());
                                                                                                var limite = parseInt($('#qtd').val());

                                                                                                if (quantity < limite) {
                                                                                                    $('#quantity').val(quantity + 1);
                                                                                                }else{
                                                                                                    
                                                                                                }
                                                                                                
                                                                                            });
                                                                                               
                                                                                            $('.quantity-left-minus').click(function (e) {
                                                                                                e.preventDefault();
                                                                                                var quantity = parseInt($('#quantity').val());                                                                                            

                                                                                                if (quantity >= 2) {
                                                                                                    $('#quantity').val(quantity - 1);
                                                                                                }else{
                                                                                                    
                                                                                                } 
                                                                                                });
                                                                                        });</script>
                                                                                    <div class="input-group">
                                                                                        <span class="input-group-btn">
                                                                                            <button type="button" class="quantity-left-minus btn btn-danger btn-number" data-type="minus" data-field="">
                                                                                                <span class="glyphicon glyphicon-minus"></span>
                                                                                            </button>
                                                                                        </span>
                                                                                        <input type="text" id="quantity" name="quantity" readonly="" size="4" required>                                                                                        
                                                                                        <input hidden type="text" id="qtd" name="qtd" value="5">

                                                                                        <span class="input-group-btn">
                                                                                            <button type="button" class="quantity-right-plus btn btn-success btn-number" data-type="plus" data-field="">
                                                                                                <span class="glyphicon glyphicon-plus"></span>
                                                                                            </button>
                                                                                        </span>
                                                                                    </div>
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>Valor Unitario: </td>
                                                                            <td><input type="text" id="preco" name="preco" readonly="" value="<%=anuncio.getPreco()%>" required></td>
                                                                        </tr>     
                                                                    </table>                                                                        
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <ul class="list-inline pull-right">
                                                            <li><button type="button" class="btn btn-primary next-step">Continuar</button></li>
                                                        </ul> 
                                                    </div>

                                                    <div class="tab-pane" role="tabpanel" id="step2">
                                                        <div class="step2">                                                                
                                                            <div class="row" align="center">
                                                                <label for="endereco">Endereço para Envio:  </label>
                                                                <a href="consultarConta">(Cadastrar um endereço)</a>
                                                                <%
                                                                    List<Endereco> todosEnderecos = (List<Endereco>) request.getAttribute("resultadoEndereco");
                                                                    if (todosEnderecos != null) {
                                                                        for (Endereco endereco : todosEnderecos) {

                                                                %>
                                                                <p><input type="radio" name="endereco" id=endereco required> <%=endereco.getRua()%> <%=endereco.getNumero()%>, CEP <%=endereco.getCep()%> <a href="consultarConta"> Modificar</a> </p>                                                       
                                                                    <%
                                                                            }
                                                                        }
                                                                    %>
                                                                <br>
                                                            </div>
                                                        </div>
                                                        <ul class="list-inline pull-right">
                                                            <li><button type="button" class="btn btn-default prev-step">VOLTAR</button></li>
                                                            <li><button type="button" class="btn btn-primary next-step1">CONTINUAR</button></li>
                                                        </ul>
                                                    </div>
                                                    <div class="tab-pane" role="tabpanel" id="step3">
                                                        <div class="step3">
                                                            <div class="row">                                                                    
                                                                <div class="panel panel-default credit-card-box">
                                                                    <div class="panel-heading display-table">
                                                                        <div class="row display-tr">
                                                                            <div class="display-td">                            
                                                                                <img class="img-responsive pull-right" src="http://ateliedarevisao.com.br/wp-content/uploads/2016/03/cartoes-credito.png">
                                                                            </div>
                                                                        </div>                    
                                                                    </div>

                                                                    <div class="panel-body">
                                                                        <style>
                                                                            table, th, td {
                                                                                border-collapse: collapse;
                                                                                text-align: center;
                                                                            }

                                                                            th, td {
                                                                                padding: 5px;
                                                                                text-align: left;
                                                                            }
                                                                        </style>
                                                                        <table style="width:70%" align="center">
                                                                            <tr>
                                                                                <td>Titular do Cartão: </td>

                                                                                <td colspan="3"><input type="text" id="titular" class="titular" name="titular" nome="nome"></td> 

                                                                            <script type="text/javascript">
                                                                                $(document).ready(function () {
                                                                                    $(".titular").on("input", function () {
                                                                                        var textoDigitado = $(this).val();
                                                                                        var inputCusto = $(this).attr("nome");
                                                                                        $("#" + inputCusto).val(textoDigitado);
                                                                                    });
                                                                                });
                                                                            </script>
                                                                            </tr>
                                                                            <tr>                                                                             
                                                                                <td>Numero do Cartão: </td>
                                                                                <td colspan="3"><input type="text" id="cartao" class="cartao" name="cartao" num="num"></td>
                                                                            <script type="text/javascript">
                                                                                $(document).ready(function () {
                                                                                    $(".cartao").on("input", function () {
                                                                                        var textoDigitado = $(this).val();
                                                                                        var inputCusto = $(this).attr("num");
                                                                                        $("#" + inputCusto).val(textoDigitado);
                                                                                    });
                                                                                });
                                                                            </script>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>Cod. Segurança: </td>
                                                                                <td colspan="3"><input type="text" name="cod" id="cod" required></td>
                                                                            </tr>
                                                                            <tr>

                                                                                <td>Validade: </td>
                                                                                <td><select name="mesvalidade" id="mesvalidade" required>
                                                                                        <option value=""></option>
                                                                                        <option value="01">Janeiro (01)</option>
                                                                                        <option value="02">Fevereiro (02)</option>
                                                                                        <option value="03">Março (03)</option>
                                                                                        <option value="04">Abril (04)</option>
                                                                                        <option value="05">Maio (05)</option>
                                                                                        <option value="06">Junho (06)</option>
                                                                                        <option value="07">Julho (07)</option>
                                                                                        <option value="08">Agosto (08)</option>
                                                                                        <option value="09">Setembro (09)</option>
                                                                                        <option value="10">Outubro (10)</option>
                                                                                        <option value="11">Novenbro (11)</option>
                                                                                        <option value="12">Dezembro (12)</option>
                                                                                    </select>
                                                                                    <select name="anovalidade" id="anovalidade" required>
                                                                                        <option value=""></option>
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
                                                                                </td>
                                                                                <td>
                                                                            </tr>
                                                                        </table>
                                                                    </div>
                                                                </div>            
                                                            </div>
                                                        </div>
                                                        <ul class="list-inline pull-right">
                                                            <li><button type="button" class="btn btn-default prev-step">VOLTAR</button></li>
                                                            <li><button type="button" class="btn btn-primary next-step2">CONTINUAR</button></li>
                                                        </ul>
                                                    </div>
                                                    <div class="tab-pane" role="tabpanel" id="complete">
                                                        <div class="step44">                                                                
                                                            <table width="620" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="border-radius: 5px;">
                                                                <tbody>                      
                                                                    <tr>
                                                                        <td valign="top" style="color:#404041;line-height:16px;padding:25px 20px 0px 20px">

                                                                            <section style="position: relative;clear: both;margin: 5px 0;height: 1px;border-top: 1px solid #cbcbcb;margin-bottom: 25px;margin-top: 10px;text-align: center;">
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
                                                                                                        <td height="16" valign="top" style="color:#404041;font-size:13px;padding:15px 5px 0px 5px">
                                                                                                            <strong>Número do Pedido: </strong>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:0px 5px 0px 5px">
                                                                                                            <p>1234</p>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="color:#404041;font-size:13px;padding:15px 5px 0px 5px" valign="top" height="16">
                                                                                                            <strong>Data: </strong>
                                                                                                        </td></tr><tr>
                                                                                                        <td valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:0px 5px 0px 5px">
                                                                                                            <p>
                                                                                                                <script>
                                                                                                                    now = new Date
                                                                                                                    document.write("" + now.getDate() + "/" + (now.getMonth() + 1) + "/" + now.getFullYear())
                                                                                                                </script>
                                                                                                            </p>
                                                                                                        </td>
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
                                                                                                            <p><%=usuario.getEmail()%></p>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>

                                                                                                        <td style="color:#404041;font-size:13px;padding:15px 5px 0px 5px" valign="top" height="16">
                                                                                                            <strong>Telefone:</strong>
                                                                                                        </td></tr><tr>
                                                                                                        <td valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:0px 5px 0px 5px">
                                                                                                            <p><%=usuario.getTelefone()%></p>
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
                                                                    <tr>
                                                                        <td valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:25px 20px 0px 20px">
                                                                            <p>
                                                                                <span></span></p><h2 style="color: #848484; font-family: arial,sans-serif; font-weight: 200;">DETALHES DO PRODUTO</h2>
                                                                            <p></p>
                                                                            <p>Obrigado por comprar conosco!<br>
                                                                                <br>
                                                                                Recebemos seu pedido e nós o notificaremos assim que seu pagamento for aprovado.</p>
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
                                                                                                            <%=anuncio.getTitulo()%> 
                                                                                                        </td>
                                                                                                        <td width="85" align="right" valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:5px 5px 3px 5px;border-bottom:dashed 1px #e5e5e5">
                                                                                                            <%=anuncio.getQuantidade()%>
                                                                                                        </td>
                                                                                                        <td width="60" align="right" valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:5px 5px 3px 5px;border-bottom:dashed 1px #e5e5e5">
                                                                                                                                <input type="text" id="total" name="total" readonly="" required>                                                                    <script type="text/javascript">

                                                                                        $(document).ready( function() {

                                                                                        var valor = $('#preco').val(); 
                                                                                        var un = $('#quantity').val(); 

                                                                                        var resultado = valor * un;

                                                                                        $('#total').val(resultado); 



                                                                                        });
                                                                                        </script>
                                                                                        

                                                                                                        </td>
                                                                                                    </tr>


                                                                                                    <tr>
                                                                                                        <td width="15">&nbsp;
                                                                                                        </td>
                                                                                                        <td width="200" align="left" valign="top" style="color:#404041;font-size:12px;padding:10px 0px 0px 5px">
                                                                                                            <strong>Vendedor: </strong>
                                                                                                        </td>
                                                                                                        <td colspan="4" align="left" valign="top" width="115" style="color:#ff6600;font-size:12px;padding:10px 5px 0px 5px">
                                                                                                            <%=vendedor.getNome()%>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td width="15">&nbsp;
                                                                                                        </td>
                                                                                                        <td width="200" align="left" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 0px 5px">
                                                                                                            <strong>Metodo de envio: </strong>
                                                                                                        </td>
                                                                                                        <td colspan="4" align="left" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 0px 5px">
                                                                                                            <%=anuncio.getFormaEnvio()%>
                                                                                                        </td> 
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
                                                                                            Crédito
                                                                                        </td>
                                                                                    </tr>

                                                                                    <tr>
                                                                                        <td align="left" valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:5px 0px 3px 0px;">
                                                                                            <strong>Cartão: </strong>
                                                                                        </td>
                                                                                        <td width="62" align="right" valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:5px 5px 3px 5px;">
                                                                                            <input style="border:0;" type="text" id="num" name="num" readonly="">
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="left" valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:5px 0px 3px 0px;">
                                                                                            <strong>Titular: </strong>
                                                                                        </td>
                                                                                        <td width="120" align="right" valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:5px 5px 3px 5px;">

                                                                                            <input style="border:0;" type="text" id="nome" name="nome" readonly="">
                                                                                        </td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>

                                                                            <table width="0" border="0" align="right" cellpadding="0" cellspacing="0">
                                                                                <tbody>                                                                                            
                                                                                    <tr>
                                                                                        <td width="0" align="left" valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:15px 0px 3px 0px">
                                                                                            <strong>Sub-total:</strong> 
                                                                                            <span style="font-size:11px;color:#666666"></span>
                                                                                        </td>
                                                                                        <td width="0" align="right" valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:15px 5px 3px 5px">
                                                                                            R$1,234.00
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="left" valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:5px 0px 3px 0px;border-bottom:solid 1px #999999">
                                                                                            <strong>Valor de Envio: </strong>
                                                                                        </td>
                                                                                        <td width="62" align="right" valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:5px 5px 3px 5px;border-bottom:solid 1px #999999">
                                                                                            R$<%=anuncio.getValorFrete()%>
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
                                                                </tbody>
                                                            </table>  

                                                        </div>
                                                        <ul class="list-inline pull-right">
                                                            <li><button type="button" class="btn btn-default prev-step">VOLTAR</button></li>
                                                            <li><input type="submit" class="btn btn-login" value="Finalizar"></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </section>

                                    </div>
                                </div>
                            </div>        
                            <%}
                                    }
                                }%>                                          
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