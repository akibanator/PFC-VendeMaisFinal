/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package emailSender;

import java.util.Properties;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import modelo.Usuario;

/**
 *
 * @author ailto
 */
public class EmailSender {

    public void enviarEmailCadastro(Usuario usuario) {

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
                    .parse(usuario.getEmail()); //Pega o email para enviar
            message.setRecipients(Message.RecipientType.TO, toUser);
            message.setSubject("VendeMais Cadastro Realizado");//Assunto
            message.setText("Bem vindo ao VendeMais, sua conta foi criada com sucesso com o login " + usuario.getEmail() + " e a senha: " + usuario.getSenha() + ". Tenha ótimas compras e vendas. Atenciosamente. Equipe VendeMais");

            //Método para enviar a mensagem criada
            Transport.send(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }

    }

}