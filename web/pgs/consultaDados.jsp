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
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="shortcut icon" href="images/i.ico" >
        <SCRIPT src="js/jquery-1.5.2.min.js"></SCRIPT>
        <SCRIPT src="js/jquery.maskedinput-1.3.min.js"></SCRIPT>
        <script>

            function limpa_formulário_cep() {
                //Limpa valores do formulário de cep.
                document.getElementById('rua').value = ("");
                document.getElementById('bairro').value = ("");
                document.getElementById('cidade').value = ("");
                document.getElementById('uf').value = ("");
            }

            function meu_callback(conteudo) {
                if (!("erro" in conteudo)) {
                    //Atualiza os campos com os valores.
                    document.getElementById('rua').value = (conteudo.logradouro);
                    document.getElementById('bairro').value = (conteudo.bairro);
                    document.getElementById('cidade').value = (conteudo.localidade);
                    document.getElementById('uf').value = (conteudo.uf);
                } //end if.
                else {
                    //CEP não Encontrado.
                    limpa_formulário_cep();
                    alert("CEP não encontrado.");
                }
            }

            function pesquisacep(valor) {

                //Nova variável "cep" somente com dígitos.
                var cep = valor.replace(/\D/g, '');

                //Verifica se campo cep possui valor informado.
                if (cep != "") {

                    //Expressão regular para validar o CEP.
                    var validacep = /^[0-9]{8}$/;

                    //Valida o formato do CEP.
                    if (validacep.test(cep)) {

                        //Preenche os campos com "..." enquanto consulta webservice.
                        document.getElementById('rua').value = "...";
                        document.getElementById('bairro').value = "...";
                        document.getElementById('cidade').value = "...";
                        document.getElementById('uf').value = "...";

                        //Cria um elemento javascript.
                        var script = document.createElement('script');

                        //Sincroniza com o callback.
                        script.src = '//viacep.com.br/ws/' + cep + '/json/?callback=meu_callback';

                        //Insere script no documento e carrega o conteúdo.
                        document.body.appendChild(script);

                    } //end if.
                    else {
                        //cep é inválido.
                        limpa_formulário_cep();
                        alert("Formato de CEP inválido.");
                    }
                } //end if.
                else {
                    //cep sem valor, limpa formulário.
                    limpa_formulário_cep();
                }
            }
            ;

        </script>
        <title>VendeMais</title>
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
                                        
                                        <a><span class="main-menu-link-text"><font color="#FFFFFF" size="3"><b><script src="js/saudacao.js"></script><br>
                                                    <%  Usuario us = (Usuario) request.getSession().getAttribute("usuario");
                                                            if (us != null) {%>
                                                                <%=us.getNome()%>
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
                                        <a href="anuncieconosco.jsp" class="block-keep-ratio__content  main-menu-link"> <span class="main-menu-link-text"></span>
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
                                                                    <input type="password" class="form-control" name="senha" maxlength="8" minlength="6" id=senha><br>
                                                                </div>

                                                                <!-- Button -->
                                                                <div class="control-group" align="center">
                                                                    <br>
                                                                    <table align='center'>
                                                                        <tr>
                                                                            <td>
                                                                                <input type="submit" class="btn btn-success" value="SALVAR">
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
                                            List<Endereco> todosEnderecos = usuario.getEndereco();
                                            if (todosEnderecos != null) {
                                                for (Endereco endereco : usuario.getEndereco()) {
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
                                                                    <input type="text" class="form-control" maxlength="9" name="cep1" value="<%=endereco.getCep()%>" id=cep1 required>
                                                                </div>

                                                                <div class="control-group">
                                                                    <label class="control-label" for="numero">Numero: </label>                                                                            
                                                                    <input type="text" class="form-control" maxlength="4" name="numero1" value="<%=endereco.getNumero()%>" id=numero1 required>
                                                                </div>

                                                                <div class="control-group">
                                                                    <label class="control-label" for="rua">Rua: </label>
                                                                    <input type="text" class="form-control" maxlength="100" name="rua1" value="<%=endereco.getRua()%>" id=rua1 required>                                                                         
                                                                </div>
                                                                <div class="control-group">
                                                                    <label class="control-label" for="cidade">Cidade: </label>                                                                            
                                                                    <input type="text" class="form-control" maxlength="50" name="cidade1" value="<%=endereco.getCidade()%>" id=cidade1 required>
                                                                </div>
                                                                <div class="control-group">
                                                                    <label class="control-label" for="uf">Estado:  </label>
                                                                    <select type="text" name="uf1" class="form-control" id="uf1" uf required />
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
                                                                    <input type="text" class="form-control" maxlength="50" name="complemento1" value="<%=endereco.getComplemento()%>" id=complemento1>                                                                         
                                                                </div>
                                                                <div class="control-group">
                                                                    <label class="control-label" for="bairro">Bairro: </label>                                                                            
                                                                    <input type="text" class="form-control" name="bairro1" value="<%=endereco.getBairro()%>" id=bairro1 required>  
                                                                    <input hidden type="text" name="idEndereco" maxlength="50" value="<%=endereco.getId()%>">
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
                                                        <form role="form" action="cadastrarEndereco" method="post">
                                                            <div class="control-group">
                                                                <label class="control-label" for="cep">CEP: </label>
                                                                <input type="text" class="form-control" maxlength="9" name="cep" onblur="pesquisacep(this.value);" id="cep" required>
                                                            </div>
                                                            <div class="control-group">
                                                                <label class="control-label" for="numero">Numero: </label>                                                                            
                                                                <input type="text" class="form-control" maxlength="4" name="numero" id=numero required>
                                                            </div>
                                                            <div class="control-group">
                                                                <label class="control-label" for="rua">Rua: </label>
                                                                <input type="text" class="form-control" maxlength="100" name="rua" id=rua required>                                                                         
                                                            </div>
                                                            <div class="control-group">
                                                                <label class="control-label" for="cidade">Cidade: </label>                                                                            
                                                                <input type="text" class="form-control" name="cidade" maxlength="50" id="cidade" required>
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
                                                                <input type="text" class="form-control" maxlength="50" name="complemento" id=complemento>                                                                         
                                                            </div>
                                                            <div class="control-group">
                                                                <label class="control-label" for="bairro">Bairro: </label>                                                                            
                                                                <input type="text" class="form-control" maxlength="50" name="bairro" id=bairro required>  
                                                            </div>
                                                            <div class="control-group" align="center">
                                                                <br>
                                                                <table align='center'>
                                                                    <tr>
                                                                        <td>
                                                                            <input type="submit" class="btn btn-success" value="SALVAR">
                                                                        </td>
                                                                        <td>
                                                                            <button type="button" class="btn btn-login" data-dismiss="modal">CANCELAR</button>
                                                                        </td>
                                                                    </tr>
                                                                </table>                                                                            
                                                            </div>
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
        <SCRIPT src="js/validacaoInputs.js"></SCRIPT>
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>