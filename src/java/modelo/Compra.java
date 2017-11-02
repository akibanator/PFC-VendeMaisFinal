package modelo;

import java.sql.Date;

public class Compra {

    private int id;
    private Comprador comprador;
    private Vendedor vendedor;
    private int quantidadeComprada;
    private Date data_compra;
    private Anuncio anuncio;
    private double subtotal;
    private double total;
    private String enderecoEnvio;

    public String getEnderecoEnvio() {
        return enderecoEnvio;
    }

    public void setEnderecoEnvio(String enderecoEnvio) {
        this.enderecoEnvio = enderecoEnvio;
    }

    public Vendedor getVendedor() {
        return vendedor;
    }

    public void setVendedor(Vendedor vendedor) {
        this.vendedor = vendedor;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Comprador getComprador() {
        return comprador;
    }

    public void setComprador(Comprador comprador) {
        this.comprador = comprador;
    }

    public int getQuantidadeComprada() {
        return quantidadeComprada;
    }

    public void setQuantidadeComprada(int quantidadeComprada) {
        this.quantidadeComprada = quantidadeComprada;
    }

    public Date getData_compra() {
        return data_compra;
    }

    public void setData_compra(Date data_compra) {
        this.data_compra = data_compra;
    }

    public Anuncio getAnuncio() {
        return anuncio;
    }

    public void setAnuncio(Anuncio anuncio) {
        this.anuncio = anuncio;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public double calcularTotal() {
        total = this.getSubtotal() + this.anuncio.getValorFrete();
        return total;
    }

    public double calcularSubtotal() {
        subtotal = this.getQuantidadeComprada() * this.anuncio.getPreco();
        return subtotal;
    }    
}
