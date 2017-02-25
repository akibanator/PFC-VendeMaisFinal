/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import dao.UsuarioDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Usuario;

/**
 *
 * @author ailto
 */
public class ControleSessao extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.equals(request.getContextPath() + "/login")) {
            try {
                login(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                response.sendRedirect("erroLogin.html");
                Logger.getLogger(ControleUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.equals(request.getContextPath() + "/logout")) {
            try {
                logout(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(ControleUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void login(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ClassNotFoundException, SQLException, ServletException {

        String login = request.getParameter("usuario");
        String senha = request.getParameter("senha");

        Usuario usuario = new Usuario();
        usuario.setEmail(login);
        usuario.setSenha(senha);

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        Usuario usuarioAutenticado = usuarioDAO.validar(usuario);

        HttpSession sessaoUsuario = request.getSession();

        if (usuarioAutenticado != null) {
            sessaoUsuario.setAttribute("usuario", usuarioAutenticado);
            request.getRequestDispatcher("home.jsp").forward(request, response);
        } else {
            sessaoUsuario.invalidate();
            response.sendRedirect("erroLogin.html");
        }
    }

    public void logout(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ClassNotFoundException, SQLException, ServletException {
        HttpSession sessaoUsuario = request.getSession();
        sessaoUsuario.invalidate();
        response.sendRedirect("index.html");
    }
}
