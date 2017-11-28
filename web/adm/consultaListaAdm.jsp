<%@page import="modelo.PerfilAcesso"%>
<%@page import="modelo.Usuario"%>
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
        <script src="js/jquery.maskedinput-1.3.min.js"></script>
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
                                        <a href="<%if (usuario.getPerfil()==PerfilAcesso.adm){%>adm<%}else{%>colaborador<%}%>/Corporativo.jsp" class="main-menu-link about block-keep-ratio__content flexbox-center">
                                            <p align="center"><img src="images/home.png" height="60" width="60"></p>
                                            HOME
                                        </a>                                    
                                    </div>   
                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-right  contact-main">
                                        <a href="adm/gerenciaAdmin.jsp" class="main-menu-link about block-keep-ratio__content flexbox-center">
                                            <p align="center"><img src="images/colaborador.png" height="60" width="60"></p>
                                            COLABORADORES
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
                            </div>
                        </aside>

                        <div class="content-main">
                            <div class="row margin-b-30">
                                <div class="col-xs-12 col-sm-12 col-md-12 biliend">
                                    <div class="row margin-b-30">
                                        <div class="col-xs-12 col-sm-12 col-md-12 biliend">
                                            <div class="banner-2-container">
                                                <div class="aenean">
                                                    <h4>CATEGORIAS</h4>
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
                                        <hr>
                                        <h2 class="intro-text text-center">DESATIVAR ADMINISTRADORES</h2>
                                        <table>
                                            <tr>
                                                <td width="25%"><b>Nome</b></td>
                                                <td width="45%"><b>Usuario</b></td>
                                                <td width="25%"><b>Opções</b></td>
                                            </tr>
                                            <%
                                                List<Usuario> todosUsuarios = (List<Usuario>) request.getAttribute("resultado");
                                                if (todosUsuarios != null) {
                                                    for (Usuario usuarioAdm : todosUsuarios) {
                                            %>
                                            <tr>   
                                                <td width="25%"><%=usuarioAdm.getNome()%></td>
                                                <td width="25%"><%=usuarioAdm.getEmail()%></td>
                                                <td width="25%">                                                    
                                                    <%if (usuarioAdm.getAtivo() == 1) {%>
                                                    <input type="image" src="images/desativar.png" height="32" width="64" data-toggle="modal" data-target="#myModalDeleteUsr<%=usuarioAdm.getId()%>">
                                                    <%} else if (usuarioAdm.getAtivo() == 2) {%>
                                                    <input type="image" src="images/ativar.png" height="32" width="64" data-toggle="modal" data-target="#myModalAtivarUsr<%=usuarioAdm.getId()%>">
                                                    <%}%>                                                      

                                                    <div class="modal fade" id="myModalDeleteUsr<%=usuarioAdm.getId()%>" role="dialog">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                    <h4 class="modal-title">Desativar Administrador</h4>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <form action="desativarConta" method="get">
                                                                        <fieldset>
                                                                            <p align="center">Tem certeza que deseja desativar este administrador?</p>
                                                                            <p align="center">Se você desativar esse administrador ele não terá mais acesso ao site como administrador.</p>
                                                                            <div class="control-group" align="center">
                                                                                <br>
                                                                                <input hidden type="text" name="idUsuario" value="<%=usuarioAdm.getId()%>">
                                                                                <input type="submit" class="btn btn-success" value="DESATIVAR">
                                                                                <button type="button" class="btn btn-login" data-dismiss="modal">CANCELAR</button>                                                                                                                      
                                                                            </div>
                                                                        </fieldset>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>  <!--desativarCategoria-->
                                                </td>
                                            </tr>
                                            <td></td>
                                            <td></td>
                                            <%}
                                                }%>
                                            <td></td>
                                            <td></td>
                                            <hr>
                                        </table>                                  
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 footer">
                            <p class="copyright">Copyright © 2017 Vende Mais</p>
                        </div>
                    </div> <!-- .container -->
                </div> <!-- .main-body -->
            </div>
        </div>
    </body>
</html>