package controle;

import dao.AnuncioDAO;
import dao.HistoricoDAO;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Anuncio;
import modelo.Compra;
import modelo.Comprador;
import modelo.Usuario;

public class ControleTransacao extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.equals(request.getContextPath() + "/comprarAnuncio")) {
            try {
                comprar(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erro.html").forward(request, response);
                Logger.getLogger(ControleAnuncio.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (uri.equals(request.getContextPath() + "/finalizarCompra")) {
            try {
                finalizarCompra(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erro.html").forward(request, response);
                Logger.getLogger(ControleAnuncio.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.equals(request.getContextPath() + "/recuperarCompra")) {
            try {
                recuperar(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erro.html").forward(request, response);
                Logger.getLogger(ControleAnuncio.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (uri.equals(request.getContextPath() + "/selecionarAnuncio")) {
            try {
                selecionar(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erro.html").forward(request, response);
                Logger.getLogger(ControleAnuncio.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void comprar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

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
        int qtdDesejada = Integer.parseInt(request.getParameter("quantidadeDesejada"));
        int vendedor = Integer.parseInt(request.getParameter("vendedor"));

        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
        if (u != null) {

            u.getId();
            Comprador us = new Comprador();
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
            a.setVendedor(vendedor);

            if (u.getId() != a.getVendedor()) {
                Compra c = new Compra();
                c.setAnuncio(a);
                c.setQuantidade(qtdDesejada);
                c.setTotal(a.getPreco() * c.getQuantidade());

                request.setAttribute("resultadoC", c);
                request.setAttribute("resultadoA", a);
                request.getRequestDispatcher("finalizarCompra.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("erroGeral.html").forward(request, response);
            }
        }
        request.getRequestDispatcher("erroSessao.html").forward(request, response);
    }

    public void recuperar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
        if (u != null) {
            u.getId();
            AnuncioDAO edao = new AnuncioDAO();

            List<Anuncio> todosAnuncios = edao.consultarTodosDisponiveis();

            request.setAttribute("resultado", todosAnuncios);
            request.getRequestDispatcher("produtos.jsp").forward(request, response);
        }
        request.getRequestDispatcher("erroSessao.html").forward(request, response);
    }

    public void selecionar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

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
        int vendedor = Integer.parseInt(request.getParameter("vendedor"));

        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
        if (u != null) {

            u.getId();
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
            a.setVendedor(vendedor);

            AnuncioDAO dao = new AnuncioDAO();

            dao.consultarAtivo(a);
            dao.alterar(a);
            request.setAttribute("resultado", a);

            request.getRequestDispatcher("realizarCompra.jsp").forward(request, response);
        }
        request.getRequestDispatcher("erroSessao.html").forward(request, response);
    }

    public void finalizarCompra(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        int quantidade = Integer.parseInt(request.getParameter("quantidade"));
        double preco = Double.parseDouble(request.getParameter("preco"));

        int id = Integer.parseInt(request.getParameter("idAnuncio"));
        int qtdDesejada = Integer.parseInt(request.getParameter("qtdDesejada"));
        double total = Double.parseDouble(request.getParameter("total"));
        int vendedor = Integer.parseInt(request.getParameter("vendedor"));

        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
        if (u != null) {

            u.getId();
            Comprador us = new Comprador();
            us.setId(u.getId());

            Anuncio a = new Anuncio();
            a.setId(id);

            Compra c = new Compra();
            c.setAnuncio(a);
            c.setQuantidade(qtdDesejada);
            c.setComprador(us);
            c.setData_compra(new Date(System.currentTimeMillis()));
            c.setTotal(total);

            HistoricoDAO dao = new HistoricoDAO();
            dao.gerarHistorico(c, us, a);

            request.getRequestDispatcher("sucessoGeral.html").forward(request, response);
        }
        request.getRequestDispatcher("erroSessao.html").forward(request, response);
    }
}
