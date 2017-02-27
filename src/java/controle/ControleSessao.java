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

public class ControleSessao extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.equals(request.getContextPath() + "/logout")) {
            try {
                logout(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(ControleUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        String login = request.getParameter("usuario");
        String senha = request.getParameter("senha");

        Usuario usuario = new Usuario();
        usuario.setEmail(login);
        usuario.setSenha(senha);

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        Usuario usuarioAutenticado = usuarioDAO.validar(usuario);
        HttpSession sessaoUsuario = request.getSession();

        if (usuarioAutenticado != null) {
            if ((usuarioAutenticado.getAtivo() == 1) & (usuarioAutenticado.getPerfilAdm() == 2)) {
                sessaoUsuario.setAttribute("usuario", usuarioAutenticado);
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else if ((usuarioAutenticado.getAtivo() == 1) & (usuarioAutenticado.getPerfilAdm() == 1)) {
                sessaoUsuario.setAttribute("usuario", usuarioAutenticado);
                request.getRequestDispatcher("Corporativo.jsp").forward(request, response);
            } else if (usuarioAutenticado.getAtivo() == 2){
                sessaoUsuario.setAttribute("usuario", usuarioAutenticado);
                response.sendRedirect("erroInativo.html");
            }
        } else {
            response.sendRedirect("erroLogin.html");
        }
    }

    public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

//        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
//        if (u.getPerfilAdm()== 2) {
//        HttpSession sessaoUsuario = request.getSession();
//        sessaoUsuario.invalidate();
//        response.sendRedirect("index.jsp");
        HttpSession sessaoUsuario = request.getSession();
        sessaoUsuario.invalidate();
        response.sendRedirect("login.html");
    }
}
