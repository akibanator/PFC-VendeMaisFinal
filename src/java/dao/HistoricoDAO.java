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
            Historico h = new Historico();
            
            Vendedor v = new Vendedor();
            v.setId(resultado.getInt("vendedor_id"));
            UsuarioDAO vd = new UsuarioDAO();
                        
            Comprador c = new Comprador();
            c.setId(resultado.getInt("comprador_id"));
            UsuarioDAO cd = new UsuarioDAO();
            
            Anuncio a = new Anuncio();
            a.setId(resultado.getInt("compra_id"));
            AnuncioDAO ad = new AnuncioDAO();
  
            h.setId(resultado.getInt("compra_id"));
            h.setData_compra(resultado.getDate("data_compra"));
            h.setQuantidadeComprada(resultado.getInt("quantidade"));
            h.setTotal(resultado.getDouble("total"));
            h.setVendedor((Vendedor) vd.consultar(v));
            h.setComprador((Comprador) cd.consultar(c));
            h.setSubtotal(resultado.getDouble("subtotal"));
            h.setEnderecoEnvio(resultado.getString("enderecoenvio"));
            h.setAnuncio((Anuncio) ad.consultarPorId(a));
            todasCompras.add(h);    
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
            Historico h = new Historico();
            
            Vendedor v = new Vendedor();
            v.setId(resultado.getInt("vendedor_id"));
            UsuarioDAO vd = new UsuarioDAO();
                        
            Comprador c = new Comprador();
            c.setId(resultado.getInt("comprador_id"));
            UsuarioDAO cd = new UsuarioDAO();
            
            Anuncio a = new Anuncio();
            a.setId(resultado.getInt("compra_id"));
            AnuncioDAO ad = new AnuncioDAO();
  
            h.setId(resultado.getInt("compra_id"));
            h.setData_compra(resultado.getDate("data_compra"));
            h.setQuantidadeComprada(resultado.getInt("quantidade"));
            h.setTotal(resultado.getDouble("total"));
            h.setVendedor((Vendedor) vd.consultar(v));
            h.setComprador((Comprador) cd.consultar(c));
            h.setSubtotal(resultado.getDouble("subtotal"));
            h.setEnderecoEnvio(resultado.getString("enderecoenvio"));
            h.setAnuncio((Anuncio) ad.consultarPorId(a));
            todasVendas.add(h);
        }

        con.close();
        return todasVendas;
    }
}
