package controle;

import dao.CategoriaDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Categoria;
import modelo.PerfilAcesso;
import modelo.Usuario;

public class ControleCategoria extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.equals(request.getContextPath() + "/consultarCategoria")) {
            try {
                consultar(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erroGeral.html").forward(request, response);
                Logger.getLogger(ControleCategoria.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (uri.equals(request.getContextPath() + "/desativarCategoria")) {
            try {
                desativar(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erroGeral.html").forward(request, response);
                Logger.getLogger(ControleCategoria.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (uri.equals(request.getContextPath() + "/ativarCategoria")) {
            try {
                ativar(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erroGeral.html").forward(request, response);
                Logger.getLogger(ControleCategoria.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.equals(request.getContextPath() + "/cadastrarCategoria")) {
            try {
                cadastrar(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erroGeral.html").forward(request, response);
                Logger.getLogger(ControleCategoria.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (uri.equals(request.getContextPath() + "/alterarCategoria")) {
            try {
                alterar(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erroGeral.html").forward(request, response);
                Logger.getLogger(ControleCategoria.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void cadastrar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        String cat = request.getParameter("nomeCat");

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (usuario != null) {
            usuario.getId();

            Categoria categoria = new Categoria();
            categoria.setNome(cat);
            categoria.setAtivo(1);

            CategoriaDAO dao = new CategoriaDAO();
            dao.cadastrar(categoria);

            this.consultar(request, response);

        } else {
            request.getRequestDispatcher("erroSessao.html").forward(request, response);
        }
    }

    public void alterar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        String nome = request.getParameter("nomeCat");
        int id = Integer.parseInt(request.getParameter("idCategoria"));

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (usuario != null) {
            Categoria categoria = new Categoria();
            categoria.setId(id);
            categoria.setNome(nome);

            CategoriaDAO dao = new CategoriaDAO();
            dao.alterar(categoria);

            this.consultar(request, response);

        } else {
            request.getRequestDispatcher("erroSessao.html").forward(request, response);
        }
    }

    public void desativar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        int id = Integer.parseInt(request.getParameter("idCategoria")); //recupera campo descricao do formulario
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (usuario != null) {
            Categoria categoria = new Categoria();
            categoria.setId(id);

            CategoriaDAO dao = new CategoriaDAO();
            dao.desativar(categoria);

            this.consultar(request, response);
        } else {
            request.getRequestDispatcher("erroSessao.html").forward(request, response);
        }
    }

    public void ativar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        int id = Integer.parseInt(request.getParameter("idCategoria")); //recupera campo descricao do formulario
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (usuario != null) {
            Categoria categoria = new Categoria();
            categoria.setId(id);

            CategoriaDAO dao = new CategoriaDAO();
            dao.ativar(categoria);

            this.consultar(request, response);
        } else {
            request.getRequestDispatcher("erroSessao.html").forward(request, response);
        }
    }

    public void consultar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (usuario != null) {

            CategoriaDAO dao = new CategoriaDAO();
            List<Categoria> todosCategorias = dao.consultar();

            request.setAttribute("resultado", todosCategorias);
            if (usuario.getPerfil() == PerfilAcesso.adm){
                request.getRequestDispatcher("/adm/consultaCategoria.jsp").forward(request, response);
            }else{
                request.getRequestDispatcher("/colaborador/consultaCategoria.jsp").forward(request, response);
            }
        } else {
            request.getRequestDispatcher("erroSessao.html").forward(request, response);
        }
    }
}
