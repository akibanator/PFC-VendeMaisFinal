package controle;

import dao.CompraDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
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
        } else if (uri.equals(request.getContextPath() + "/filtrarrelatorio")) {
            try {
                filtroDeRelatorio(request, response);
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

    public void classificarProduto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
        
        int nota = Integer.parseInt(request.getParameter("ratings-hidden"));
        String comentario = request.getParameter("new-review");
        int idCompra = Integer.parseInt(request.getParameter("idCompra"));
        
        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
        if (u != null) {
            
            Compra compra = new Compra();
            compra.setNota(nota);
            compra.setComentario(comentario);
            compra.setId(idCompra);
            
            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            Date date = new Date();

            compra.setData_classificacao(dateFormat.format(date));
            
            CompraDAO dao = new CompraDAO();
            dao.classificarProduto(compra);
            
            request.getRequestDispatcher("sucessoGeral.jsp").forward(request, response);
            
        } else {
            request.getRequestDispatcher("erroSessao.html").forward(request, response);
        }
    }
    
    public void filtroDeRelatorio(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
        String ordem = request.getParameter("ordem");
        String data1 = request.getParameter("data1");
        String data2 = request.getParameter("data2");
        String quantidade1 = request.getParameter("quantidade1");
        String quantidade2 = request.getParameter("quantidade2");
        String valor1 = request.getParameter("valor1");
        String valor2 = request.getParameter("valor2");
        String classificacao1 = request.getParameter("classificacao1");
        String classificacao2 = request.getParameter("classificacao2");
        String id = request.getParameter("idVendedor");
        String usuario = request.getParameter("usuario");

        String select = "where " + usuario+ " = " +id;        
        
        if ((!data1.equals(""))&&(!data2.equals(""))){
            select += " and data_compra between '" + data1 + "' and '" + data2 + "'";
        }
        
        if ((!quantidade1.equals(""))&&(!quantidade2.equals(""))){
            select += " and quantidade between " + quantidade1 + " and " + quantidade2;
        }
        
        if ((!valor1.equals(""))&&(!valor2.equals(""))){
            select += " and total between '" + valor1 + "' and '" + valor2 + "'";
        }
        
        if ((!classificacao1.equals(""))&&(!classificacao2.equals(""))){
            select += " and nota between '" + classificacao1 + "' and '" + classificacao2 + "'";
        }
        
        if (ordem != null){
            select += " order by " + ordem + " desc";
        }else{
            select += "";
        }
        
        CompraDAO dao = new CompraDAO();
        List<Compra> todasVendas = dao.filtroDePesquisa(select);

        Relatorio relatorioVenda = new Relatorio();
        relatorioVenda.totalValorVenda(todasVendas);
        relatorioVenda.totalQtdVenda(todasVendas);

        request.setAttribute("resultado", todasVendas);
        request.setAttribute("resultado1", relatorioVenda);
        request.getRequestDispatcher("pgs/relatorioGeralVenda.jsp").forward(request, response);
    }
}
