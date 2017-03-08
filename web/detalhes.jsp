<html lang="en"><head>

        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Vende Mais</title>

        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,400italic">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="shortcut icon" href="images/i.ico">
        <script type="text/javascript" src="//code.jquery.com/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" src="//netdna.bootstrapcdn.com/bootstrap/3.0.1/js/bootstrap.min.js"></script>
        <script type="text/javascript"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
        <style>
            @import url("bootstrap/bootstrap.min.css");
            @import url("bootstrap-override.css");
            @import url("//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css");

            .gold{
                color: #FFBF00;
            }

            .product{
                border: 1px solid #dddddd;
                height: 321px;
            }

            .product>img{
                max-width: 230px;
            }

            .product-rating{
                font-size: 20px;
                margin-bottom: 25px;
            }

            .product-title{
                font-size: 20px;
            }

            .product-desc{
                font-size: 14px;
            }

            .product-price{
                font-size: 22px;
            }

            .product-stock{
                color: #74DF00;
                font-size: 20px;
                margin-top: 10px;
            }

            .product-info{
                margin-top: 50px;
            }
            .content-wrapper {
                max-width: 1140px;
                background: #fff;
                margin: 0 auto;
                margin-top: 25px;
                margin-bottom: 10px;
                border: 0px;
                border-radius: 0px;
            }

            .container-fluid{
                max-width: 1140px;
                margin: 0 auto;
            }

            .view-wrapper {
                float: right;
                max-width: 70%;
                margin-top: 25px;
            }

            .container {
                padding-left: 0px;
                padding-right: 0px;
                max-width: 100%;
            }
            .service1-items {
                padding: 0px 0 0px 0;
                float: left;
                position: relative;
                overflow: hidden;
                max-width: 100%;
                height: 321px;
                width: 130px;
            }

            .service1-item {
                height: 107px;
                width: 120px;
                display: block;
                float: left;
                position: relative;
                padding-right: 20px;
                border-right: 1px solid #DDD;
                border-top: 1px solid #DDD;
                border-bottom: 1px solid #DDD;
            }

            .service1-item > img {
                max-height: 110px;
                max-width: 110px;
                opacity: 0.6;
                transition: all .2s ease-in;
                -o-transition: all .2s ease-in;
                -moz-transition: all .2s ease-in;
                -webkit-transition: all .2s ease-in;
            }

            .service1-item > img:hover {
                cursor: pointer;
                opacity: 1;
            }

            .service-image-left {
                padding-right: 50px;
            }

            .service-image-right {
                padding-left: 50px;
            }

            .service-image-left > center > img,.service-image-right > center > img{
                max-height: 155px;
            }
        </style>


        <style>ul > li{margin-right:25px;font-weight:lighter;cursor:pointer}
            li.active{border-bottom:3px solid silver;}

            .item-photo{display:flex;justify-content:center;align-items:center;border-right:1px solid #f6f6f6;}
            .menu-items{list-style-type:none;font-size:11px;display:inline-flex;margin-bottom:0px;margin-top:20px}
            .btn-success{width:100%;border-radius:0px;}
            .section{width:100%;margin-left:-15px;padding:2px;padding-left:15px;padding-right:15px;background:#f8f9f9}
            .title-price{margin-top:30px;margin-bottom:0px;color:black}
            .title-attr{margin-top:0px;margin-bottom:0px;color:black;}
            .btn-minus{cursor:pointer;font-size:7px;display:flex;align-items:center;padding:5px;padding-left:10px;padding-right:10px;border:1px solid gray;border-radius:2px;border-right:0px;}
            .btn-plus{cursor:pointer;font-size:7px;display:flex;align-items:center;padding:5px;padding-left:10px;padding-right:10px;border:1px solid gray;border-radius:2px;border-left:0px;}
            div.section > div {width:100%;display:inline-flex;}
            div.section > div > input {margin:0px;padding-left:5px;font-size:10px;padding-right:5px;max-width:18%;text-align:center;}
            .attr,.attr2{cursor:pointer;margin-right:5px;height:20px;font-size:10px;padding:2px;border:1px solid gray;border-radius:2px;}
            .attr.active,.attr2.active{ border:1px solid orange;}

            @media (max-width: 426px) {
                .container {margin-top:0px !important;}
                .container > .row{padding:0px !important;}
                .container > .row > .col-xs-12.col-sm-5{
                    padding-right:0px ;    
                }
                .container > .row > .col-xs-12.col-sm-9 > div > p{
                    padding-left:0px !important;
                    padding-right:0px !important;
                }
                .container > .row > .col-xs-12.col-sm-9 > div > ul{
                    padding-left:10px !important;

                }            
                .section{width:104%;}
                .menu-items{padding-left:0px;}
            }
        </style>

        <script type="text/javascript">
            $(document).ready(function () {
                //-- Click on detail
                $("ul.menu-items > li").on("click", function () {
                    $("ul.menu-items > li").removeClass("active");
                    $(this).addClass("active");
                })

                $(".attr,.attr2").on("click", function () {
                    var clase = $(this).attr("class");

                    $("." + clase).removeClass("active");
                    $(this).addClass("active");
                })

                //-- Click on QUANTITY
                $(".btn-minus").on("click", function () {
                    var now = $(".section > div > input").val();
                    if ($.isNumeric(now)) {
                        if (parseInt(now) - 1 > 0) {
                            now--;
                        }
                        $(".section > div > input").val(now);
                    } else {
                        $(".section > div > input").val("1");
                    }
                })
                $(".btn-plus").on("click", function () {
                    var now = $(".section > div > input").val();
                    if ($.isNumeric(now)) {
                        $(".section > div > input").val(parseInt(now) + 1);
                    } else {
                        $(".section > div > input").val("1");
                    }
                })
            })
        </script>
        
    </head>

    <body class="contact-page">
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
                                        <a href="contact.html" class="main-menu-link contact block-keep-ratio__content flexbox-center">
                                            <i class="fa fa-envelope-o fa-4x main-menu-link-icon"></i>
                                            CONTATO
                                        </a>                                
                                    </div>

                                </div>

                            </div> <!-- main-menu -->
                        </aside>

                        <div class="content-main contact-content">
                            <div class="contact-content-upper">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="gallery_title">
                                            <h3>VENDE+</h3>
                                            <h4>AQUI VOCÊ VENDE MUITO MAIS!</h4>
                                        </div>    
                                    </div>                            
                                </div>

                                <div class="row">  
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">        
                                        <div class="row">
                                            <div class="col-xs-4 item-photo">
                                                <img style="max-width:100%;" src="images/xbox.png">
                                            </div>
                                            <div class="col-xs-5" style="border:0px solid gray">
                                                <!-- Datos del vendedor y titulo del producto -->
                                                <h3>XBOX - ONE + 2 JOGOS + KINECT + CONTROLE</h3>    

                                                <!-- Preços -->
                                                <h6 class="title-price"><small>PREÇO: </small></h6>
                                                <h3 style="margin-top:0px;">R$ 1399.00</h3>

                                                <div class="section" style="padding-bottom:20px;">
                                                    <h6 class="title-attr"><small>QUANTIDADE DISPONÍVEL: 10</small></h6>
                                                </div>

                                                <div class="section" style="padding-bottom:20px;">
                                                    <h6 class="title-attr"><small>QUANTIDADE: </small></h6>                    
                                                    <div>
                                                        <div class="btn-minus"><span class="glyphicon glyphicon-minus"></span></div>
                                                        <input value="1">
                                                        <div class="btn-plus"><span class="glyphicon glyphicon-plus"></span></div>
                                                    </div>
                                                </div>     

                                                <!-- Botones de compra -->
                                                <div class="section" style="padding-bottom:20px;">
                                                    <button class="btn btn-success"><span style="margin-right:20px" class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> COMPRAR</button>
                                                </div>                                        
                                            </div>                              

                                            <div class="container-fluid">		
                                                <div class="col-md-12 product-info">
                                                    <ul id="myTab" class="nav nav-tabs nav_tabs">

                                                        <li class="active"><a href="#service-one" data-toggle="tab">DESCRIÇÃO</a></li>
                                                        <li><a href="#service-two" data-toggle="tab">GARANTIA</a></li>
                                                        <li><a href="#service-three" data-toggle="tab">ENVIO</a></li>

                                                    </ul>
                                                    <div id="myTabContent" class="tab-content">
                                                        <div class="tab-pane fade in active" id="service-one">

                                                            <section class="container product-info">
                                                                The Corsair Gaming Series GS600 power supply is the ideal price-performance solution for building or upgrading a Gaming PC. A single +12V rail provides up to 48A of reliable, continuous power for multi-core gaming PCs with multiple graphics cards. The ultra-quiet, dual ball-bearing fan automatically adjusts its speed according to temperature, so it will never intrude on your music and games. Blue LEDs bathe the transparent fan blades in a cool glow. Not feeling blue? You can turn off the lighting with the press of a button.

                                                                <h3>Corsair Gaming Series GS600 Features:</h3>
                                                                <li>It supports the latest ATX12V v2.3 standard and is backward compatible with ATX12V 2.2 and ATX12V 2.01 systems</li>
                                                                <li>An ultra-quiet 140mm double ball-bearing fan delivers great airflow at an very low noise level by varying fan speed in response to temperature</li>
                                                                <li>80Plus certified to deliver 80% efficiency or higher at normal load conditions (20% to 100% load)</li>
                                                                <li>0.99 Active Power Factor Correction provides clean and reliable power</li>
                                                                <li>Universal AC input from 90~264V ? no more hassle of flipping that tiny red switch to select the voltage input!</li>
                                                                <li>Extra long fully-sleeved cables support full tower chassis</li>
                                                                <li>A three year warranty and lifetime access to Corsair?s legendary technical support and customer service</li>
                                                                <li>Over Current/Voltage/Power Protection, Under Voltage Protection and Short Circuit Protection provide complete component safety</li>
                                                                <li>Dimensions: 150mm(W) x 86mm(H) x 160mm(L)</li>
                                                                <li>MTBF: 100,000 hours</li>
                                                                <li>Safety Approvals: UL, CUL, CE, CB, FCC Class B, TÜV, CCC, C-tick</li>
                                                            </section>

                                                        </div>
                                                        <div class="tab-pane fade" id="service-two">

                                                            <section class="container product-info">
                                                                The Corsair Gaming Series GS600 power supply is the ideal price-performance solution for building or upgrading a Gaming PC. A single +12V rail provides up to 48A of reliable, continuous power for multi-core gaming PCs with multiple graphics cards. The ultra-quiet, dual ball-bearing fan automatically adjusts its speed according to temperature, so it will never intrude on your music and games. Blue LEDs bathe the transparent fan blades in a cool glow. Not feeling blue? You can turn off the lighting with the press of a button.

                                                                <h3>Corsair Gaming Series GS600 Features:</h3>
                                                                <li>It supports the latest ATX12V v2.3 standard and is backward compatible with ATX12V 2.2 and ATX12V 2.01 systems</li>
                                                                <li>An ultra-quiet 140mm double ball-bearing fan delivers great airflow at an very low noise level by varying fan speed in response to temperature</li>
                                                                <li>80Plus certified to deliver 80% efficiency or higher at normal load conditions (20% to 100% load)</li>
                                                                <li>0.99 Active Power Factor Correction provides clean and reliable power</li>
                                                                <li>Universal AC input from 90~264V ? no more hassle of flipping that tiny red switch to select the voltage input!</li>
                                                                <li>Extra long fully-sleeved cables support full tower chassis</li>
                                                                <li>A three year warranty and lifetime access to Corsair?s legendary technical support and customer service</li>
                                                                <li>Over Current/Voltage/Power Protection, Under Voltage Protection and Short Circuit Protection provide complete component safety</li>
                                                                <li>Dimensions: 150mm(W) x 86mm(H) x 160mm(L)</li>
                                                                <li>MTBF: 100,000 hours</li>
                                                                <li>Safety Approvals: UL, CUL, CE, CB, FCC Class B, TÜV, CCC, C-tick</li>
                                                            </section>

                                                        </div>
                                                        <div class="tab-pane fade" id="service-three">
                                                            <section class="container product-info">
                                                                The Corsair Gaming Series GS600 power supply is the ideal price-performance solution for building or upgrading a Gaming PC. A single +12V rail provides up to 48A of reliable, continuous power for multi-core gaming PCs with multiple graphics cards. The ultra-quiet, dual ball-bearing fan automatically adjusts its speed according to temperature, so it will never intrude on your music and games. Blue LEDs bathe the transparent fan blades in a cool glow. Not feeling blue? You can turn off the lighting with the press of a button.

                                                                <h3>Corsair Gaming Series GS600 Features:</h3>
                                                                <li>It supports the latest ATX12V v2.3 standard and is backward compatible with ATX12V 2.2 and ATX12V 2.01 systems</li>
                                                                <li>An ultra-quiet 140mm double ball-bearing fan delivers great airflow at an very low noise level by varying fan speed in response to temperature</li>
                                                                <li>80Plus certified to deliver 80% efficiency or higher at normal load conditions (20% to 100% load)</li>
                                                                <li>0.99 Active Power Factor Correction provides clean and reliable power</li>
                                                                <li>Universal AC input from 90~264V ? no more hassle of flipping that tiny red switch to select the voltage input!</li>
                                                                <li>Extra long fully-sleeved cables support full tower chassis</li>
                                                                <li>A three year warranty and lifetime access to Corsair?s legendary technical support and customer service</li>
                                                                <li>Over Current/Voltage/Power Protection, Under Voltage Protection and Short Circuit Protection provide complete component safety</li>
                                                                <li>Dimensions: 150mm(W) x 86mm(H) x 160mm(L)</li>
                                                                <li>MTBF: 100,000 hours</li>
                                                                <li>Safety Approvals: UL, CUL, CE, CB, FCC Class B, TÜV, CCC, C-tick</li>
                                                            </section>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                </div>
                                            </div>	
                                        </div>    
                                    </div> <!-- .contact-left -->

                                    <a href="mailto:mailto@company.com" class="contact-info-link"> <!-- .contact_right -->

                                    </a></div><a href="mailto:info@company.com" class="contact-info-link"> <!-- .row -->
                                </a></div><a href="mailto:info@company.com" class="contact-info-link">

                            </a></div><a href="mailto:info@company.com" class="contact-info-link"> <!-- .contact-content -->
                        </a></div><a href="mailto:info@company.com" class="contact-info-link"> <!-- .main-page -->
                    </a></div><a href="mailto:info@company.com" class="contact-info-link"> <!-- .row -->

                    <footer class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 footer">
                            <p class="copyright">Copyright © 2016 Company Name</p>
                        </div>    
                    </footer>  <!-- .row -->   

                </a></div><a href="mailto:info@company.com" class="contact-info-link"> <!-- .container -->
            </a></div><a href="mailto:info@company.com" class="contact-info-link"> <!-- .main-body -->

            <script src="js/jquery-1.11.3.min.js"></script>
            <script src="js/bootstrap.min.js"></script>


        </a></body>

</html>