package controle;

import dao.EnderecoDAO;
import dao.UsuarioDAO;
import emailSender.ThreadEmailSenderCadastro;
import emailSender.ThreadEmailSenderFeedBack;
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
import modelo.Feedback;
import modelo.PerfilAcesso;
import modelo.Usuario;
import org.apache.commons.mail.EmailException;

public class ControleFeedback extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String uri = request.getRequestURI();

        if (uri.equals(request.getContextPath() + "/enviarFeedback")) {
            try {
                enviarFeedback(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                request.getRequestDispatcher("erroCadastro.html").forward(request, response);
                Logger.getLogger(ControleUsuario.class.getName()).log(Level.SEVERE, null, ex);
            } catch (EmailException ex) {
                Logger.getLogger(ControleUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void enviarFeedback(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException, EmailException {

        String assunto = request.getParameter("assunto");
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String telefone = request.getParameter("telefone");
        String mensagem = request.getParameter("mensagem");
        
        Feedback feedback = new Feedback();
        feedback.setAssunto(assunto);
        feedback.setEmail(email);
        feedback.setNome(nome);
        feedback.setTelefone(telefone);
        feedback.setMensagem(mensagem);

        ThreadEmailSenderFeedBack thread1 = new ThreadEmailSenderFeedBack(feedback);
        

        request.getRequestDispatcher("sucessoUsuario.html").forward(request, response);
    }
}
