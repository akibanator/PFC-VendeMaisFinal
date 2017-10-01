<%@page import="modelo.Usuario"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,400italic">
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="../font-awesome/css/font-awesome.min.css">    
        <link rel="stylesheet" type="text/css" href="../css/style.css">
        <link rel="shortcut icon" href="../images/i.ico">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link href="css/business-casual.css" rel="stylesheet">
        <SCRIPT src="js/jquery-1.5.2.min.js"></SCRIPT>
        <SCRIPT src="js/jquery.maskedinput-1.3.min.js"></SCRIPT>
        <title>VendeMais</title>
    </head>

    <body>
        <script src="../js/jquery-1.11.3.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <div class="main-body">	
            <div class="container">
                <div class="row">               
                    <div class="main-page">
                        <aside class="main-navigation">
                            <div class="main-menu">

                                <div class="menu-container">
                                    <div class="block-keep-ratio block-keep-ratio-2-1 block-width-full homedata">

                                        <a><span class="main-menu-link-text"><font color="#FFFFFF" size="3"><b><script src="../js/saudacao.js"></script><br>
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
                                        <a href="Corporativo.jsp" class="main-menu-link about block-keep-ratio__content flexbox-center">
                                            <p align="center"><img src="../images/home.png" height="60" width="60"></p>
                                            HOME
                                        </a>                                    
                                    </div>   
                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-right  contact-main">
                                        <a href="gerenciaAdmin.jsp" class="main-menu-link about block-keep-ratio__content flexbox-center">
                                            <p align="center"><img src="../images/colaborador.png" height="60" width="60"></p>
                                            COLABORADORES
                                        </a>                                
                                    </div>
                                </div>

                                <div class="menu-container">                                
                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-left  about-main">                                    
                                        <a href="../consultarConta" class="main-menu-link about block-keep-ratio__content flexbox-center">
                                            <i class="fa fa-user fa-4x main-menu-link-icon"></i>
                                            CONTA
                                        </a>                                    
                                    </div>

                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-right  contact-main">
                                        <a href="../logout" class="main-menu-link about block-keep-ratio__content flexbox-center">
                                            <p align="center"><img src="../images/logout.png" height="60" width="60"></p>
                                            LOGOUT
                                        </a>                                
                                    </div>
                                </div> 

                                <div class="menu-container">  
                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-right  contact-main">
                                        <a href="../consultarCategoria" class="main-menu-link about block-keep-ratio__content flexbox-center">
                                            <p align="center"><img src="../images/categoria.png" height="60" width="60"></p>
                                            CATEGORIAS
                                        </a>                                
                                    </div> 

                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-left  about-main">                                    
                                        <a href="#" class="main-menu-link about block-keep-ratio__content flexbox-center">
                                            <p align="center"><img src="../images/report.ico" height="60" width="60"></p>
                                            ALERTAS
                                        </a>                                    
                                    </div>   
                                </div> 
                            </div> <!-- main-menu -->
                        </aside> <!-- main-navigation -->

                        <div class="content-main">
                            <div class="row margin-b-30">
                                <div class="col-xs-12 col-sm-12 col-md-12 biliend">
                                    <div class="banner-2-container">
                                        <div class="aenean">
                                            <h4>corporativo</h4>
                                            <h3>VendeMais</h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row margin-b-30">
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                    <div class="box london">
                                        <div class="box-icon">
                                            <img src="../images/home-img-2.jpg" alt="Image" class="img-responsive">
                                        </div>
                                        <div class="info float-container">
                                            <div class="col-sm-12 london-title">
                                                <h3 class="text-uppercase">CADASTRO DE ADMINISTRADORES</h3>

                                            </div>
                                            <a href="#signup" data-toggle="modal" data-target=".bs-modal-sm"><p align="justify">Clique aqui para cadastrar um administrador</p><hr></a>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal fade bs-modal-sm" id="myModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" style="display: none;">
                                    <div class="modal-dialog modal-sm">
                                        <div class="modal-content">
                                            <br>
                                            <div class="bs-example bs-example-tabs">
                                                <ul id="myTab" class="nav nav-tabs">
                                                    <li class=""><a href="#signup" data-toggle="tab">Registrar Administrador</a></li>
                                                </ul>
                                            </div>
                                            <div class="modal-body">
                                                <div id="myTabContent" class="tab-content">
                                                    <div class="tab-pane fade active in" id="signup">
                                                        <form role="form" action="../cadastrarContaAdm" method="post">     
                                                            <div class="control-group">
                                                                <label class="control-label" for="email">Email:</label>                                                                        
                                                                <input id="email" name="email" class="form-control" type="text" required="">
                                                            </div>
                                                            <div class="control-group">
                                                                <label class="control-label" for="nome">Nome Completo: </label>
                                                                <input id="nome" name="nome" class="form-control" maxlength="100" type="text" required="">
                                                            </div>
                                                            <div class="control-group">
                                                                <label class="control-label" for="cpf">CPF:  </label>
                                                                <input id="cpf" name="cpf" class="form-control" maxlength="14" type="text" required>                                                                         
                                                            </div>
                                                            <div class="control-group">
                                                                <label class="control-label" for="telefone">Telefone: </label>
                                                                <input id="telefone" name="telefone" class="form-control" type="text" required="">
                                                            </div>
                                                            <div class="control-group">
                                                                <label class="control-label" for="senha">Senha: </label>
                                                                <input id="senha" name="senha" class="form-control" maxlength="8" minlength="6" type="password" required="">
                                                                <em>1-8 Characters</em>
                                                            </div>                                                                
                                                            <br>    
                                                            <div class="control-group" align="center">
                                                                <label class="control-label" for="confirmsignup"></label>
                                                                <div class="controls">                                                                            
                                                                    <table align='center'>
                                                                        <tr>
                                                                            <td>
                                                                                <input type="submit"  class="btn btn-success" value="CADASTRAR">
                                                                            </td>
                                                                            <td>
                                                                                <button type="button" class="btn btn-login" data-dismiss="modal">CANCELAR</button>
                                                                            </td>
                                                                        </tr>
                                                                    </table> 
                                                                </div>
                                                            </div>                                                              
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                    <div class="box paris">
                                        <div class="box-icon">
                                            <img src="../images/msg.jpg" alt="Image" class="img-responsive">
                                        </div>
                                        <div class="info float-container">
                                            <div class="col-sm-12 london-title paris-title">
                                                <h3 class="text-uppercase">LISTA DE ADMINISTRADORES</h3>
                                            </div>
                                            <a href="../consultarContasAdm"><p align="justify">Clique aqui para gerenciar os administradores</p><hr></a>
                                        </div>
                                    </div>
                                </div>

                            </div> <!-- row -->
                        </div> <!-- .content-main -->
                    </div> <!-- .main-page -->
                </div> <!-- .row -->    

                <SCRIPT src="js/validacaoInputs.js"></SCRIPT>
                <script src="js/jquery.js"></script>
                <script src="js/bootstrap.min.js"></script>
                <footer class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 footer">
                        <p class="copyright">Copyright © 2016 Company Name</p>
                    </div>    
                </footer>  <!-- .row -->      
            </div> <!-- .container -->
        </div> <!-- .main-body -->
    </body>
</html>