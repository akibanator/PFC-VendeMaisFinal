package modelo;

import java.util.List;

public class Categoria {

    private String nome;
    private int id;
    private List<SubCategoria> subcategoria;
    private int ativo;

    public int getAtivo() {
        return ativo;
    }

    public void setAtivo(int ativo) {
        this.ativo = ativo;
    }

    public List<SubCategoria> getSubcategoria() {
        return subcategoria;
    }

    public void setSubcategoria(List<SubCategoria> subcategoria) {
        this.subcategoria = subcategoria;
    }
            
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
}
