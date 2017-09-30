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

public class ControleRelatorio extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.equals(request.getContextPath() + "/gerarRelatorio")) {
            try {
                gerarRelatorio(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                response.sendRedirect("erroLogin.html");
                Logger.getLogger(ControleUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        } 
    }

    public void gerarRelatorio(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
        if (u != null) {
           
            Comprador comprador = new Comprador();
            comprador.setId(u.getId());
            
            Vendedor vendedor = new Vendedor();
            vendedor.setId(u.getId());
           
            HistoricoDAO dao = new HistoricoDAO();

            List<Historico> todasCompras = dao.historicoCompra(comprador);
            List<Historico> todasVendas = dao.historicoVenda(vendedor);

            request.setAttribute("resultado1", todasCompras);
            request.setAttribute("resultado2", todasVendas);
            request.getRequestDispatcher("pgs/relatorioGeral.jsp").forward(request, response);
        }
        request.getRequestDispatcher("fazerLogin.jsp").forward(request, response);
    }
}
