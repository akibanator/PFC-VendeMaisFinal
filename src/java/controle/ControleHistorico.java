/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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

/**
 *
 * @author ailto
 */
public class ControleHistorico extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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

	public void historicoCompra(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ClassNotFoundException, SQLException, ServletException {

		Usuario u = (Usuario) request.getSession().getAttribute("usuario");
		if (u != null) {

			u.getId();
			Comprador us = new Comprador();
			us.setId(u.getId());

			HistoricoDAO dao = new HistoricoDAO();

			List<Historico> todasCompras = dao.historicoCompra(us);

			request.setAttribute("resultado", todasCompras);
			request.getRequestDispatcher("historicoCompras.jsp").forward(request, response);
		}
		request.getRequestDispatcher("erroSessao.html").forward(request, response);
	}

	public void historicoVenda(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ClassNotFoundException, SQLException, ServletException {

		Usuario u = (Usuario) request.getSession().getAttribute("usuario");
		if (u != null) {

			u.getId();
			Vendedor us = new Vendedor();
			us.setId(u.getId());

			HistoricoDAO dao = new HistoricoDAO();

			List<Historico> todasVendas = dao.historicoVenda(us);

			request.setAttribute("resultado", todasVendas);
			request.getRequestDispatcher("historicoVendas.jsp").forward(request, response);
		}
		request.getRequestDispatcher("erroSessao.html").forward(request, response);
	}
}
