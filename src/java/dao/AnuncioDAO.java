package dao;

import bancoDeDados.FabricaConexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Anuncio;
import modelo.Categoria;
import modelo.SubCategoria;
import modelo.Vendedor;

public class AnuncioDAO {

    public void cadastrar(Anuncio anuncio) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement(
                "insert into anuncio (titulo,descricao,quantidade,preco,estado_produto,peso,altura,largura,categoria_id,subcategoria_id,data_cadastro,ativo,usuario_id,valor_frete,forma_envio,observacoes,cep, bairro,cidade,estado,rua,vaga,area,areatotal,ano,marca,cor,pic1,pic2,pic3,pic4,pic5,forma_pagamento,prazo_entrega, permite_alterar) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
        comando.setString(1, anuncio.getTitulo());
        comando.setString(2, anuncio.getDescricao());
        comando.setInt(3, anuncio.getQuantidade());
        comando.setDouble(4, anuncio.getPreco());
        comando.setString(5, anuncio.getEstadoprod());
        comando.setString(6, anuncio.getPeso());
        comando.setString(7, anuncio.getAltura());
        comando.setString(8, anuncio.getLargura());
        comando.setInt(9, anuncio.getCategoria().getId());
        comando.setInt(10, anuncio.getSubcategoria().getId());
        comando.setDate(11, anuncio.getData_cadastro());
        comando.setInt(12, anuncio.getAtivo());
        comando.setInt(13, anuncio.getVendedor().getId());
        comando.setDouble(14, anuncio.getValorFrete());
        comando.setString(15, anuncio.getFormaEnvio());
        comando.setString(16, anuncio.getObservacoes());
        comando.setString(17, anuncio.getCep());
        comando.setString(18, anuncio.getBairro());
        comando.setString(19, anuncio.getCidade());
        comando.setString(20, anuncio.getEstado());
        comando.setString(21, anuncio.getRua());
        comando.setString(22, anuncio.getVaga());
        comando.setString(23, anuncio.getArea());
        comando.setString(24, anuncio.getAreatotal());
        comando.setString(25, anuncio.getAno());
        comando.setString(26, anuncio.getMarca());
        comando.setString(27, anuncio.getCor());
        comando.setString(28, anuncio.getPic1());
        comando.setString(29, anuncio.getPic2());
        comando.setString(30, anuncio.getPic3());
        comando.setString(31, anuncio.getPic4());
        comando.setString(32, anuncio.getPic5());
        comando.setString(33, anuncio.getFormapag());
        comando.setInt(34, anuncio.getPrazo_entrega());
        comando.setString(35, anuncio.getPermite_alterar());
        comando.execute();
        con.close();
    }

