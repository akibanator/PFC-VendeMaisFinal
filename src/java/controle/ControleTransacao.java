package controle;

import dao.AnuncioDAO;
import dao.EnderecoDAO;
import dao.HistoricoDAO;
import dao.UsuarioDAO;
import emailSender.ThreadEmailSenderComprador;
import emailSender.ThreadEmailSenderVendedor;
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

    public void comprar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        int id = Integer.parseInt(request.getParameter("id"));

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (usuario != null) {
            
            Comprador comprador = new Comprador();
            comprador.setId(usuario.getId());   
            
            UsuarioDAO dao = new UsuarioDAO();
            dao.consultar(comprador);            
            
            Anuncio anuncio = new Anuncio();
            anuncio.setId(id);
            
            AnuncioDAO adao = new AnuncioDAO();
            adao.consultarPorId(anuncio);            
                        
            Vendedor vendedor = new Vendedor();
            vendedor.setId(anuncio.getVendedor().getId());
            
            UsuarioDAO udao = new UsuarioDAO();
            udao.consultar(vendedor);       
            
            Endereco endereco = new Endereco();
            endereco.setUsuario(comprador);
 
            EnderecoDAO edao = new EnderecoDAO(); 
            List<Endereco> todosEnderecos = edao.consultar(endereco);
            
            if (comprador.getId() != vendedor.getId()) { 
                request.setAttribute("resultadoEndereco", todosEnderecos);
                request.setAttribute("resultado", adao.consultarPorId(anuncio));
                request.setAttribute("resultadoComprador", dao.consultar(comprador));
                request.setAttribute("resultadoVendedor", udao.consultar(vendedor));
                request.getRequestDispatcher("compra.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("erroCompra.html").forward(request, response);
            }
        }
        request.getRequestDispatcher("fazerLogin.jsp").forward(request, response);
    }

    public void finalizarCompra(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {
        
        int id = Integer.parseInt(request.getParameter("idAnuncio"));
        int qtdDesejada = Integer.parseInt(request.getParameter("qt"));
        String enderecoEnvio = request.getParameter("txtendereco");

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (usuario != null) {

            Comprador comprador = new Comprador();
            comprador.setId(usuario.getId());
            
            UsuarioDAO dao = new UsuarioDAO();
            dao.consultar(comprador);
            
            Anuncio anuncio = new Anuncio();
            anuncio.setId(id);
            
            AnuncioDAO adao = new AnuncioDAO();
            adao.consultarPorId(anuncio);
            
            Vendedor vendedor = new Vendedor();
            vendedor.setId(anuncio.getVendedor().getId());
            
            UsuarioDAO udao = new UsuarioDAO();
            udao.consultar(vendedor);

            Compra compra = new Compra();
            compra.setAnuncio(anuncio);
            compra.setQuantidadeComprada(qtdDesejada);
            compra.setComprador(comprador);
            compra.setData_compra(new Date(System.currentTimeMillis()));
            compra.calcularSubtotal();
            compra.calcularTotal(); 
            compra.setVendedor(vendedor);
            compra.setEnderecoEnvio(enderecoEnvio);      
            compra.retiraEstoque(anuncio);
            
            adao.atualizarQuantidade(compra);

            HistoricoDAO hdao = new HistoricoDAO();
            hdao.gerarHistorico(compra);
            
            ThreadEmailSenderComprador thread = new ThreadEmailSenderComprador(comprador,vendedor,anuncio,compra);
            ThreadEmailSenderVendedor thread1 = new ThreadEmailSenderVendedor(comprador,vendedor,anuncio,compra);
            
            if (anuncio.getQuantidade()==0){                
                adao.encerrar(anuncio);               
            }

            request.getRequestDispatcher("sucessoGeral.html").forward(request, response);
        }
        request.getRequestDispatcher("fazerLogin.jsp").forward(request, response);
    }
}
