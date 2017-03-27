<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Vende Mais</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <style type="text/css">

            /*****************globals*************/
            body {
                font-family: 'open sans';
                overflow-x: hidden; }

            img {
                max-width: 100%; }

            .preview {
                display: -webkit-box;
                display: -webkit-flex;
                display: -ms-flexbox;
                display: flex;
                -webkit-box-orient: vertical;
                -webkit-box-direction: normal;
                -webkit-flex-direction: column;
                -ms-flex-direction: column;
                flex-direction: column; }
            @media screen and (max-width: 996px) {
                .preview {
                    margin-bottom: 20px; } }

            .preview-pic {
                -webkit-box-flex: 1;
                -webkit-flex-grow: 1;
                -ms-flex-positive: 1;
                flex-grow: 1; }

            .preview-thumbnail.nav-tabs {
                border: none;
                margin-top: 15px; }
            .preview-thumbnail.nav-tabs li {
                width: 18%;
                margin-right: 2.5%; }
            .preview-thumbnail.nav-tabs li img {
                max-width: 100%;
                display: block; }
            .preview-thumbnail.nav-tabs li a {
                padding: 0;
                margin: 0; }
            .preview-thumbnail.nav-tabs li:last-of-type {
                margin-right: 0; }

            .tab-content {
                overflow: hidden; }
            .tab-content img {
                width: 100%;
                -webkit-animation-name: opacity;
                animation-name: opacity;
                -webkit-animation-duration: .3s;
                animation-duration: .3s; }

            .card {
                margin-top: 50px;
                background: #eee;
                padding: 3em;
                line-height: 1.5em; }

            @media screen and (min-width: 997px) {
                .wrapper {
                    display: -webkit-box;
                    display: -webkit-flex;
                    display: -ms-flexbox;
                    display: flex; } }

            .details {
                display: -webkit-box;
                display: -webkit-flex;
                display: -ms-flexbox;
                display: flex;
                -webkit-box-orient: vertical;
                -webkit-box-direction: normal;
                -webkit-flex-direction: column;
                -ms-flex-direction: column;
                flex-direction: column; }

            .colors {
                -webkit-box-flex: 1;
                -webkit-flex-grow: 1;
                -ms-flex-positive: 1;
                flex-grow: 1; }

            .product-title, .price, .sizes, .colors {
                text-transform: UPPERCASE;
                font-weight: bold; }

            .checked, .price span {
                color: #ff9f1a; }

            .product-title, .rating, .product-description, .price, .vote, .sizes {
                margin-bottom: 15px; }

            .product-title {
                margin-top: 0; }

            .size {
                margin-right: 10px; }
            .size:first-of-type {
                margin-left: 40px; }

            .color {
                display: inline-block;
                vertical-align: middle;
                margin-right: 10px;
                height: 2em;
                width: 2em;
                border-radius: 2px; }
            .color:first-of-type {
                margin-left: 20px; }

            .add-to-cart, .like {
                background: #ff9f1a;
                padding: 1.2em 1.5em;
                border: none;
                text-transform: UPPERCASE;
                font-weight: bold;
                color: #fff;
                -webkit-transition: background .3s ease;
                transition: background .3s ease; }
            .add-to-cart:hover, .like:hover {
                background: #b36800;
                color: #fff; }

            .not-available {
                text-align: center;
                line-height: 2em; }
            .not-available:before {
                font-family: fontawesome;
                content: "\f00d";
                color: #fff; }

            .orange {
                background: #ff9f1a; }

            .green {
                background: #85ad00; }

            .blue {
                background: #0076ad; }

            .tooltip-inner {
                padding: 1.3em; }

            @-webkit-keyframes opacity {
                0% {
                    opacity: 0;
                    -webkit-transform: scale(3);
                    transform: scale(3); }
                100% {
                    opacity: 1;
                    -webkit-transform: scale(1);
                    transform: scale(1); } }

            @keyframes opacity {
                0% {
                    opacity: 0;
                    -webkit-transform: scale(3);
                    transform: scale(3); }
                100% {
                    opacity: 1;
                    -webkit-transform: scale(1);
                    transform: scale(1); } }

            /*# sourceMappingURL=style.css.map */
        </style>
        <script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script type="text/javascript">
            window.alert = function () {};
            var defaultCSS = document.getElementById('bootstrap-css');
            function changeCSS(css) {
                if (css)
                    $('head > link').filter(':first').replaceWith('<link rel="stylesheet" href="' + css + '" type="text/css" />');
                else
                    $('head > link').filter(':first').replaceWith(defaultCSS);
            }
            $(document).ready(function () {
                var iframe_height = parseInt($('html').height());
                window.parent.postMessage(iframe_height, 'http://bootsnipp.com');
            });
        </script>
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

                        <div class="content-main contact-content">
                            <div class="contact-content-upper">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="gallery_title">
                                            <h3>VENDEMAIS</h3>
                                            <h4>DETALHES DA z</h4>
                                        </div>    
                                    </div>                            
                                </div>

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