    public void alterar(Anuncio anuncio) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement(
                "update anuncio set titulo=?,descricao=?,quantidade=?,preco=?,estado_produto=?,peso=?,altura=?,largura=?,valor_frete=?,forma_envio=?,observacoes=?,cep=?, bairro=?,cidade=?,estado=?,rua=?,vaga=?,area=?,areatotal=?,ano=?,marca=?,cor=?,pic1=?,pic2=?,pic3=?,pic4=?,pic5=?,forma_pagamento=?, prazo_entrega=? where anuncio_id = ?");
        comando.setString(1, anuncio.getTitulo());
        comando.setString(2, anuncio.getDescricao());
        comando.setInt(3, anuncio.getQuantidade());
        comando.setDouble(4, anuncio.getPreco());
        comando.setString(5, anuncio.getEstadoprod());
        comando.setString(6, anuncio.getPeso());
        comando.setString(7, anuncio.getAltura());
        comando.setString(8, anuncio.getLargura());        
        comando.setDouble(9, anuncio.getValorFrete());
        comando.setString(10, anuncio.getFormaEnvio());
        comando.setString(11, anuncio.getObservacoes());
        comando.setString(12, anuncio.getCep());
        comando.setString(13, anuncio.getBairro());
        comando.setString(14, anuncio.getCidade());
        comando.setString(15, anuncio.getEstado());
        comando.setString(16, anuncio.getRua());
        comando.setString(17, anuncio.getVaga());
        comando.setString(18, anuncio.getArea());
        comando.setString(19, anuncio.getAreatotal());
        comando.setString(20, anuncio.getAno());
        comando.setString(21, anuncio.getMarca());
        comando.setString(22, anuncio.getCor());
        comando.setString(23, anuncio.getPic1());
        comando.setString(24, anuncio.getPic2());
        comando.setString(25, anuncio.getPic3());
        comando.setString(26, anuncio.getPic4());
        comando.setString(27, anuncio.getPic5());
        comando.setString(28, anuncio.getFormapag());
        comando.setInt(29, anuncio.getPrazo_entrega());
        comando.setInt(30, anuncio.getId());
        comando.execute();
        con.close();
    }

    public void atualizarQuantidade(Anuncio anuncio) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("update anuncio set quantidade=?, permite_alterar='Não' where anuncio_id = ?");
        comando.setInt(1, anuncio.getQuantidade());
        comando.setInt(2, anuncio.getId());
        comando.execute();
        con.close();
    }

    public void encerrar(Anuncio anuncio) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("update anuncio set ativo = 2, motivo = ? where anuncio_id = ?");
        comando.setString(1, anuncio.getMotivo());
        comando.setInt(2, anuncio.getId());
        comando.execute();
        con.close();
    }

    public List<Anuncio> pesquisa(String palavra) throws ClassNotFoundException, SQLException {

        Connection con = FabricaConexao.getConexao();

        PreparedStatement comando = con.prepareStatement("SELECT * FROM anuncio join categoria on anuncio.categoria_id = categoria.categoria_id join subcategoria on anuncio.subcategoria_id = subcategoria.subcategoria_id where anuncio.ativo=1 and (anuncio.titulo ~* ? or categoria.nome ~* ? or subcategoria.nome ~*?)");
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
            anuncio.setEstadoprod(resultado.getString("estado_produto"));
            anuncio.setPeso(resultado.getString("peso"));
            anuncio.setAltura(resultado.getString("altura"));
            anuncio.setLargura(resultado.getString("largura"));
            anuncio.setCep(resultado.getString("cep"));
            anuncio.setBairro(resultado.getString("bairro"));
            anuncio.setCidade(resultado.getString("cidade"));
            anuncio.setEstado(resultado.getString("estado"));
            anuncio.setRua(resultado.getString("rua"));
            anuncio.setVaga(resultado.getString("vaga"));
            anuncio.setArea(resultado.getString("area"));
            anuncio.setAreatotal(resultado.getString("areatotal"));
            anuncio.setAno(resultado.getString("ano"));
            anuncio.setMarca(resultado.getString("marca"));
            anuncio.setCor(resultado.getString("cor"));
            anuncio.setPic1(resultado.getString("pic1"));
            anuncio.setPic2(resultado.getString("pic2"));
            anuncio.setPic3(resultado.getString("pic3"));
            anuncio.setPic4(resultado.getString("pic4"));
            anuncio.setPic5(resultado.getString("pic5"));
            anuncio.setMotivo(resultado.getString("motivo"));
            anuncio.setFormapag(resultado.getString("forma_pagamento"));
            anuncio.setPrazo_entrega(resultado.getInt("prazo_entrega"));
            anuncio.setPermite_alterar(resultado.getString("permite_alterar"));

            Categoria categoria = new Categoria();
            categoria.setId(resultado.getInt("categoria_id"));

            CategoriaDAO dao = new CategoriaDAO();

            SubCategoria subcategoria = new SubCategoria();
            subcategoria.setId(resultado.getInt("subcategoria_id"));

            SubCategoriaDAO sdao = new SubCategoriaDAO();

            anuncio.setCategoria(dao.consultarId(categoria));
            anuncio.setSubcategoria(sdao.consultar(subcategoria));
            anuncio.setData_cadastro(resultado.getDate("data_cadastro"));

            Vendedor vendedor = new Vendedor();
            vendedor.setId(resultado.getInt("usuario_id"));
            
            UsuarioDAO daou = new UsuarioDAO();
            
            anuncio.setVendedor((Vendedor) daou.consultar(vendedor));

            anuncio.setValorFrete(resultado.getDouble("valor_frete"));
            anuncio.setFormaEnvio(resultado.getString("forma_envio"));
            anuncio.setObservacoes(resultado.getString("observacoes"));
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
            anuncio.setEstadoprod(resultado.getString("estado_produto"));
            anuncio.setPeso(resultado.getString("peso"));
            anuncio.setAltura(resultado.getString("altura"));
            anuncio.setLargura(resultado.getString("largura"));
            anuncio.setCep(resultado.getString("cep"));
            anuncio.setBairro(resultado.getString("bairro"));
            anuncio.setCidade(resultado.getString("cidade"));
            anuncio.setEstado(resultado.getString("estado"));
            anuncio.setRua(resultado.getString("rua"));
            anuncio.setVaga(resultado.getString("vaga"));
            anuncio.setArea(resultado.getString("area"));
            anuncio.setAreatotal(resultado.getString("areatotal"));
            anuncio.setAno(resultado.getString("ano"));
            anuncio.setMarca(resultado.getString("marca"));
            anuncio.setCor(resultado.getString("cor"));
            anuncio.setPic1(resultado.getString("pic1"));
            anuncio.setPic2(resultado.getString("pic2"));
            anuncio.setPic3(resultado.getString("pic3"));
            anuncio.setPic4(resultado.getString("pic4"));
            anuncio.setPic5(resultado.getString("pic5"));
            anuncio.setMotivo(resultado.getString("motivo"));
            anuncio.setFormapag(resultado.getString("forma_pagamento"));
            anuncio.setPrazo_entrega(resultado.getInt("prazo_entrega"));
            anuncio.setPermite_alterar(resultado.getString("permite_alterar"));
            
            Categoria categoria = new Categoria();
            categoria.setId(resultado.getInt("categoria_id"));

            CategoriaDAO dao = new CategoriaDAO();

            SubCategoria subcategoria = new SubCategoria();
            subcategoria.setId(resultado.getInt("subcategoria_id"));

            SubCategoriaDAO sdao = new SubCategoriaDAO();

            anuncio.setCategoria(dao.consultarId(categoria));
            anuncio.setSubcategoria(sdao.consultar(subcategoria));
            anuncio.setData_cadastro(resultado.getDate("data_cadastro"));

            Vendedor v = new Vendedor();
            v.setId(resultado.getInt("usuario_id"));
            
            UsuarioDAO vendedor1 = new UsuarioDAO();
            anuncio.setVendedor((Vendedor)vendedor1.consultar(v));

            anuncio.setValorFrete(resultado.getDouble("valor_frete"));
            anuncio.setFormaEnvio(resultado.getString("forma_envio"));
            anuncio.setObservacoes(resultado.getString("observacoes"));
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
            Anuncio a = new Anuncio();
            a.setId(resultado.getInt("anuncio_id"));
            a.setTitulo(resultado.getString("titulo"));
            a.setDescricao(resultado.getString("descricao"));
            a.setQuantidade(resultado.getInt("quantidade"));
            a.setPreco(resultado.getDouble("preco"));
            a.setEstadoprod(resultado.getString("estado_produto"));
            a.setPeso(resultado.getString("peso"));
            a.setAltura(resultado.getString("altura"));
            a.setLargura(resultado.getString("largura"));
            a.setCep(resultado.getString("cep"));
            a.setBairro(resultado.getString("bairro"));
            a.setCidade(resultado.getString("cidade"));
            a.setEstado(resultado.getString("estado"));
            a.setRua(resultado.getString("rua"));
            a.setVaga(resultado.getString("vaga"));
            a.setArea(resultado.getString("area"));
            a.setAreatotal(resultado.getString("areatotal"));
            a.setAno(resultado.getString("ano"));
            a.setMarca(resultado.getString("marca"));
            a.setCor(resultado.getString("cor"));
            a.setPic1(resultado.getString("pic1"));
            a.setPic2(resultado.getString("pic2"));
            a.setPic3(resultado.getString("pic3"));
            a.setPic4(resultado.getString("pic4"));
            a.setPic5(resultado.getString("pic5"));
            a.setMotivo(resultado.getString("motivo"));
            a.setFormapag(resultado.getString("forma_pagamento"));
            a.setPrazo_entrega(resultado.getInt("prazo_entrega"));
            a.setPermite_alterar(resultado.getString("permite_alterar"));
            
            Categoria categoria = new Categoria();
            categoria.setId(resultado.getInt("categoria_id"));

            CategoriaDAO dao = new CategoriaDAO();

            SubCategoria subcategoria = new SubCategoria();
            subcategoria.setId(resultado.getInt("subcategoria_id"));

            SubCategoriaDAO sdao = new SubCategoriaDAO();

            a.setCategoria(dao.consultarId(categoria));
            a.setSubcategoria(sdao.consultar(subcategoria));
            a.setData_cadastro(resultado.getDate("data_cadastro"));

            Vendedor v = new Vendedor();
            v.setId(resultado.getInt("usuario_id"));
            a.setVendedor(v);

            a.setValorFrete(resultado.getDouble("valor_frete"));
            a.setFormaEnvio(resultado.getString("forma_envio"));
            a.setObservacoes(resultado.getString("observacoes"));
            a.setAtivo(resultado.getInt("ativo"));
            todosAnuncios.add(a);
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
            Anuncio a = new Anuncio();
            a.setId(resultado.getInt("anuncio_id"));
            a.setTitulo(resultado.getString("titulo"));
            a.setDescricao(resultado.getString("descricao"));
            a.setQuantidade(resultado.getInt("quantidade"));
            a.setPreco(resultado.getDouble("preco"));
            a.setEstadoprod(resultado.getString("estado_produto"));
            a.setPeso(resultado.getString("peso"));
            a.setAltura(resultado.getString("altura"));
            a.setLargura(resultado.getString("largura"));
            a.setCep(resultado.getString("cep"));
            a.setBairro(resultado.getString("bairro"));
            a.setCidade(resultado.getString("cidade"));
            a.setEstado(resultado.getString("estado"));
            a.setRua(resultado.getString("rua"));
            a.setVaga(resultado.getString("vaga"));
            a.setArea(resultado.getString("area"));
            a.setAreatotal(resultado.getString("areatotal"));
            a.setAno(resultado.getString("ano"));
            a.setMarca(resultado.getString("marca"));
            a.setCor(resultado.getString("cor"));
            a.setPic1(resultado.getString("pic1"));
            a.setPic2(resultado.getString("pic2"));
            a.setPic3(resultado.getString("pic3"));
            a.setPic4(resultado.getString("pic4"));
            a.setPic5(resultado.getString("pic5"));
            a.setMotivo(resultado.getString("motivo"));
            a.setFormapag(resultado.getString("forma_pagamento"));
            a.setPrazo_entrega(resultado.getInt("prazo_entrega"));
            a.setPermite_alterar(resultado.getString("permite_alterar"));
            
            Categoria categoria = new Categoria();
            categoria.setId(resultado.getInt("categoria_id"));

            CategoriaDAO dao = new CategoriaDAO();

            SubCategoria subcategoria = new SubCategoria();
            subcategoria.setId(resultado.getInt("subcategoria_id"));

            SubCategoriaDAO sdao = new SubCategoriaDAO();

            a.setCategoria(dao.consultarId(categoria));
            a.setSubcategoria(sdao.consultar(subcategoria));
            a.setData_cadastro(resultado.getDate("data_cadastro"));

            Vendedor v = new Vendedor();
            v.setId(resultado.getInt("usuario_id"));
            a.setVendedor(v);

            a.setValorFrete(resultado.getDouble("valor_frete"));
            a.setFormaEnvio(resultado.getString("forma_envio"));
            a.setObservacoes(resultado.getString("observacoes"));
            a.setAtivo(resultado.getInt("ativo"));
            todosAnuncios.add(a);
        }

        con.close();
        return todosAnuncios;
    }
}
