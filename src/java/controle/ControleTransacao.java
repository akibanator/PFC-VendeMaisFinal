package controle;

import dao.AnuncioDAO;
import dao.EnderecoDAO;
import dao.HistoricoDAO;
import dao.UsuarioDAO;
import emailSender.EmailSender;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Anuncio;
import modelo.Compra;
import modelo.Comprador;
import modelo.Endereco;
import modelo.Usuario;
import modelo.Vendedor;

public class ControleTransacao extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.equals(request.getContextPath() + "/comprar")) {
            try {
                comprar(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erro.html").forward(request, response);
                Logger.getLogger(ControleAnuncio.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (uri.equals(request.getContextPath() + "/finalizarCompra")) {
            try {
                finalizarCompra(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erro.html").forward(request, response);
                Logger.getLogger(ControleAnuncio.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }

    public void comprar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        int id = Integer.parseInt(request.getParameter("id"));

        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
        if (u != null) {
            
            Comprador us = new Comprador();
            us.setId(u.getId());   
            
            UsuarioDAO c = new UsuarioDAO();
            c.consultar(us);            
            
            Anuncio a = new Anuncio();
            a.setId(id);
            
            AnuncioDAO dao = new AnuncioDAO();
            dao.consultarPorId(a);            
                        
            Vendedor v = new Vendedor();
            v.setId(a.getVendedor());
            
            UsuarioDAO vu = new UsuarioDAO();
            vu.consultar(v);       
            
            Endereco e = new Endereco();
            e.setUsuario(us.getId());
 
            EnderecoDAO edao = new EnderecoDAO(); 
            List<Endereco> todosEnderecos = edao.consultar(e);
            
            if (us.getId() != v.getId()) { 
                request.setAttribute("resultadoEndereco", todosEnderecos);
                request.setAttribute("resultado", dao.consultarPorId(a));
                request.setAttribute("resultadoComprador", c.consultar(us));
                request.setAttribute("resultadoVendedor", vu.consultar(v));
                request.getRequestDispatcher("compra.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("erroCompra.html").forward(request, response);
            }
        }
        request.getRequestDispatcher("erroSessao.html").forward(request, response);
    }

    public void finalizarCompra(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {
        
        int id = Integer.parseInt(request.getParameter("idAnuncio"));
        int qtdDesejada = Integer.parseInt(request.getParameter("qt"));
        String enderecoEnvio = request.getParameter("txtendereco");

        Usuario u = (Usuario) request.getSession().getAttribute("usuario");
        if (u != null) {

            Comprador us = new Comprador();
            us.setId(u.getId());
            UsuarioDAO cd = new UsuarioDAO();
            cd.consultar(us);

            Anuncio a = new Anuncio();
            a.setId(id);
            AnuncioDAO ad = new AnuncioDAO();
            ad.consultarPorId(a);
            
            Vendedor v = new Vendedor();
            v.setId(a.getVendedor());
            UsuarioDAO vd = new UsuarioDAO();
            vd.consultar(v);

            Compra c = new Compra();
            c.setAnuncio(a);
            c.setQuantidadeComprada(qtdDesejada);
            c.setComprador(us);
            c.setData_compra(new Date(System.currentTimeMillis()));
            c.calcularSubtotal();
            c.calcularTotal(); 
            c.setVendedor(v);
            c.setEnderecoEnvio(enderecoEnvio);      
            c.retiraEstoque(a);
            
            ad.vender(c);

            HistoricoDAO dao = new HistoricoDAO();
            dao.gerarHistorico(c);
            
//            EmailSender emailSender = new EmailSender();
//            emailSender.enviarEmailComprador(us, v, a);
//            emailSender.enviarEmailVendedor(us, v, a);
            
            if (a.getQuantidade()==0){                
                ad.encerrar(a);               
            }

            request.getRequestDispatcher("sucessoGeral.html").forward(request, response);
        }
        request.getRequestDispatcher("erroSessao.html").forward(request, response);
    }
}
