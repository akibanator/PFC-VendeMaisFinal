<%@page import="modelo.SubCategoria"%>
<%@page import="modelo.Categoria"%>
<%@page import="modelo.Anuncio"%>
<%@page import="modelo.Vendedor"%>
<%@page import="modelo.Comprador"%>
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

                                        <a><span class="main-menu-link-text"><font color="#FFFFFF" size="3"><b><script src="js/saudacao.js"></script><br>
                                                        <%  Usuario u = (Usuario) request.getSession().getAttribute("usuario");
                                                            if (u != null) {%>
                                                        <%=u.getNome()%>
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
                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-left  about-main">
                                        <a href="gerarRelatorio" class="main-menu-link about block-keep-ratio__content flexbox-center">
                                            <p align="center"><img src="images/estatistica.png" height="60" width="60"></p>
                                            ESTATÍSTICA
                                        </a>                                
                                    </div>
                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-right  contact-main">                                    
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
                                                    <h4>Anuncios Ativos</h4>
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
                                                                    <h4 class="modal-title">DETALHES DO PRODUTO</h4>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <table align="center" style="width: 100%;">
                                                                        <tr><td colspan="4"><h4 class="gallery_title"><hr><b>INFORMAÇÕES DO PRODUTO</h4></td></tr>                                                                                      
                                                                        <tr>   
                                                                            <td><label for="titulo">Titulo:</label></td>
                                                                            <td colspan="3"><%=anuncio.getTitulo()%></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td valign=top><label for="descricao">Descrição:</label></td>
                                                                            <td colspan="3"><%=anuncio.getDescricao()%></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><label for="estado" style="width: 25%;">Estado:</label></td>
                                                                            <td colspan="3"><%=anuncio.getEstadoprod()%></td>
                                                                        </tr>
                                                                        <tr>                                                
                                                                            <td><label for="categoria">Categoria:</label></td>
                                                                            <td><%=anuncio.getCategoria().getNome()%></td>
                                                                            <td><label for="subcategoria">Subcategoria:</label></td>
                                                                            <td><%=anuncio.getSubcategoria().getNome()%></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><label for="preco">Preço: </label></td>
                                                                            <td><%=anuncio.getPreco()%></td>
                                                                            <td><label for="quantidade">Quantidade:</label></td>
                                                                            <td><%=anuncio.getQuantidade()%></td>    
                                                                        </tr>
                                                                        <tr><td colspan="4"><h4 class="gallery_title"><hr><b>INFORMAÇÕES COMPLEMENTARES</h4></td></tr>
                                                                        <tr>
                                                                            <td><label for="altura">Altura: (cm) </label></td>
                                                                            <td><%if ("".equals(anuncio.getAltura()) | "0".equals(anuncio.getAltura())) {%>Não informado<%} else {%><%=anuncio.getAltura()%><%}%></td>
                                                                            <td><label for="largura">Largura: (cm)</label></td>
                                                                            <td><%if ("".equals(anuncio.getLargura()) | "0".equals(anuncio.getLargura())) {%>Não informado<%} else {%><%=anuncio.getLargura()%><%}%></td>
                                                                        </tr>                                                                        
                                                                        <tr>
                                                                            <td><label for="peso">Peso: (em Kg) </label></td>
                                                                            <td><%if ("".equals(anuncio.getPeso()) | "0".equals(anuncio.getPeso())) {%>Não informado<%} else {%><%=anuncio.getPeso()%><%}%></td>
                                                                            <%if (anuncio.getCategoria().getId() == 1) {%>
                                                                            <td><label for="cor">Cor: </label></td>
                                                                            <td><%=anuncio.getCor()%></td>
                                                                        </tr>                                            
                                                                        <tr>
                                                                            <td><label for="ano">Ano: </label></td>
                                                                            <td><%=anuncio.getAno()%></td>
                                                                            <td><label for="marca">Marca: </label></td>
                                                                            <td><%=anuncio.getMarca()%></td>
                                                                        </tr>
                                                                        <%} else {%>                                                                        
                                                                        <td><label for="cor">Cor: </label></td>
                                                                        <td><%if ("".equals(anuncio.getCor()) | "0".equals(anuncio.getCor())) {%>Não informado<%} else {%><%=anuncio.getCor()%><%}%></td>
                                                                        </tr>                                            
                                                                        <%}%>
                                                                        <tr>
                                                                            <td><label for="descricao">Observações: </label></td>
                                                                            <td colspan="3"><%if ("".equals(anuncio.getObservacoes()) | "0".equals(anuncio.getObservacoes())) {%>Não informado<%} else {%><%=anuncio.getObservacoes()%><%}%></td>
                                                                        </tr>
                                                                        <% if (anuncio.getCategoria().getId() == 2) {%>             
                                                                        <tr>
                                                                            <td><label for="area">Área Útil(m²): </label></td>
                                                                            <td><%=anuncio.getArea()%></td>
                                                                            <td><label for="atotal">Área Total(m²): </label></td>
                                                                            <td><%=anuncio.getAreatotal()%></td>
                                                                        </tr>
                                                                        <tr><td colspan="4"><h4 class="gallery_title"><hr><b>LOCALIZAÇÃO DO IMÓVEL</h4></td></tr>
                                                                        <tr>
                                                                            <td><label class="control-label" for="cep">CEP: </label></td>
                                                                            <td><%=anuncio.getCep()%></td>
                                                                            <td><label class="control-label" for="bairro">Bairro: </label></td>
                                                                            <td><%=anuncio.getBairro()%></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><label class="control-label" for="cidade">Cidade: </label></td>
                                                                            <td><%=anuncio.getCidade()%></td>
                                                                            <td><label class="control-label" for="uf">Estado:  </label></td>
                                                                            <td><%=anuncio.getEstado()%></td>                                            
                                                                        </tr>
                                                                        <tr>
                                                                            <td><label class="control-label" for="rua">Rua: </label></td>
                                                                            <td><%=anuncio.getRua()%></td>
                                                                            <td><label for="estacionamento">Possui vaga para Estacionamento:</label></td>
                                                                            <td><%=anuncio.getVaga()%></td>
                                                                        </tr>
                                                                        <%} else {%>  
                                                                        <tr><td colspan="4"><h4 class="gallery_title"><hr><b>INFORMAÇÕES DE ENVIO</h4></td></tr>
                                                                        <tr>
                                                                            <td><label for="envio">Forma de envio: </label></td>           
                                                                            <td colspan="3"><%=anuncio.getFormaEnvio()%></td>
                                                                        </tr>
                                                                        <tr>                                            
                                                                            <td><label for="endereco">Endereço de Venda: </label></td>
                                                                            <td colspan="3"><%=anuncio.getEndereco()%></td> 
                                                                        <tr>
                                                                            <td><label for="frete">Valor do Frete: </label></td>
                                                                            <td colspan="3"><%=anuncio.getValorFrete()%></td>
                                                                        </tr>
                                                                        <%}%>                                           
                                                                    </table>                                                                                                                                     
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div> 
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="40%"><b>Quantidade á venda:</b> <%=anuncio.getQuantidade()%></td>
                                                <td><b>Valor do Frete:</b> <%=anuncio.getValorFrete()%></td>
                                                <td width="25%"><b><button type="button" data-toggle="modal" data-target="#myModal<%=anuncio.getId()%>">Editar Produto</button></b>
                                                    <div class="modal fade" id="myModal<%=anuncio.getId()%>" role="dialog">
                                                        <div class="modal1-dialog modal-sm">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                    <h4 class="modal-title">Detalhes do Produto</h4>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <form role="form" action="alterarAnuncio" method="POST">
                                                                        <table align="center" style="width: 100%;">
                                                                            <tr><td colspan="4"><h4 class="gallery_title"><hr><b>INFORMAÇÕES DO PRODUTO</h4></td></tr>                                                                                      
                                                                            <tr>   
                                                                                <td><label for="titulo">Titulo: *</label></td>
                                                                                <td colspan="3"><input type="text" value="<%=anuncio.getTitulo()%>" maxlength="100" style="width: 100%;" name="titulo" id=titulo required placeholder="Digite o nome do seu produto"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td valign=top><label for="descricao">Descrição: *</label></td>
                                                                                <td colspan="3"><textarea name="descricao" style="resize: vertical;width: 100%; height: 150px;" maxlength="1000" cols="40" rows="5" placeholder="Não esqueça de detalhar bem seu produto!" id=descricao required><%=anuncio.getDescricao()%></textarea></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td><label for="estado" style="width: 25%;">Estado:*</label></td>
                                                                                <td style="width: 25%;"><input type="radio" name="estadoprod" value="usado"id=estado required> USADO </td>
                                                                                <td style="width: 25%;"><input type="radio" name="estadoprod" value="novo" id=estado required> NOVO</td>
                                                                                <td style="width: 25%;"><input type="radio" name="estadoprod" value="seminovo" id=estado required> SEMINOVO</td>
                                                                            </tr>
                                                                            <tr>                                                
                                                                                <td><label for="categoria">Categoria: *</label></td>
                                                                                <td><input type="text" readonly style="border:0;" name="cat" id=cat value="<%=anuncio.getCategoria().getNome()%>" /></td>
                                                                                <td><label for="subcategoria">Subcategoria: *</label></td>
                                                                                <td><input type="text" readonly style="border:0;" name="cat" id=sub value="<%=anuncio.getSubcategoria().getNome()%>" /></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td><label for="preco">Preço: * </label></td>
                                                                                <td><input type="number" max="100000" step="1" value="<%=anuncio.getPreco()%>" min="1" style="width: 100%;" size=7 name="preco" id=preco ></td>
                                                                                <td><label for="quantidade">Quantidade: *</label></td>
                                                                                <td><input type="number" max="1000" value="<%=anuncio.getQuantidade()%>" step="1" onkeypress="return event.charCode >= 48" min="1" style="width: 100%;" name="quantidade" id=quantidade required /></td>    
                                                                            </tr>
                                                                            <tr><td colspan="4"><h4 class="gallery_title"><hr><b>INFORMAÇÕES COMPLEMENTARES</h4></td></tr>
                                                                            <tr>
                                                                                <td><label for="altura">Altura: (cm) </label></td>
                                                                                <td><input type="number" max="1000" value="<%=anuncio.getAltura()%>" step="1" min="1" style="width: 100%;" size=7 name="altura" id=altura></td>
                                                                                <td><label for="largura">Largura: (cm)</label></td>
                                                                                <td><input type="number" max="1000" step="1" value="<%=anuncio.getLargura()%>" min="1" style="width: 100%;" size=7 name="largura" id=largura></td>
                                                                            </tr>
                                                                            <%if (anuncio.getCategoria().getId() == 1) {%>
                                                                            <tr>
                                                                                <td><label for="peso">Peso: (em Kg) </label></td>
                                                                                <td><input type="number" max="1000" step="1" value="<%=anuncio.getPeso()%>" min="1" style="width: 100%;" size=7 name="peso" id=peso></td>
                                                                                <td><label for="cor">Cor:* </label></td>
                                                                                <td><select type="text" style="width: 100%;" name="cor" id=cor/>
                                                                            <option value="<%=anuncio.getCor()%>"><%=anuncio.getCor()%></option>                                                
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
                                                                                <td><input type="number" value="<%=anuncio.getAno()%>" max="9999" step="1" onkeypress="return event.charCode >= 48" min="1" style="width: 100%;" name="ano" id=ano required/></td>
                                                                                <td><label for="marca">Marca:* </label></td>
                                                                                <td><input type="text" value="<%=anuncio.getMarca()%>" style="width: 100%;" size=7 name="marca" id=marca required></td>
                                                                            </tr>
                                                                            <%} else {%>
                                                                            <tr>
                                                                                <td><label for="peso">Peso: (em Kg) </label></td>
                                                                                <td><input type="number" value="<%=anuncio.getPeso()%>" max="1000" step="1" min="1" style="width: 100%;" size=7 name="peso" id=peso></td>
                                                                                <td><label for="cor">Cor: </label></td>
                                                                                <td><select type="text" value="<%=anuncio.getCor()%>" style="width: 100%;" name="cor" id=cor/>
                                                                            <option value="<%=anuncio.getCor()%>"><%=anuncio.getCor()%></option>                                                
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
                                                                                <td colspan="3"><textarea name="observações" style="resize: vertical;width: 100%; height: 150px;" maxlength="1000" cols="40" rows="5" id=observações><%=anuncio.getObservacoes()%></textarea></td>
                                                                            </tr>
                                                                            <% if (anuncio.getCategoria().getId() == 2) {%>             
                                                                            <tr>
                                                                                <td><label for="area">Área Útil(m²):* </label></td>
                                                                                <td><input type="number" max="1000000" value="<%=anuncio.getArea()%>" step="1" min="1" style="width: 100%;" size=7 name="area" id=area required></td>
                                                                                <td><label for="atotal">Área Total(m²):* </label></td>
                                                                                <td><input type="number" max="10000000" value="<%=anuncio.getAreatotal()%>" step="1" min="1" style="width: 100%;" size=7 name="atotal" id=atotal required></td>
                                                                            </tr>
                                                                            <tr><td colspan="4"><h4 class="gallery_title"><hr><b>LOCALIZAÇÃO DO IMÓVEL</h4></td></tr>
                                                                            <tr>
                                                                                <td><label class="control-label" for="cep">CEP:* </label></td>
                                                                                <td><input type="text" maxlength="9" readonly style="border:0;" value="<%=anuncio.getCep()%>" style="width: 100%;" name="cep" onblur="pesquisacep(this.value);" id="cep" required></td>
                                                                                <td><label class="control-label" for="bairro">Bairro:* </label></td>
                                                                                <td><input type="text" maxlength="50" readonly style="border:0;" value="<%=anuncio.getBairro()%>" style="width: 100%;" name="bairro" id=bairro required></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td><label class="control-label" for="cidade">Cidade:* </label></td>
                                                                                <td><input type="text" name="cidade" readonly style="border:0;" value="<%=anuncio.getCidade()%>" style="width: 100%;" maxlength="50" id="cidade" required></td>
                                                                                <td><label class="control-label" for="uf">Estado:*  </label></td>
                                                                                <td><input type="text" name="uf" readonly style="border:0;" value="<%=anuncio.getEstado()%>" style="width: 100%;" maxlength="50" id="uf" uf required /></td>                                            
                                                                            </tr>
                                                                            <tr>
                                                                                <td><label for="rua">Rua:* </label></td>
                                                                                <td><input type="text" maxlength="100" readonly style="border:0;"  value="<%=anuncio.getRua()%>" style="width: 100%;" name="rua" id=rua required></td>
                                                                                <td><label for="estacionamento">Possui vaga para Estacionamento:* </label></td>
                                                                                <td><input type="text" maxlength="100" readonly style="border:0;"  value="<%=anuncio.getVaga()%>" style="width: 100%;" name="vaga" id=vaga required>
                                                                            </tr>
                                                                            <%} else {%>    
                                                                            <tr><td colspan="4"><h4 class="gallery_title"><hr><b>INFORMAÇÕES DE ENVIO</h4></td></tr>
                                                                            <tr>
                                                                                <td><label for="envio">Forma de envio: *  </label></td>           
                                                                                <td colspan="3"><input type="radio" value="<%=anuncio.getFormaEnvio()%>" name="envio" value="Envio por Correios"id=envio required> Envio por Correios</td>
                                                                            </tr>                                            
                                                                            <tr>
                                                                                <td></td>
                                                                                <td colspan="3"><input type="radio" name="envio" value="Outro meio de entrega" id=envio required> Outro meio de entrega</td> 
                                                                            </tr>
                                                                            <tr><td></td><td colspan="3"><hr></td></tr>
                                                                            <tr>                                            
                                                                                <td><label for="endereco">Endereço de Venda:* </label></td>
                                                                                <td colspan="3"><input type="text" readonly style="border:0;width: 100%;" name="endereco" id=endereco value="<%=anuncio.getEndereco()%>" /></td>
                                                                            <tr><td></td><td colspan="3"><hr></td></tr>
                                                                            <tr>
                                                                                <td><label for="frete">Valor do Frete:* </label></td>
                                                                                <td colspan="3"><input type="number" max="10000000" step="1" min="1" size=7 style="width: 30%;" name="frete" id=frete required> (Deixar com 0 se não houver valor do frete)</td>
                                                                            </tr>
                                                                            <%}%> 
                                                                            <tr><td colspan="4"><h4 class="gallery_title"><hr><b>FOTOS DO PRODUTO</h4></td></tr>
                                                                            <tr>
                                                                                <td colspan="4">Foto principal:  <input type="file" name="pic" accept="image/*"></td>                                              
                                                                            </tr>
                                                                            <tr>
                                                                                <td colspan="4">2º Foto: <input type="file" name="pic" accept="image/*"></td>                                                
                                                                            </tr>
                                                                            <tr>
                                                                                <td colspan="4">3º Foto:  <input type="file" name="pic" accept="image/*"></td>                                                
                                                                            </tr>
                                                                            <tr>
                                                                                <td colspan="4">4º Foto:<input type="file" name="pic" accept="image/*"></td>                                                
                                                                            </tr>
                                                                        </table>
                                                                        <br>
                                                                        <input hidden type="text" name="idAnuncio" maxlength="50" value="<%=anuncio.getId()%>">
                                                                        <input type="submit" id="confirmsignup" class="btn btn-success" value="SALVAR">
                                                                    </form>
                                                                    <p align="center">
                                                                        <a href="index.jsp">CANCELAR</a>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div> 
                                                </td>
                                            </tr>      

                                            <tr>
                                                <td><b>Situação: </b><%if (anuncio.getAtivo() == 1) {%><% out.print("Disponivel á venda"); %><%} else {%><% out.print("Encerrado"); %><%}%></td>
                                                <td><b>Preço (por un.): </b><%=anuncio.getPreco()%></td>                                            
                                                <td><button type="button" data-toggle="modal" data-target="#myModal1<%=anuncio.getId()%>"><b>Encerrar Anuncio</b></button></td>
                                            <div class="modal fade" id="myModal1<%=anuncio.getId()%>" role="dialog">
                                                <div class="modal-dialog">

                                                    <!-- Modal content-->
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                            <h4 class="modal-title">Encerrar Anuncio</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form action="encerrarAnuncio" method="get">
                                                                <fieldset>
                                                                    <p align="center">Tem certeza que deseja encerrar este anuncio?</p>
                                                                    <input hidden type="text" name="idAnuncio" value="<%=anuncio.getId()%>">
                                                                    <br>
                                                                    <input type="submit" id="confirmsignup" class="btn btn-success" value="ENCERRAR">   
                                                                </fieldset>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div> 
                                            </tr>
                                        </table>                                                                     
                                    </div>
                                </div>
                            </div>
                            <div class="row margin-b-30"></div>
                            <% }
                                } else {
                                }%>  
                            <SCRIPT src="js/validacaoInputs.js"></SCRIPT>
                            <script src="js/jquery.js"></script>
                            <script src="js/bootstrap.min.js"></script>
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