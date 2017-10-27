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
                "insert into historico (data_compra,quantidade,total,subtotal,anuncio_id,enderecoEnvio,vendedor_id,comprador_id) values (?,?,?,?,?,?,?,?)");
        comando.setDate(1, compra.getData_compra());
        comando.setInt(2, compra.getQuantidadeComprada());
        comando.setDouble(3, compra.getTotal());
        comando.setDouble(4, compra.getSubtotal());
        comando.setInt(5, compra.getAnuncio().getId());
        comando.setString(6, compra.getEnderecoEnvio());
        comando.setInt(7, compra.getVendedor().getId());
        comando.setInt(8, compra.getComprador().getId());

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

            Historico historico = new Historico();

            Vendedor vendedor = new Vendedor();
            vendedor.setId(resultado.getInt("vendedor_id"));
            
            Comprador c = new Comprador();
            c.setId(resultado.getInt("comprador_id"));
            UsuarioDAO ud = new UsuarioDAO();

            Anuncio anuncio = new Anuncio();
            anuncio.setId(resultado.getInt("anuncio_id"));
            AnuncioDAO ad = new AnuncioDAO();

            historico.setId(resultado.getInt("compra_id"));
            historico.setData_compra(resultado.getDate("data_compra"));
            historico.setQuantidadeComprada(resultado.getInt("quantidade"));
            historico.setTotal(resultado.getDouble("total"));
            historico.setVendedor((Vendedor) ud.consultar(vendedor));
            historico.setComprador((Comprador) ud.consultar(c));
            historico.setSubtotal(resultado.getDouble("subtotal"));
            historico.setEnderecoEnvio(resultado.getString("enderecoenvio"));
            historico.setAnuncio((Anuncio) ad.consultarPorId(anuncio));
            todasCompras.add(historico);
        }

        con.close();
        return todasCompras;
    }

    public List<Historico> historicoVenda(Vendedor vendedor) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("select * from historico where vendedor_id=?");
        comando.setInt(1, vendedor.getId());
        ResultSet resultado = comando.executeQuery();

        List<Historico> todasVendas = new ArrayList<>();
        while (resultado.next()) {
            Historico historico = new Historico();

            Vendedor v = new Vendedor();
            v.setId(resultado.getInt("vendedor_id"));
            UsuarioDAO vd = new UsuarioDAO();

            Comprador comprador = new Comprador();
            comprador.setId(resultado.getInt("comprador_id"));
            UsuarioDAO cd = new UsuarioDAO();

            Anuncio anuncio = new Anuncio();
            anuncio.setId(resultado.getInt("anuncio_id"));
            AnuncioDAO ad = new AnuncioDAO();

            historico.setId(resultado.getInt("compra_id"));
            historico.setData_compra(resultado.getDate("data_compra"));
            historico.setQuantidadeComprada(resultado.getInt("quantidade"));
            historico.setTotal(resultado.getDouble("total"));
            historico.setVendedor((Vendedor) vd.consultar(v));
            historico.setComprador((Comprador) cd.consultar(comprador));
            historico.setSubtotal(resultado.getDouble("subtotal"));
            historico.setEnderecoEnvio(resultado.getString("enderecoenvio"));
            historico.setAnuncio((Anuncio) ad.consultarPorId(anuncio));
            todasVendas.add(historico);
        }

        con.close();
        return todasVendas;
    }
}
