package modelo;

import java.sql.Date;

public class Anuncio {

    private int id;
    private Vendedor vendedor;
    private String titulo;
    private String fotos;
    private String descricao;
    private String estadoprod;
    private int quantidade;
    private double preco;
    private String peso;
    private String largura;
    private String altura;
    private String cep;
    private String bairro;
    private String cidade;
    private String estado;
    private String rua;
    private String vaga;
    private String area;
    private String areatotal;
    private String ano;
    private String marca;
    private String cor;
    private Categoria categoria;
    private SubCategoria subcategoria;
    private Date data_cadastro;
    private String endereco;
    private int ativo;
    private double valorFrete;
    private String formaEnvio;
    private String observacoes;
    private String pic1;
    private String pic2;
    private String pic3;
    private String pic4;
    private String pic5;

    public String getPic5() {
        return pic5;
    }

    public void setPic5(String pic5) {
        this.pic5 = pic5;
    }

    public String getPic1() {
        return pic1;
    }

    public void setPic1(String pic1) {
        this.pic1 = pic1;
    }

    public String getPic2() {
        return pic2;
    }

    public void setPic2(String pic2) {
        this.pic2 = pic2;
    }

    public String getPic3() {
        return pic3;
    }

    public void setPic3(String pic3) {
        this.pic3 = pic3;
    }

    public String getPic4() {
        return pic4;
    }

    public void setPic4(String pic4) {
        this.pic4 = pic4;
    }

    public String getEstadoprod() {
        return estadoprod;
    }

    public void setEstadoprod(String estadoprod) {
        this.estadoprod = estadoprod;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getRua() {
        return rua;
    }

    public void setRua(String rua) {
        this.rua = rua;
    }

    public String getVaga() {
        return vaga;
    }

    public void setVaga(String vaga) {
        this.vaga = vaga;
    }

    public String getAno() {
        return ano;
    }

    public void setAno(String ano) {
        this.ano = ano;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getCor() {
        return cor;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }

    public String getObservacoes() {
        return observacoes;
    }

    public void setObservacoes(String observacoes) {
        this.observacoes = observacoes;
    }

    public int getAtivo() {
        return ativo;
    }

    public void setAtivo(int ativo) {
        this.ativo = ativo;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public double getValorFrete() {
        return valorFrete;
    }

    public void setValorFrete(double valorFrete) {
        this.valorFrete = valorFrete;
    }

    public String getFormaEnvio() {
        return formaEnvio;
    }

    public void setFormaEnvio(String formaEnvio) {
        this.formaEnvio = formaEnvio;
    }

    public Date getData_cadastro() {
        return data_cadastro;
    }

    public void setData_cadastro(Date data_cadastro) {
        this.data_cadastro = data_cadastro;
    }

    public String getPeso() {
        return peso;
    }

    public void setPeso(String peso) {
        this.peso = peso;
    }

    public String getLargura() {
        return largura;
    }

    public void setLargura(String largura) {
        this.largura = largura;
    }

    public String getAltura() {
        return altura;
    }

    public void setAltura(String altura) {
        this.altura = altura;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getAreatotal() {
        return areatotal;
    }

    public void setAreatotal(String areatotal) {
        this.areatotal = areatotal;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Vendedor getVendedor() {
        return vendedor;
    }

    public void setVendedor(Vendedor vendedor) {
        this.vendedor = vendedor;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getFotos() {
        return fotos;
    }

    public void setFotos(String fotos) {
        this.fotos = fotos;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    public SubCategoria getSubcategoria() {
        return subcategoria;
    }

    public void setSubcategoria(SubCategoria subcategoria) {
        this.subcategoria = subcategoria;
    }

}
