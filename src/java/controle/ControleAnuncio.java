package controle;

import dao.AnuncioDAO;
import dao.EnderecoDAO;
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
import modelo.Endereco;
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
        if (uri.equals(request.getContextPath() + "/consultarAnuncio")) {
            try {
                consultar(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erro.html").forward(request, response);
                Logger.getLogger(ControleEndereco.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (uri.equals(request.getContextPath() + "/excluirAnuncio")) {
            try {
                excluir(request, response);
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
        } else if (uri.equals(request.getContextPath() + "/recuperarAnuncio")) {
            try {
                recuperar(request, response);
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
        int endereco = Integer.parseInt(request.getParameter("endereco"));
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
        request.getRequestDispatcher("erroSessao.html").forward(request, response);
    }

    public void alterar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

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
        int id = Integer.parseInt(request.getParameter("idAnuncio"));

        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
        if (u != null) {
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
            a.setId(id);

            AnuncioDAO dao = new AnuncioDAO();

            dao.alterar(a);
            request.setAttribute("resultado", a);
            request.getRequestDispatcher("sucessoAnuncio.html").forward(request, response);
        }
        request.getRequestDispatcher("erroSessao.html").forward(request, response);
    }

    public void recuperar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

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
        int id = Integer.parseInt(request.getParameter("idAnuncio"));

        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
        if (u != null) {
            u.getId();
            Usuario us = new Vendedor();
            us.setId(u.getId());

            Anuncio a = new Anuncio();
            a.setId(id);
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
            a.setVendedor(us.getId());

            AnuncioDAO dao = new AnuncioDAO();

            dao.consultarAtivo(a);
            dao.alterar(a);
            request.setAttribute("resultado", a);
            request.getRequestDispatcher("alterarDadosAnuncio.jsp").forward(request, response);
        }
        request.getRequestDispatcher("erroSessao.html").forward(request, response);
    }

    public void excluir(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        int id = Integer.parseInt(request.getParameter("idAnuncio")); //recupera campo descricao do formulario

        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
        if (u != null) {
            u.getId();
            Anuncio e = new Anuncio();
            AnuncioDAO dao = new AnuncioDAO();

            e.setId(id);
            dao.excluir(e);
            request.getRequestDispatcher("sucessoAnuncio.html").forward(request, response);
        }
        request.getRequestDispatcher("erroSessao.html").forward(request, response);
    }

    public void consultar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
        if (u != null) {
            u.getId();
            Usuario us = new Vendedor();
            us.setId(u.getId());

            Anuncio a = new Anuncio();
            a.setVendedor(us.getId());

            AnuncioDAO edao = new AnuncioDAO();

            List<Anuncio> todosAnuncios = edao.consultarAtivo(a);

            request.setAttribute("resultado", todosAnuncios);
            request.getRequestDispatcher("consultaAnuncio.jsp").forward(request, response);
        }
        request.getRequestDispatcher("fazerLogin.jsp").forward(request, response);
    }

    public void selecionar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
        if (u != null) {
            u.getId();
            Endereco e = new Endereco();
            e.setUsuario(u.getId());

            EnderecoDAO edao = new EnderecoDAO();

            List<Endereco> todosEnderecos = edao.consultar(e);

            request.setAttribute("resultadoE", todosEnderecos);
            request.getRequestDispatcher("cadastroAnuncio.jsp").forward(request, response);
        }
        request.getRequestDispatcher("erroSessao.html").forward(request, response);
    }
}
