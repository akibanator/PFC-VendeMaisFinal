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
                                                                        <%} else if ((anuncio.getCategoria().getId() != 1) && (anuncio.getCategoria().getId() != 2)) {%>  
                                                                        <tr><td colspan="4"><h4 class="gallery_title"><hr><b>INFORMAÇÕES DE ENVIO</h4></td></tr>
                                                                        <tr>
                                                                            <td><label for="envio">Forma de envio: </label></td>           
                                                                            <td colspan="3"><%=anuncio.getFormaEnvio()%></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><label for="envio">Prazo de entrega estimado (em dias): </label></td>           
                                                                            <td colspan="3"><%if (anuncio.getPrazo_entrega()!=0){%><%=anuncio.getPrazo_entrega()%> dias.<%}else{%>Não informado. Após a compra, o anunciante entrará em contato para estimar prazo.<%}%></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><label for="frete">Valor do Frete: </label></td>
                                                                            <td colspan="3"><%=anuncio.getValorFrete()%></td>
                                                                        </tr>
                                                                        <%}%>
                                                                        <tr><td colspan="4"><h4 class="gallery_title"><hr><b>FORMA DE PAGAMENTO</h4></td></tr>  
                                                                        <tr>
                                                                            <td></td>
                                                                            <td colspan="3"><%=anuncio.getFormapag()%></td> 
                                                                        </tr>                                                                        
                                                                        <tr><td colspan="4"><h4 class="gallery_title"><hr><b>FOTOS DO PRODUTO</h4></td></tr>
                                                                        <tr>
                                                                            <td colspan="5">
                                                                                <img id="img0" width="100" height="100" src="BancoImagens/<%=anuncio.getPic1()%>"/>
                                                                                <img id="img1" width="100" height="100" src="BancoImagens/<%=anuncio.getPic2()%>"/>   
                                                                                <img id="img2" width="100" height="100" src="BancoImagens/<%=anuncio.getPic3()%>"/>
                                                                                <img id="img3" width="100" height="100" src="BancoImagens/<%=anuncio.getPic4()%>"/> 
                                                                                <img id="img4" width="100" height="100" src="BancoImagens/<%=anuncio.getPic5()%>"/>
                                                                            </td>
                                                                        </tr>                                  
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
                                                                    <h4 class="modal-title"><%if (anuncio.getPermite_alterar().equals("Sim")){%>Detalhes do Produto<%}else if (anuncio.getPermite_alterar().equals("Não")){%>Mensagem<%}%></h4>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <%if (anuncio.getPermite_alterar().equals("Sim")){%>
                                                                    <form role="form" action="alterarAnuncio" method="POST" enctype="multipart/form-data">
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
                                                                                <td style="width: 25%;"><input type="radio" name="estadoprod" value="usado"id=estado required <%if (anuncio.getEstadoprod().equals("usado")) {%>checked<%} else {
                                                                                    }%>>USADO </td>
                                                                                <td style="width: 25%;"><input type="radio" name="estadoprod" value="novo" id=estado required <%if (anuncio.getEstadoprod().equals("novo")) {%>checked<%} else {
                                                                                    }%>> NOVO</td>
                                                                                <td style="width: 25%;"><input type="radio" name="estadoprod" value="seminovo" id=estado required <%if (anuncio.getEstadoprod().equals("seminovo")) {%>checked<%} else {
                                                                                    }%>> SEMINOVO</td>
                                                                            </tr>
                                                                            <tr>                                                
                                                                                <td><label for="categoria">Categoria: *</label></td>
                                                                                <td><input type="text" readonly style="border:0;" name="cat" id=cat value="<%=anuncio.getCategoria().getNome()%>" /></td>
                                                                                <td><label for="subcategoria">Subcategoria: *</label></td>
                                                                                <td><input type="text" readonly style="border:0;" name="cat" id=sub value="<%=anuncio.getSubcategoria().getNome()%>" /></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td><label for="preco">Preço: * </label></td>
                                                                                <td><input type="number" class="form-control"  max="99999999999" step="1" min="1" style="width: 100%;" size=7 name="preco" id=preco value="<%=anuncio.getPreco()%>"></td>
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
                                                                                <td><input type="text" maxlength="9" value="<%=anuncio.getCep()%>" style="width: 100%;" name="cep" onblur="pesquisacep(this.value);" id="cep" required></td>
                                                                                <td><label class="control-label" for="bairro">Bairro:* </label></td>
                                                                                <td><input type="text" maxlength="50" value="<%=anuncio.getBairro()%>" style="width: 100%;" name="bairro" id=bairro required></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td><label class="control-label" for="cidade">Cidade:* </label></td>
                                                                                <td><input type="text" name="cidade" value="<%=anuncio.getCidade()%>" style="width: 100%;" maxlength="50" id="cidade" required></td>
                                                                                <td><label class="control-label" for="uf">Estado:*  </label></td>
                                                                                <td><input type="text" name="uf" value="<%=anuncio.getEstado()%>" style="width: 100%;" maxlength="50" id="uf" uf required /></td>                                            
                                                                            </tr>
                                                                            <tr>
                                                                                <td><label for="rua">Rua:* </label></td>
                                                                                <td><input type="text" maxlength="100" value="<%=anuncio.getRua()%>" style="width: 100%;" name="rua" id=rua required></td>
                                                                                <td><label for="estacionamento">Possui vaga para Estacionamento:* </label></td>
                                                                                <td><input type="text" maxlength="100" value="<%=anuncio.getVaga()%>" style="width: 100%;" name="vaga" id=vaga required>
                                                                            </tr>
                                                                            <%} else if ((anuncio.getCategoria().getId() != 1) && (anuncio.getCategoria().getId() != 2)) {%>    
                                                                            <tr><td colspan="4"><h4 class="gallery_title"><hr><b>INFORMAÇÕES DE ENVIO</h4></td></tr>
                                                                            <tr>
                                                                                <td><label for="envio">Forma de envio: *  </label></td>           
                                                                                <td colspan="3"><input type="radio" name="envio" value="O vendedor se responsabiliza por enviar o produto"id=envio required <%if (anuncio.getFormaEnvio().equals("O vendedor se responsabiliza por enviar o produto")) {%>checked<%} else {
                                                                                    }%>>O vendedor se responsabiliza por enviar o produto</td>
                                                                            </tr>                                            
                                                                            <tr>
                                                                                <td></td>
                                                                                <td colspan="3"><input type="radio" name="envio" value="O comprador se responsabiliza por buscar o produto" id=envio required <%if (anuncio.getFormaEnvio().equals("O comprador se responsabiliza por buscar o produto")) {%>checked<%} else {
                                                                                    }%>> O comprador se responsabiliza por buscar o produto</td> 
                                                                            </tr>
                                                                            <tr>
                                                                                <td></td>
                                                                                <td colspan="3"><input type="radio" name="envio" value="A combinar" id=envio required <%if (anuncio.getFormaEnvio().equals("A combinar")) {%>checked<%} else {
                                                                                    }%>> A combinar <br>(Nesta opção, o vendedor e comprador devem entrar em contato para combinar entrega/recebimento do produto.) 
                                                                                </td>
                                                                            </tr>
                                                                            <tr><td></td><td colspan="3"><hr></td></tr>
                                                                            <tr>
                                                                                <td><b>Prazo de entrega estimado: (em dias)</b></td>
                                                                                <td colspan="3"><input type="number" class="form-control" size="3" max="999" style="width: 20%;" step="1" onkeypress="return event.charCode >= 48" min="0" style="width: 100%;" name="prazoentrega" id=prazoentrega value="<%=anuncio.getPrazo_entrega()%>" />(Preencher este campo se o envio for de responsabilidade do vendedor.)</td> 
                                                                            </tr>
                                                                            <tr><td></td><td colspan="3"><hr></td></tr>
                                                                            <tr>
                                                                                <td><label for="frete">Valor do Frete:* </label></td>
                                                                                <td colspan="3"><input type="number" max="10000000" class="form-control" step="1" min="0" size=7 style="width: 30%;" name="frete" class="form-control" id=frete value="<%=anuncio.getValorFrete()%>" required> (Deixar com 0 se não houver valor do frete)</td>
                                                                            </tr>
                                                                            <%}%> 
                                                                            <tr><td colspan="4"><h4 class="gallery_title"><hr><b>FORMA DE PAGAMENTO</h4></td></tr>  
                                                                                        <%if ((anuncio.getCategoria().getId() != 1) && (anuncio.getCategoria().getId() != 2)) {%>
                                                                            <tr>
                                                                                <td></td>           
                                                                                <td colspan="3"><input type="radio" name="formapag" value="cartão de crédito" id=formapag required <%if (anuncio.getFormapag().equals("cartão de crédito")) {%>checked<%} else {
                                                                                    }%>> cartão de crédito</td>
                                                                            </tr>                                            
                                                                            <tr>
                                                                                <td></td>
                                                                                <td colspan="3"><input type="radio" name="formapag" value="cartão de débito" id=formapag required <%if (anuncio.getFormapag().equals("cartão de débito")) {%>checked<%} else {
                                                                                    }%>> cartão de débito</td> 
                                                                            </tr>                                                                       
                                                                            <tr>
                                                                                <td></td>
                                                                                <td colspan="3"><input type="radio" name="formapag" value="negociar direto com comprador" id=formapag required <%if (anuncio.getFormapag().equals("negociar direto com comprador")) {%>checked<%} else {
                                                                                    }%>> negociar direto com comprador <br>(A VendeMais não trata a negociação, a negociaçao é feita diretamente com interessado)</td> 
                                                                            </tr>
                                                                            <%} else {%>
                                                                            <tr>
                                                                                <td></td>
                                                                                <td colspan="3"><input type="radio" name="formapag" value="negociar direto com comprador" id=formapag required <%if (anuncio.getFormapag().equals("negociar direto com comprador")) {%>checked<%} else {
                                                                                    }%>> negociar direto com comprador <br>(A VendeMais não trata a negociação, a negociaçao é feita diretamente com interessado)</td> 
                                                                            </tr>
                                                                            <%}%>
                                                                            <tr><td colspan="4"><h4 class="gallery_title"><hr><b>FOTOS DO PRODUTO</h4></td></tr>
                                                                            <tr>
                                                                                <td><img id="img0" width="100" height="100" src="BancoImagens/<%=anuncio.getPic1()%>"/></td> 
                                                                                <td colspan="3">Foto Principal:<input type="file" id="pic1" name="pic1" onchange="document.getElementById('img0').src = window.URL.createObjectURL(this.files[0])"><input type="checkbox" name="remover1" value="sem-foto.jpg">Remover esta imagem?</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td><img id="img1" width="100" height="100" src="BancoImagens/<%=anuncio.getPic2()%>"/></td>   
                                                                                <td colspan="3">2º Foto:<input type="file" id="pic2" name="pic2" onchange="document.getElementById('img1').src = window.URL.createObjectURL(this.files[0])"><input type="checkbox" name="remover2" value="sem-foto.jpg">Remover esta imagem?</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td><img id="img2" width="100" height="100" src="BancoImagens/<%=anuncio.getPic3()%>"/></td>   
                                                                                <td colspan="3">3º Foto:<input type="file" id="pic3" name="pic3" onchange="document.getElementById('img2').src = window.URL.createObjectURL(this.files[0])"><input type="checkbox" name="remover3" value="sem-foto.jpg">Remover esta imagem?</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td><img id="img3" width="100" height="100" src="BancoImagens/<%=anuncio.getPic4()%>"/></td>   
                                                                                <td colspan="3">4º Foto:<input type="file" id="pic4" name="pic4" onchange="document.getElementById('img3').src = window.URL.createObjectURL(this.files[0])"><input type="checkbox" name="remover4" value="sem-foto.jpg">Remover esta imagem?</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td><img id="img4" width="100" height="100" src="BancoImagens/<%=anuncio.getPic5()%>"/></td>   
                                                                                <td colspan="3">5º Foto:<input type="file" id="pic5" name="pic5" onchange="document.getElementById('img4').src = window.URL.createObjectURL(this.files[0])"><input type="checkbox" name="remover5" value="sem-foto.jpg">Remover esta imagem?</td>
                                                                            </tr>
                                                                        </table>
                                                                        <br>
                                                                        <input hidden type="text" name="pic01" maxlength="50" value="<%=anuncio.getPic1()%>">
                                                                        <input hidden type="text" name="pic02" maxlength="50" value="<%=anuncio.getPic2()%>">
                                                                        <input hidden type="text" name="pic03" maxlength="50" value="<%=anuncio.getPic3()%>">
                                                                        <input hidden type="text" name="pic04" maxlength="50" value="<%=anuncio.getPic4()%>">
                                                                        <input hidden type="text" name="pic05" maxlength="50" value="<%=anuncio.getPic5()%>">
                                                                        <input hidden type="text" name="idAnuncio" maxlength="50" value="<%=anuncio.getId()%>">
                                                                        <input type="submit" id="confirmsignup" class="btn btn-success" value="SALVAR">
                                                                    </form>
                                                                    <p align="center">
                                                                        <a href="index.jsp">CANCELAR</a>
                                                                    </p>
                                                                    <%}else if (anuncio.getPermite_alterar().equals("Não")){%>
                                                                    Prezado anunciante, este anúncio não pode ser editado, pois já foi gerada ao menos uma venda.
                                                                    <%}%>
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
                                                                    <p align="center">Se sim, por gentileza informar o motivo:</p>
                                                                    <p><input type="radio" name="motivo" value="O produto foi vendido diretamente com o interessado" id=motivo required> O produto foi vendido diretamente com o interessado</p>
                                                                    <p><input type="radio" name="motivo" value="Decidi não vender este produto" id=motivo required> Decidi não vender este produto</p>
                                                                    <p><input type="radio" name="motivo" value="Não possuo mais este produto" id=motivo required> Não possuo mais este produto</p>
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