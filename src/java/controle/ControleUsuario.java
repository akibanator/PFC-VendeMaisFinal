package controle;

import dao.EnderecoDAO;
import dao.UsuarioDAO;
import emailSender.ThreadEmailSenderCadastro;
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
import modelo.PerfilAcesso;
import modelo.Usuario;

public class ControleUsuario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String uri = request.getRequestURI();

        if (uri.equals(request.getContextPath() + "/consultarConta")) {
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
        } else if (uri.equals(request.getContextPath() + "/consultarContasAdm")) {
            try {
                consultarAdm(request, response);
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
        } else if (uri.equals(request.getContextPath() + "/ativarConta")) {
            try {
                ativar(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(ControleUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (uri.equals(request.getContextPath() + "/cadastrarContaAdm")) {
            try {
                cadastrarAdm(request, response);
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

        Usuario usuario = new Usuario();
        usuario.setCpf(cpf);
        usuario.setEmail(email);
        usuario.setNome(nome);
        usuario.setSenha(senha);
        usuario.setTelefone(telefone);
        usuario.setAtivo(1);
        usuario.setPerfil(PerfilAcesso.comum);

        UsuarioDAO dao = new UsuarioDAO();
        dao.cadastrar(usuario);

        ThreadEmailSenderCadastro thread = new ThreadEmailSenderCadastro(usuario);

        request.getRequestDispatcher("sucessoUsuario.html").forward(request, response);
    }

    public void cadastrarAdm(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        String cpf = request.getParameter("cpf");
        String email = request.getParameter("email");
        String nome = request.getParameter("nome");
        String senha = request.getParameter("senha");
        String telefone = request.getParameter("telefone");

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (usuario != null) {

            Usuario usuarioAdm = new Usuario();
            usuarioAdm.setCpf(cpf);
            usuarioAdm.setEmail(email);
            usuarioAdm.setNome(nome);
            usuarioAdm.setSenha(senha);
            usuarioAdm.setTelefone(telefone);
            usuarioAdm.setAtivo(1);
            usuarioAdm.setPerfil(PerfilAcesso.adm);

            UsuarioDAO dao = new UsuarioDAO();
            dao.cadastrar(usuarioAdm);

            ThreadEmailSenderCadastro thread = new ThreadEmailSenderCadastro(usuarioAdm);

            if (usuario.getPerfil() == PerfilAcesso.adm) {
                request.getRequestDispatcher("sucessoUsuario.html").forward(request, response);
            } else {
                request.getRequestDispatcher("acessonegado.jsp").forward(request, response);
            }

        } else {
            request.getRequestDispatcher("../erroSessao.html").forward(request, response);
        }
    }

    public void consultarAdm(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (usuario != null) {
            
            if (usuario.getPerfil() == PerfilAcesso.adm) {
                UsuarioDAO dao = new UsuarioDAO();
                request.setAttribute("resultado", dao.consultarAdm());
                request.getRequestDispatcher("admin/consultaListaAdm.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("acessonegado.jsp").forward(request, response);
            }

        } else {
            request.getRequestDispatcher("fazerLogin.jsp").forward(request, response);
        }
    }

    public void alterar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        String senha = request.getParameter("senha");
        String telefone = request.getParameter("telefone");
        String email = request.getParameter("email");

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (usuario != null) {
            usuario.getId();
            usuario.setSenha(senha);
            usuario.setTelefone(telefone);
            usuario.setEmail(email);

            UsuarioDAO dao = new UsuarioDAO();
            dao.alterar(usuario);
            consultar(request, response);

            request.setAttribute("resultado", usuario);
            request.getRequestDispatcher("pgs/consultaDados.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("erroSessao.html").forward(request, response);
        }
    }

    public void desativar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (usuario != null) {
            usuario.getId();

            UsuarioDAO dao = new UsuarioDAO();
            dao.desativar(usuario);

            HttpSession sessaoUsuario = request.getSession();
            sessaoUsuario.invalidate();
            response.sendRedirect("index.jsp");
        } else {
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

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (usuario != null) {

            usuario.getId();

            UsuarioDAO dao = new UsuarioDAO();
            dao.consultar(usuario);

            Endereco endereco = new Endereco();
            endereco.setUsuario(usuario);

            EnderecoDAO edao = new EnderecoDAO();
            List<Endereco> todosEnderecos = edao.consultar(endereco);

            usuario.setEndereco(todosEnderecos);

            request.setAttribute("resultado", usuario);

            if (usuario.getPerfil() == PerfilAcesso.adm) {
                request.getRequestDispatcher("/admin/consultaDados_1.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("pgs/consultaDados.jsp").forward(request, response);
            }
        } else {
            request.getRequestDispatcher("fazerLogin.jsp").forward(request, response);
        }
    }
}
