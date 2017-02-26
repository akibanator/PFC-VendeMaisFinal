package dao;

import controle.FabricaConexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import modelo.Usuario;

public class UsuarioDAO {

    public void cadastrar(Usuario usuario) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("insert into usuario (cpf,email,nome,senha,telefone,ativo,perfiladm) values (?,?,?,?,?,?,?)");
        comando.setString(1, usuario.getCpf());
        comando.setString(2, usuario.getEmail());
        comando.setString(3, usuario.getNome());
        comando.setString(4, usuario.getSenha());
        comando.setString(5, usuario.getTelefone());
        comando.setInt(6, usuario.getAtivo());
        comando.setInt(7, usuario.getPerfilAdm());

        comando.execute();
        con.close();
    }

    public void alterar(Usuario usuario) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("update usuario set telefone=?,senha=?,email=? where usuario_id = ?");
        comando.setString(1, usuario.getTelefone());
        comando.setString(2, usuario.getSenha());
        comando.setString(3, usuario.getEmail());
        comando.setInt(4, usuario.getId());
        comando.execute();

        con.close();
    }

    public void desativar(Usuario usuario) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("update usuario set ativo=2 where usuario_id = ?");
        comando.setInt(1, usuario.getId());
        comando.execute();

        con.close();
    }

    public void ativar(Usuario usuario) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("update usuario set ativo=1 where usuario_id = ?");
        comando.setInt(1, usuario.getId());
        comando.execute();

        con.close();
    }

    public Usuario consultar(Usuario usuario) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("select * from usuario where usuario_id = ?");
        comando.setInt(1, usuario.getId());
        ResultSet resultado = comando.executeQuery();

        if (resultado.next()) {
            usuario.setId(resultado.getInt("usuario_id"));
            usuario.setCpf(resultado.getString("cpf"));
            usuario.setEmail(resultado.getString("email"));
            usuario.setNome(resultado.getString("nome"));
            usuario.setTelefone(resultado.getString("telefone"));
            usuario.setSenha(resultado.getString("senha"));
            usuario.setAtivo(resultado.getInt("ativo"));
            usuario.setPerfilAdm(resultado.getInt("perfilAdm"));
        }

        con.close();
        return usuario;
    }

    public Usuario validar(Usuario usuario) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        Usuario us = null;

        PreparedStatement comando = con.prepareStatement("select * from usuario where email = ? and senha=?");
        comando.setString(1, usuario.getEmail());
        comando.setString(2, usuario.getSenha());

        ResultSet resultado = comando.executeQuery();

        if (resultado.next()) {
            us = new Usuario();
            us.setId(resultado.getInt("usuario_id"));
            us.setPerfilAdm(resultado.getInt("perfilAdm"));
            us.setAtivo(resultado.getInt("ativo"));
        }

        con.close();
        return us;
    }
}
