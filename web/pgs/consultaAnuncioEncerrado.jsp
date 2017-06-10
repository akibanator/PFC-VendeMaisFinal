<%@page import="modelo.Anuncio"%>
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
                                                    <h4>Anuncios Encerrados</h4>
                                                    <h3>VendeMais</h3>
                                                </div>    
                                            </div>                                
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <%
                                List<Anuncio> todosAnuncios = (List<Anuncio>) request.getAttribute("resultado");
                                if (todosAnuncios != null) {
                                    for (Anuncio anuncio : todosAnuncios) {                                                                                                            
                            %>
                            <div class="content-main contact-content">
                                <div class="contact-content-upper">
                                    <div class="row">                                        
                                        <table>
                                            <tr>
                                                <td colspan="4"><b>ANUNCIO #<%=anuncio.getId()%> - CADASTRADA EM: <%=anuncio.getData_cadastro()%></b></td>
                                            </tr>
                                            <tr>   
                                                <td width="80%" colspan="2"><b>Titulo: </b>
                                                    <%
                                                        int maxSize = 50;

                                                        String titulo = anuncio.getTitulo();
                                                        out.println(titulo.length() <= maxSize ? titulo : titulo.substring(0, maxSize).concat("..."));
                                                    %>
                                                </td>
                                                <td width="10%"><button type="button" data-toggle="modal" data-target="#myModal2<%=anuncio.getId()%>"><b>Ver Detalhes</b></button></b>
                                                    <div class="modal fade" id="myModal2<%=anuncio.getId()%>" role="dialog">
                                                        <div class="modal1-dialog modal-sm">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                    <h4 class="modal-title">Detalhes do Produto</h4>
                                                                </div>
                                                                <div class="modal-body">
                                                                    
                                                                    <h2 class="intro-text text-center">Dados do Produto</h2>
                                                                    <hr>
                                                                    <table border=1 align="center">
                                                                        <tbody>
                                                                            <tr>
                                                                                <td><label for="titulo">Titulo: </label></td>
                                                                                <td colspan="3"><%=anuncio.getTitulo()%></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td valign=top><label for="descricao">Descrição: </label></td>
                                                                                <td colspan="3" style="text-align: justify;"><%=anuncio.getDescricao()%></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td><label for="estado">Estado: </label></td>
                                                                                <td><%=anuncio.getEstado()%>                               
                                                                                <td><label for="quantidade">Quantidade</label></td>
                                                                                <td><%=anuncio.getQuantidade()%></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td><label for="categoria">Categoria: </label></td>
                                                                                <td><%=anuncio.getCategoria().getNome()%></td>
                                                                                <td><label for="subcategoria">Subcategoria: </label></td>
                                                                                <td><%=anuncio.getSubcategoria().getNome()%></td>                                                    
                                                                            </tr>
                                                                            <tr>
                                                                                <td><label for="preco">Preço: </label></td>
                                                                                <td><%=anuncio.getPreco()%></td>
                                                                                <td><label for="peso">Peso: (em Kg) </label></td>
                                                                                <td><%=anuncio.getPeso()%></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td><label for="altura">Altura: (cm) </label></td>
                                                                                <td><%=anuncio.getAltura()%></td>
                                                                                <td><label for="largura">Largura: (cm)</label></td>
                                                                                <td><%=anuncio.getLargura()%></td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                    <hr>
                                                                    <h2 class="intro-text text-center">Forma de Envio</h2>
                                                                    <hr>
                                                                    <label for="envio">Forma de envio:  </label> <%=anuncio.getFormaEnvio()%><br>
                                                                    <label for="endereco">Endereço de Venda:  </label><%=anuncio.getEndereco()%><br>
                                                                    <label for="frete">Valor do Frete: </label><%=anuncio.getValorFrete()%>                                                                    
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div> 
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="40%"><b>Quantidade á venda:</b> <%=anuncio.getQuantidade()%></td>
                                                <td><b>Valor do Frete:</b> <%=anuncio.getQuantidade()%></td>
                                                <td width="25%"></td>
                                            </tr> 
                                            <tr>
                                                <td><b>Situação: </b><%if (anuncio.getAtivo()==1){%><% out.print("Disponivel á venda"); %><%}else{%><% out.print("Encerrado"); %><%}%></td>
                                                <td><b>Preço (por un.): </b><%=anuncio.getPreco()%></td>                                            
                                                <td></td>                                                    
                                            </tr>
                                        </table>                                                           
                                    </div>
                                </div>
                            </div>
                            <div class="row margin-b-30"></div>
                            <% }} %>                           
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