package dao;

import connection.ConnectionFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Playlist;

public class PlaylistDAO {

    private ConnectionFactory myConnection = new ConnectionFactory();
    private Connection con;
    private PreparedStatement stmt;
    private ResultSet rs;

    public boolean criarPlaylist(Playlist playlist) {
        boolean verificar = false;
        con = myConnection.getConnection();
        String sql = "INSERT INTO playlist (usuario_id, caminho_pasta, nome_playlist, caminho_imagem, privado) VALUES (?, ?, ?, ?, ?)";

        try {
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, playlist.getUsuario_id());
            stmt.setString(2, playlist.getCaminho_pasta());
            stmt.setString(3, playlist.getNome_playlist());
            stmt.setString(4, playlist.getCaminho_imagem());
            stmt.setBoolean(5, false);
            stmt.executeUpdate();
            verificar = true;
        } catch (SQLException e) {
            System.out.println("Erro ao criar playlist: " + e);
        } finally {
            myConnection.closeConnection(con, stmt);
        }

        return verificar;
    }

    public boolean atualizarPlaylist(Playlist playlist) {
        boolean verificar = false;
        con = myConnection.getConnection();
        String sql = "UPDATE playlist SET caminho_pasta = ?, nome_playlist = ?, caminho_imagem = ? WHERE id_playlist = ? AND usuario_id = ?";

        try {
            stmt = con.prepareStatement(sql);
            stmt.setString(1, playlist.getCaminho_pasta());
            stmt.setString(2, playlist.getNome_playlist());
            stmt.setString(3, playlist.getCaminho_imagem());
            stmt.setInt(4, playlist.getId_playlist());
            stmt.setInt(5, playlist.getUsuario_id());
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                verificar = true;
            }
        } catch (SQLException e) {
            System.out.println("Erro ao atualizar playlist: " + e);
        } finally {
            myConnection.closeConnection(con, stmt);
        }

        return verificar;
    }

    public boolean excluirPlaylist(int idPlaylist) {
        boolean verificar = false;
        con = myConnection.getConnection();
        String sql = "DELETE FROM playlist WHERE id_playlist = ?";

        try {
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, idPlaylist);
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                verificar = true;
            }
        } catch (SQLException e) {
            System.out.println("Erro ao excluir playlist: " + e);
        } finally {
            myConnection.closeConnection(con, stmt);
        }

        return verificar;
    }

    public String obterCaminhoPasta(int idPlaylist) {
        con = myConnection.getConnection();
        String caminhoPasta = null;
        String sql = "SELECT caminho_pasta FROM playlist WHERE id_playlist = ?";

        try {
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, idPlaylist);
            rs = stmt.executeQuery();

            if (rs.next()) {
                caminhoPasta = rs.getString("caminho_pasta");
                System.out.println("DAO CAMINHO PASTA:" + caminhoPasta);
            }
        } catch (SQLException e) {
            System.out.println("Erro ao obter caminho da pasta: " + e);
        } finally {
            myConnection.closeConnection(con, stmt, rs);
        }

        return caminhoPasta;
    }

    public List<Playlist> listarPlaylists(int idUsuario) {
        con = myConnection.getConnection();
        List<Playlist> playlists = new ArrayList<>();
        String sql = "SELECT * FROM playlist WHERE usuario_id = ?";

        try {
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, idUsuario);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Playlist playlist = new Playlist();
                playlist.setId_playlist(rs.getInt("id_playlist"));
                playlist.setNome_playlist(rs.getString("nome_playlist"));
                playlist.setCaminho_pasta(rs.getString("caminho_pasta"));
                playlist.setCaminho_imagem(rs.getString("caminho_imagem"));
                playlist.setData_criacao(rs.getTimestamp("data_criacao"));
                playlist.setPrivado(rs.getBoolean("privado"));
                playlist.setUsuario_id(rs.getInt("usuario_id"));

                playlists.add(playlist);
            }
        } catch (SQLException e) {
            System.out.println("Erro ao listar playlists: " + e);
        } finally {
            myConnection.closeConnection(con, stmt, rs);
        }

        return playlists;
    }

    public Playlist selecionarPlaylist(int idPlaylist) {
        con = myConnection.getConnection();
        Playlist playlist = null; // Inicialize a variável playlist como null
        String sql = "SELECT * FROM playlist WHERE id_playlist = ?";

        try {
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, idPlaylist);
            rs = stmt.executeQuery();

            if (rs.next()) {
                playlist = new Playlist();
                playlist.setId_playlist(rs.getInt("id_playlist"));
                playlist.setNome_playlist(rs.getString("nome_playlist"));
                playlist.setCaminho_pasta(rs.getString("caminho_pasta"));
                playlist.setCaminho_imagem(rs.getString("caminho_imagem"));
                playlist.setData_criacao(rs.getTimestamp("data_criacao"));
                playlist.setUsuario_id(rs.getInt("usuario_id"));
            }
        } catch (SQLException e) {
            System.out.println("Erro ao obter caminho da pasta: " + e);
        } finally {
            myConnection.closeConnection(con, stmt, rs);
        }

        return playlist; // Retorne a instância de Playlist preenchida
    }

}
