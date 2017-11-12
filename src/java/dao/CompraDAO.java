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
import modelo.Vendedor;

public class CompraDAO {

    public void gerarHistorico(Compra compra)
            throws ClassNotFoundException, SQLException {
        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement(
                "insert into compra (data_compra,quantidade,total,subtotal,anuncio_id,enderecoEnvio,vendedor_id,comprador_id) values (?,?,?,?,?,?,?,?)");
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

    public List<Compra> historicoCompra(Comprador comprador) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement(
                "select * from compra where comprador_id=?");
        comando.setInt(1, comprador.getId());
        ResultSet resultado = comando.executeQuery();

        List<Compra> todasCompras = new ArrayList<>();
        while (resultado.next()) {

            Compra compra = new Compra();

            Vendedor vendedor = new Vendedor();
            vendedor.setId(resultado.getInt("vendedor_id"));
            
            Comprador c = new Comprador();
            c.setId(resultado.getInt("comprador_id"));
            UsuarioDAO ud = new UsuarioDAO();

            Anuncio anuncio = new Anuncio();
            anuncio.setId(resultado.getInt("anuncio_id"));
            AnuncioDAO ad = new AnuncioDAO();

            compra.setId(resultado.getInt("compra_id"));
            compra.setData_compra(resultado.getDate("data_compra"));
            compra.setQuantidadeComprada(resultado.getInt("quantidade"));
            compra.setTotal(resultado.getDouble("total"));
            compra.setVendedor((Vendedor) ud.consultar(vendedor));
            compra.setComprador((Comprador) ud.consultar(c));
            compra.setSubtotal(resultado.getDouble("subtotal"));
            compra.setEnderecoEnvio(resultado.getString("enderecoenvio"));
            compra.setAnuncio((Anuncio) ad.consultarPorId(anuncio));
            todasCompras.add(compra);
        }

        con.close();
        return todasCompras;
    }

    public List<Compra> historicoVenda(Vendedor vendedor) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("select * from compra where vendedor_id=?");
        comando.setInt(1, vendedor.getId());
        ResultSet resultado = comando.executeQuery();

        List<Compra> todasVendas = new ArrayList<>();
        while (resultado.next()) {
            Compra compra = new Compra();

            Vendedor v = new Vendedor();
            v.setId(resultado.getInt("vendedor_id"));
            UsuarioDAO vd = new UsuarioDAO();

            Comprador comprador = new Comprador();
            comprador.setId(resultado.getInt("comprador_id"));
            UsuarioDAO cd = new UsuarioDAO();

            Anuncio anuncio = new Anuncio();
            anuncio.setId(resultado.getInt("anuncio_id"));
            AnuncioDAO ad = new AnuncioDAO();

            compra.setId(resultado.getInt("compra_id"));
            compra.setData_compra(resultado.getDate("data_compra"));
            compra.setQuantidadeComprada(resultado.getInt("quantidade"));
            compra.setTotal(resultado.getDouble("total"));
            compra.setVendedor((Vendedor) vd.consultar(v));
            compra.setComprador((Comprador) cd.consultar(comprador));
            compra.setSubtotal(resultado.getDouble("subtotal"));
            compra.setEnderecoEnvio(resultado.getString("enderecoenvio"));
            compra.setAnuncio((Anuncio) ad.consultarPorId(anuncio));
            todasVendas.add(compra);
        }

        con.close();
        return todasVendas;
    }
    
    public void classificarProduto(Compra compra)
            throws ClassNotFoundException, SQLException {
        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement(
                "update compra set nota=?, comentario=? where compra_id=?");
        comando.setInt(1, compra.getNota());
        comando.setString(2, compra.getComentario());
        comando.setInt(3, compra.getId());

        comando.execute();
        con.close();
    }
}
