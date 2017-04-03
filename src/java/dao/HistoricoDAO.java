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
import modelo.Comprador;
import modelo.Historico;
import modelo.Vendedor;

public class HistoricoDAO {

    public void gerarHistorico(Compra compra)
            throws ClassNotFoundException, SQLException {
        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement(
                "insert into historico (data_compra,quantidade,total,subtotal,emailC,telefoneC,vendedor,comprador,emailV,telefoneV,produto,anuncio_id,formaEnvio,enderecoEnvio,vendedor_id,comprador_id) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
        comando.setDate(1, compra.getData_compra());
        comando.setInt(2, compra.getQuantidadeComprada());
        comando.setDouble(3, compra.getTotal());
        comando.setDouble(4, compra.getSubtotal());
        comando.setString(5, compra.getComprador().getEmail());
        comando.setString(6, compra.getComprador().getTelefone());
        comando.setString(7, compra.getVendedor().getNome());
        comando.setString(8, compra.getComprador().getNome());
        comando.setString(9, compra.getVendedor().getEmail());
        comando.setString(10, compra.getVendedor().getTelefone());
        comando.setString(11, compra.getAnuncio().getTitulo());
        comando.setInt(12, compra.getAnuncio().getId());
        comando.setString(13, compra.getAnuncio().getFormaEnvio());
        comando.setString(14, compra.getEnderecoEnvio());
        comando.setInt(15, compra.getVendedor().getId());
        comando.setInt(16, compra.getComprador().getId());

        comando.execute();
        con.close();
    }

    public List<Historico> historicoCompra(Comprador comprador) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement(
                "select * from historico where comprador_id=?");
        comando.setInt(1, comprador.getId());
        ResultSet resultado = comando.executeQuery();

        List<Historico> todasCompras = new ArrayList<>();
        while (resultado.next()) {
            Historico h = new Historico();
            
            
  
            h.setId(resultado.getInt("compra_id"));
            h.setData_compra(resultado.getDate("data_compra"));
            h.setQuantidadeComprada(resultado.getInt("quantidade"));
            h.setTotal(resultado.getDouble("total"));
            h.setVendedor((h.getVendedor().setId(resultado.getInt("vendedor_id"))));
            h.getComprador().setId(resultado.getInt("comprador_id"));
            h.setSubtotal(resultado.getDouble("subtotal"));
            h.setEnderecoEnvio(resultado.getString("enderecoenvio"));
            todasCompras.add(h);          
              
        }

        con.close();
        return todasCompras;
    }

    public List<Historico> historicoVenda(Vendedor vendedor) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement(
                "select u.nome as comprador,h.total as valor_da_venda,h.quantidade as quantidade_vendida,a.preco as preco_unitario, h.data_compra as data_venda, a.titulo as produto,a.descricao,a.estado_produto as estado\n"
                + "from anuncio a, historico h, usuario u where h.comprador_id = u.usuario_id and h.anuncio_id = a.anuncio_id and a.usuario_id=?");
        comando.setInt(1, vendedor.getId());
        ResultSet resultado = comando.executeQuery();

        List<Historico> todasVendas = new ArrayList<>();
        while (resultado.next()) {
            Historico h = new Historico();
            h.setData_compra(resultado.getDate("data_venda"));
            h.setQuantidade(resultado.getInt("quantidade_vendida"));
            h.setTotal(resultado.getDouble("valor_da_venda"));
            h.setComprador(resultado.getString("comprador"));
            h.setDescricao(resultado.getString("descricao"));
            h.setProduto(resultado.getString("produto"));
            h.setEstado(resultado.getString("estado"));
            h.setPreco_unitario(resultado.getDouble("preco_unitario"));
            todasVendas.add(h);
        }

        con.close();
        return todasVendas;
    }
}
