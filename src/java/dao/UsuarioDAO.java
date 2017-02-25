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
import modelo.Usuario;

/**
 *
 * @author ailto
 */
public class UsuarioDAO {

    public void cadastrar(Usuario usuario) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con
                .prepareStatement("insert into usuario (cpf,email,nome,senha,telefone) values (?,?,?,?,?)");
        comando.setString(1, usuario.getCpf());
        comando.setString(2, usuario.getEmail());
        comando.setString(3, usuario.getNome());
        comando.setString(4, usuario.getSenha());
        comando.setString(5, usuario.getTelefone());

        comando.execute();
        con.close();
    }

    public void alterar(Usuario usuario) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("update usuario set telefone=?,senha=? where usuario_id = ?");
        comando.setString(1, usuario.getTelefone());
        comando.setString(2, usuario.getSenha());
        comando.setInt(3, usuario.getId());
        comando.execute();

        con.close();
    }

    public void excluir(Usuario usuario) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("delete from usuarios where id = ?");
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
            // us.setPerfilAcesso(resultado.getString("perfil_acesso"));

        }

        con.close();
        return us;
    }

}
