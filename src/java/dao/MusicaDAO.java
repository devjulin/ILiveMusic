package dao;

import connection.ConnectionFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Musica;

public class MusicaDAO {

    private ConnectionFactory myConnection = new ConnectionFactory();
    private Connection con;
    private PreparedStatement stmt;
    private ResultSet rs;

    public boolean inserirMusica(Musica musica) {
        boolean verificar = false;
        con = myConnection.getConnection();
        String sql = "INSERT INTO musica (playlist_id, caminho_musica, imagem_musica) VALUES (?, ?, ?)";

        try {
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, musica.getPlaylistId());
            stmt.setString(2, musica.getCaminhoMusica());
            stmt.setString(3, musica.getImagemMusica());
            stmt.executeUpdate();
            verificar = true;
        } catch (SQLException e) {
            System.out.println("Erro ao criar música: " + e);
        } finally {
            myConnection.closeConnection(con, stmt);
        }

        return verificar;
    }
}
