package dao;

import controle.FabricaConexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Endereco;

public class EnderecoDAO {

    public boolean cadastrar(Endereco endereco) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comand = con.prepareStatement("select count(*) from Endereco where usuario_id=?");
        comand.setInt(1, endereco.getUsuario());

        ResultSet result = comand.executeQuery();

        if (result.next()) {
            int numberOfRows = result.getInt(1);
            System.out.println("numberOfRows= " + numberOfRows);

            if (numberOfRows < 5) {
                PreparedStatement comando = con.prepareStatement(
                        "insert into endereco (cep,numero,bairro,rua,estado,cidade,complemento,usuario_id) values (?,?,?,?,?,?,?,?)");
                comando.setString(1, endereco.getCep());
                comando.setString(2, endereco.getNumero());
                comando.setString(3, endereco.getBairro());
                comando.setString(4, endereco.getRua());
                comando.setString(5, endereco.getEstado());
                comando.setString(6, endereco.getCidade());
                comando.setString(7, endereco.getComplemento());
                comando.setInt(8, endereco.getUsuario());
                comando.execute();
                con.close();
                return true;

            } else {
                System.out.println("erro: tem mais de 5 endereços cadastrados");
            }
        } else {
            System.out.println("erro: Não pôde obter o registro conta");
        }
        return false;
    }

    public void alterar(Endereco endereco) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement(
                "update endereco set cep=?,numero=?,bairro=?,rua=?,estado=?,cidade=?,complemento=? where endereco_id = ?");
        comando.setString(1, endereco.getCep());
        comando.setString(2, endereco.getNumero());
        comando.setString(3, endereco.getBairro());
        comando.setString(4, endereco.getRua());
        comando.setString(5, endereco.getEstado());
        comando.setString(6, endereco.getCidade());
        comando.setString(7, endereco.getComplemento());
        comando.setInt(8, endereco.getId());
        comando.execute();

        con.close();
    }

    public void excluir(Endereco endereco) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("delete from endereco where endereco_id = ?");
        comando.setInt(1, endereco.getId());
        comando.execute();

        con.close();
    }

    public List<Endereco> consultar(Endereco endereco) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("select * from endereco where usuario_id = ?");
        comando.setInt(1, endereco.getUsuario());
        ResultSet resultado = comando.executeQuery();

        List<Endereco> todosEnderecos = new ArrayList<>();
        while (resultado.next()) {
            Endereco e = new Endereco();
            e.setId(resultado.getInt("endereco_id"));
            e.setCep(resultado.getString("cep"));
            e.setRua(resultado.getString("rua"));
            e.setNumero(resultado.getString("numero"));
            e.setBairro(resultado.getString("bairro"));
            e.setCidade(resultado.getString("cidade"));
            e.setEstado(resultado.getString("estado"));
            e.setComplemento(resultado.getString("complemento"));
            todosEnderecos.add(e);
        }

        con.close();
        return todosEnderecos;
    }

    public Endereco consultaId(Endereco endereco) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("select * from endereco where endereco_id = ?");
        comando.setInt(1, endereco.getUsuario());
        ResultSet resultado = comando.executeQuery();

        while (resultado.next()) {
            endereco.setId(resultado.getInt("endereco_id"));
            endereco.setCep(resultado.getString("cep"));
            endereco.setRua(resultado.getString("rua"));
            endereco.setNumero(resultado.getString("numero"));
            endereco.setBairro(resultado.getString("bairro"));
            endereco.setCidade(resultado.getString("cidade"));
            endereco.setEstado(resultado.getString("estado"));
            endereco.setComplemento(resultado.getString("complemento"));
        }

        con.close();
        return endereco;
    }
}
