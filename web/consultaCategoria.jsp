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
        <script type="text/javascript" src="//code.jquery.com/jquery-1.10.2.min.js"></script>
        <script type="text/javascript"></script>
        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.maskedinput-1.3.min.js"></script>
        <script src="js/validacaoEndereco.js"></script>
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
                                        <a class="main-menu-link contact block-keep-ratio__content flexbox-center" data-toggle="modal" data-target="#myModalAddCat">
                                            <p align="center"><img src="images/add1.png" height="60" width="60"></p>
                                            NOVA CATEGORIA
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
                                                    <h4>CATEGORIAS</h4>
                                                    <h3>VendeMais</h3>
                                                </div>    
                                            </div>                                
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="modal fade" id="myModalAddCat" role="dialog">
                                <div class="modal-dialog modal-sm">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Adicionar Categoria</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form class="form-horizontal" action="cadastrarCategoria" method="post">
                                                <fieldset>
                                                    <div class="control-group">
                                                        <label class="control-label" for="nomeCat">Nome da Categoria:  </label>
                                                        <input type="text" class="form-control" name="nomeCat" id=nomeCat required><br>
                                                    </div>                                                                
                                                    <!-- Button -->
                                                    <div class="control-group" align="center">
                                                        <br>
                                                        <input type="submit" id="confirmsignup" name="confirmsignup" class="btn btn-success" value="SALVAR">
                                                        <button type="button" class="btn btn-login" data-dismiss="modal">CANCELAR</button>                                                                                                                                                   
                                                    </div>
                                                </fieldset>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>  <!--adicionarCategoria-->
                            
                            <div class="modal fade" id="myModalAddSubCat" role="dialog">
                                <div class="modal-dialog modal-sm">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Adicionar SubCategoria</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form class="form-horizontal" action="cadastrarSubCategoria" method="post">
                                                <fieldset>
                                                    <div class="control-group">
                                                        <label class="control-label" for="nomeSub">Nome da SubCategoria:  </label>
                                                        <input type="text" class="form-control" name="nomeSub" id=nomeSub required><br>
                                                    </div>                                                                
                                                    <!-- Button -->
                                                    <div class="control-group" align="center">
                                                        <br>
                                                        <input type="submit" id="confirmsignup" name="confirmsignup" class="btn btn-success" value="SALVAR">
                                                        <button type="button" class="btn btn-login" data-dismiss="modal">CANCELAR</button>                                                                                                                                                   
                                                    </div>
                                                </fieldset>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>  <!--adicionarSubCategoria-->
                            
                            <div class="modal fade" id="myModalEditCat" role="dialog">
                                <div class="modal-dialog modal-sm">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Editar Categoria</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form class="form-horizontal" action="alterarCategoria" method="post">
                                                <fieldset>
                                                    <div class="control-group">
                                                        <label class="control-label" for="nomeCat">Novo nome:  </label>
                                                        <input type="text" class="form-control" name="nomeCat" id=nomeCat required><br>
                                                    </div>                                                                
                                                    <!-- Button -->
                                                    <div class="control-group" align="center">
                                                        <br>
                                                        <input type="submit" id="confirmsignup" name="confirmsignup" class="btn btn-success" value="SALVAR">
                                                        <button type="button" class="btn btn-login" data-dismiss="modal">CANCELAR</button>                                                                                                                                                   
                                                    </div>
                                                </fieldset>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>  <!--editarCategoria-->   
                            
                            <div class="modal fade" id="myModalDeleteCat" role="dialog">
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Deletar Categoria</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form class="form-horizontal" action="excluirCategoria" method="get">
                                                <fieldset>
                                                    <p align="center">Tem certeza que deseja excluir esta categoria?</p>
                                                    <p align="center">Se você deletar esta categoria, você apagará todas subcategorias contidas nela.</p>
                                                    <input hidden type="text" name="idCategoria" value="1">

                                                    <div class="control-group" align="center">
                                                        <br>
                                                        <input type="submit" id="confirmsignup" name="confirmsignup" class="btn btn-success" value="EXCLUIR">
                                                        <button type="button" class="btn btn-login" data-dismiss="modal">CANCELAR</button>                                                                                                                      
                                                    </div>
                                                </fieldset>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>  <!--deletarCategoria-->
                            
                            <div class="modal fade" id="myModalEditSub" role="dialog">
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
                                                        <input type="text" class="form-control" name="nomeSub" id=nomeSub required><br>
                                                    </div>                                                                
                                                    <!-- Button -->
                                                    <div class="control-group" align="center">
                                                        <br>
                                                        <input type="submit" id="confirmsignup" name="confirmsignup" class="btn btn-success" value="SALVAR">
                                                        <button type="button" class="btn btn-login" data-dismiss="modal">CANCELAR</button>                                                                                                                                                   
                                                    </div>
                                                </fieldset>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>  <!--editarSubcategoria-->
                            
                            <div class="modal fade" id="myModalDeleteSub" role="dialog">
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Deletar SubCategoria</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form class="form-horizontal" action="excluirSubCategoria" method="get">
                                                <fieldset>
                                                    <p align="center">Tem certeza que deseja excluir esta subcategoria?</p>
                                                    <input hidden type="text" name="idSubCategoria" value="1">

                                                    <div class="control-group" align="center">
                                                        <br>
                                                        <input type="submit" id="confirmsignup" name="confirmsignup" class="btn btn-success" value="EXCLUIR">
                                                        <button type="button" class="btn btn-login" data-dismiss="modal">CANCELAR</button>                                                                                                                      
                                                    </div>
                                                </fieldset>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>  <!--deletarsubCategoria-->
                            
                            <div class="content-main contact-content">
                                <div class="contact-content-upper">
                                    <div class="row">
                                        <hr>
                                        <h2 class="intro-text text-center">Categorias e Subcategorias</h2>
                                        <hr>
                                        <table>
                                            <tr>
                                                <td width="25%"><b>CATEGORIA</b></td>
                                                <td width="25%"><b>OPÇÕES</b></td>
                                                <td width="25%"><b>SUBCATEGORIAS</b></td>
                                                <td width="25%"></td>
                                            </tr>
                                        </table>
                                        <hr>
                                        <!--inserir codigo java aqui para repetir categorias-->
                                        <table>
                                            <tr>   
                                                <td width="25%">Categoria.nome</td>
                                                <td width="25%">                                                    
                                                    <input type="image" src="images/edit.png" height="35" width="35" data-toggle="modal" data-target="#myModalEditCat">
                                                    <input type="image" src="images/delete.png" height="35" width="35" data-toggle="modal" data-target="#myModalDeleteCat">
                                                    <input type="image" src="images/add.png" height="35" width="35" data-toggle="modal" data-target="#myModalAddSubCat">
                                                </td>
                                                <!--inserir comando aqui para repetir subcategorias-->
                                                <td width="25%">Mexico</td>
                                                <td width="25%">
                                                    <input type="image" src="images/edit.png" height="32" width="32" data-toggle="modal" data-target="#myModalEditSub">
                                                    <input type="image" src="images/delete.png" height="32" width="32" data-toggle="modal" data-target="#myModalDeleteSub">
                                                </td>
                                            </tr>
                                                <td></td>
                                                <td></td>
                                                <!--acaba o codigo de subcategoria-->
                                                <td width="25%">Mexico</td> <!--apos inserir o codigo, apagar essa linha-->
                                                <td width="25%">
                                                    <input type="image" src="images/edit.png" height="32" width="32" data-toggle="modal" data-target="#myModalEditSub">
                                                    <input type="image" src="images/delete.png" height="32" width="32" data-toggle="modal" data-target="#myModalDeleteSub">
                                                </td>            <!--apos inserir o codigo, apagar essa linha-->
                                                
                                        </table>
                                        <hr>
                                        <!--acaba o codigo de categoria-->
                                        <table>
                                            <tr>   
                                                <td width="25%">Categoria.nome</td>
                                                <td width="25%">                                                    
                                                    <input type="image" src="images/edit.png" height="35" width="35" data-toggle="modal" data-target="#myModalEditCat">
                                                    <input type="image" src="images/delete.png" height="35" width="35" data-toggle="modal" data-target="#myModalDeleteCat">
                                                    <input type="image" src="images/add.png" height="35" width="35" data-toggle="modal" data-target="#myModalAddSubCat">
                                                </td>
                                                <!--inserir comando aqui para repetir subcategorias-->
                                                <td width="25%">Mexico</td>
                                                <td width="25%">
                                                    <input type="image" src="images/edit.png" height="32" width="32" data-toggle="modal" data-target="#myModalEditSub">
                                                    <input type="image" src="images/delete.png" height="32" width="32" data-toggle="modal" data-target="#myModalDeleteSub">
                                                </td>
                                            </tr>                                            
                                            <!--acaba o codigo de subcategoria-->
                                        </table>
                                        <hr>
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