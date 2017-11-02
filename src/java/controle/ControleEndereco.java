package controle;

import dao.EnderecoDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Endereco;
import modelo.Usuario;

public class ControleEndereco extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.equals(request.getContextPath() + "/excluirEndereco")) {
            try {
                excluir(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erroGeral.html").forward(request, response);
                Logger.getLogger(ControleEndereco.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.equals(request.getContextPath() + "/cadastrarEndereco")) {
            try {
                cadastrar(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erroEndereco.html").forward(request, response);
                Logger.getLogger(ControleEndereco.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (uri.equals(request.getContextPath() + "/alterarEndereco")) {
            try {
                alterar(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erroGeral.html").forward(request, response);
                Logger.getLogger(ControleEndereco.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void cadastrar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        String bairro = request.getParameter("bairro");
        String cep = request.getParameter("cep");
        String cidade = request.getParameter("cidade"); //recupera campo descricao do formulario
        String complemento = request.getParameter("complemento");
        String estado = request.getParameter("uf");
        String numero = request.getParameter("numero");
        String rua = request.getParameter("rua");

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (usuario != null) {
            usuario.getId();

            Endereco endereco = new Endereco();
            endereco.setBairro(bairro);
            endereco.setCep(cep);
            endereco.setCidade(cidade);
            endereco.setComplemento(complemento);
            endereco.setEstado(estado);
            endereco.setNumero(numero);
            endereco.setRua(rua);
            endereco.setUsuario(usuario);

            EnderecoDAO dao = new EnderecoDAO();

            if (dao.cadastrar(endereco)) {
                ControleUsuario c = new ControleUsuario();
                c.consultar(request, response);
            } else {
                request.getRequestDispatcher("erroEndereco.html").forward(request, response);
            }
        }
        request.getRequestDispatcher("erroSessao.html").forward(request, response);
    }

    public void alterar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        String bairro = request.getParameter("bairro1");
        String cep = request.getParameter("cep1");
        String cidade = request.getParameter("cidade1"); //recupera campo descricao do formulario
        String complemento = request.getParameter("complemento1");
        String estado = request.getParameter("uf1");
        String numero = request.getParameter("numero1");
        String rua = request.getParameter("rua1");
        int id = Integer.parseInt(request.getParameter("idEndereco"));

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (usuario != null) {
            Endereco endereco = new Endereco();
            endereco.setId(id);
            endereco.setBairro(bairro);
            endereco.setCep(cep);
            endereco.setCidade(cidade);
            endereco.setComplemento(complemento);
            endereco.setEstado(estado);
            endereco.setNumero(numero);
            endereco.setRua(rua);

            EnderecoDAO dao = new EnderecoDAO();
            dao.alterar(endereco);

            ControleUsuario c = new ControleUsuario();
            c.consultar(request, response);

            request.setAttribute("resultado", endereco);
            request.getRequestDispatcher("pgs/consultaDados.jsp").forward(request, response);
        }
        request.getRequestDispatcher("erroSessao.html").forward(request, response);
    }

    public void excluir(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        int id = Integer.parseInt(request.getParameter("idEndereco")); //recupera campo descricao do formulario
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");

        if (usuario != null) {

            Endereco endereco = new Endereco();
            endereco.setId(id);

            EnderecoDAO dao = new EnderecoDAO();
            dao.excluir(endereco);

            ControleUsuario c = new ControleUsuario();
            c.consultar(request, response);

            request.getRequestDispatcher("pgs/consultaDados.jsp").forward(request, response);
        }
        request.getRequestDispatcher("erroSessao.html").forward(request, response);
    }
}
