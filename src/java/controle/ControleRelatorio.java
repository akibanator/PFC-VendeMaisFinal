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
import modelo.Relatorio;
import modelo.Usuario;
import modelo.Vendedor;

public class ControleRelatorio extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.equals(request.getContextPath() + "/gerarRelatorio")) {
            try {
                gerarRelatorioCompra(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                response.sendRedirect("erroGeral.html");
                Logger.getLogger(ControleUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void gerarRelatorioCompra(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
        if (u != null) {

            Comprador comprador = new Comprador();
            comprador.setId(u.getId());
            
            Vendedor vendedor = new Vendedor();
            vendedor.setId(u.getId());

            CompraDAO dao = new CompraDAO();

            List<Compra> todasCompras = dao.historicoCompra(comprador);
            List<Compra> todasVendas = dao.historicoVenda(vendedor);

            Relatorio relatorioCompra = new Relatorio();
            Relatorio relatorioVenda = new Relatorio();

            relatorioCompra.totalValorCompra(todasCompras);
            relatorioVenda.totalValorVenda(todasVendas);
            
            relatorioCompra.totalQtdCompra(todasCompras);
            relatorioVenda.totalQtdVenda(todasVendas);
            
            request.setAttribute("resultado1", todasCompras);
            request.setAttribute("resultado2", relatorioCompra);
            request.setAttribute("resultado3", todasVendas);
            request.setAttribute("resultado4", relatorioVenda);
            request.getRequestDispatcher("pgs/relatorioGeral.jsp").forward(request, response);
        }
        request.getRequestDispatcher("fazerLogin.jsp").forward(request, response);
    }
}
