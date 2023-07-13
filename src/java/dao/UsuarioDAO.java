package dao;

import connection.ConnectionFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Usuario;

public class UsuarioDAO {

    //Objeto para a Conexão com Banco de Dados
    private ConnectionFactory myConnection = new ConnectionFactory();
    private Connection con;
    private PreparedStatement stmt;
    private ResultSet rs;

    //cadastrar contade usuario iliveMusic
    public boolean cadastrar(Usuario usuario) {
        boolean verificar = false;
        con = myConnection.getConnection();
        String sql = "INSERT INTO usuario (nome, usuario, email, senha, permissao) VALUES (?, ?, ?, ?, ?)";

        try {
            stmt = con.prepareStatement(sql);
            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getUsuario());
            stmt.setString(3, usuario.getEmail());
            stmt.setString(4, usuario.getSenha());
            stmt.setString(5, "comum");
            stmt.executeUpdate();
            verificar = true;
        } catch (Exception e) {
            System.out.println("Erro ao cadastrar usuário: " + e);
        } finally {
            myConnection.closeConnection(con, stmt);
        }

        return verificar;
    }

    public boolean cadastrar_painel_adm(Usuario usuario) {
        boolean verificar = false;
        con = myConnection.getConnection();
        String sql = "insert into usuario(nome, usuario, email, senha, permissao) values(?, ?, ?, ?, ?)";
        try {
            stmt = con.prepareCall(sql);
            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getUsuario());
            stmt.setString(3, usuario.getEmail());
            stmt.setString(4, usuario.getSenha());
            stmt.setString(5, usuario.getPermissao());
            stmt.executeUpdate();
            verificar = true;
        } catch (Exception e) {
            System.out.println("Erro ao cadastrar usuario!" + e);
        } finally {
            myConnection.closeConnection(con, stmt);
        }
        return verificar;
    }

    public Usuario logar(Usuario usuario) {
        Usuario usu = new Usuario();
        String sql = "select * from usuario where usuario =? and senha =?";
        con = myConnection.getConnection();
        try {
            stmt = con.prepareCall(sql);
            stmt.setString(1, usuario.getUsuario());
            stmt.setString(2, usuario.getSenha());
            rs = stmt.executeQuery();
            while (rs.next()) {
                usu.setIdUsuario(rs.getInt("idUsuario"));
                usu.setNome(rs.getString("nome"));
                usu.setUsuario(rs.getString("usuario"));
                usu.setEmail(rs.getString("email"));
                usu.setSenha(rs.getString("senha"));
                usu.setPermissao(rs.getString("permissao"));
            }
        } catch (SQLException e) {
            System.out.println("OPS... Erro ao tentar logar!" + e);
        } finally {
            myConnection.closeConnection(con, stmt, rs);
        }
        return usu;
    }

    public Usuario listar_usuario(int id) {
        con = myConnection.getConnection();
        String sql = "select * from usuario where idUsuario=?";
        Usuario usuario = new Usuario();
        try {
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            while (rs.next()) {
                usuario.setIdUsuario(rs.getInt("idUsuario"));
                usuario.setNome(rs.getString("nome"));
                usuario.setUsuario(rs.getString("usuario"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setPermissao(rs.getString("permissao"));
                usuario.setFoto_perfil((rs.getString("foto_perfil")));
            }
        } catch (Exception e) {
            System.out.println("Erro ao tentar listar Usuarios");
        } finally {
            myConnection.closeConnection(con, stmt, rs);
        }
        return usuario;
    }

    public List<Usuario> read() {
        con = myConnection.getConnection();
        List usuarios = new ArrayList();
        String sql = "select * from usuario";
        try {
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                Usuario usu = new Usuario();

                usu.setIdUsuario(rs.getInt("idUsuario"));
                usu.setNome(rs.getString("nome"));
                usu.setUsuario(rs.getString("usuario"));
                usu.setEmail(rs.getString("email"));
                usu.setSenha(rs.getString("senha"));
                usu.setPermissao(rs.getString("permissao"));
                usu.setFoto_perfil(rs.getString("foto_perfil"));

                usuarios.add(usu);
            }
        } catch (Exception e) {
            System.out.println("Erro ao tentar listar Usuarios" + e);
        } finally {
            myConnection.closeConnection(con, stmt, rs);
        }
        return usuarios;
    }

    public boolean verificarUsuarioExistente(String usuario) {
        con = myConnection.getConnection();
        String sql = "SELECT COUNT(*) AS count FROM usuario WHERE usuario = ?";
        try {
            stmt = con.prepareStatement(sql);
            stmt.setString(1, usuario);
            rs = stmt.executeQuery();
            if (rs.next()) {
                int count = rs.getInt("count");
                return count > 0;
            }
        } catch (Exception e) {
            System.out.println("Erro ao verificar usuário existente: " + e);
        } finally {
            myConnection.closeConnection(con, stmt, rs);
        }
        return false;
    }

    public boolean excluir(int id) {
        boolean resp = false;
        con = myConnection.getConnection();
        String sqlAssinatura = "DELETE FROM assinatura WHERE usuario_id=?";
        String sqlPagamento = "DELETE FROM pagamento WHERE usuario_id=?";
        String sqlRestricao = "DELETE FROM restricao WHERE usuario_id=?";
        String sqlUsuario = "DELETE FROM usuario WHERE idUsuario=?";

        try {
            // Excluir registros da tabela "assinatura"
            PreparedStatement stmtAssinatura = con.prepareStatement(sqlAssinatura);
            stmtAssinatura.setInt(1, id);
            stmtAssinatura.executeUpdate();

            // Excluir registros da tabela "pagamento"
            PreparedStatement stmtPagamento = con.prepareStatement(sqlPagamento);
            stmtPagamento.setInt(1, id);
            stmtPagamento.executeUpdate();

            // Excluir registros da tabela "restricao"
            PreparedStatement stmtRestricao = con.prepareStatement(sqlRestricao);
            stmtRestricao.setInt(1, id);
            stmtRestricao.executeUpdate();

            // Excluir usuário
            PreparedStatement stmtUsuario = con.prepareStatement(sqlUsuario);
            stmtUsuario.setInt(1, id);
            stmtUsuario.executeUpdate();

            resp = true;
        } catch (Exception e) {
            System.out.println("Erro ao tentar excluir o usuário: " + e);
        } finally {
            myConnection.closeConnection(con, stmt, null);
            myConnection.closeConnection(null, stmt, null);
            myConnection.closeConnection(null, stmt, null);
            myConnection.closeConnection(null, stmt, null);
        }
        return resp;
    }

    public boolean atualizar(Usuario usuario) {
        boolean verificar = false;
        con = myConnection.getConnection();
        String sql = "update usuario set nome=?, usuario=?, email=?, senha=?, permissao=? where idUsuario=?";

        try {
            stmt = con.prepareStatement(sql);
            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getUsuario());
            stmt.setString(3, usuario.getEmail());
            stmt.setString(4, usuario.getSenha());
            stmt.setString(5, usuario.getPermissao());
            stmt.setInt(6, usuario.getIdUsuario());
            stmt.executeUpdate();
            verificar = true;
        } catch (Exception e) {
            System.out.println("Erro ao tentar atualizar dados do usuario!" + e);
        } finally {
            myConnection.closeConnection(con, stmt);
        }
        return verificar;
    }

    public boolean atualizar_meu_perfil(Usuario usuario) {
        boolean verificar = false;
        con = myConnection.getConnection();
        String sql = "update usuario set nome=?, email=?, senha=? where idUsuario=?";

        try {
            stmt = con.prepareStatement(sql);
            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getEmail());
            stmt.setString(3, usuario.getSenha());
            stmt.setInt(4, usuario.getIdUsuario());
            stmt.executeUpdate();
            verificar = true;
        } catch (Exception e) {
            System.out.println("Erro ao tentar atualizar dados do usuario!" + e);
        } finally {
            myConnection.closeConnection(con, stmt);
        }
        return verificar;
    }

    public boolean atualizar_foto_perfil(Usuario usuario) {
        boolean verificar = false;
        con = myConnection.getConnection();
        String sql = "update usuario set foto_perfil=? where idUsuario=?";

        try {
            stmt = con.prepareStatement(sql);
            stmt.setString(1, usuario.getFoto_perfil());
            stmt.setInt(2, usuario.getIdUsuario());
            stmt.executeUpdate();
            verificar = true;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Erro ao tentar atualizar dados do usuario!" + e);
        } finally {
            myConnection.closeConnection(con, stmt);
        }
        return verificar;
    }

    public List<String> listarLogin() {
        con = myConnection.getConnection();
        List<String> usuarios = new ArrayList<>();
        String sql = "SELECT usuario FROM usuario";
        try {
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                String usuario = rs.getString("usuario");
                usuarios.add(usuario);
            }
        } catch (SQLException e) {
            System.out.println("Erro ao tentar listar usuários: " + e.getMessage());
        } finally {
            myConnection.closeConnection(con, stmt, rs);
        }
        return usuarios;
    }

}
