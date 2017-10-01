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

        PreparedStatement comando = con.prepareStatement("insert into categoria (nome,ativo) values (?,?)");
        comando.setString(1, categoria.getNome());
        comando.setInt(2, categoria.getAtivo());

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

    public void desativar(Categoria categoria) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("update categoria set ativo=2 where categoria_id = ?");
        comando.setInt(1, categoria.getId());
        comando.execute();

        con.close();
    }

    public void ativar(Categoria categoria) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("update categoria set ativo=1 where categoria_id = ?");
        comando.setInt(1, categoria.getId());
        comando.execute();

        con.close();
    }

    public List<Categoria> consultar() throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("select * from categoria ORDER BY nome");
        ResultSet resultado = comando.executeQuery();

        List<Categoria> todosCategorias = new ArrayList<>();
        while (resultado.next()) {

            Categoria categoria = new Categoria();
            categoria.setId(resultado.getInt("categoria_id"));
            categoria.setNome(resultado.getString("nome"));
            categoria.setAtivo(resultado.getInt("ativo"));

            SubCategoriaDAO edao = new SubCategoriaDAO();
            List<SubCategoria> todosSubCategorias = edao.consultar(categoria);
            categoria.setSubcategoria(todosSubCategorias);
            todosCategorias.add(categoria);
        }
        con.close();
        return todosCategorias;
    }

    public List<Categoria> consultarAtivos() throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("select * from categoria where ativo=1 ORDER BY nome");
        ResultSet resultado = comando.executeQuery();

        List<Categoria> todosCategorias = new ArrayList<>();
        while (resultado.next()) {
            Categoria categoria = new Categoria();
            categoria.setId(resultado.getInt("categoria_id"));
            categoria.setNome(resultado.getString("nome"));
            categoria.setAtivo(resultado.getInt("ativo"));
            todosCategorias.add(categoria);
        }
        con.close();
        return todosCategorias;
    }

    public Categoria consultarId(Categoria categoria) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("select * from categoria where categoria_id=? ORDER BY nome");
        comando.setInt(1, categoria.getId());
        comando.execute();

        ResultSet resultado = comando.executeQuery();

        Categoria c = new Categoria();

        while (resultado.next()) {
            c.setId(resultado.getInt("categoria_id"));
            c.setNome(resultado.getString("nome"));
            c.setAtivo(resultado.getInt("ativo"));
        }
        con.close();
        return c;
    }
}
