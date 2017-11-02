package controle;

import dao.CategoriaDAO;
import dao.SubCategoriaDAO;
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
import modelo.SubCategoria;
import modelo.Usuario;

public class ControleSubCategoria extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.equals(request.getContextPath() + "/consultarSubCategoria")) {
            try {
                consultar(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erroGeral.html").forward(request, response);
                Logger.getLogger(ControleSubCategoria.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (uri.equals(request.getContextPath() + "/desativarSubCategoria")) {
            try {
                desativar(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erroGeral.html").forward(request, response);
                Logger.getLogger(ControleSubCategoria.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (uri.equals(request.getContextPath() + "/ativarSubCategoria")) {
            try {
                ativar(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erroGeral.html").forward(request, response);
                Logger.getLogger(ControleSubCategoria.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.equals(request.getContextPath() + "/cadastrarSubCategoria")) {
            try {
                cadastrar(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erroGeral.html").forward(request, response);
                Logger.getLogger(ControleSubCategoria.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (uri.equals(request.getContextPath() + "/alterarSubCategoria")) {
            try {
                alterar(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erroGeral.html").forward(request, response);
                Logger.getLogger(ControleSubCategoria.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void cadastrar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        String sub = request.getParameter("nomeSub");
        int id = Integer.parseInt(request.getParameter("idCategoria"));

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (usuario != null) {
            usuario.getId();
            Categoria categoria = new Categoria();
            categoria.setId(id);
            SubCategoria subcategoria = new SubCategoria();
            subcategoria.setNome(sub);
            subcategoria.setAtivo(1);

            SubCategoriaDAO dao = new SubCategoriaDAO();
            dao.cadastrar(subcategoria, categoria);
            this.consultar(request, response);
        } else {
            request.getRequestDispatcher("erroSessao.html").forward(request, response);
        }
    }

    public void alterar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        String nome = request.getParameter("nomeSub");
        int id = Integer.parseInt(request.getParameter("idSub"));

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (usuario != null) {
            SubCategoria subcategoria = new SubCategoria();
            subcategoria.setId(id);
            subcategoria.setNome(nome);

            SubCategoriaDAO dao = new SubCategoriaDAO();
            dao.alterar(subcategoria);
            this.consultar(request, response);
        }
        request.getRequestDispatcher("erroSessao.html").forward(request, response);
    }

    public void desativar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        int id = Integer.parseInt(request.getParameter("idSubCategoria")); //recupera campo descricao do formulario
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (usuario != null) {
            SubCategoria subcategoria = new SubCategoria();
            subcategoria.setId(id);
            SubCategoriaDAO dao = new SubCategoriaDAO();
            dao.desativar(subcategoria);
            this.consultar(request, response);
        }
        request.getRequestDispatcher("erroSessao.html").forward(request, response);
    }

    public void ativar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        int id = Integer.parseInt(request.getParameter("idSubCategoria")); //recupera campo descricao do formulario
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (usuario != null) {
            SubCategoria subcategoria = new SubCategoria();
            subcategoria.setId(id);
            SubCategoriaDAO dao = new SubCategoriaDAO();
            dao.ativar(subcategoria);
            this.consultar(request, response);
        }
        request.getRequestDispatcher("erroSessao.html").forward(request, response);
    }

    public void consultar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (usuario != null) {

            CategoriaDAO dao = new CategoriaDAO();
            List<Categoria> todosCategorias = dao.consultar();

            request.setAttribute("resultado", todosCategorias);
            request.getRequestDispatcher("admin/consultaCategoria.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("erroSessao.html").forward(request, response);
        }
    }
}
