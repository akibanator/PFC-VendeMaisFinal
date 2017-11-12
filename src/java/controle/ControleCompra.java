package controle;

import dao.CompraDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Compra;
import modelo.Comprador;

import modelo.Usuario;
import modelo.Vendedor;

public class ControleCompra extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.equals(request.getContextPath() + "/historicoCompra")) {
            try {
                historicoCompra(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                response.sendRedirect("erroGeral.html");
                Logger.getLogger(ControleUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (uri.equals(request.getContextPath() + "/historicoVenda")) {
            try {
                historicoVenda(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                response.sendRedirect("erroGeral.html");
                Logger.getLogger(ControleUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.equals(request.getContextPath() + "/classificarProduto")) {
            try {
                classificarProduto(request, response);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ControleCompra.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(ControleCompra.class.getName()).log(Level.SEVERE, null, ex);
            }
        } 
    }

    public void historicoCompra(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
        if (u != null) {

            Comprador comprador = new Comprador();
            comprador.setId(u.getId());

            CompraDAO dao = new CompraDAO();

            List<Compra> todasCompras = dao.historicoCompra(comprador);

            request.setAttribute("resultado", todasCompras);
            request.getRequestDispatcher("pgs/historicoCompras.jsp").forward(request, response);
        }
        request.getRequestDispatcher("fazerLogin.jsp").forward(request, response);
    }

    public void historicoVenda(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
        if (u != null) {

            Vendedor vendedor = new Vendedor();
            vendedor.setId(u.getId());

            CompraDAO dao = new CompraDAO();

            List<Compra> todasVendas = dao.historicoVenda(vendedor);

            request.setAttribute("resultado", todasVendas);
            request.getRequestDispatcher("pgs/historicoVendas.jsp").forward(request, response);
        }
        request.getRequestDispatcher("fazerLogin.jsp").forward(request, response);
    }

    private void classificarProduto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
        
        int nota = Integer.parseInt(request.getParameter("ratings-hidden"));
        String comentario = request.getParameter("new-review");
        int idCompra = Integer.parseInt(request.getParameter("idCompra"));
        
        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
        if (u != null) {
            
            Compra compra = new Compra();
            compra.setNota(nota);
            compra.setComentario(comentario);
            compra.setId(idCompra);
            
            CompraDAO dao = new CompraDAO();
            dao.classificarProduto(compra);
            
            request.getRequestDispatcher("sucessoGeral.html").forward(request, response);
            
        } else {
            request.getRequestDispatcher("erroSessao.html").forward(request, response);
        }
    }
}
