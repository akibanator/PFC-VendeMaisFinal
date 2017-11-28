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
                                    <%  List<Compra> todasCompras = (List<Compra>) request.getAttribute("resultado");
                                        if (todasCompras != null) {%>
                                    <h3>COMPRAS</h3>
                                    <form role="form" action="filtrarrelatorio" method="POST">
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
                                                <td style="padding: 3px;" rowspan="2" align="center"><input style="width:150px;font-size: 13px;" hidden type="text" id="id" name="id" value="<%=u.getId()%>"><%} else {}%><input type="submit" class="btn btn-primary btn-lg" value="PESQUISAR"></td>
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
                                                <input style="width:60px;font-size: 13px;" hidden type="text" id="usuario" name="usuario" value="comprador_id" >
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
                                        <%}
                                        } else {%>Você não possui compras<%}%>
                                    </table>
                                    <%
                                        Relatorio relatorioTotalCompra = (Relatorio) request.getAttribute("resultado1");
                                        if (relatorioTotalCompra != null) {%>
                                    <hr>
                                    <p align="left">Quantidade total de itens comprados: <%=relatorioTotalCompra.getQtd()%></p>
                                    <p align="right">Valor total das compras: <%=relatorioTotalCompra.getTotal()%></p>

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