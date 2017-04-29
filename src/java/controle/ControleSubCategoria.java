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
                request.getRequestDispatcher("erro.html").forward(request, response);
                Logger.getLogger(ControleSubCategoria.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (uri.equals(request.getContextPath() + "/excluirSubCategoria")) {
            try {
                excluir(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erro.html").forward(request, response);
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
                request.getRequestDispatcher("erroSubCategoria.html").forward(request, response);
                Logger.getLogger(ControleSubCategoria.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (uri.equals(request.getContextPath() + "/alterarSubCategoria")) {
            try {
                alterar(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erro.html").forward(request, response);
                Logger.getLogger(ControleSubCategoria.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void cadastrar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        String subcategoria = request.getParameter("nomeSub");
        int id = Integer.parseInt(request.getParameter("idCategoria"));

        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
        if (u != null) {
            u.getId();
            Categoria ca = new Categoria();
            ca.setId(id);
            SubCategoria c = new SubCategoria();
            c.setNome(subcategoria);

            SubCategoriaDAO dao = new SubCategoriaDAO();
            dao.cadastrar(c, ca);
            this.consultar(request, response);
        } else {
            request.getRequestDispatcher("erroSessao.html").forward(request, response);
        }
    }

    public void alterar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        String nome = request.getParameter("nomeSub");
        int id = Integer.parseInt(request.getParameter("idSub"));

        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
        if (u != null) {
            SubCategoria e = new SubCategoria();
            e.setId(id);
            e.setNome(nome);

            SubCategoriaDAO dao = new SubCategoriaDAO();
            dao.alterar(e);
            this.consultar(request, response);
        }
        request.getRequestDispatcher("erroSessao.html").forward(request, response);
    }

    public void excluir(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        int id = Integer.parseInt(request.getParameter("idSubCategoria")); //recupera campo descricao do formulario
        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
        if (u != null) {
            SubCategoria e = new SubCategoria();
            SubCategoriaDAO dao = new SubCategoriaDAO();

            e.setId(id);
            dao.excluir(e);
            this.consultar(request, response);
        }
        request.getRequestDispatcher("erroSessao.html").forward(request, response);
    }

    public void consultar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
        if (u != null) {
            
            CategoriaDAO edao = new CategoriaDAO();
            List<Categoria> todosCategorias = edao.consultar();
            
            request.setAttribute("resultado", todosCategorias);
            request.getRequestDispatcher("consultaCategoria.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("erroSessao.html").forward(request, response);
        }
    }       
}
