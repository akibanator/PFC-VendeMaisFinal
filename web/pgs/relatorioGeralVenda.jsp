<%@page import="modelo.Relatorio"%>
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
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
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
                padding: 8px;
                vertical-align:middle;
            }

            tr:nth-child(even) {
                background-color: #dddddd;
            }
            .animated {
                -webkit-transition: height 0.2s;
                -moz-transition: height 0.2s;
                transition: height 0.2s;
            }

            .stars
            {
                margin: 20px 0;
                font-size: 15px;
                color: #190707;
            }
            .thumbnail {
                padding:0px;
            }
            .panel {
                position:relative;
            }
            .panel>.panel-heading:after,.panel>.panel-heading:before{
                position:absolute;
                top:11px;left:-16px;
                right:100%;
                width:0;
                height:0;
                display:block;
                content:" ";
                border-color:transparent;
                border-style:solid solid outset;
                pointer-events:none;
            }
            .panel>.panel-heading:after{
                border-width:7px;
                border-right-color:#f7f7f7;
                margin-top:1px;
                margin-left:2px;
            }
            .panel>.panel-heading:before{
                border-right-color:#ddd;
                border-width:8px;
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
                        <div class="row margin-b-30">
                            <div class="col-xs-12 col-sm-12 col-md-12 biliend">
                                <div class="banner-2-container">
                                    <div class="aenean">
                                        <h4>RELATÓRIO GERAL</h4>
                                        <h3>VendeMais</h3>
                                    </div>    
                                </div>  
                            </div>
                        </div>

                        <div class="content-main contact-content">
                            <div class="contact-content-upper">
                                <div class="row">
                                    
                                    <h3>VENDAS</h3>
                                    <form role="form" action="filtrarvenda" method="POST">
                                        <table style="width:70%;border:0px;">
                                            <tr style='background-color: white;'>
                                                <td width="20%" style="padding: 3px;">Ordernar por: </td>
                                                <td width="20%" style="padding: 3px;"><input style="width:60px;font-size: 13px;" type="radio" id="ordem" name="ordem" value="data_compra"> data</td>
                                                <td width="20%" style="padding: 3px;"><input style="width:60px;font-size: 13px;" type="radio" id="ordem" name="ordem" value="quantidade"> quantidade</td>
                                                <td width="20%" style="padding: 3px;"><input style="width:60px;font-size: 13px;" type="radio" id="ordem" name="ordem" value="total"> total</td>
                                                <td width="20%" style="padding: 3px;"><input style="width:60px;font-size: 13px;" type="radio" id="ordem" name="ordem" value="nota"> classificação</td>
                                            </tr>
                                        </table>  
                                    <hr>
                                        <table style="width:100%;vertical-align:middle;border:0px;">
                                            <tr style='background-color: white;'>
                                                <td style="padding: 3px;" width="15%">Filtrar por data entre:</td>                                            
                                                <td style="padding: 3px;" width="13%"><input style="width:150px;font-size: 13px;"  type="date" id="data1" name="data1"></td>
                                                <td style="padding: 3px;" width="20"> a </td>
                                                <td style="padding: 3px;" width="20"><input style="width:150px;font-size: 13px;" type="date" id="data2" name="data2"></td>
                                                <td></td>
                                                <td style="padding: 3px;" width="20%">Filtrar por quantidade entre:</td>
                                                <td style="padding: 3px;" width="20"><input style="width:60px;font-size: 13px;" type="number" id="quantidade1" name="quantidade1" ></td>
                                                <td style="padding: 3px;" width="20">a</td>
                                                <td style="padding: 3px;" width="20"><input style="width:60px;font-size: 13px;" type="number" id="quantidade2" name="quantidade2" ></td>
                                                <%  Usuario u = (Usuario) request.getSession().getAttribute("usuario");
                                                            if (u != null) {%>
                                                <td style="padding: 3px;" rowspan="2" align="center"><input style="width:150px;font-size: 13px;" hidden type="text" id="idVendedor" name="idVendedor" value="<%=u.getId()%>"><%} else {}%><input type="submit" class="btn btn-primary btn-lg" value="PESQUISAR"></td>
                                            </tr>                                        
                                            <tr style='background-color: white;'>
                                                <td style="padding: 3px;">Filtrar por valor entre:</td>
                                                <td style="padding: 3px;"><input style="width:150px;font-size: 13px;" type="number" id="valor1" name="valor1" ></td>
                                                <td style="padding: 3px;">a</td>
                                                <td style="padding: 3px;"><input style="width:150px;font-size: 13px;" type="number" id="valor2" name="valor2" ></td>
                                                <td></td>                                                
                                                <td style="padding: 3px;">Filtrar por classificação entre:</td>
                                                <td style="padding: 3px;"><input style="width:60px;font-size: 13px" type="number" id="classificacao1" name="classificacao1" ></td>
                                                <td style="padding: 3px;">a</td>
                                                <td style="padding: 3px;"><input style="width:60px;font-size: 13px" type="number" id="classificacao2" name="classificacao2" ></td>
                                            </tr>                                                                               
                                        </table>
                                    </form>
                                    <hr>
                                    <br>
                                    <table border="1" style="border-color:#dddddd;">
                                        <tr>
                                            <th>ID</th>
                                            <th>Data</th>
                                            <th>Produto</th>
                                            <th>Quantidade</th>
                                            <th>Comprador</th>
                                            <th>Valor</th>
                                            <th>Classificação</th>
                                        </tr>
                                        <%
                                            List<Compra> todasVendas = (List<Compra>) request.getAttribute("resultado");
                                            if (todasVendas != null) {
                                                for (Compra venda : todasVendas) {
                                        %>
                                        <tr>                                                    
                                            <td><%=venda.getId()%></td>
                                            <td><%=venda.getData_compra()%></td>
                                            <td><%=venda.getAnuncio().getTitulo()%></td>
                                            <td><%=venda.getQuantidadeComprada()%></td>
                                            <td><%=venda.getComprador().getNome()%></td>
                                            <td><%=venda.getTotal()%></td>
                                        <script>(function(e){var t, o = {className:"autosizejs", append:"", callback:!1, resizeDelay:10}, i = '<textarea tabindex="-1" style="position:absolute; top:-999px; left:0; right:auto; bottom:auto; border:0; padding: 0; -moz-box-sizing:content-box; -webkit-box-sizing:content-box; box-sizing:content-box; word-wrap:break-word; height:0 !important; min-height:0 !important; overflow:hidden; transition:none; -webkit-transition:none; -moz-transition:none;"/>', n = ["fontFamily", "fontSize", "fontWeight", "fontStyle", "letterSpacing", "textTransform", "wordSpacing", "textIndent"], s = e(i).data("autosize", !0)[0]; s.style.lineHeight = "99px", "99px" === e(s).css("lineHeight") && n.push("lineHeight"), s.style.lineHeight = "", e.fn.autosize = function(i){return this.length?(i = e.extend({}, o, i || {}), s.parentNode !== document.body && e(document.body).append(s), this.each(function(){function o(){var t, o; "getComputedStyle"in window?(t = window.getComputedStyle(u, null), o = u.getBoundingClientRect().width, e.each(["paddingLeft", "paddingRight", "borderLeftWidth", "borderRightWidth"], function(e, i){o -= parseInt(t[i], 10)}), s.style.width = o + "px"):s.style.width = Math.max(p.width(), 0) + "px"}function a(){var a = {}; if (t = u, s.className = i.className, d = parseInt(p.css("maxHeight"), 10), e.each(n, function(e, t){a[t] = p.css(t)}), e(s).css(a), o(), window.chrome){var r = u.style.width; u.style.width = "0px", u.offsetWidth, u.style.width = r}}function r(){var e, n; t !== u?a():o(), s.value = u.value + i.append, s.style.overflowY = u.style.overflowY, n = parseInt(u.style.height, 10), s.scrollTop = 0, s.scrollTop = 9e4, e = s.scrollTop, d && e > d?(u.style.overflowY = "scroll", e = d):(u.style.overflowY = "hidden", c > e && (e = c)), e += w, n !== e && (u.style.height = e + "px", f && i.callback.call(u, u))}function l(){clearTimeout(h), h = setTimeout(function(){var e = p.width(); e !== g && (g = e, r())}, parseInt(i.resizeDelay, 10))}var d, c, h, u = this, p = e(u), w = 0, f = e.isFunction(i.callback), z = {height:u.style.height, overflow:u.style.overflow, overflowY:u.style.overflowY, wordWrap:u.style.wordWrap, resize:u.style.resize}, g = p.width(); p.data("autosize") || (p.data("autosize", !0), ("border-box" === p.css("box-sizing") || "border-box" === p.css("-moz-box-sizing") || "border-box" === p.css("-webkit-box-sizing")) && (w = p.outerHeight() - p.height()), c = Math.max(parseInt(p.css("minHeight"), 10) - w || 0, p.height()), p.css({overflow:"hidden", overflowY:"hidden", wordWrap:"break-word", resize:"none" === p.css("resize") || "vertical" === p.css("resize")?"none":"horizontal"}), "onpropertychange"in u?"oninput"in u?p.on("input.autosize keyup.autosize", r):p.on("propertychange.autosize", function(){"value" === event.propertyName && r()}):p.on("input.autosize", r), i.resizeDelay !== !1 && e(window).on("resize.autosize", l), p.on("autosize.resize", r), p.on("autosize.resizeIncludeStyle", function(){t = null, r()}), p.on("autosize.destroy", function(){t = null, clearTimeout(h), e(window).off("resize", l), p.off("autosize").off(".autosize").css(z).removeData("autosize")}), r())})):this}})(window.jQuery || window.$);
                                            var __slice = [].slice; (function(e, t){var n; n = function(){function t(t, n){var r, i, s, o = this; this.options = e.extend({}, this.defaults, n); this.$el = t; s = this.defaults; for (r in s){i = s[r]; if (this.$el.data(r) != null){this.options[r] = this.$el.data(r)}}this.createStars(); this.syncRating(); this.$el.on("mouseover.starrr", "span", function(e){return o.syncRating(o.$el.find("span").index(e.currentTarget) + 1)}); this.$el.on("mouseout.starrr", function(){return o.syncRating()}); this.$el.on("click.starrr", "span", function(e){return o.setRating(o.$el.find("span").index(e.currentTarget) + 1)}); this.$el.on("starrr:change", this.options.change)}t.prototype.defaults = {rating:void 0, numStars:5, change:function(e, t){}}; t.prototype.createStars = function(){var e, t, n; n = []; for (e = 1, t = this.options.numStars; 1 <= t?e <= t:e >= t; 1 <= t?e++:e--){n.push(this.$el.append("<span class='glyphicon .glyphicon-star-empty'></span>"))}return n}; t.prototype.setRating = function(e){if (this.options.rating === e){e = void 0}this.options.rating = e; this.syncRating(); return this.$el.trigger("starrr:change", e)}; t.prototype.syncRating = function(e){var t, n, r, i; e || (e = this.options.rating); if (e){for (t = n = 0, i = e - 1; 0 <= i?n <= i:n >= i; t = 0 <= i?++n:--n){this.$el.find("span").eq(t).removeClass("glyphicon-star-empty").addClass("glyphicon-star")}}if (e && e < 5){for (t = r = e; e <= 4?r <= 4:r >= 4; t = e <= 4?++r:--r){this.$el.find("span").eq(t).removeClass("glyphicon-star").addClass("glyphicon-star-empty")}}if (!e){return this.$el.find("span").removeClass("glyphicon-star").addClass("glyphicon-star-empty")}}; return t}(); return e.fn.extend({starrr:function(){var t, r; r = arguments[0], t = 2 <= arguments.length?__slice.call(arguments, 1):[]; return this.each(function(){var i; i = e(this).data("star-rating"); if (!i){e(this).data("star-rating", i = new n(e(this), r))}if (typeof r === "string"){return i[r].apply(i, t)}})}})})(window.jQuery, window); $(function(){return $(".starrr").starrr()})

                                                    $(function(){

                                                    $('#new-review').autosize({append: "\n"});
                                                    var reviewBox = $('#post-review-box');
                                                    var newReview = $('#new-review');
                                                    var openReviewBtn = $('#open-review-box');
                                                    var closeReviewBtn = $('#close-review-box');
                                                    var ratingsField = $('#ratings-hidden<%=venda.getId()%>');
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
                                                    $('.starrr1').on('starrr:change', function(e, value){
                                                    ratingsField.val(value);
                                                    });
                                                    $('.starrr').on('starrr:change', function(e, value){
                                                    ratingsField.val(value);
                                                    });
                                                    });
                                        </script>
                                        <td><% if (venda.getNota() == 0) {%>Pendente<%} else {%><span class="stars starrr" data-rating="<%=venda.getNota()%>"></span>(<%=venda.getNota()%>)<%}%></td>
                                        <%}
                                                }%>
                                        </tr>
                                    </table>
                                    <%
                                        Relatorio relatorioTotalVenda = (Relatorio) request.getAttribute("resultado1");
                                        if (relatorioTotalVenda != null) {%>
                                    <hr>
                                    <p align="left">Quantidade total de itens vendidos: <%=relatorioTotalVenda.getQtdVenda()%></p>
                                    <p align="right">Valor total das vendas: <%=relatorioTotalVenda.getTotalVenda()%></p>

                                    <%}%>                                                                                
                                </div>
                            </div>
                        </div>   

                        <div class="row margin-b-30"></div>     
                        <a href="relatorioGeral.jsp" class="btn btn-primary btn-lg">VOLTAR</a>
                        <p class="copyright">Copyright © 2017 Vende Mais</p>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>