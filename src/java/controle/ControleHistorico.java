package controle;

import dao.HistoricoDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Comprador;
import modelo.Historico;
import modelo.Usuario;
import modelo.Vendedor;

public class ControleHistorico extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.equals(request.getContextPath() + "/historicoCompra")) {
            try {
                historicoCompra(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                response.sendRedirect("erroLogin.html");
                Logger.getLogger(ControleUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (uri.equals(request.getContextPath() + "/historicoVenda")) {
            try {
                historicoVenda(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                response.sendRedirect("erroLogin.html");
                Logger.getLogger(ControleUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void historicoCompra(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
        if (u != null) {
           
            Comprador comprador = new Comprador();
            comprador.setId(u.getId());
           
            HistoricoDAO dao = new HistoricoDAO();

            List<Historico> todasCompras = dao.historicoCompra(comprador);

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

            HistoricoDAO dao = new HistoricoDAO();

            List<Historico> todasVendas = dao.historicoVenda(vendedor);

            request.setAttribute("resultado", todasVendas);
            request.getRequestDispatcher("pgs/historicoVendas.jsp").forward(request, response);
        }
        request.getRequestDispatcher("fazerLogin.jsp").forward(request, response);
    }
}
