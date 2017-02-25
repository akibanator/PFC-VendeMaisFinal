package dao;

import controle.FabricaConexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Categoria;

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
        comando.setInt(1, categoria.getId());

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

    public List<Categoria> consultar(Categoria categoria) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("select * from categoria");
        ResultSet resultado = comando.executeQuery();

        List<Categoria> todosCategorias = new ArrayList<>();
        while (resultado.next()) {
            Categoria e = new Categoria();
            e.setId(resultado.getInt("categoria_id"));
            e.setNome(resultado.getString("nome"));

            todosCategorias.add(e);
        }

        con.close();
        return todosCategorias;
    }
}
