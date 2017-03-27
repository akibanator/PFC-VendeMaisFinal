package controle;

import dao.AnuncioDAO;
import dao.EnderecoDAO;
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
import modelo.Endereco;
import modelo.Usuario;

public class ControleTransacao extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.equals(request.getContextPath() + "/comprar")) {
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
        
    }

    public void comprar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        int id = Integer.parseInt(request.getParameter("id"));

        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
        if (u != null) {
            Comprador us = new Comprador();
            us.setId(u.getId());
            
            Anuncio a = new Anuncio();
            a.setId(id);
            
            AnuncioDAO dao = new AnuncioDAO();
            dao.consultarPorId(a);
            
            Endereco e = new Endereco();
            e.setUsuario(us.getId());
 
            EnderecoDAO edao = new EnderecoDAO(); 
            List<Endereco> todosEnderecos = edao.consultar(e);
            
            if (us.getId() != a.getVendedor()) { 
                request.setAttribute("resultadoEndereco", todosEnderecos);
                request.setAttribute("resultado", dao.consultarPorId(a));
                request.getRequestDispatcher("compra.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("erroGeral.html").forward(request, response);
            }
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
