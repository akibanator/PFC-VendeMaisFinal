package dao;

import bancoDeDados.FabricaConexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Anuncio;
import modelo.Compra;
import modelo.Vendedor;

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
        comando.setInt(13, anuncio.getVendedor().getId());
        comando.setDouble(14, anuncio.getValorFrete());
        comando.setString(15, anuncio.getFormaEnvio());
        comando.setString(16, anuncio.getEndereco());
        comando.execute();
        con.close();
    }

    public void alterar(Anuncio anuncio) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement(
                "update anuncio set titulo=?,descricao=?,quantidade=?,preco=?,peso=?,altura=?,largura=? where anuncio_id = ?");
        comando.setString(1, anuncio.getTitulo());
        comando.setString(2, anuncio.getDescricao());
        comando.setInt(3, anuncio.getQuantidade());
        comando.setDouble(4, anuncio.getPreco());
        comando.setDouble(5, anuncio.getPeso());
        comando.setDouble(6, anuncio.getAltura());
        comando.setDouble(7, anuncio.getLargura());
        comando.setInt(8, anuncio.getId());
        comando.execute();
        con.close();
    }
    
    public void atualizarQuantidade(Compra compra) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("update anuncio set quantidade=(quantidade-?) where anuncio_id = ?");
        comando.setInt(1,compra.getQuantidadeComprada());
        comando.setInt(2,compra.getAnuncio().getId());        
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

        PreparedStatement comando = con.prepareStatement("select * from anuncio where ativo = 1 ");
        ResultSet resultado = comando.executeQuery();

        List<Anuncio> todosAnuncios = new ArrayList<>();
        while (resultado.next()) {
            Anuncio anuncio = new Anuncio();
            anuncio.setId(resultado.getInt("anuncio_id"));
            anuncio.setTitulo(resultado.getString("titulo"));
            anuncio.setDescricao(resultado.getString("descricao"));
            anuncio.setQuantidade(resultado.getInt("quantidade"));
            anuncio.setPreco(resultado.getDouble("preco"));
            anuncio.setEstado(resultado.getString("estado_produto"));
            anuncio.setPeso(resultado.getDouble("peso"));
            anuncio.setAltura(resultado.getDouble("altura"));
            anuncio.setLargura(resultado.getDouble("largura"));
            anuncio.setCategoria(resultado.getString("categoria"));
            anuncio.setSubcategoria(resultado.getString("subcategoria"));
            anuncio.setData_cadastro(resultado.getDate("data_cadastro"));
            
            Vendedor vendedor = new Vendedor();
            vendedor.setId(resultado.getInt("usuario_id"));
            anuncio.setVendedor(vendedor);
            
            anuncio.setValorFrete(resultado.getDouble("valor_frete"));
            anuncio.setFormaEnvio(resultado.getString("forma_envio"));
            anuncio.setEndereco(resultado.getString("endereco_venda"));
            anuncio.setAtivo(resultado.getInt("ativo"));
            todosAnuncios.add(anuncio);
        }

        con.close();
        return todosAnuncios;
    }

    public List<Anuncio> pesquisa(String palavra) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("SELECT * FROM anuncio where ativo=1 and (titulo ~* ? or categoria ~* ? or subcategoria ~* ?)");
        comando.setString(1, palavra); 
        comando.setString(2, palavra); 
        comando.setString(3, palavra); 
        ResultSet resultado = comando.executeQuery();

        List<Anuncio> todosAnuncios = new ArrayList<>();
        while (resultado.next()) {
            Anuncio anuncio = new Anuncio();
            anuncio.setId(resultado.getInt("anuncio_id"));
            anuncio.setTitulo(resultado.getString("titulo"));
            anuncio.setDescricao(resultado.getString("descricao"));
            anuncio.setQuantidade(resultado.getInt("quantidade"));
            anuncio.setPreco(resultado.getDouble("preco"));
            anuncio.setEstado(resultado.getString("estado_produto"));
            anuncio.setPeso(resultado.getDouble("peso"));
            anuncio.setAltura(resultado.getDouble("altura"));
            anuncio.setLargura(resultado.getDouble("largura"));
            anuncio.setCategoria(resultado.getString("categoria"));
            anuncio.setSubcategoria(resultado.getString("subcategoria"));
            anuncio.setData_cadastro(resultado.getDate("data_cadastro"));
            
            Vendedor vendedor = new Vendedor();
            vendedor.setId(resultado.getInt("usuario_id"));
            anuncio.setVendedor(vendedor);
            
            anuncio.setValorFrete(resultado.getDouble("valor_frete"));
            anuncio.setFormaEnvio(resultado.getString("forma_envio"));
            anuncio.setEndereco(resultado.getString("endereco_venda"));
            anuncio.setAtivo(resultado.getInt("ativo"));
            todosAnuncios.add(anuncio);
        }

        con.close();
        return todosAnuncios;
    }
    public Anuncio consultarPorId(Anuncio anuncio) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("select * from anuncio where anuncio_id = ?");
        comando.setInt(1, anuncio.getId());
        comando.execute();
        
        ResultSet resultado = comando.executeQuery();

        while (resultado.next()) {            
            anuncio.setId(resultado.getInt("anuncio_id"));
            anuncio.setTitulo(resultado.getString("titulo"));
            anuncio.setDescricao(resultado.getString("descricao"));
            anuncio.setQuantidade(resultado.getInt("quantidade"));
            anuncio.setPreco(resultado.getDouble("preco"));
            anuncio.setEstado(resultado.getString("estado_produto"));
            anuncio.setPeso(resultado.getDouble("peso"));
            anuncio.setAltura(resultado.getDouble("altura"));
            anuncio.setLargura(resultado.getDouble("largura"));
            anuncio.setCategoria(resultado.getString("categoria"));
            anuncio.setSubcategoria(resultado.getString("subcategoria"));
            anuncio.setData_cadastro(resultado.getDate("data_cadastro"));
            
            Vendedor vendedor = new Vendedor();
            vendedor.setId(resultado.getInt("usuario_id"));
            anuncio.setVendedor(vendedor);
            
            anuncio.setValorFrete(resultado.getDouble("valor_frete"));
            anuncio.setFormaEnvio(resultado.getString("forma_envio"));
            anuncio.setEndereco(resultado.getString("endereco_venda"));
            anuncio.setAtivo(resultado.getInt("ativo"));
        }

        con.close();
        return anuncio;
    }
    
    public List<Anuncio> consultarAtivosVendedor(Anuncio anuncio) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("select * from anuncio where usuario_id = ? and ativo = 1");
        comando.setInt(1, anuncio.getVendedor().getId());
        comando.execute();

        ResultSet resultado = comando.executeQuery();

        List<Anuncio> todosAnuncios = new ArrayList<>();
        while (resultado.next()) {
            anuncio.setId(resultado.getInt("anuncio_id"));
            anuncio.setTitulo(resultado.getString("titulo"));
            anuncio.setDescricao(resultado.getString("descricao"));
            anuncio.setQuantidade(resultado.getInt("quantidade"));
            anuncio.setPreco(resultado.getDouble("preco"));
            anuncio.setEstado(resultado.getString("estado_produto"));
            anuncio.setPeso(resultado.getDouble("peso"));
            anuncio.setAltura(resultado.getDouble("altura"));
            anuncio.setLargura(resultado.getDouble("largura"));
            anuncio.setCategoria(resultado.getString("categoria"));
            anuncio.setSubcategoria(resultado.getString("subcategoria"));
            anuncio.setData_cadastro(resultado.getDate("data_cadastro"));
            
            Vendedor vendedor = new Vendedor();
            vendedor.setId(resultado.getInt("usuario_id"));
            anuncio.setVendedor(vendedor);
            
            anuncio.setValorFrete(resultado.getDouble("valor_frete"));
            anuncio.setFormaEnvio(resultado.getString("forma_envio"));
            anuncio.setEndereco(resultado.getString("endereco_venda"));
            anuncio.setAtivo(resultado.getInt("ativo"));
            todosAnuncios.add(anuncio);
        }

        con.close();
        return todosAnuncios;
    }
    
    public List<Anuncio> consultarEncerradosVendedor(Anuncio anuncio) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("select * from anuncio where usuario_id = ? and ativo = 2");
        comando.setInt(1, anuncio.getVendedor().getId());
        comando.execute();

        ResultSet resultado = comando.executeQuery();

        List<Anuncio> todosAnuncios = new ArrayList<>();
        while (resultado.next()) {
            anuncio.setId(resultado.getInt("anuncio_id"));
            anuncio.setTitulo(resultado.getString("titulo"));
            anuncio.setDescricao(resultado.getString("descricao"));
            anuncio.setQuantidade(resultado.getInt("quantidade"));
            anuncio.setPreco(resultado.getDouble("preco"));
            anuncio.setEstado(resultado.getString("estado_produto"));
            anuncio.setPeso(resultado.getDouble("peso"));
            anuncio.setAltura(resultado.getDouble("altura"));
            anuncio.setLargura(resultado.getDouble("largura"));
            anuncio.setCategoria(resultado.getString("categoria"));
            anuncio.setSubcategoria(resultado.getString("subcategoria"));
            anuncio.setData_cadastro(resultado.getDate("data_cadastro"));
            
            Vendedor vendedor = new Vendedor();
            vendedor.setId(resultado.getInt("usuario_id"));
            anuncio.setVendedor(vendedor);
            
            anuncio.setValorFrete(resultado.getDouble("valor_frete"));
            anuncio.setFormaEnvio(resultado.getString("forma_envio"));
            anuncio.setEndereco(resultado.getString("endereco_venda"));
            anuncio.setAtivo(resultado.getInt("ativo"));
            todosAnuncios.add(anuncio);
        }

        con.close();
        return todosAnuncios;
    }
}
