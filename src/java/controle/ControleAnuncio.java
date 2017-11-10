package controle;

import dao.AnuncioDAO;
import dao.CategoriaDAO;
import dao.EnderecoDAO;
import dao.SubCategoriaDAO;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Anuncio;
import modelo.Categoria;
import modelo.Endereco;
import modelo.SubCategoria;
import modelo.Usuario;
import modelo.Vendedor;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class ControleAnuncio extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.equals(request.getContextPath() + "/cadastrarAnuncio")) {
            try {
                cadastrar(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erroGeral.html").forward(request, response);
                Logger.getLogger(ControleAnuncio.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(ControleAnuncio.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (uri.equals(request.getContextPath() + "/alterarAnuncio")) {
            try {
                alterar(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erroGeral.html").forward(request, response);
                Logger.getLogger(ControleAnuncio.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(ControleAnuncio.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.equals(request.getContextPath() + "/anuncioEmAberto")) {
            try {
                anuncioEmAberto(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erroGeral.html").forward(request, response);
                Logger.getLogger(ControleEndereco.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (uri.equals(request.getContextPath() + "/encerrarAnuncio")) {
            try {
                encerrar(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erroGeral.html").forward(request, response);
                Logger.getLogger(ControleEndereco.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (uri.equals(request.getContextPath() + "/selecao")) {
            try {
                selecionar(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erroGeral.html").forward(request, response);
                Logger.getLogger(ControleEndereco.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (uri.equals(request.getContextPath() + "/recuperarDados")) {
            try {
                selecionar1(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erroGeral.html").forward(request, response);
                Logger.getLogger(ControleEndereco.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (uri.equals(request.getContextPath() + "/anuncioAbertoVendedor")) {
            try {
                anuncioAbertoVendedor(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erroGeral.html").forward(request, response);
                Logger.getLogger(ControleEndereco.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (uri.equals(request.getContextPath() + "/anuncioEncerradoVendedor")) {
            try {
                anuncioEncerradoVendedor(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erroGeral.html").forward(request, response);
                Logger.getLogger(ControleEndereco.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (uri.equals(request.getContextPath() + "/verDetalhes")) {
            try {
                verDetalhes(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erroGeral.html").forward(request, response);
                Logger.getLogger(ControleEndereco.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (uri.equals(request.getContextPath() + "/pesquisa")) {
            try {
                pesquisa(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erroGeral.html").forward(request, response);
                Logger.getLogger(ControleEndereco.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void cadastrar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException, FileUploadException, Exception {

        Map<String, String> fields = new HashMap<>();
        Map<String, List<String>> multiValueFields = new HashMap<>();

        ServletFileUpload.isMultipartContent(request);

        FileItemFactory itemfactory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(itemfactory);

        ArrayList<String> pics = new ArrayList<>();
        
            List<FileItem> items = upload.parseRequest(request);
            for (FileItem item : items) {

                if (!item.isFormField()) {
                    String contentType = item.getContentType();
                    
                    if (contentType!=null){
                        if (item.getName().equals("")){
                            String caminho = "sem-foto.jpg";
                            pics.add(caminho);
                        }else{
                            File uploadDir = new File("C:\\Users\\celin\\Desktop\\PFC-VendeMaisFinal\\web\\BancoImagens");
                            File file = File.createTempFile("img", ".jpg", uploadDir);
                            item.write(file);
                            pics.add(file.getName());
                        }                       
                    }
                } else {
                    String name = item.getFieldName();
                    String value = item.getString();
                    
                    if (!multiValueFields.containsKey(name)) {
                        multiValueFields.put(name, new ArrayList<>());
                    }
                    fields.put(name, value);
                    multiValueFields.get(name).add(value);
                }
            }
            
            String pic1 = pics.get(0);
            String pic2 = pics.get(1);
            String pic3 = pics.get(2);
            String pic4 = pics.get(3);
            String pic5 = pics.get(4);

            String titulo = fields.get("titulo");
            String descricao = fields.get("descricao");
            String observacoes = fields.get("observações");
            String quantidade = fields.get("quantidade");
            String preco = fields.get("preco");
            String estadoprod = fields.get("estadoprod");
            String peso = fields.get("peso");
            String altura = fields.get("altura");
            String largura = fields.get("largura");
            String cat = fields.get("categoria");
            String sub = fields.get("subcategoria");
            String formaEnvio = fields.get("envio");
            String endereco = fields.get("endereco");
            String frete = fields.get("frete");
            String cep = fields.get("cep");
            String bairro = fields.get("bairro");
            String cidade = fields.get("cidade");
            String estado = fields.get("uf");
            String rua = fields.get("rua");
            String vaga = fields.get("vaga");
            String area = fields.get("area");
            String areatotal = fields.get("atotal");
            String ano = fields.get("ano");
            String marca = fields.get("marca");
            String cor = fields.get("cor");

            preco = preco.replace(',', '.');
            altura = altura.replace(',', '.');
            largura = largura.replace(',', '.');
            peso = peso.replace(',', '.');

            if (frete == null) {
                frete = "0";
            } else {
                frete = frete.replace(',', '.');
            }

            Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
            if (usuario != null) {
                usuario.getId();

                Vendedor vendedor = new Vendedor();
                vendedor.setId(usuario.getId());

                Anuncio anuncio = new Anuncio();
                anuncio.setTitulo(titulo);
                anuncio.setDescricao(descricao);
                anuncio.setObservacoes(observacoes);
                anuncio.setQuantidade(Integer.parseInt(quantidade));
                anuncio.setPreco(Double.parseDouble(preco));
                anuncio.setEstadoprod(estadoprod);
                anuncio.setPeso(peso);
                anuncio.setAltura(altura);
                anuncio.setLargura(largura);
                anuncio.setCep(cep);
                anuncio.setBairro(bairro);
                anuncio.setCidade(cidade);
                anuncio.setEstado(estado);
                anuncio.setRua(rua);
                anuncio.setVaga(vaga);
                anuncio.setArea(area);
                anuncio.setAreatotal(areatotal);
                anuncio.setAno(ano);
                anuncio.setMarca(marca);
                anuncio.setCor(cor);
                anuncio.setPic1(pic1);
                anuncio.setPic2(pic2);
                anuncio.setPic3(pic3);
                anuncio.setPic4(pic4);
                anuncio.setPic5(pic5);

                Categoria categoria = new Categoria();
                categoria.setId(Integer.parseInt(cat));

                SubCategoria subcategoria = new SubCategoria();
                subcategoria.setId(Integer.parseInt(sub));

                anuncio.setCategoria(categoria);
                anuncio.setSubcategoria(subcategoria);
                anuncio.setAtivo(1);
                anuncio.setData_cadastro(new Date(System.currentTimeMillis()));
                anuncio.setVendedor(vendedor);
                anuncio.setEndereco(endereco);
                anuncio.setValorFrete(Double.parseDouble(frete));
                anuncio.setFormaEnvio(formaEnvio);

                AnuncioDAO dao = new AnuncioDAO();
                dao.cadastrar(anuncio);

                request.getRequestDispatcher("sucessoAnuncio.html").forward(request, response);
            }else{
                request.getRequestDispatcher("fazerLogin.jsp").forward(request, response);
            }
    }

    public void alterar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException, FileUploadException, Exception {
        
        Map<String, String> fields = new HashMap<>();
        Map<String, List<String>> multiValueFields = new HashMap<>();

        ServletFileUpload.isMultipartContent(request);

        FileItemFactory itemfactory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(itemfactory);

        ArrayList<String> pics = new ArrayList<>();
        
            List<FileItem> items = upload.parseRequest(request);
            for (FileItem item : items) {

                if (!item.isFormField()) {
                    String contentType = item.getContentType();
                    
                    if (contentType!=null){                        
                        if (item.getName().equals("")){
                            String caminho = "";
                            pics.add(caminho);
                        }else{
                            File uploadDir = new File("C:\\Users\\celin\\Desktop\\PFC-VendeMaisFinal\\web\\BancoImagens");
                            File file = File.createTempFile("img", ".jpg", uploadDir);
                            item.write(file);
                            pics.add(file.getName());
                        }                       
                    }
                } else {
                    String name = item.getFieldName();
                    String value = item.getString();
                    
                    if (!multiValueFields.containsKey(name)) {
                        multiValueFields.put(name, new ArrayList<>());
                    }
                    fields.put(name, value);
                    multiValueFields.get(name).add(value);
                }
            }
            
            String pic1 = pics.get(0);
            String pic2 = pics.get(1);
            String pic3 = pics.get(2);
            String pic4 = pics.get(3);
            String pic5 = pics.get(4);
            
            if (pic1==""){pic1 = fields.get("pic01");}
            if (pic2==""){pic2 = fields.get("pic02");}
            if (pic3==""){pic3 = fields.get("pic03");}
            if (pic4==""){pic4 = fields.get("pic04");}
            if (pic5==""){pic5 = fields.get("pic05");}

            String titulo = fields.get("titulo");
            String descricao = fields.get("descricao");
            String observacoes = fields.get("observações");
            String quantidade = fields.get("quantidade");
            String preco = fields.get("preco");
            String estadoprod = fields.get("estadoprod");
            String peso = fields.get("peso");
            String altura = fields.get("altura");
            String largura = fields.get("largura");            
            String formaEnvio = fields.get("envio");
            String endereco = fields.get("endereco");
            String frete = fields.get("frete");
            String cep = fields.get("cep");
            String bairro = fields.get("bairro");
            String cidade = fields.get("cidade");
            String estado = fields.get("uf");
            String rua = fields.get("rua");
            String vaga = fields.get("vaga");
            String area = fields.get("area");
            String areatotal = fields.get("atotal");
            String ano = fields.get("ano");
            String marca = fields.get("marca");
            String cor = fields.get("cor");
            String id = fields.get("idAnuncio");
            String remover1 = fields.get("remover1");
            String remover2 = fields.get("remover2");
            String remover3 = fields.get("remover3");
            String remover4 = fields.get("remover4");
            String remover5 = fields.get("remover5");
            
            if(remover1!=null){pic1=remover1;}
            if(remover2!=null){pic2=remover2;}
            if(remover3!=null){pic3=remover3;}
            if(remover4!=null){pic4=remover4;}
            if(remover5!=null){pic5=remover5;}

            
            preco = preco.replace(',', '.');
            altura = altura.replace(',', '.');
            largura = largura.replace(',', '.');
            peso = peso.replace(',', '.');

            if (frete == null) {
                frete = "0";
            } else {
                frete = frete.replace(',', '.');
            }

            Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
            if (usuario != null) {
                usuario.getId();

                Vendedor vendedor = new Vendedor();
                vendedor.setId(usuario.getId());

                Anuncio anuncio = new Anuncio();
                anuncio.setTitulo(titulo);
                anuncio.setDescricao(descricao);
                anuncio.setObservacoes(observacoes);
                anuncio.setQuantidade(Integer.parseInt(quantidade));
                anuncio.setPreco(Double.parseDouble(preco));
                anuncio.setEstadoprod(estadoprod);
                anuncio.setPeso(peso);
                anuncio.setAltura(altura);
                anuncio.setLargura(largura);
                anuncio.setCep(cep);
                anuncio.setBairro(bairro);
                anuncio.setCidade(cidade);
                anuncio.setEstado(estado);
                anuncio.setRua(rua);
                anuncio.setVaga(vaga);
                anuncio.setArea(area);
                anuncio.setAreatotal(areatotal);
                anuncio.setAno(ano);
                anuncio.setMarca(marca);
                anuncio.setCor(cor);
                anuncio.setPic1(pic1);
                anuncio.setPic2(pic2);
                anuncio.setPic3(pic3);
                anuncio.setPic4(pic4);
                anuncio.setPic5(pic5);
                anuncio.setEndereco(endereco);
                anuncio.setValorFrete(Double.parseDouble(frete));
                anuncio.setFormaEnvio(formaEnvio);
                anuncio.setId(Integer.parseInt(id));

                AnuncioDAO dao = new AnuncioDAO();
                dao.alterar(anuncio);;

                request.getRequestDispatcher("sucessoAnuncio.html").forward(request, response);
            }else{
                request.getRequestDispatcher("fazerLogin.jsp").forward(request, response);
            }
    }

    public void encerrar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        int id = Integer.parseInt(request.getParameter("idAnuncio"));

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (usuario != null) {
            usuario.getId();

            Anuncio anuncio = new Anuncio();
            AnuncioDAO dao = new AnuncioDAO();

            anuncio.setId(id);
            dao.encerrar(anuncio);
            request.getRequestDispatcher("sucessoAnuncio.html").forward(request, response);
        }
        request.getRequestDispatcher("fazerLogin.jsp").forward(request, response);
    }

    public void anuncioAbertoVendedor(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (usuario != null) {
            usuario.getId();

            Vendedor vendedor = new Vendedor();
            vendedor.setId(usuario.getId());

            Anuncio anuncio = new Anuncio();
            anuncio.setVendedor(vendedor);

            AnuncioDAO dao = new AnuncioDAO();

            List<Anuncio> todosAnuncios = dao.consultarAtivosVendedor(anuncio);

            request.setAttribute("resultado", todosAnuncios);
            request.getRequestDispatcher("pgs/consultaAnuncioAberto.jsp").forward(request, response);
        }
        request.getRequestDispatcher("fazerLogin.jsp").forward(request, response);
    }

    public void anuncioEncerradoVendedor(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (usuario != null) {
            usuario.getId();

            Vendedor us = new Vendedor();
            us.setId(usuario.getId());

            Anuncio anuncio = new Anuncio();
            anuncio.setVendedor(us);

            AnuncioDAO dao = new AnuncioDAO();

            List<Anuncio> todosAnuncios = dao.consultarEncerradosVendedor(anuncio);

            request.setAttribute("resultado", todosAnuncios);
            request.getRequestDispatcher("pgs/consultaAnuncioEncerrado.jsp").forward(request, response);
        }
        request.getRequestDispatcher("fazerLogin.jsp").forward(request, response);
    }

    public void anuncioEmAberto(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        AnuncioDAO dao = new AnuncioDAO();
        List<Anuncio> todosAnuncios = dao.consultarTodosAbertos();
        request.setAttribute("resultado", todosAnuncios);
        request.getRequestDispatcher("resultado.jsp").forward(request, response);
    }

    public void pesquisa(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        String pesquisa = request.getParameter("palavra");
        AnuncioDAO dao = new AnuncioDAO();
        List<Anuncio> todosAnuncios = dao.pesquisa(pesquisa);
        request.setAttribute("resultado", todosAnuncios);
        request.getRequestDispatcher("resultado.jsp").forward(request, response);
    }

    public void selecionar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (usuario != null) {

            CategoriaDAO cdao = new CategoriaDAO();
            List<Categoria> todosCategorias = cdao.consultarAtivos();

            request.setAttribute("resultadoC", todosCategorias);
            request.getRequestDispatcher("pgs/selecionarCategoria.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("fazerLogin.jsp").forward(request, response);
        }
    }

    public void selecionar1(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        int cat = Integer.parseInt(request.getParameter("categoria"));

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (usuario != null) {
            usuario.getId();

            Categoria categoria = new Categoria();
            categoria.setId(cat);

            CategoriaDAO cdao = new CategoriaDAO();

            Endereco endereco = new Endereco();
            endereco.setUsuario(usuario);

            EnderecoDAO dao = new EnderecoDAO();

            List<Endereco> todosEnderecos = dao.consultar(endereco);

            SubCategoriaDAO sdao = new SubCategoriaDAO();
            List<SubCategoria> todosSubCategorias = sdao.consultarAtivos(categoria);

            request.setAttribute("resultadoC", cdao.consultarId(categoria));
            request.setAttribute("resultadoS", todosSubCategorias);
            request.setAttribute("resultadoE", todosEnderecos);
            request.getRequestDispatcher("pgs/cadastroAnuncio.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("fazerLogin.jsp").forward(request, response);
        }
    }

    public void verDetalhes(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        int id = Integer.parseInt(request.getParameter("id"));

        Anuncio anuncio = new Anuncio();
        anuncio.setId(id);

        AnuncioDAO dao = new AnuncioDAO();

        request.setAttribute("resultado", dao.consultarPorId(anuncio));
        request.getRequestDispatcher("detalhes.jsp").forward(request, response);

    }

}
