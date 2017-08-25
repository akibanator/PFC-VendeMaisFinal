package controle;

import dao.AnuncioDAO;
import dao.CategoriaDAO;
import dao.EnderecoDAO;
import dao.SubCategoriaDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Anuncio;
import modelo.Categoria;
import modelo.Endereco;
import modelo.SubCategoria;
import modelo.Usuario;
import modelo.Vendedor;

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
            }
        } else if (uri.equals(request.getContextPath() + "/alterarAnuncio")) {
            try {
                alterar(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erro.html").forward(request, response);
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
                request.getRequestDispatcher("erro.html").forward(request, response);
                Logger.getLogger(ControleEndereco.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (uri.equals(request.getContextPath() + "/encerrarAnuncio")) {
            try {
                encerrar(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erro.html").forward(request, response);
                Logger.getLogger(ControleEndereco.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (uri.equals(request.getContextPath() + "/selecao")) {
             try {
                 selecionar(request, response);
             } catch (ClassNotFoundException | SQLException ex) {
                 request.getRequestDispatcher("erro.html").forward(request, response);
                 Logger.getLogger(ControleEndereco.class.getName()).log(Level.SEVERE, null, ex);
             }
        }else if (uri.equals(request.getContextPath() + "/recuperarDados")) {
             try {
                 selecionar1(request, response);
             } catch (ClassNotFoundException | SQLException ex) {
                 request.getRequestDispatcher("erro.html").forward(request, response);
                 Logger.getLogger(ControleEndereco.class.getName()).log(Level.SEVERE, null, ex);
             }
        }else if (uri.equals(request.getContextPath() + "/anuncioAbertoVendedor")) {
            try {
                anuncioAbertoVendedor(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erro.html").forward(request, response);
                Logger.getLogger(ControleEndereco.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (uri.equals(request.getContextPath() + "/anuncioEncerradoVendedor")) {
            try {
                anuncioEncerradoVendedor(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erro.html").forward(request, response);
                Logger.getLogger(ControleEndereco.class.getName()).log(Level.SEVERE, null, ex);
            }
        }else if (uri.equals(request.getContextPath() + "/verDetalhes")) {
            try {
                verDetalhes(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erro.html").forward(request, response);
                Logger.getLogger(ControleEndereco.class.getName()).log(Level.SEVERE, null, ex);
            }
        }else if (uri.equals(request.getContextPath() + "/pesquisa")) {
            try {
                pesquisa(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erro.html").forward(request, response);
                Logger.getLogger(ControleEndereco.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void cadastrar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        String titulo = request.getParameter("titulo");
        String descricao = request.getParameter("descricao");
        String observacoes = request.getParameter("observações");
        int quantidade = Integer.parseInt(request.getParameter("quantidade"));
        double preco = Double.parseDouble(request.getParameter("preco"));
        String estado = request.getParameter("estado");
        String peso = request.getParameter("peso");
        String altura = request.getParameter("altura");
        String largura = request.getParameter("largura");
        int cat = Integer.parseInt(request.getParameter("categoria"));
        int sub = Integer.parseInt(request.getParameter("subcategoria"));
        String formaEnvio = request.getParameter("envio");
        String endereco = request.getParameter("endereco");
        double frete = Double.parseDouble(request.getParameter("frete"));
       
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (usuario != null) {
            usuario.getId();
            
            Vendedor vendedor = new Vendedor();
            vendedor.setId(usuario.getId());
            
            Anuncio anuncio = new Anuncio();
            anuncio.setTitulo(titulo);
            anuncio.setDescricao(descricao);
            anuncio.setObservacoes(observacoes);
            anuncio.setQuantidade(quantidade);
            anuncio.setPreco(preco);
            anuncio.setEstado(estado);
            anuncio.setPeso(peso);
            anuncio.setAltura(altura);
            anuncio.setLargura(largura);
            
            Categoria categoria = new Categoria();
            categoria.setId(cat);
            
            SubCategoria subcategoria = new SubCategoria();
            subcategoria.setId(sub);
            
            anuncio.setCategoria(categoria);
            anuncio.setSubcategoria(subcategoria);
            anuncio.setAtivo(1);
            anuncio.setData_cadastro(new Date(System.currentTimeMillis()));
            anuncio.setVendedor(vendedor);
            anuncio.setEndereco(endereco);
            anuncio.setValorFrete(frete);
            anuncio.setFormaEnvio(formaEnvio);

            AnuncioDAO dao = new AnuncioDAO();
            dao.cadastrar(anuncio);

            request.getRequestDispatcher("sucessoAnuncio.html").forward(request, response);
        }
        request.getRequestDispatcher("fazerLogin.jsp").forward(request, response);
    }

    public void alterar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        String titulo = request.getParameter("titulo");
        String descricao = request.getParameter("descricao");
        int quantidade = Integer.parseInt(request.getParameter("quantidade"));
        double preco = Double.parseDouble(request.getParameter("preco"));
        String peso = request.getParameter("peso");
        String altura = request.getParameter("altura");
        String largura = request.getParameter("largura");
        int id = Integer.parseInt(request.getParameter("idAnuncio"));

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (usuario != null) {
            Anuncio anuncio = new Anuncio();
            anuncio.setTitulo(titulo);
            anuncio.setDescricao(descricao);
            anuncio.setQuantidade(quantidade);
            anuncio.setPreco(preco);
            anuncio.setPeso(peso);
            anuncio.setAltura(altura);
            anuncio.setLargura(largura);            
            anuncio.setId(id);

            AnuncioDAO dao = new AnuncioDAO();
            dao.alterar(anuncio);
            
            request.setAttribute("resultado", anuncio);
            request.getRequestDispatcher("sucessoAnuncio.html").forward(request, response);
        }
        request.getRequestDispatcher("fazerLogin.jsp").forward(request, response);
    }

    public void encerrar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        int id = Integer.parseInt(request.getParameter("idAnuncio")); //recupera campo descricao do formulario

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
        if (usuario != null) {  //se o usuario estiver logado, mostrar todos os anuncios em aberto 
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
        if (usuario != null) {  //se o usuario estiver logado, mostrar todos os anuncios em encerrado 
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
        }else{
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
            
            request.setAttribute("resultadoC",cdao.consultarId(categoria));
            request.setAttribute("resultadoS", todosSubCategorias);
            request.setAttribute("resultadoE", todosEnderecos);
            request.getRequestDispatcher("pgs/cadastroAnuncio.jsp").forward(request, response);
        }else{
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
