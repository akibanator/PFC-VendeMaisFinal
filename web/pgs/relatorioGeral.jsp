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
                                        <a href="historicoVenda" class="main-menu-link about block-keep-ratio__content flexbox-center">
                                            <p align="center"><img src="images/5.png" height="60" width="60"></p>
                                            HISTÓRICO
                                        </a>                                    
                                    </div>
                                </div>

                                <div class="menu-container"> 
                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-left  about-main">
                                        <a href="anuncioAbertoVendedor" class="main-menu-link about block-keep-ratio__content flexbox-center">
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

                                <div class="menu-container">  
                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-left  contact-main">                                    
                                        <a href="selecao" class="main-menu-link about block-keep-ratio__content flexbox-center">
                                            <p align="center"><img src="images/add2.png" height="60" width="60"></p>
                                            NOVO ANUNCIO
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
                                                    <h4>RELATÓRIO GERAL</h4>
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
                                              <%  List<Compra> todasCompras = (List<Compra>) request.getAttribute("resultado1");
                                                    if (todasCompras != null) {%>
                                            <h3>COMPRADOS</h3>
                                            <table>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Data</th>
                                                    <th>Produto</th>
                                                    <th>Unidade</th>
                                                    <th>Vendedor</th>
                                                    <th>Valor</th>
                                                </tr>
                                                <%                                                    
                                                        for (Compra compra : todasCompras) {
                                                %>
                                                <tr>
                                                    
                                                    <td><%=compra.getId()%></td>
                                                    <td><%=compra.getData_compra()%></td>
                                                    <td><%=compra.getAnuncio().getTitulo()%></td>
                                                    <td><%=compra.getQuantidadeComprada()%></td>
                                                    <td><%=compra.getVendedor().getNome()%></td>
                                                    <td><%=compra.getTotal()%></td>
                                                </tr>
                                                <%}}else{%>Você não possui compras<%}%>
                                            </table>
                                            <%
                                                Relatorio relatorioTotalCompra = (Relatorio) request.getAttribute("resultado2");
                                                if (relatorioTotalCompra != null) {%>
                                            <hr>
                                            <p align="left">Quantidade total de itens comprados: <%=relatorioTotalCompra.getQtdCompra()%></p>
                                            <p align="right">Valor total das compras: <%=relatorioTotalCompra.getTotalCompra()%></p>
                                            <%}%>                                                                       
                                    </div>
                                </div>
                            </div>  
                                    
                            <div class="row margin-b-30"></div>  
                            
                            <div class="content-main contact-content">
                                <div class="contact-content-upper">
                                    <div class="row">
                                        <h3>VENDIDOS</h3>
                                        <table>
                                            <tr>
                                                <th>ID</th>
                                                <th>Data</th>
                                                <th>Produto</th>
                                                <th>Unidade</th>
                                                <th>Comprador</th>
                                                <th>Valor</th>
                                            </tr>
                                            <%
                                                    List<Compra> todasVendas = (List<Compra>) request.getAttribute("resultado3");
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
                                            <%}}%>
                                            </tr>
                                        </table>
                                        <%                                                
                                            Relatorio relatorioTotalVenda = (Relatorio) request.getAttribute("resultado4");
                                            if (relatorioTotalVenda != null) {%>
                                        <hr>
                                        <p align="left">Quantidade total de itens vendidos: <%=relatorioTotalVenda.getQtdVenda()%></p>
                                        <p align="right">Valor total das vendas: <%=relatorioTotalVenda.getTotalVenda()%></p>

                                        <%}%>                                                                                
                                    </div>
                                </div>
                            </div>   
                            
                            <div class="row margin-b-30"></div>     
                             <p class="copyright">Copyright © 2017 Vende Mais</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>