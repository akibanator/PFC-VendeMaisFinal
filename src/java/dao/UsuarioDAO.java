package dao;

import bancoDeDados.FabricaConexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.PerfilAcesso;
import modelo.Usuario;

public class UsuarioDAO {

    public void cadastrar(Usuario usuario) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("insert into usuario (cpf,email,nome,senha,telefone,ativo,perfil) values (?,?,?,md5(?),?,?,?)");
        comando.setString(1, usuario.getCpf());
        comando.setString(2, usuario.getEmail());
        comando.setString(3, usuario.getNome());
        comando.setString(4, usuario.getSenha());
        comando.setString(5, usuario.getTelefone());
        comando.setInt(6, usuario.getAtivo());
        comando.setString(7, usuario.getPerfil().toString());

        comando.execute();
        con.close();
    }

    public void alterar(Usuario usuario) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("update usuario set telefone=?,senha=md5(?),email=? where usuario_id = ?");
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

        PreparedStatement comando = con.prepareStatement("update usuario set ativo=1 where email = ?");
        comando.setString(1, usuario.getEmail());
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
            usuario.setPerfil(PerfilAcesso.valueOf(resultado.getString("perfil")));
        }

        con.close();
        return usuario;
    }

    public List<Usuario> consultarAdm() throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("select * from usuario where perfil = 'adm'");
        ResultSet resultado = comando.executeQuery();

        List<Usuario> todosUsuarios = new ArrayList<>();

        while (resultado.next()) {
            Usuario usuario = new Usuario();
            usuario.setId(resultado.getInt("usuario_id"));
            usuario.setCpf(resultado.getString("cpf"));
            usuario.setEmail(resultado.getString("email"));
            usuario.setNome(resultado.getString("nome"));
            usuario.setTelefone(resultado.getString("telefone"));
            usuario.setSenha(resultado.getString("senha"));
            usuario.setAtivo(resultado.getInt("ativo"));
            usuario.setPerfil(PerfilAcesso.valueOf(resultado.getString("perfil")));
            todosUsuarios.add(usuario);
        }

        con.close();
        return todosUsuarios;
    }

    public Usuario validar(Usuario usuario) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        Usuario us = null;

        PreparedStatement comando = con.prepareStatement("select * from usuario where email = ? and senha=md5(?)");
        comando.setString(1, usuario.getEmail());
        comando.setString(2, usuario.getSenha());

        ResultSet resultado = comando.executeQuery();

        if (resultado.next()) {
            us = new Usuario();
            us.setId(resultado.getInt("usuario_id"));
            us.setPerfil(PerfilAcesso.valueOf(resultado.getString("perfil")));
            us.setAtivo(resultado.getInt("ativo"));
            us.setNome(resultado.getString("nome"));
        }

        con.close();
        return us;
    }
}
