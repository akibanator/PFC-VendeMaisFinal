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

public class ThreadEmailSenderVendedor implements Runnable {

    private String anuncioTitulo;
    private int compraQuantidade;
    private String anuncioFormaEnvio;
    private String anuncioFormaPagamento;
    private int anuncioPrazoEntrega;

    private String compradorNome;
    private String compradorEmail;
    private String compradorTelefone;

    private int vendedorId;
    private String vendedorNome;
    private String vendedorEmail;
    
    private String compraEndereco;
    private double compraTotal;


    public ThreadEmailSenderVendedor(Comprador comprador, Vendedor vendedor, Anuncio anuncio, Compra compra) {
        this.anuncioTitulo = anuncio.getTitulo();
        this.compraQuantidade = compra.getQuantidadeComprada();
        this.anuncioFormaEnvio = anuncio.getFormaEnvio();
        this.anuncioFormaPagamento = anuncio.getFormapag();
        this.anuncioPrazoEntrega = anuncio.getPrazo_entrega();

        this.compradorNome = comprador.getNome();
        this.compradorEmail = comprador.getEmail();
        this.compradorTelefone = comprador.getTelefone();

        this.vendedorId = vendedor.getId();
        this.vendedorNome = vendedor.getNome();
        this.vendedorEmail = vendedor.getEmail();
        
        this.compraEndereco = compra.getEnderecoEnvio();
        this.compraTotal = compra.getTotal();

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
                    InternetAddress.parse(vendedorEmail));
            message.setSubject("Venda realizada - Vende Mais");
            message.setContent(" <p>Prezado(a) "+vendedorNome+",</p>" +
                                "<p>O seu produto foi vendido com sucesso. Segue dados da venda:</p>" +
                                "<p>" +
                                "Produto: "+anuncioTitulo+"<br>Quantidade: "+compraQuantidade+"<br>Total da compra: "+compraTotal+"<br>Endereço para envio: "+compraEndereco+"<br>Prazo de entrega estimado: "+anuncioPrazoEntrega+"<br>Forma de pagamento: "+anuncioFormaPagamento+"<br>Comprador: "+compradorNome+"<br>E-mail: "+compradorEmail+"<br>Telefone: "+compradorTelefone+"<br>" +
                                "</p>" +
                                "<p>Atenciosamente,<br>Equipe Vende Mais.</p>", "text/html");
            Transport.send(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }

    }
}
