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
        <link rel="shortcut icon" href="images/i.ico" >        
        <title>VendeMais</title>
    </head>
    <body>
        <script type="text/javascript" src="//code.jquery.com/jquery-1.10.2.min.js"></script>
        <script type="text/javascript"></script>
        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.maskedinput-1.3.min.js"></script>
        <script src="js/validacaoEndereco.js"></script>
        <script src="js/validacaoInputs.js"></script>
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
                                        <a href="anuncioAbertoVendedor" class="main-menu-link about block-keep-ratio__content flexbox-center">
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

                        <div class="content-main">
                            <div class="row margin-b-30">
                                <div class="col-xs-12 col-sm-12 col-md-12 biliend">
                                    <div class="row margin-b-30">
                                        <div class="col-xs-12 col-sm-12 col-md-12 biliend">
                                            <div class="banner-2-container">
                                                <div class="aenean">
                                                    <h4>CONTA</h4>
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
                                        <h2 class="intro-text text-center">Dados da Conta</h2>
                                        <hr>

                                        <table align='center'>
                                            <tbody>
                                                <%
                                                    Usuario usuario = (Usuario) request.getAttribute("resultado");
                                                    if (usuario != null) {
                                                %>
                                                <tr>
                                                    <td width=20%><label for="nome">Nome: </label></td>
                                                    <td><%=usuario.getNome()%></td>
                                                </tr>
                                                <tr>
                                                    <td><label for="telefone">Telefone: </label></td>
                                                    <td><%=usuario.getTelefone()%></td>
                                                </tr>
                                                <tr>
                                                    <td><label for="email">E-mail</label></td>
                                                    <td><%=usuario.getEmail()%></td>
                                                </tr>
                                                <tr>
                                                    <td><label for="senha">Senha: </label></td>
                                                    <td>********</td>
                                                </tr>
                                                <tr>
                                                    <td><label for="cpf">CPF:  </label></td>
                                                    <td><%=usuario.getCpf()%></td>
                                                </tr>

                                            </tbody>
                                        </table>
                                        <br>
                                        <p align="center"><button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">Editar</button></p>
                                        <!-- Modal -->
                                        <div class="modal fade" id="myModal" role="dialog">
                                            <div class="modal-dialog modal-sm">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        <h4 class="modal-title">Editar/Alterar Dados</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form class="form-horizontal" action="alterarConta" method="post">
                                                            <fieldset>
                                                                <div class="control-group">
                                                                    <label class="control-label" for="email">Novo e-mail:  </label>
                                                                    <input type="text" class="form-control" name="email" value="<%=usuario.getEmail()%>" id=email required><br>
                                                                </div>

                                                                <div class="control-group">
                                                                    <label class="control-label" for="telefone">Novo telefone:  </label>
                                                                    <input type="text" class="form-control" name="telefone" value="<%=usuario.getTelefone()%>" id=telefone required><br>
                                                                </div> 

                                                                <div class="control-group">
                                                                    <label class="control-label" for="senha">Nova senha:  </label>
                                                                    <input type="password" class="form-control" name="senha" id=senha required><br>
                                                                </div>

                                                                <!-- Button -->
                                                                <div class="control-group" align="center">
                                                                    <br>
                                                                    <table align='center'>
                                                                        <tr>
                                                                            <td>
                                                                                <input type="submit" id="confirmsignup" name="confirmsignup" class="btn btn-success" value="SALVAR">
                                                                            </td>
                                                                            <td>
                                                                                <button type="button" class="btn btn-login" data-dismiss="modal">CANCELAR</button>
                                                                            </td>
                                                                        </tr>
                                                                    </table>                                                                            
                                                                </div>
                                                            </fieldset>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                        
                                        <%
                                            }
                                        %>                                        
                                    </div>
                                </div>
                            </div>

                            <div class="row margin-b-30"></div>

                            <div class="content-main contact-content">
                                <div class="contact-content-upper">
                                    <div class="row">
                                        <hr>
                                        <h2 class="intro-text text-center">Dados de Endereço</h2>
                                        <hr>
                                        <%
                                            List<Endereco> todosEnderecos = (List<Endereco>) request.getAttribute("resultadoE");
                                            if (todosEnderecos != null) {
                                                for (Endereco endereco : todosEnderecos) {
                                        %>
                                        <table width=70% align='center'>
                                            <tbody>
                                                <tr>
                                                    <td width=20%><label for="cep">Cep:</label></td>
                                                    <td width=40%><%=endereco.getCep()%></td>
                                                    <td width=15%><label for="bairro">Bairro:</label></td>
                                                    <td><%=endereco.getBairro()%></td>
                                                </tr>
                                                <tr>
                                                    <td width=10%><label for="rua">Rua:</label></td>
                                                    <td><%=endereco.getRua()%></td>
                                                    <td><label for="numero">Numero:</label></td>
                                                    <td><%=endereco.getNumero()%></td>
                                                </tr>
                                                <tr>
                                                    <td><label for="cidade">Cidade:</label></td>
                                                    <td><%=endereco.getCidade()%></td>
                                                    <td><label for="estado">Estado:</label></td>
                                                    <td><%=endereco.getEstado()%></td>
                                                </tr>
                                                <tr>
                                                    <td><label for="complemento">Complemento:</label></td>
                                                    <td><%=endereco.getComplemento()%></td>
                                                </tr>

                                            </tbody>
                                        </table>
                                        <br>
                                        <table align='center'>
                                            <tr>  
                                                <td><button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal0<%=endereco.getId()%>">Editar</button></td>
                                                <td><button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal1<%=endereco.getId()%>">Excluir</button></td>                                                    
                                            </tr> 
                                        </table>
                                        <div class="modal fade" id="myModal1<%=endereco.getId()%>" role="dialog">
                                            <div class="modal-dialog">

                                                <!-- Modal content-->
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        <h4 class="modal-title">Deletar Endereço</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form action="excluirEndereco" method="get">
                                                            <fieldset>
                                                                <p align="center">Tem certeza que deseja excluir este endereço?</p>
                                                                <input hidden type="text" name="idEndereco" value="<%=endereco.getId()%>">

                                                                <div class="control-group" align="center">
                                                                    <br>
                                                                    <table align='center'>
                                                                        <tr>
                                                                            <td>
                                                                                <input type="submit" id="confirmsignup" class="btn btn-success" value="EXCLUIR">
                                                                            </td>
                                                                            <td>
                                                                                <button type="button" class="btn btn-login" data-dismiss="modal">CANCELAR</button>
                                                                            </td>
                                                                        </tr>
                                                                    </table>                                                                            
                                                                </div>
                                                            </fieldset>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div> 
                                        <!-- Modal -->
                                        <div class="modal fade" id="myModal0<%=endereco.getId()%>" role="dialog">
                                            <div class="modal-dialog">

                                                <!-- Modal content-->
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        <h4 class="modal-title">Editar Endereço</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form class="form-horizontal" action="alterarEndereco" method="post">
                                                            <fieldset>

                                                                <div class="control-group">
                                                                    <label class="control-label" for="cep">CEP: </label>
                                                                    <input type="text" class="form-control" name="cep" value="<%=endereco.getCep()%>" id=cep required>
                                                                </div>

                                                                <div class="control-group">
                                                                    <label class="control-label" for="numero">Numero: </label>                                                                            
                                                                    <input type="text" class="form-control" name="numero" value="<%=endereco.getNumero()%>" id=numero required>
                                                                </div>

                                                                <div class="control-group">
                                                                    <label class="control-label" for="rua">Rua: </label>
                                                                    <input type="text" class="form-control" name="rua" value="<%=endereco.getRua()%>" id=rua required>                                                                         
                                                                </div>
                                                                <div class="control-group">
                                                                    <label class="control-label" for="cidade">Cidade: </label>                                                                            
                                                                    <input type="text" class="form-control" name="cidade" value="<%=endereco.getCidade()%>" id=cidade required>
                                                                </div>
                                                                <div class="control-group">
                                                                    <label class="control-label" for="uf">Estado:  </label>
                                                                    <select type="text" name="uf" class="form-control" id="uf" uf required />
                                                                    <option value="<%=endereco.getEstado()%>"><%=endereco.getEstado()%></option>
                                                                    <option value="AC">Acre</option>
                                                                    <option value="AL">Alagoas</option>
                                                                    <option value="AM">Amazonas</option>
                                                                    <option value="AP">Amapá</option>
                                                                    <option value="BA">Bahia</option>
                                                                    <option value="CE">Ceará</option>
                                                                    <option value="DF">Distrito Federal</option>
                                                                    <option value="ES">Espírito Santo</option>
                                                                    <option value="GO">Goiás</option>
                                                                    <option value="MA">Maranhão</option>
                                                                    <option value="MT">Mato Grosso</option>
                                                                    <option value="MS">Mato Grosso do Sul</option>
                                                                    <option value="MG">Minas Gerais</option>
                                                                    <option value="PA">Pará</option>
                                                                    <option value="PB">Paraíba</option>
                                                                    <option value="PR">Paraná</option>
                                                                    <option value="PE">Pernambuco</option>
                                                                    <option value="PI">Piauí</option>
                                                                    <option value="RJ">Rio de Janeiro</option>
                                                                    <option value="RN">Rio Grande do Norte</option>
                                                                    <option value="RO">Rondônia</option>
                                                                    <option value="RS">Rio Grande do Sul</option>
                                                                    <option value="RR">Roraima</option>
                                                                    <option value="SC">Santa Catarina</option>
                                                                    <option value="SE">Sergipe</option>
                                                                    <option value="SP">São Paulo</option>
                                                                    <option value="TO">Tocantins</option> </select>                                                                            
                                                                </div>
                                                                <div class="control-group">
                                                                    <label class="control-label" for="complemento">Complemento: </label>                                                                           
                                                                    <input type="text" class="form-control" name="complemento" value="<%=endereco.getComplemento()%>" id=complemento>                                                                         
                                                                </div>
                                                                <div class="control-group">
                                                                    <label class="control-label" for="bairro">Bairro: </label>                                                                            
                                                                    <input type="text" class="form-control" name="bairro" value="<%=endereco.getBairro()%>" id=bairro required>  
                                                                    <input hidden type="text" name="idEndereco" value="<%=endereco.getId()%>">
                                                                </div>

                                                                <!-- Button -->
                                                                <div class="control-group" align="center">
                                                                    <br>
                                                                    <table align='center'>
                                                                        <tr>
                                                                            <td>
                                                                                <input type="submit" id="confirmsignup" class="btn btn-success" value="SALVAR">
                                                                            </td>
                                                                            <td>
                                                                                <button type="button" class="btn btn-login" data-dismiss="modal">CANCELAR</button>
                                                                            </td>
                                                                        </tr>
                                                                    </table>                                                                            
                                                                </div>
                                                            </fieldset>
                                                        </form>
                                                    </div>

                                                </div>

                                            </div>
                                        </div>    


                                        <hr>
                                        <%
                                                }
                                            }
                                        %>        

                                        <p align="center"><button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal2">Cadastrar novo endereço</button></p>

                                        <div class="modal fade" id="myModal2" role="dialog">
                                            <div class="modal-dialog">

                                                <!-- Modal content-->
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        <h4 class="modal-title">Cadastrar Endereço</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form class="form-horizontal" action="cadastrarEndereco" method="post">
                                                            <fieldset>
                                                                <div class="control-group">
                                                                    <label class="control-label" for="cep">CEP: </label>
                                                                    <input type="text" class="form-control" name="cep"  onblur="pesquisacep(this.value);"id=cep required >
                                                                </div>

                                                                <div class="control-group">
                                                                    <label class="control-label" for="numero">Numero: </label>                                                                            
                                                                    <input type="text" class="form-control" name="numero" id=numero required>
                                                                </div>

                                                                <div class="control-group">
                                                                    <label class="control-label" for="rua">Rua: </label>
                                                                    <input type="text" class="form-control" name="rua" id=rua required>                                                                         
                                                                </div>
                                                                <div class="control-group">
                                                                    <label class="control-label" for="cidade">Cidade: </label>                                                                            
                                                                    <input type="text" class="form-control" name="cidade" id=cidade required>
                                                                </div>
                                                                <div class="control-group">
                                                                    <label class="control-label" for="uf">Estado:  </label>
                                                                    <select type="text" name="uf" class="form-control" id="uf" uf required />
                                                                    <option value=""></option>
                                                                    <option value="AC">Acre</option>
                                                                    <option value="AL">Alagoas</option>
                                                                    <option value="AM">Amazonas</option>
                                                                    <option value="AP">Amapá</option>
                                                                    <option value="BA">Bahia</option>
                                                                    <option value="CE">Ceará</option>
                                                                    <option value="DF">Distrito Federal</option>
                                                                    <option value="ES">Espírito Santo</option>
                                                                    <option value="GO">Goiás</option>
                                                                    <option value="MA">Maranhão</option>
                                                                    <option value="MT">Mato Grosso</option>
                                                                    <option value="MS">Mato Grosso do Sul</option>
                                                                    <option value="MG">Minas Gerais</option>
                                                                    <option value="PA">Pará</option>
                                                                    <option value="PB">Paraíba</option>
                                                                    <option value="PR">Paraná</option>
                                                                    <option value="PE">Pernambuco</option>
                                                                    <option value="PI">Piauí</option>
                                                                    <option value="RJ">Rio de Janeiro</option>
                                                                    <option value="RN">Rio Grande do Norte</option>
                                                                    <option value="RO">Rondônia</option>
                                                                    <option value="RS">Rio Grande do Sul</option>
                                                                    <option value="RR">Roraima</option>
                                                                    <option value="SC">Santa Catarina</option>
                                                                    <option value="SE">Sergipe</option>
                                                                    <option value="SP">São Paulo</option>
                                                                    <option value="TO">Tocantins</option> </select>                                                                            
                                                                </div>
                                                                <div class="control-group">
                                                                    <label class="control-label" for="complemento">Complemento: </label>                                                                           
                                                                    <input type="text" class="form-control" name="complemento" id=complemento>                                                                         
                                                                </div>
                                                                <div class="control-group">
                                                                    <label class="control-label" for="bairro">Bairro: </label>                                                                            
                                                                    <input type="text" class="form-control" name="bairro" id=bairro required>  
                                                                </div>

                                                                <div class="control-group" align="center">
                                                                    <br>
                                                                    <table align='center'>
                                                                        <tr>
                                                                            <td>
                                                                                <input type="submit" id="confirmsignup" class="btn btn-success" value="SALVAR">
                                                                            </td>
                                                                            <td>
                                                                                <button type="button" class="btn btn-login" data-dismiss="modal">CANCELAR</button>
                                                                            </td>
                                                                        </tr>
                                                                    </table>                                                                            
                                                                </div>
                                                            </fieldset>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div> 
                                    </div>
                                </div>
                            </div>
                            <div class="row margin-b-30"></div>

                            <div class="content-main contact-content">
                                <div class="contact-content-upper">
                                    <div class="row">
                                        <hr>
                                        <h2 class="intro-text text-center">Opções Avançadas</h2>
                                        <hr>
                                        <p align="center"><a href="desativarConta.html">Desejo desativar minha conta</a></p>
                                    </div>
                                </div>
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