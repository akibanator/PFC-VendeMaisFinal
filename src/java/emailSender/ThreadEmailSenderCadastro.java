package emailSender;

import modelo.Usuario;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

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
                    InternetAddress.parse(email));
            message.setSubject("VendeMais Cadastro Realizado");
            /*message.setContent(" <p>Olá "+nome+",</p>\n" +
                                "<p>Seu cadastro na Vende Mais foi concluída com sucesso. Desejamos boas compras e boas vendas!</p>" +
                                "<p>E não se esqueça dos seus dados para efetuar login:</p>" +                               
                                "<p>Usuário: "+email+"<br>Senha: "+senha+"<br>" +
                                "<p>Lembrando que essas informações podem ser alteradas após login na Vende Mais.</p>"+
                                "<p>Atenciosamente,<br>Equipe Vende Mais</p> ", "text/html");*/

            MimeMultipart multipart = new MimeMultipart("related");

            BodyPart messageBodyPart = new MimeBodyPart();
            String htmlText = "<div align=\"center\"><img src=\"cid:image\"><h1>Olá " + nome + ",</h1>\n"
                    + "<p>Seu cadastro na Vende Mais foi concluída com sucesso. Desejamos boas compras e boas vendas!</p>"
                    + "<p>E não se esqueça dos seus dados para efetuar login:</p>"
                    + "<p>Usuário: " + email + "<br>Senha: " + senha + "<br>"
                    + "<p>Lembrando que essas informações podem ser alteradas após login na Vende Mais.</p>"
                    + "<p>Atenciosamente,<br>Equipe Vende Mais</p></div>";
            messageBodyPart.setContent(htmlText, "text/html");

            multipart.addBodyPart(messageBodyPart);

            messageBodyPart = new MimeBodyPart();
            DataSource fds = new FileDataSource("C:\\images\\welcome.jpg");
            messageBodyPart.setDataHandler(new DataHandler(fds));
            messageBodyPart.setHeader("Content-ID", "<image>");

            multipart.addBodyPart(messageBodyPart);

            message.setContent(multipart);

            Transport.send(message);

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }

    }
}
