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
        } else if (uri.equals(request.getContextPath() + "/selecionarEndereco")) {
             try {
                 selecionar(request, response);
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
        int quantidade = Integer.parseInt(request.getParameter("quantidade"));
        double preco = Double.parseDouble(request.getParameter("preco"));
        String estado = request.getParameter("estado");
        Double peso = Double.parseDouble(request.getParameter("peso"));
        Double altura = Double.parseDouble(request.getParameter("altura"));
        Double largura = Double.parseDouble(request.getParameter("largura"));
        String categoria = request.getParameter("categoria");
        String subcategoria = request.getParameter("subcategoria");
        String formaEnvio = request.getParameter("envio");
        String endereco = request.getParameter("endereco");
        double frete = Double.parseDouble(request.getParameter("frete"));

        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
        if (u != null) {
            u.getId();
            Usuario us = new Vendedor();
            us.setId(u.getId());

            Anuncio a = new Anuncio();
            a.setTitulo(titulo);
            a.setDescricao(descricao);
            a.setQuantidade(quantidade);
            a.setPreco(preco);
            a.setEstado(estado);
            a.setPeso(peso);
            a.setAltura(altura);
            a.setLargura(largura);
            a.setCategoria(categoria);
            a.setSubcategoria(subcategoria);
            a.setAtivo(1);
            a.setData_cadastro(new Date(System.currentTimeMillis()));
            a.setVendedor(us.getId());
            a.setEndereco(endereco);
            a.setValorFrete(frete);
            a.setFormaEnvio(formaEnvio);

            AnuncioDAO dao = new AnuncioDAO();
            dao.cadastrar(a);

            request.getRequestDispatcher("sucessoAnuncio.html").forward(request, response);
        }
        request.getRequestDispatcher("fazerLogin.jsp").forward(request, response);
    }

    public void alterar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        String titulo = request.getParameter("titulo");
        String descricao = request.getParameter("descricao");
        int quantidade = Integer.parseInt(request.getParameter("quantidade"));
        double preco = Double.parseDouble(request.getParameter("preco"));
        Double peso = Double.parseDouble(request.getParameter("peso"));
        Double altura = Double.parseDouble(request.getParameter("altura"));
        Double largura = Double.parseDouble(request.getParameter("largura"));
        int id = Integer.parseInt(request.getParameter("idAnuncio"));

        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
        if (u != null) {
            Anuncio a = new Anuncio();
            a.setTitulo(titulo);
            a.setDescricao(descricao);
            a.setQuantidade(quantidade);
            a.setPreco(preco);           
            a.setPeso(peso);
            a.setAltura(altura);
            a.setLargura(largura);            
            a.setId(id);

            AnuncioDAO dao = new AnuncioDAO();

            dao.alterar(a);
            request.setAttribute("resultado", a);
            request.getRequestDispatcher("sucessoAnuncio.html").forward(request, response);
        }
        request.getRequestDispatcher("fazerLogin.jsp").forward(request, response);
    }

    public void encerrar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        int id = Integer.parseInt(request.getParameter("idAnuncio")); //recupera campo descricao do formulario

        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
        if (u != null) {
            u.getId();
            Anuncio e = new Anuncio();
            AnuncioDAO dao = new AnuncioDAO();

            e.setId(id);
            dao.encerrar(e);
            request.getRequestDispatcher("sucessoAnuncio.html").forward(request, response);
        }
        request.getRequestDispatcher("fazerLogin.jsp").forward(request, response);
    }

    public void anuncioAbertoVendedor(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
        if (u != null) {  //se o usuario estiver logado, mostrar todos os anuncios em aberto 
            u.getId();
            Usuario us = new Vendedor();
            us.setId(u.getId());

            Anuncio a = new Anuncio();
            a.setVendedor(us.getId());

            AnuncioDAO edao = new AnuncioDAO();

            List<Anuncio> todosAnuncios = edao.consultarAtivosVendedor(a);

            request.setAttribute("resultado", todosAnuncios);
            request.getRequestDispatcher("consultaAnuncioAberto.jsp").forward(request, response);
        }
        request.getRequestDispatcher("fazerLogin.jsp").forward(request, response);
    }
    
    public void anuncioEncerradoVendedor(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
        if (u != null) {  //se o usuario estiver logado, mostrar todos os anuncios em encerrado 
            u.getId();
            Usuario us = new Vendedor();
            us.setId(u.getId());

            Anuncio a = new Anuncio();
            a.setVendedor(us.getId());

            AnuncioDAO edao = new AnuncioDAO();

            List<Anuncio> todosAnuncios = edao.consultarEncerradosVendedor(a);

            request.setAttribute("resultado", todosAnuncios);
            request.getRequestDispatcher("consultaAnuncioEncerrado.jsp").forward(request, response);
        }
        request.getRequestDispatcher("fazerLogin.jsp").forward(request, response);
    }
    
    public void anuncioEmAberto(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {
        
            AnuncioDAO edao = new AnuncioDAO();
            List<Anuncio> todosAnuncios = edao.consultarTodosAbertos();
            request.setAttribute("resultado", todosAnuncios);
            request.getRequestDispatcher("resultado.jsp").forward(request, response);        
    }
    
    public void pesquisa(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {
        
            String pesquisa = request.getParameter("palavra");
            AnuncioDAO edao = new AnuncioDAO();
            List<Anuncio> todosAnuncios = edao.pesquisa(pesquisa);
            request.setAttribute("resultado", todosAnuncios);
            request.getRequestDispatcher("resultado.jsp").forward(request, response);        
    }
    
    public void selecionar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {
 
        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
        if (u != null) {
            u.getId();
            Endereco e = new Endereco();
            e.setUsuario(u.getId());

            EnderecoDAO edao = new EnderecoDAO();

            List<Endereco> todosEnderecos = edao.consultar(e);
            
            CategoriaDAO cdao = new CategoriaDAO();
            List<Categoria> todosCategorias = cdao.consultar();
            
            SubCategoriaDAO dao = new SubCategoriaDAO();
            List<SubCategoria> todosSubCategorias = dao.consultar();
            
            request.setAttribute("resultadoC", todosCategorias);
            request.setAttribute("resultadoS", todosSubCategorias);
            request.setAttribute("resultadoE", todosEnderecos);
            request.getRequestDispatcher("cadastroAnuncio.jsp").forward(request, response);
        }else{
            request.getRequestDispatcher("fazerLogin.jsp").forward(request, response);
        }         
    }
    
    public void verDetalhes(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        Anuncio a = new Anuncio();
        a.setId(id);
        
        AnuncioDAO edao = new AnuncioDAO();        
        
        request.setAttribute("resultado", edao.consultarPorId(a));
        request.getRequestDispatcher("detalhes.jsp").forward(request, response);
        
    }

}
