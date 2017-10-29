<%@page import="modelo.Usuario"%>
<%@page import="dao.SubCategoriaDAO"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="modelo.SubCategoria"%>
<%@page import="modelo.Categoria"%>
<%@page import="modelo.Endereco"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,400italic">        
        <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/business-casual.css" rel="stylesheet">
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

    <body class="contact-page">       
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
                            </div>
                        </aside>

                        <div class="content-main contact-content">
                            <div class="contact-content-upper">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="gallery_title">
                                            <h3>Cadastro Anúncio</h3>
                                            <h4>VendeMais</h4>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <%
                                        Categoria categoria = (Categoria) request.getAttribute("resultadoC");
                                        if (usuario != null) {
                                    %>
                                    <form role="form" action="cadastrarAnuncio" method="POST" enctype="multipart/form-data">
                                        <style>
                                            table, th, td {
                                                border-collapse: collapse;
                                                text-align: center;
                                            }

                                            th, td {
                                                padding: 5px;
                                                text-align: left;
                                            }
                                        </style>
                                        <table align="center" style="width: 85%;">
                                            <tr><td colspan="4"><h4 class="gallery_title"><hr><b>INFORMAÇÕES DO PRODUTO</h4></td></tr>                                                                                      
                                            <tr>   
                                                <td><label for="titulo">Titulo: *</label></td>
                                                <td colspan="3"><input type="text" class="form-control" maxlength="100" style="width: 100%;" name="titulo" id=titulo required placeholder="Digite o nome do seu produto"></td>
                                            </tr>
                                            <tr>
                                                <td valign=top><label for="descricao">Descrição: *</label></td>
                                                <td colspan="3"><textarea name="descricao" class="form-control"  style="resize: vertical;width: 100%; height: 150px;" maxlength="1000" cols="40" rows="5" placeholder="Não esqueça de detalhar bem seu produto!" id=descricao required></textarea></td>
                                            </tr>
                                            <tr>
                                                <td><label for="estado" style="width: 25%;">Estado:*</label></td>
                                                <td style="width: 25%;"><input type="radio" name="estadoprod" value="usado"id=estado required> USADO </td>
                                                <td style="width: 25%;"><input type="radio" name="estadoprod" value="novo" id=estado required> NOVO</td>
                                                <td style="width: 25%;"><input type="radio" name="estadoprod" value="seminovo" id=estado required> SEMINOVO</td>
                                            </tr>
                                            <tr>                                                
                                                <td><label for="categoria">Categoria: *</label></td>
                                                <td><input type="text" readonly style="border:0;" name="cat" id=cat value="<%=categoria.getNome()%>" />  
                                                    <input type="text" hidden style="border:0;" name="categoria" id=categoria value="<%=categoria.getId()%>" />


                                                </td>
                                                <td><label for="subcategoria">Subcategoria: *</label></td>
                                                <td><select type="text" style="width: 100%;" class="form-control" name="subcategoria" id=subcategoria required/>
                                            <option value=""></option>
                                            <%
                                                List<SubCategoria> todosSubCategorias = (List<SubCategoria>) request.getAttribute("resultadoS");
                                                if (todosSubCategorias != null) {
                                                    for (SubCategoria Subcategoria : todosSubCategorias) {
                                            %>
                                            <option value="<%=Subcategoria.getId()%>"><%=Subcategoria.getNome()%></option>
                                            <%}
                                                    }else{}%>
                                            </select></td>
                                            </tr>
                                            <tr>
                                                <td><label for="preco">Preço: * </label></td>
                                                <td><input type="number" class="form-control"  max="99999999999" step="1" min="1" style="width: 100%;" size=7 name="preco" id=preco ></td>
                                                <td><label for="quantidade">Quantidade (Máx 1.000): *</label></td>
                                                <td><input type="number" class="form-control" max="1000" step="1" onkeypress="return event.charCode >= 48" min="1" style="width: 100%;" name="quantidade" id=quantidade required /></td>    
                                            </tr>
                                            <tr><td colspan="4"><h4 class="gallery_title"><hr><b>INFORMAÇÕES COMPLEMENTARES</h4></td></tr>
                                            <tr>
                                                <td><label for="altura">Altura: (cm) </label></td>
                                                <td><input type="number" class="form-control" max="999900" step="1" min="1" style="width: 100%;" size=7 name="altura" id=altura></td>
                                                <td><label for="largura">Largura: (cm)</label></td>
                                                <td><input type="number" class="form-control"  max="999900" step="1" min="1" style="width: 100%;" size=7 name="largura" id=largura></td>
                                            </tr>
                                            <%if (categoria.getId()==1){%>
                                            <tr>
                                                <td><label for="peso">Peso: (em Kg) </label></td>
                                                <td><input type="number" class="form-control" max="100000" step="1" min="1" style="width: 100%;" size=7 name="peso" id=peso></td>
                                                <td><label for="cor">Cor:* </label></td>
                                                <td><select type="text" class="form-control" style="width: 100%;" name="cor" id=cor/>
                                            <option value=""></option>                                                
                                            <option value="Branco">Branco</option>
                                            <option value="Prata">Prata</option>
                                            <option value="Preto">Preto</option>
                                            <option value="Cinza">Cinza</option>
                                            <option value="Vermelho">Vermelho</option>
                                            <option value="Azul">Azul</option>
                                            <option value="Marron">Marron</option>
                                            <option value="Verde">Verde</option>
                                            <option value="Amarelo">Amarelo</option>
                                            <option value="Bege">Bege</option>
                                            <option value="Outro">Outro</option>
                                            </select></td>
                                            </tr>                                            
                                            <tr>
                                                <td><label for="ano">Ano:* </label></td>
                                                <td><input type="number" class="form-control" max="9999" step="1" onkeypress="return event.charCode >= 48" min="1" style="width: 100%;" name="ano" id=ano required/></td>
                                                <td><label for="marca">Marca:* </label></td>
                                                <td><input type="text" class="form-control" style="width: 100%;" size=7 name="marca" id=marca required></td>
                                            </tr>
                                            <%}else{%>
                                            <tr>
                                                <td><label for="peso">Peso: (em Kg) </label></td>
                                                <td><input type="number" class="form-control" max="100000" step="1" min="1" style="width: 100%;" size=7 name="peso" id=peso></td>
                                                <td><label for="cor">Cor: </label></td>
                                                <td><select type="text" class="form-control" style="width: 100%;" name="cor" id=cor/>
                                            <option value=""></option>                                                
                                            <option value="Branco">Branco</option>
                                            <option value="Prata">Prata</option>
                                            <option value="Preto">Preto</option>
                                            <option value="Cinza">Cinza</option>
                                            <option value="Vermelho">Vermelho</option>
                                            <option value="Azul">Azul</option>
                                            <option value="Marron">Marron</option>
                                            <option value="Verde">Verde</option>
                                            <option value="Amarelo">Amarelo</option>
                                            <option value="Bege">Bege</option>
                                            <option value="Outro">Outro</option>
                                            </select></td>
                                            </tr>                                            
                                            <%}%>
                                            <tr>
                                                <td><label for="descricao">Observações: </label></td>
                                                <td colspan="3"><textarea name="observações" class="form-control" style="resize: vertical;width: 100%; height: 150px;" maxlength="1000" cols="40" rows="5" id=observações></textarea></td>
                                            </tr>
                                            <% if (categoria.getId()==2){%>             
                                            <tr>
                                                <td><label for="area">Área Útil(m²):* </label></td>
                                                <td><input type="number" max="1000000" class="form-control" step="1" min="1" style="width: 100%;" size=7 name="area" id=area required></td>
                                                <td><label for="atotal">Área Total(m²):* </label></td>
                                                <td><input type="number" max="10000000" class="form-control" step="1" min="1" style="width: 100%;" size=7 name="atotal" id=atotal required></td>
                                            </tr>
                                            <tr><td colspan="4"><h4 class="gallery_title"><hr><b>LOCALIZAÇÃO DO IMÓVEL</h4></td></tr>
                                            <tr>
                                                <td><label class="control-label" for="cep">CEP:* </label></td>
                                                <td><input type="text" maxlength="9" class="form-control" style="width: 100%;" name="cep" onblur="pesquisacep(this.value);" id="cep" required></td>
                                                <td><label class="control-label" for="bairro">Bairro:* </label></td>
                                                <td><input type="text" maxlength="50" class="form-control" style="width: 100%;" name="bairro" id=bairro required></td>
                                            </tr>
                                            <tr>
                                                <td><label class="control-label" for="cidade">Cidade:* </label></td>
                                                <td><input type="text" name="cidade" class="form-control" style="width: 100%;" maxlength="50" id="cidade" required></td>
                                                <td><label class="control-label" for="uf">Estado:*  </label></td>
                                                <td><select type="text" name="uf"  class="form-control" style="width: 100%;" id="uf" uf required />
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
                                            <option value="TO">Tocantins</option> </select></td>                                            
                                            </tr>
                                            <tr>
                                                <td><label class="control-label" for="rua">Rua:* </label></td>
                                                <td><input type="text" maxlength="100" class="form-control" style="width: 100%;" name="rua" id=rua required></td>
                                                <td><label for="estacionamento">Possui vaga para Estacionamento:* </label></td>
                                                <td><select type="text" name="vaga" class="form-control" style="width: 100%;" id="vaga" vaga required />
                                            <option value=""></option>
                                            <option value="Sim">Sim</option>
                                            <option value="Não">Não</option></select>
                                            </tr>
                                            <%}else{%>    
                                            <tr><td colspan="4"><h4 class="gallery_title"><hr><b>INFORMAÇÕES DE ENVIO</h4></td></tr>
                                            <tr>
                                                <td><label for="envio">Forma de envio: *  </label></td>           
                                                <td colspan="3"><input type="radio" name="envio" value="Envio por Correios"id=envio required> Envio por Correios</td>
                                            </tr>                                            
                                            <tr>
                                                <td></td>
                                                <td colspan="3"><input type="radio" name="envio" value="Outro meio de entrega" id=envio required> Outro meio de entrega</td> 
                                            </tr>
                                            <tr><td></td><td colspan="3"><hr></td></tr>
                                            <tr>                                            
                                                <td><label for="endereco">Endereço de Venda:* </label></td>
                                                <%
                                                    List<Endereco> todosEnderecos = (List<Endereco>) request.getAttribute("resultadoE");
                                                    if (todosEnderecos != null) {
                                                        for (Endereco endereco : todosEnderecos) {

                                                %>
                                                <td colspan="3"><input type="radio" name="endereco" value="<%=endereco.getRua()%> <%=endereco.getNumero()%>, CEP <%=endereco.getCep()%>"id=endereco required> <%=endereco.getRua()%> <%=endereco.getNumero()%>, CEP <%=endereco.getCep()%> <a href="consultarConta"> Modificar</a> </td></tr><tr><td></td>                                                   
                                                    <%
                                                            }
                                                        }
                                                    %>
                                                <td></td>
                                            <tr>
                                                <td></td>
                                                <td colspan="3"><a href="consultarConta">(Cadastrar um endereço)</a></td>                                               
                                            </tr>
                                            <tr><td></td><td colspan="3"><hr></td></tr>
                                            <tr>
                                                <td><label for="frete">Valor do Frete:* </label></td>
                                                <td colspan="3"><input type="number" max="10000000" class="form-control" step="1" min="0" size=7 style="width: 30%;" name="frete" class="form-control" id=frete required> (Deixar com 0 se não houver valor do frete)</td>
                                            </tr>
                                            <%}%> 
                                            <tr><td colspan="4"><h4 class="gallery_title"><hr><b>FOTOS DO PRODUTO</h4></td></tr>
                                            <tr>
                                                <td colspan="4">Foto principal:  <input type="file" name="pic1" accept="image/*"></td>                                              
                                            </tr>
                                            <tr>
                                                <td colspan="4">2º Foto: <input type="file" name="pic2" accept="image/*"></td>                                                
                                            </tr>
                                            <tr>
                                                <td colspan="4">3º Foto:  <input type="file" name="pic3" accept="image/*"></td>                                                
                                            </tr>
                                            <tr>
                                                <td colspan="4">4º Foto:<input type="file" name="pic4" accept="image/*"></td>                                                
                                            </tr>
                                            <tr>
                                                <td colspan="5">5º Foto:<input type="file" name="pic5" accept="image/*"></td>                                                
                                            </tr>
                                        </table>
                                        <br>
                                        <p align="center">
                                            <input type="submit" class="btn btn-login" value="Cadastrar"> 
                                            <input type="reset" class="btn btn-login" value="Limpar">
                                        </p>
                                    </form>
                                    <p align="center">
                                        <a href="index.jsp" class="btn btn-login">CANCELAR</a>
                                    </p>
                                    <%}else{}%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <SCRIPT src="js/validacaoInputs.js"></SCRIPT>
                <script src="js/jquery.js"></script>
                <script src="js/bootstrap.min.js"></script>
                <footer class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 footer">
                        <p class="copyright">Copyright© 2017 VendeMais</p>
                    </div>
                </footer>
            </div>
        </div>
    </body>
</html>