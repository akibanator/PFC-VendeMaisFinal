<html lang="en"><head>
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
                                                                    <div class="col-xs-5">

                                                                        <label for="produto">Produto: </label>
                                                                        <input type="text" class="form-control" id="produto">

                                                                        <label for="quantidadeDesejada">Quantidade a ser comprada: </label>
                                                                        <input type="text" class="form-control" id="quantidadeDesejada">

                                                                        <label for="preco">Valor Unitario: </label>
                                                                        <input type="text" class="form-control" id="preco">

                                                                        <label for="subtotal">Subtotal: </label>
                                                                        <input type="text" class="form-control" id="subtotal" required="" >
                                                                    </div>

                                                                    <div class="preview col-md-6">
                                                                        <p align="center"><img src="images/xbox.png" height="300" width="200"></p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <ul class="list-inline pull-right">
                                                                <li><button type="button" class="btn btn-primary next-step">CONTINUAR</button></li>
                                                            </ul>
                                                        </div>
                                                        <div class="tab-pane" role="tabpanel" id="step2">
                                                            <div class="step2">
                                                                <div class="step_21">
                                                                    <div class="row">

                                                                    </div>
                                                                </div>
                                                                <div class="step-22">

                                                                </div>
                                                            </div>
                                                            <ul class="list-inline pull-right">
                                                                <li><button type="button" class="btn btn-default prev-step">VOLTAR</button></li>
                                                                <li><button type="button" class="btn btn-primary next-step">CONTINUAR</button></li>
                                                            </ul>
                                                        </div>
                                                        <div class="tab-pane" role="tabpanel" id="step3">
                                                            <div class="step3">
                                                                
                                                                <div class="step-22">

                                                                </div>
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
                                    <label for="cardNumber">CARD NUMBER</label>
                                    <div class="input-group">
                                        <input type="tel" class="form-control unknown" name="cardNumber" placeholder="Valid Card Number" autocomplete="cc-number" required="" autofocus="" aria-required="true">
                                        <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                    </div>
                                </div>                            
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-7 col-md-7">
                                <div class="form-group">
                                    <label for="cardExpiry"><span class="hidden-xs">EXPIRATION</span><span class="visible-xs-inline">EXP</span> DATE</label>
                                    <input type="tel" class="form-control" name="cardExpiry" placeholder="MM / YY" autocomplete="cc-exp" required="" aria-required="true">
                                </div>
                            </div>
                            <div class="col-xs-5 col-md-5 pull-right">
                                <div class="form-group">
                                    <label for="cardCVC">CV CODE</label>
                                    <input type="tel" class="form-control" name="cardCVC" placeholder="CVC" autocomplete="cc-csc" required="" aria-required="true">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label for="couponCode">COUPON CODE</label>
                                    <input type="text" class="form-control" name="couponCode">
                                </div>
                            </div>                        
                        </div>
                        
                        
                    
                </div>
            </div>            
            <!-- CREDIT CARD FORM ENDS HERE -->
            
            
                   
                                                                    </div></div>
                                                            <ul class="list-inline pull-right">
                                                                <li><button type="button" class="btn btn-default prev-step">VOLTAR</button></li>
                                                                <li><button type="button" class="btn btn-primary next-step">CONTINUAR</button></li>
                                                            </ul>
                                                        </div>
                                                        <div class="tab-pane" role="tabpanel" id="complete">
                                                            <div class="step44">
                                                                <h5>Completed</h5>


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