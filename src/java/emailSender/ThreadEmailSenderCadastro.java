package emailSender;

import modelo.Usuario;
import java.util.Properties;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class ThreadEmailSenderCadastro implements Runnable {
    
    private int id;
    private String nome;
    private String email;
    private String cpf;
    private String senha;
    
    public ThreadEmailSenderCadastro(Usuario usuario) {
        this.nome = usuario.getNome();
        this.email = usuario.getEmail();
        this.cpf = usuario.getCpf();
        this.senha = usuario.getSenha();
        this.id = usuario.getId();
        Thread t = new Thread(this);
        t.start();
    }

    @Override
    public void run() {
        
        Properties props = new Properties();

        //Parâmetros de conexão com servidor Gmail
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");

        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("projetovendemais@gmail.com", "60708090");
            }
        });

        //Ativa Debug para sessão
        session.setDebug(true);
        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("projetovendemais@gmail.com")); //Remetente

            Address[] toUser = InternetAddress //Destinatário(s)
                    .parse(email); //Pega o email para enviar
            message.setRecipients(Message.RecipientType.TO, toUser);
            message.setSubject("VendeMais Cadastro Realizado");//Assunto
            message.setText("Bem vindo ao VendeMais" + nome + ", sua conta foi criada com sucesso com o login " + email + " e a senha: " + senha + ". Tenha ótimas compras e vendas. Atenciosamente. Equipe VendeMais");

            //Método para enviar a mensagem criada
            Transport.send(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }      
    }    
}
