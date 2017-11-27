package emailSender;

import static java.lang.System.out;
import modelo.Usuario;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import modelo.Feedback;

public class ThreadEmailSenderFeedBack implements Runnable {

    private String assunto;
    private String nome;
    private String email;
    private String telefone;
    private String mensagem;

    public ThreadEmailSenderFeedBack(Feedback feedback) {
        this.assunto = feedback.getAssunto();
        this.nome = feedback.getNome();
        this.email = feedback.getEmail();
        this.telefone = feedback.getTelefone();
        this.mensagem = feedback.getMensagem();

        Thread t = new Thread(this);
        t.start();
    }

    @Override
    public void run() {

        final String username = "projetovendemais@gmail.com";
        final String password = "60708090";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("from-email@gmail.com"));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse("projetovendemais@gmail.com"));
            message.setSubject("FeedBack - "+assunto);
            message.setContent(" <p>Prezado colaborador,</p>" +
                                "<p>Segue feedback enviado pela "+nome+":</p>" +
                                "<p>"+mensagem+"</p>" +
                                "<br>" +
                                "<p>De:"+nome+" <br>E-mail: "+email+"<br>Telefone:"+telefone+"</p>" +
                                "<p>Atenciosamente,<br>Equipe Vende Mais</p> ", "text/html");
            Transport.send(message);

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }

    }
}
