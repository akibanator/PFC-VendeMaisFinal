package controle;

import dao.EnderecoDAO;
import dao.UsuarioDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Endereco;
import modelo.Usuario;

public class ControleUsuario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String uri = request.getRequestURI();

        if (uri.equals(request.getContextPath() + "/recuperarConta")) {
            try {
                recuperar(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(ControleUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (uri.equals(request.getContextPath() + "/recuperarMensagem")) {
            try {
                recuperarMensagem(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(ControleUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (uri.equals(request.getContextPath() + "/consultarConta")) {
            try {
                consultar(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(ControleUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (uri.equals(request.getContextPath() + "/desativarConta")) {
            try {
                desativar(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(ControleUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String uri = request.getRequestURI();

        if (uri.equals(request.getContextPath() + "/cadastrarConta")) {
            try {
                cadastrar(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(ControleUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (uri.equals(request.getContextPath() + "/alterarConta")) {
            try {
                alterar(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(ControleUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        }else if (uri.equals(request.getContextPath() + "/ativarConta")) {
            try {
                ativar(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(ControleUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void cadastrar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        String cpf = request.getParameter("cpf");
        String email = request.getParameter("email");
        String nome = request.getParameter("nome");
        String senha = request.getParameter("senha");
        String telefone = request.getParameter("telefone");
        int adm = Integer.parseInt(request.getParameter("perfil"));

        Usuario u = new Usuario();
        u.setCpf(cpf);
        u.setEmail(email);
        u.setNome(nome);
        u.setSenha(senha);
        u.setTelefone(telefone);
        u.setAtivo(1);
        u.setPerfilAdm(adm);

        UsuarioDAO dao = new UsuarioDAO();
        dao.cadastrar(u);

        request.getRequestDispatcher("sucessoUsuario.html").forward(request, response);
    }

    public void recuperar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        String senha = request.getParameter("senha");
        String telefone = request.getParameter("telefone");
        String email = request.getParameter("email");

        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
        if (u != null) {
            u.getId();
            u.setSenha(senha);
            u.setTelefone(telefone);
            u.setEmail(email);

            UsuarioDAO dao = new UsuarioDAO();
            dao.consultar(u);
            dao.alterar(u);

            request.setAttribute("resultado", u);
            request.getRequestDispatcher("alterarDadosConta.jsp").forward(request, response);
        }else{
            request.getRequestDispatcher("erroSessao.html").forward(request, response);
        }       
    }

    public void recuperarMensagem(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
        if (u != null) {
            u.getId();

            UsuarioDAO dao = new UsuarioDAO();
            dao.consultar(u);

            request.setAttribute("resultado", u);
            request.getRequestDispatcher("contato.jsp").forward(request, response);
        }else{
            request.getRequestDispatcher("erroSessao.html").forward(request, response);
        }
}

    public void alterar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        String senha = request.getParameter("senha");
        String telefone = request.getParameter("telefone");
        String email = request.getParameter("email");

        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
        if (u != null) {
            u.getId();
            u.setSenha(senha);
            u.setTelefone(telefone);
            u.setEmail(email);

            UsuarioDAO dao = new UsuarioDAO();
            dao.alterar(u);

            request.setAttribute("resultado", u);
            request.getRequestDispatcher("sucessoGeral.html").forward(request, response);
        }else{
            request.getRequestDispatcher("erroSessao.html").forward(request, response);
        }        
    }

    public void desativar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
        if (u != null) {
            u.getId();

            UsuarioDAO dao = new UsuarioDAO();
            dao.desativar(u);

            HttpSession sessaoUsuario = request.getSession();
            sessaoUsuario.invalidate();
            response.sendRedirect("index.jsp");
        }else{
            request.getRequestDispatcher("erroSessao.html").forward(request, response);
        }
        
    }

    public void ativar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        String login = request.getParameter("usuario");

        Usuario usuario = new Usuario();
        usuario.setEmail(login);

        UsuarioDAO dao = new UsuarioDAO();
        dao.ativar(usuario);

        response.sendRedirect("sucessoAtivacao.html");
    }

    public void consultar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
        if (u != null) {

            u.getId();
            UsuarioDAO udao = new UsuarioDAO();
            udao.consultar(u);

            Endereco e = new Endereco();
            e.setUsuario(u.getId());

            EnderecoDAO edao = new EnderecoDAO();
            List<Endereco> todosEnderecos = edao.consultar(e);

            request.setAttribute("resultado", u);
            request.setAttribute("resultadoE", todosEnderecos);
            request.getRequestDispatcher("consultaDados.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("fazerLogin.jsp").forward(request, response);
        }
    }
}
