/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import controle.FabricaConexao;
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

/**
 *
 * @author ailto
 */
public class HistoricoDAO {

    public void gerarHistorico(Compra compra, Comprador comprador, Anuncio anuncio)
            throws ClassNotFoundException, SQLException {
        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement(
                "insert into historico (data_compra,quantidade,total,comprador_id,anuncio_id) values (?,?,?,?,?)");
        comando.setDate(1, compra.getData_compra());
        comando.setInt(2, compra.getQuantidade());
        comando.setDouble(3, compra.getTotal());
        comando.setInt(4, comprador.getId());
        comando.setInt(5, anuncio.getId());

        comando.execute();
        con.close();
    }

    public List<Historico> historicoCompra(Comprador comprador) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement(
                "select u.nome as comprador,h.total,h.quantidade,a.preco as preco_unitario, h.data_compra, a.titulo as produto,a.descricao,a.estado_produto as estado, a.usuario_id as vendedor "
                + "from anuncio a, historico h, usuario u where h.comprador_id = u.usuario_id and h.anuncio_id = a.anuncio_id and u.usuario_id=?");
        comando.setInt(1, comprador.getId());
        ResultSet resultado = comando.executeQuery();

        List<Historico> todasCompras = new ArrayList<>();
        while (resultado.next()) {
            Historico h = new Historico();

            h.setData_compra(resultado.getDate("data_compra"));
            h.setQuantidade(resultado.getInt("quantidade"));
            h.setTotal(resultado.getDouble("total"));
            h.setVendedor(resultado.getString("vendedor"));
            h.setDescricao(resultado.getString("descricao"));
            h.setProduto(resultado.getString("produto"));
            h.setEstado(resultado.getString("estado"));
            h.setPreco_unitario(resultado.getDouble("preco_unitario"));
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
