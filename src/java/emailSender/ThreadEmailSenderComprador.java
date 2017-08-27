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
import modelo.Anuncio;
import modelo.Compra;
import modelo.Comprador;
import modelo.Vendedor;

/**
 *
 * @author ailto
 */
public class ThreadEmailSenderComprador implements Runnable {

    private String anuncioTitulo;
    private String anuncioDescricao;
    private int anuncioQuantidade;
    private double anuncioPreco;
    private String anuncioFormaEnvio;

    private int compradorId;
    private String compradorNome;
    private String compradorEmail;

    private int vendedorId;
    private String vendedorNome;
    private String vendedorEmail;
    private int qtd;

    public ThreadEmailSenderComprador(Comprador comprador, Vendedor vendedor, Anuncio anuncio, Compra compra) {
        this.anuncioTitulo = anuncio.getTitulo();
        this.anuncioDescricao = anuncio.getDescricao();
        this.anuncioQuantidade = anuncio.getQuantidade();
        this.anuncioPreco = anuncio.getPreco();
        this.anuncioFormaEnvio = anuncio.getDescricao();

        this.compradorId = comprador.getId();
        this.compradorNome = comprador.getNome();
        this.compradorEmail = comprador.getEmail();

        this.vendedorId = vendedor.getId();
        this.vendedorNome = vendedor.getNome();
        this.vendedorEmail = vendedor.getEmail();
        this.qtd = compra.getQuantidadeComprada();
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
                    InternetAddress.parse(compradorEmail));
            message.setSubject("VendeMais Compra Realizada");
            message.setText("Olá " + compradorNome + ", o pedido de compra do produto " + anuncioTitulo + " do vendedor " + vendedorNome + " foi realizado.");

            Transport.send(message);

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }

    }

}
