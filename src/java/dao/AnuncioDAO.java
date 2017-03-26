package dao;

import bancoDeDados.FabricaConexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Anuncio;

public class AnuncioDAO {

    public void cadastrar(Anuncio anuncio) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement(
                "insert into anuncio (titulo,descricao,quantidade,preco,estado_produto,peso,altura,largura,categoria,subcategoria,data_cadastro,ativo,usuario_id,valor_frete,forma_envio,endereco_venda) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
        comando.setString(1, anuncio.getTitulo());
        comando.setString(2, anuncio.getDescricao());
        comando.setInt(3, anuncio.getQuantidade());
        comando.setDouble(4, anuncio.getPreco());
        comando.setString(5, anuncio.getEstado());
        comando.setDouble(6, anuncio.getPeso());
        comando.setDouble(7, anuncio.getAltura());
        comando.setDouble(8, anuncio.getLargura());
        comando.setString(9, anuncio.getCategoria());
        comando.setString(10, anuncio.getSubcategoria());
        comando.setDate(11, anuncio.getData_cadastro());
        comando.setInt(12, anuncio.getAtivo());
        comando.setInt(13, anuncio.getVendedor());
        comando.setDouble(14, anuncio.getValorFrete());
        comando.setString(15, anuncio.getFormaEnvio());
        comando.setInt(16, anuncio.getEndereco());

        comando.execute();
        con.close();
    }

    public void alterar(Anuncio anuncio) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement(
                "update anuncio set titulo=?,descricao=?,quantidade=?,preco=?,estado_produto=?,peso=?,altura=?,largura=?,categoria=?,subcategoria=? where anuncio_id = ?");
        comando.setString(1, anuncio.getTitulo());
        comando.setString(2, anuncio.getDescricao());
        comando.setInt(3, anuncio.getQuantidade());
        comando.setDouble(4, anuncio.getPreco());
        comando.setString(5, anuncio.getEstado());
        comando.setDouble(6, anuncio.getPeso());
        comando.setDouble(7, anuncio.getAltura());
        comando.setDouble(8, anuncio.getLargura());
        comando.setString(9, anuncio.getCategoria());
        comando.setString(10, anuncio.getSubcategoria());
        comando.setInt(11, anuncio.getId());
        comando.execute();

        con.close();
    }

    public void encerrar(Anuncio anuncio) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("update anuncio set ativo = 2 where anuncio_id = ?");
        comando.setInt(1, anuncio.getId());
        comando.execute();

        con.close();
    }

    public List<Anuncio> consultarTodosAbertos() throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("select * from anuncio where ativo = 1");
        ResultSet resultado = comando.executeQuery();

        List<Anuncio> todosAnuncios = new ArrayList<>();
        while (resultado.next()) {
            Anuncio a = new Anuncio();
            a.setId(resultado.getInt("anuncio_id"));
            a.setTitulo(resultado.getString("titulo"));
            a.setDescricao(resultado.getString("descricao"));
            a.setQuantidade(resultado.getInt("quantidade"));
            a.setPreco(resultado.getDouble("preco"));
            a.setEstado(resultado.getString("estado_produto"));
            a.setPeso(resultado.getDouble("peso"));
            a.setAltura(resultado.getDouble("altura"));
            a.setLargura(resultado.getDouble("largura"));
            a.setCategoria(resultado.getString("categoria"));
            a.setSubcategoria(resultado.getString("subcategoria"));
            a.setData_cadastro(resultado.getDate("data_cadastro"));
            a.setVendedor(resultado.getInt("usuario_id"));
            a.setValorFrete(resultado.getDouble("valor_frete"));
            a.setFormaEnvio(resultado.getString("forma_envio"));
            a.setEndereco(resultado.getInt("endereco_venda"));
            todosAnuncios.add(a);
        }

        con.close();
        return todosAnuncios;
    }

    public List<Anuncio> consultarAtivosVendedor(Anuncio anuncio) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("select * from anuncio where usuario_id = ? and ativo = 1");
        comando.setInt(1, anuncio.getVendedor());
        comando.execute();

        ResultSet resultado = comando.executeQuery();

        List<Anuncio> todosAnuncios = new ArrayList<>();
        while (resultado.next()) {
            Anuncio a = new Anuncio();
            a.setId(resultado.getInt("anuncio_id"));
            a.setTitulo(resultado.getString("titulo"));
            a.setDescricao(resultado.getString("descricao"));
            a.setQuantidade(resultado.getInt("quantidade"));
            a.setPreco(resultado.getDouble("preco"));
            a.setEstado(resultado.getString("estado_produto"));
            a.setPeso(resultado.getDouble("peso"));
            a.setAltura(resultado.getDouble("altura"));
            a.setLargura(resultado.getDouble("largura"));
            a.setCategoria(resultado.getString("categoria"));
            a.setSubcategoria(resultado.getString("subcategoria"));
            a.setData_cadastro(resultado.getDate("data_cadastro"));
            a.setVendedor(resultado.getInt("usuario_id"));
            a.setValorFrete(resultado.getDouble("valor_frete"));
            a.setFormaEnvio(resultado.getString("forma_envio"));
            a.setEndereco(resultado.getInt("endereco_venda"));
            todosAnuncios.add(a);
        }

        con.close();
        return todosAnuncios;
    }
    
    public List<Anuncio> consultarEncerradosVendedor(Anuncio anuncio) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("select * from anuncio where usuario_id = ? and ativo = 2");
        comando.setInt(1, anuncio.getVendedor());
        comando.execute();

        ResultSet resultado = comando.executeQuery();

        List<Anuncio> todosAnuncios = new ArrayList<>();
        while (resultado.next()) {
            Anuncio a = new Anuncio();
            a.setId(resultado.getInt("anuncio_id"));
            a.setTitulo(resultado.getString("titulo"));
            a.setDescricao(resultado.getString("descricao"));
            a.setQuantidade(resultado.getInt("quantidade"));
            a.setPreco(resultado.getDouble("preco"));
            a.setEstado(resultado.getString("estado_produto"));
            a.setPeso(resultado.getDouble("peso"));
            a.setAltura(resultado.getDouble("altura"));
            a.setLargura(resultado.getDouble("largura"));
            a.setCategoria(resultado.getString("categoria"));
            a.setSubcategoria(resultado.getString("subcategoria"));
            a.setData_cadastro(resultado.getDate("data_cadastro"));
            a.setVendedor(resultado.getInt("usuario_id"));
            a.setValorFrete(resultado.getDouble("valor_frete"));
            a.setFormaEnvio(resultado.getString("forma_envio"));
            a.setEndereco(resultado.getInt("endereco_venda"));
            todosAnuncios.add(a);
        }

        con.close();
        return todosAnuncios;
    }
}
