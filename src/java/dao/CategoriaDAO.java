package dao;

import bancoDeDados.FabricaConexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Categoria;
import modelo.SubCategoria;

public class CategoriaDAO {

    public void cadastrar(Categoria categoria) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("insert into categoria (nome) values (?)");
        comando.setString(1, categoria.getNome());

        comando.execute();
        con.close();
    }

    public void alterar(Categoria categoria) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("update categoria set nome=? where categoria_id = ?");
        comando.setString(1, categoria.getNome());
        comando.setInt(2, categoria.getId());

        comando.execute();
        con.close();
    }

    public void excluir(Categoria categoria) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("delete from categoria where categoria_id = ?");
        comando.setInt(1, categoria.getId());
        comando.execute();

        con.close();
    }

    public List<Categoria> consultar() throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("select * from categoria");
        ResultSet resultado = comando.executeQuery();

        List<Categoria> todosCategorias = new ArrayList<>();
        while (resultado.next()) {
            
            Categoria categoria = new Categoria();
            categoria.setId(resultado.getInt("categoria_id"));
            categoria.setNome(resultado.getString("nome"));
            
            SubCategoriaDAO edao = new SubCategoriaDAO();
            List<SubCategoria> todosSubCategorias = edao.consultar(categoria);         
            categoria.setSubcategoria(todosSubCategorias);
            todosCategorias.add(categoria);
        }
        con.close();
        return todosCategorias;
    }
}
