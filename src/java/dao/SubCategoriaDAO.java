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

public class SubCategoriaDAO {

    public void cadastrar(SubCategoria subcategoria, Categoria categoria) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("insert into subcategoria (nome,categoria_id,ativo) values (?,?,?)");
        comando.setString(1, subcategoria.getNome());
        comando.setInt(2, categoria.getId());
        comando.setInt(3, subcategoria.getAtivo());

        comando.execute();
        con.close();
    }

    public void alterar(SubCategoria subcategoria) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("update subcategoria set nome=? where subcategoria_id = ?");
        comando.setString(1, subcategoria.getNome());
        comando.setInt(2, subcategoria.getId());

        comando.execute();
        con.close();
    }

    public void excluir(SubCategoria subcategoria) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("delete from subcategoria where subcategoria_id = ?");
        comando.setInt(1, subcategoria.getId());
        comando.execute();

        con.close();
    }

    public List<SubCategoria> consultar(Categoria categoria) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("select * from subcategoria where categoria_id = ?");
        comando.setInt(1, categoria.getId());
        comando.execute();
        ResultSet resultado = comando.executeQuery();

        List<SubCategoria> todosSubCategorias = new ArrayList<>();
        
        while (resultado.next()) {
            SubCategoria sub = new SubCategoria();
            sub.setId(resultado.getInt("subcategoria_id"));
            sub.setNome(resultado.getString("nome"));
            todosSubCategorias.add(sub);
        }

        con.close();
        return todosSubCategorias;
    }
    
    public SubCategoria consultar(SubCategoria subcategoria) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("select * from subcategoria where subcategoria_id=?");
        comando.setInt(1, subcategoria.getId());
        comando.execute();
        
        ResultSet resultado = comando.executeQuery();
        
        SubCategoria c = new SubCategoria();
        
        while (resultado.next()) {
            c.setId(resultado.getInt("categoria_id"));
            c.setNome(resultado.getString("nome"));
        }
        con.close();
        return c;
    }
}
