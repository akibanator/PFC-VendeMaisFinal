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
        <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700">
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

    <body class="contact-page">
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
                                </div>

                                <div class="menu-container">  

                                    <div class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-left  about-main">                                    
                                        <a href="historicoVenda" class="main-menu-link about block-keep-ratio__content flexbox-center">
                                            <p align="center"><img src="images/venda.png" height="60" width="60"></p>
                                            VISÃO GERAL
                                        </a>                                    
                                    </div>

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

                                    <form role="form" action="cadastrarAnuncio" method="POST">
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
                                        <hr>
                                        <h2 class="intro-text text-center">Dados do Produto</h2>
                                        <hr>
                                        <table align="center" style="width: 85%;">
                                            <tr>
                                                <td style="width: 5%;"><label for="titulo">Titulo: </label></td>
                                                <td colspan="3"><input type="text" maxlength="100" style="width: 100%;" name="titulo" id=titulo required placeholder="Digite o nome do seu produto"></td>
                                            </tr>
                                            <tr>
                                                <td valign=top><label for="descricao">Descrição: </label></td>
                                                <td colspan="3"><textarea name="descricao" style="resize: vertical;width: 100%; height: 150px;" maxlength="1000" cols="40" rows="5" placeholder="Não esqueça de detalhar bem seu produto!" id=descricao required></textarea></td>
                                            </tr>
                                            <tr>
                                                <td><label for="estado">Estado: </label></td>
                                                <td style="width: 31%;"><input type="radio" name="estado" value="usado"id=estado required> USADO </td>
                                                <td style="width: 31%;"><input type="radio" name="estado" value="novo" id=estado required> NOVO</td>
                                                <td style="width: 31%;"><input type="radio" name="estado" value="novo" id=estado required> SEMINOVO</td>
                                            </tr>
                                            <tr>
                                                <%
                                                    Categoria categoria = (Categoria) request.getAttribute("resultadoC");
                                                    if (usuario != null) {
                                                %>
                                                <td><label for="categoria">Categoria: </label></td>
                                                <td><input type="text" readonly style="border:0;" name="categoria" id=categoria value="<%=categoria.getNome()%>" />                                                
                                                    <%}%>

                                                </td>
                                                <td><label for="subcategoria">Subcategoria: </label></td>
                                                <td><select type="text" style="width: 100%;" name="subcategoria" id=subcategoria required/>
                                            <option value=""></option>
                                            <%
                                                List<SubCategoria> todosSubCategorias = (List<SubCategoria>) request.getAttribute("resultadoS");
                                                if (todosSubCategorias != null) {
                                                    for (SubCategoria Subcategoria : todosSubCategorias) {
                                            %>


                                            <option value="<%=Subcategoria.getNome()%>"><%=Subcategoria.getNome()%></option>
                                            <%}
            }%>
                                            </select>
                                            </td>

                                            </tr>
                                            <tr>
                                                <td><label for="preco">Preço: </label></td>
                                                <td><input type="text" size=7 style="width: 100%;" name="preco" id=preco required></td>
                                                <td><label for="quantidade">Quantidade</label></td>
                                                <td><input type="number" max="1000" step="1" onkeypress="return event.charCode >= 48" min="1" style="width: 100%;" name="quantidade" id=quantidade required /></td>    
                                            </tr>
                                            <tr>
                                                <td><label for="altura">Altura: (cm) </label></td>
                                                <td><input type="number" max="1000" step="1" min="1" style="width: 100%;" size=7 name="altura" id=altura required></td>
                                                <td><label for="largura">Largura: (cm)</label></td>
                                                <td><input type="number" max="1000" step="1" min="1" style="width: 100%;" size=7 name="largura" id=largura required></td>
                                            </tr>
                                            <tr>
                                                <td><label for="peso">Peso: (em Kg) </label></td>
                                                <td><input type="number" max="1000" step="1" min="1" style="width: 100%;" size=7 name="peso" id=peso required></td>
                                            </tr>                                            
                                            <tr>
                                                <td><label for="descricao">Observações: </label></td>
                                                <td colspan="3"><textarea name="observações" style="resize: vertical;width: 100%; height: 150px;" maxlength="1000" cols="40" rows="5" id=observações></textarea></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                        <table align="center" style="width: 85%;">       
                                            <tr><td><hr></td><td><hr></td></tr>
                                            <tr>
                                                <td style="width: 30%;"><label for="envio">Forma de envio:   </label></td>           
                                                <td><input type="radio" name="envio" value="Utiliza os Correios"id=envio required> Por Correio</td>
                                            </tr>
                                            <tr>
                                                <td></td>                                                
                                                <td><input type="radio" name="envio" value="O comprador retira" id=envio required> O comprador retira </td>                                                                                               
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td><input type="radio" name="envio" value="O vendedor envia" id=envio required> Eu envio </td> 
                                            </tr>
                                            <tr><td><hr></td><td><hr></td></tr>
                                            <tr>                                            
                                                <td><label for="endereco">Endereço de Venda:  </label></td>
                                                <%
                                            List<Endereco> todosEnderecos = (List<Endereco>) request.getAttribute("resultadoE");
                                            if (todosEnderecos != null) {
                                                for (Endereco endereco : todosEnderecos) {

                                        %>
                                        <td><input type="radio" name="endereco" value="<%=endereco.getRua()%> <%=endereco.getNumero()%>, CEP <%=endereco.getCep()%>"id=endereco required> <%=endereco.getRua()%> <%=endereco.getNumero()%>, CEP <%=endereco.getCep()%> <a href="consultarConta"> Modificar</a> </td></tr><tr><td></td>                                                   
                                            <%
                                                    }
                                                }
                                            %>
                                                <td></td>
                                            <tr>
                                                <td><a href="consultarConta">(Cadastrar um endereço)</a></td>
                                            </tr>
                                            <tr><td><hr></td><td><hr></td></tr>
                                            <tr>
                                                <td><label for="frete">Valor do Frete: </label></td>
                                                <td><input type="text" size=7 style="width: 30%;" name="frete" id=frete required> (Deixar com 0 se não houver valor do frete)</td>
                                            </tr>
                                        </table>
                                        <hr>
                                        <h2 class="intro-text text-center">Fotos do Produto</h2>
                                        <hr>
                                        <div align="center">
                                            <p >Uma foto pode te ajudar a divulgar o seu produto, no entando não é obrigatório</p>
                                            <input type="file" name="pic" accept="image/*">
                                        </div>                                        
                                        <input hidden type="text" name="ativo" value="1">
                                        <br> 
                                        <p align="center"><input type="submit" class="btn btn-login" value="Cadastrar"> 
                                            <input type="reset" class="btn btn-login" value="Limpar">
                                        </p>
                                    </form>
                                    <p align="center">
                                        <a href="index.jsp">CANCELAR</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <footer class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 footer">
                        <p class="copyright">Copyright Â© 2016 Company Name</p>
                    </div>
                </footer>
            </div>
        </div>
    </body>
</html>