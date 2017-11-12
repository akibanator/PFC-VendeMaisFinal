<%@page import="modelo.PerfilAcesso"%>
<%@page import="modelo.Usuario"%>
<%@page import="dao.SubCategoriaDAO"%>
<%@page import="modelo.SubCategoria"%>
<%@page import="modelo.Categoria"%>
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
                                                        <%;}else{%>
                                                    Visitante
                                                    <%;}%></b></font> 
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

                                <div class="menu-container">  

                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-right  contact-main">
                                        <a class="main-menu-link about block-keep-ratio__content flexbox-center" data-toggle="modal" data-target="#myModalAddCat">
                                            <p align="center"><img src="images/add1.png" height="60" width="60"></p>
                                            NOVA CATEGORIA
                                        </a>          
                                        <div class="modal fade" id="myModalAddCat" role="dialog">
                                            <div class="modal-dialog modal-sm">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        <h4 class="modal-title">Adicionar Categoria</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form action="cadastrarCategoria" method="post">
                                                            <fieldset>
                                                                <div class="control-group">
                                                                    <label class="control-label" for="nomeCat">Nome da Categoria:  </label>
                                                                    <input type="text" class="form-control" name="nomeCat" id=nomeCat required><br>
                                                                </div>                                                                
                                                                <!-- Button -->
                                                                <div class="control-group" align="center">
                                                                    <br>
                                                                    <input type="submit" class="btn btn-success" value="SALVAR">
                                                                    <button type="button" class="btn btn-login" data-dismiss="modal">CANCELAR</button>                                                                                                                                                   
                                                                </div>
                                                            </fieldset>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>  <!--adicionarSubCategoria-->
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
                                        <h2 class="intro-text text-center">CATEGORIAS E SUBCATEGORIAS CADASTRADAS</h2>
                                        <hr>
                                        <table>
                                            <tr>
                                                <td width="25%"><b>CATEGORIA</b></td>
                                                <td width="25%"><b>OPÇÕES</b></td>
                                                <td width="25%"><b>SUBCATEGORIAS</b></td>
                                                <td width="25%"></td>
                                            </tr>
                                        </table>

                                        <%
                                            List<Categoria> todosCategorias = (List<Categoria>) request.getAttribute("resultado");
                                            if (todosCategorias != null) {
                                                for (Categoria categoria : todosCategorias) {
                                        %>

                                        <table>
                                            <tr>   
                                                <td width="25%"><%=categoria.getNome()%></td>
                                                <td width="25%">                                                    
                                                    <input type="image" src="images/edit.png" height="35" width="35" data-toggle="modal" data-target="#myModalEditCat<%=categoria.getId()%>">
                                                    <div class="modal fade" id="myModalEditCat<%=categoria.getId()%>" role="dialog">
                                                        <div class="modal-dialog modal-sm">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                    <h4 class="modal-title">Editar Categoria</h4>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <form action="alterarCategoria" method="post">
                                                                        <fieldset>
                                                                            <div class="control-group">
                                                                                <label class="control-label" for="nomeCat">Novo nome:  </label>
                                                                                <input type="text" class="form-control" name="nomeCat" id=nomeCat value="<%=categoria.getNome()%>" required><br>
                                                                            </div>                                                                
                                                                            <!-- Button -->
                                                                            <div class="control-group" align="center">
                                                                                <br>
                                                                                <input type="text" hidden name="idCategoria" id=idCategoria value="<%=categoria.getId()%>">
                                                                                <input type="submit" class="btn btn-success" value="SALVAR">
                                                                                <button type="button" class="btn btn-login" data-dismiss="modal">CANCELAR</button>                                                                                                                                                   
                                                                            </div>
                                                                        </fieldset>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>  <!--editarCategoria-->

                                                    <input type="image" src="images/add.png" height="35" width="35" data-toggle="modal" data-target="#myModalAddSubCat<%=categoria.getId()%>">
                                                    <div class="modal fade" id="myModalAddSubCat<%=categoria.getId()%>" role="dialog">
                                                        <div class="modal-dialog modal-sm">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                    <h4 class="modal-title">Adicionar SubCategoria</h4>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <form action="cadastrarSubCategoria" method="post">
                                                                        <fieldset>
                                                                            <div class="control-group">
                                                                                <label class="control-label" for="nomeSub">Nome da SubCategoria:  </label>
                                                                                <input type="text" class="form-control" name="nomeSub" id=nomeSub required><br>
                                                                            </div>                                                                
                                                                            <!-- Button -->
                                                                            <div class="control-group" align="center">
                                                                                <br>
                                                                                <input type="text" hidden id="idCategoria" name="idCategoria" value="<%=categoria.getId()%>">
                                                                                <input type="submit" class="btn btn-success" value="SALVAR">                                                                                
                                                                                <button type="button" class="btn btn-login" data-dismiss="modal">CANCELAR</button>                                                                                                                                                   
                                                                            </div>
                                                                        </fieldset>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>  <!--adicionarSubCategoria-->
                                                    <%if (categoria.getAtivo()==1){%>
                                                    <input type="image" src="images/desativar.png" height="35" width="75" data-toggle="modal" data-target="#myModalDeleteCat<%=categoria.getId()%>">
                                                    <%}else if (categoria.getAtivo()==2){%>
                                                    <input type="image" src="images/ativar.png" height="35" width="75" data-toggle="modal" data-target="#myModalAtivarCat<%=categoria.getId()%>">
                                                    <%}%>                                                    
                                                    <div class="modal fade" id="myModalDeleteCat<%=categoria.getId()%>" role="dialog">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                    <h4 class="modal-title">Desativar Categoria</h4>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <form  action="desativarCategoria" method="get">
                                                                        <fieldset>
                                                                            <p align="center">Tem certeza que deseja desativar esta categoria?</p>
                                                                            <p align="center">Se você desativar esta categoria, todas as subcategorias desta categoria não estarão disponiveis para o vendedor selecionar.</p>
                                                                            <div class="control-group" align="center">
                                                                                <br>
                                                                                <input hidden type="text" name="idCategoria" value="<%=categoria.getId()%>">
                                                                                <input type="submit" class="btn btn-success" value="DESATIVAR">
                                                                                <button type="button" class="btn btn-login" data-dismiss="modal">CANCELAR</button>                                                                                                                      
                                                                            </div>
                                                                        </fieldset>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>  <!--desativarCategoria-->
                                                    <div class="modal fade" id="myModalAtivarCat<%=categoria.getId()%>" role="dialog">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                    <h4 class="modal-title">Ativar Categoria</h4>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <form  action="ativarCategoria" method="get">
                                                                        <fieldset>
                                                                            <p align="center">Deseja ativar a categoria?</p>
                                                                            <p align="center">Se você ativar esta categoria, todas as subcategorias desta categoria estarão disponiveis para o vendedor selecionar.</p>
                                                                            <div class="control-group" align="center">
                                                                                <br>
                                                                                <input hidden type="text" name="idCategoria" value="<%=categoria.getId()%>">
                                                                                <input type="submit" class="btn btn-success" value="ATIVAR">
                                                                                <button type="button" class="btn btn-login" data-dismiss="modal">CANCELAR</button>                                                                                                                      
                                                                            </div>
                                                                        </fieldset>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>  <!--ativarCategoria-->
                                                </td>
                                                <%
                                                    List<SubCategoria> todosSubCategorias = (List<SubCategoria>) categoria.getSubcategoria();
                                                    if (todosCategorias != null) {
                                                        for (SubCategoria sub : todosSubCategorias) {
                                                %>
                                                <td width="25%"><%=sub.getNome()%></td>
                                                <td width="25%">
                                                    <input type="image" src="images/edit.png" height="32" width="32" data-toggle="modal" data-target="#myModalEditSub<%=sub.getId()%>">
                                                    <div class="modal fade" id="myModalEditSub<%=sub.getId()%>" role="dialog">
                                                        <div class="modal-dialog modal-sm">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                    <h4 class="modal-title">Editar Subcategoria</h4>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <form class="form-horizontal" action="alterarSubCategoria" method="post">
                                                                        <fieldset>
                                                                            <div class="control-group">
                                                                                <label class="control-label" for="nomeSub">Novo nome:  </label>
                                                                                <input type="text" class="form-control" name="nomeSub" id=nomeSub value="<%=sub.getNome()%>"><br>
                                                                            </div>                                                                
                                                                            <!-- Button -->
                                                                            <div class="control-group" align="center">
                                                                                <br>
                                                                                <input type="text" hidden name="idSub" id=idSub value="<%=sub.getId()%>">
                                                                                <input type="submit" class="btn btn-success" value="SALVAR">                                                                    
                                                                                <button type="button" class="btn btn-login" data-dismiss="modal">CANCELAR</button>                                                                                                                                                   
                                                                            </div>
                                                                        </fieldset>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>  <!--editarSubcategoria-->
                                                    <%if (sub.getAtivo()==1){%>
                                                    <input type="image" src="images/desativar.png" height="32" width="64" data-toggle="modal" data-target="#myModalDeleteSub<%=sub.getId()%>">
                                                    <%}else if (sub.getAtivo()==2){%>
                                                    <input type="image" src="images/ativar.png" height="32" width="64" data-toggle="modal" data-target="#myModalAtivarSub<%=sub.getId()%>">
                                                    <%}%>                                                      
                                                    <div class="modal fade" id="myModalDeleteSub<%=sub.getId()%>" role="dialog">
                                                        <div class="modal-dialog">

                                                            <!-- Modal content-->
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                    <h4 class="modal-title">Desativar SubCategoria</h4>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <form class="form-horizontal" action="desativarSubCategoria" method="get">
                                                                        <fieldset>
                                                                            <p align="center">Tem certeza que deseja desativar esta subcategoria?</p>
                                                                            <input hidden type="text" name="idSubCategoria" value="<%=sub.getId()%>">

                                                                            <div class="control-group" align="center">
                                                                                <br>
                                                                                <input type="submit" class="btn btn-success" value="DESATIVAR">
                                                                                <button type="button" class="btn btn-login" data-dismiss="modal">CANCELAR</button>                                                                                                                      
                                                                            </div>
                                                                        </fieldset>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>  <!--desativarsubCategoria-->
                                                    <div class="modal fade" id="myModalAtivarSub<%=sub.getId()%>" role="dialog">
                                                        <div class="modal-dialog">

                                                            <!-- Modal content-->
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                    <h4 class="modal-title">Ativar SubCategoria</h4>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <form class="form-horizontal" action="ativarSubCategoria" method="get">
                                                                        <fieldset>
                                                                            <p align="center">Tem certeza que deseja ativar esta subcategoria?</p>
                                                                            <input hidden type="text" name="idSubCategoria" value="<%=sub.getId()%>">

                                                                            <div class="control-group" align="center">
                                                                                <br>
                                                                                <input type="submit" class="btn btn-success" value="ATIVAR">
                                                                                <button type="button" class="btn btn-login" data-dismiss="modal">CANCELAR</button>                                                                                                                      
                                                                            </div>
                                                                        </fieldset>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>  <!--ativarsubCategoria-->
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
                                        <%}
                                            }%> 
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