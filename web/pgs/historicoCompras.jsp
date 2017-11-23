<%@page import="modelo.Vendedor"%>
<%@page import="modelo.Comprador"%>
<%@page import="modelo.Compra"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Endereco"%>
<%@page import="modelo.Usuario"%>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,400italic">
        <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
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

            .animated {
                -webkit-transition: height 0.2s;
                -moz-transition: height 0.2s;
                transition: height 0.2s;
            }

            .stars
            {
                margin: 20px 0;
                font-size: 24px;
                color: #d17581;
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
                                        <a href="gerarRelatorio" class="main-menu-link about block-keep-ratio__content flexbox-center">
                                            <p align="center"><img src="images/estatistica.png" height="60" width="60"></p>
                                            ESTATÍSTICA
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
                                    <div class="banner-2-container">
                                        <div class="aenean">
                                            <h4>HISTÓRICO DE COMPRAS</h4>
                                            <h3>VendeMais</h3>
                                        </div>    
                                    </div>                                
                                </div>
                            </div>
                            <%
                                List<Compra> todasCompras = (List<Compra>) request.getAttribute("resultado");
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
                                        $('.starrr').on('starrr:change', function(e, value){
                                        ratingsField.val(value);
                                        });
                                        });</script>
                            <div class="content-main contact-content">
                                <div class="contact-content-upper">
                                    <div class="row">                                        
                                        <table>
                                            <tr>
                                                <td colspan="4"><b>COMPRA ID#<%=compra.getId()%> - <%=compra.getData_compra()%></b></td>
                                            </tr>
                                            <tr>   
                                                <td width="25%"><b>Produto ID#<%=compra.getAnuncio().getId()%></b></td>
                                                <td width="25%"><b>Comprador</b></td>                                                
                                                <td width="25%"><b>Status</b></td>
                                                <td width="25%"></td>                                                
                                            </tr>
                                            <tr>
                                                <td><%=compra.getAnuncio().getTitulo()%></td>
                                                <td><%=compra.getComprador().getNome()%></td>                                            
                                                <td width="25%">Pago: Sim</td>
                                                <td width="25%"><b><button type="button" data-toggle="modal" data-target="#myModal1<%=compra.getId()%>">Detalhes da Compra</button></b>                                                        
                                                    <div class="modal fade" id="myModal1<%=compra.getId()%>" role="dialog">
                                                        <div class="modal1-dialog modal-sm">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <button type="button" class="close" data-dismiss="modal1">&times;</button>
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
                                                                                                                            <td colspan="4" align="left" valign="top" width="115" style="color:#ff6600;font-size:12px;padding:10px 5px 0px 5px"><%=compra.getComprador().getNome()%></td>
                                                                                                                        </tr>
                                                                                                                        <tr>
                                                                                                                            <td width="15">&nbsp;</td>
                                                                                                                            <td width="200" align="left" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 0px 5px"><strong>Email: </strong></td>
                                                                                                                            <td colspan="4" align="left" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 0px 5px"><%=compra.getComprador().getEmail()%></td> 
                                                                                                                        </tr>
                                                                                                                        <tr>
                                                                                                                            <td width="15">&nbsp;</td>
                                                                                                                            <td width="200" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 5px 5px"><strong>Telefone: </strong></td>
                                                                                                                            <td colspan="4" align="left" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 5px 5px"><%=compra.getComprador().getTelefone()%></td>                                                                                                             
                                                                                                                        </tr>
                                                                                                                        <tr>
                                                                                                                            <td width="15">&nbsp;</td>
                                                                                                                            <td width="200" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 5px 5px"><strong>Endereço para Envio: </strong></td>
                                                                                                                            <td colspan="4" align="left" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 5px 5px"><%=compra.getEnderecoEnvio()%></td>                                                                                                             
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
                                                                                                                            <td colspan="5" align="left" valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:5px 5px 3px 5px;border-bottom:dashed 1px #e5e5e5"><%=compra.getAnuncio().getTitulo()%></td>
                                                                                                                            <td width="85" align="right" valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:5px 5px 3px 5px;border-bottom:dashed 1px #e5e5e5"><%=compra.getQuantidadeComprada()%></td>
                                                                                                                            <td width="60" align="right" valign="top" style="color:#404041;font-size:12px;line-height:16px;padding:5px 5px 3px 5px;border-bottom:dashed 1px #e5e5e5">R$ <%=compra.getSubtotal()%></td>
                                                                                                                        </tr>
                                                                                                                        <tr>
                                                                                                                            <td width="15">&nbsp;</td>
                                                                                                                            <td width="200" align="left" valign="top" style="color:#404041;font-size:12px;padding:10px 0px 0px 5px"><strong>Vendedor: </strong></td>
                                                                                                                            <td colspan="4" align="left" valign="top" width="115" style="color:#ff6600;font-size:12px;padding:10px 5px 0px 5px"><%=compra.getVendedor().getNome()%></td>
                                                                                                                        </tr>
                                                                                                                        <tr>
                                                                                                                            <td width="15">&nbsp;</td>
                                                                                                                            <td width="200" align="left" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 0px 5px"><strong>Email: </strong></td>
                                                                                                                            <td colspan="4" align="left" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 0px 5px"><%=compra.getVendedor().getEmail()%></td> 
                                                                                                                        </tr>
                                                                                                                        <tr>
                                                                                                                            <td width="15">&nbsp;</td>
                                                                                                                            <td width="200" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 5px 5px"><strong>Telefone: </strong></td>
                                                                                                                            <td colspan="4" align="left" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 5px 5px"><%=compra.getVendedor().getTelefone()%></td>                                                                                                             
                                                                                                                        </tr>
                                                                                                                        <tr>
                                                                                                                            <td width="15">&nbsp;</td>
                                                                                                                            <td width="200" align="left" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 0px 5px"><strong>Metodo de envio: </strong></td>
                                                                                                                            <td colspan="4" align="left" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 0px 5px"><%=compra.getAnuncio().getFormaEnvio()%></td> 
                                                                                                                        </tr>    
                                                                                                                        <tr>
                                                                                                                            <td width="15">&nbsp;</td>
                                                                                                                            <td width="200" align="left" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 0px 5px"><strong>Prazo estimado para entrega:: </strong></td>
                                                                                                                            <td colspan="4" align="left" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 0px 5px"><%=compra.getAnuncio().getPrazo_entrega()%></td> 
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
                                                                                                                            <td colspan="4" align="left" valign="top" width="115" style="color:#ff6600;font-size:12px;padding:10px 5px 0px 5px"><%=compra.getAnuncio().getFormapag()%></td>
                                                                                                                        </tr>
                                                                                                                        <tr>
                                                                                                                            <td width="15">&nbsp;</td>
                                                                                                                            <td width="200" align="left" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 0px 5px"><strong>SubTotal: </strong></td>
                                                                                                                            <td colspan="4" align="left" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 0px 5px">R$ <%=compra.getSubtotal()%></td> 
                                                                                                                        </tr>
                                                                                                                        <tr>
                                                                                                                            <td width="15">&nbsp;</td>
                                                                                                                            <td width="200" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 5px 5px"><strong>Valor frete: </strong></td>
                                                                                                                            <td colspan="4" align="left" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 5px 5px">R$ <%=compra.getAnuncio().getValorFrete()%></td>                                                                                                             
                                                                                                                        </tr>
                                                                                                                        <tr>
                                                                                                                            <td width="15">&nbsp;</td>
                                                                                                                            <td width="200" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 5px 5px"><strong>Total: </strong></td>
                                                                                                                            <td colspan="4" align="left" valign="top" style="color:#404041;font-size:12px;padding:5px 5px 5px 5px">R$ <%=compra.getTotal()%></td>                                                                                                             
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
                                                <td><b>Total da Venda: </b><%=compra.getTotal()%></td>
                                                <td><b>Tel.:</b><%=compra.getComprador().getTelefone()%></td>                                            
                                                <td width="25%"></td>
                                                <td width="25%"><b><button type="button" data-toggle="modal" data-target="#myModal2<%=compra.getId()%>">Classificar produto</button></b></td> 
                                            <div class="modal fade" id="myModal2<%=compra.getId()%>" role="dialog">
                                                <div class="modal1-dialog modal-sm">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal1">&times;</button>
                                                            <h4 class="modal-title">Classificação do produto</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="tab-pane" role="tabpanel" id="complete">
                                                                <div class="well well-sm">
                                                                    <div class="text-right">
                                                                        <a class="btn btn-success btn-green" href="#reviews-anchor" id="open-review-box" style="display: none;">Leave a Review</a>
                                                                    </div>

                                                                    <div class="row" id="post-review-box" style="">
                                                                        <div class="col-md-12">
                                                                            <form action="classificarProduto" method="POST">
                                                                                <input id="ratings-hidden<%=compra.getId()%>" name="ratings-hidden" type="hidden"> 
                                                                                <textarea class="form-control animated" cols="50" id="new-review" name="new-review" placeholder="Escreva aqui o que você achou do produto" rows="5" style="overflow: hidden; word-wrap: break-word; resize: horizontal; height: 54px;"></textarea>
                                                                                <div class="text-right">
                                                                                    <div class="stars starrr" data-rating="0"></div>
                                                                                    <input hidden type="text" name="idCompra" value="<%=compra.getId()%>">
                                                                                    <input type="submit" class="btn btn-success" value="SALVAR">
                                                                                </div>
                                                                            </form>
                                                                        </div>
                                                                    </div>
                                                                </div>                                
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            </tr>
                                        </table> 
                                    </div> 
                                </div>
                            </div>                        
                            <div class="row margin-b-30"></div>
                            <%}
                                } else {
                                }%>                         
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