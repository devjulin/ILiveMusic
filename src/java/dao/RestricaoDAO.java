package dao;

import connection.ConnectionFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Restricao;

public class RestricaoDAO {

    private ConnectionFactory myConnection = new ConnectionFactory();
    private Connection con;
    private PreparedStatement stmt;
    private ResultSet rs;

    public boolean cadastrar(Restricao restricao) {
        boolean resp = false;
        try {

            con = myConnection.getConnection();
            String sql = "INSERT INTO restricao (usuario_id, restrito, dataInicio, dataTermino, motivo) VALUES (?, ?, ?, ?, ?)";
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, restricao.getUsuario_id());
            stmt.setBoolean(2, restricao.isRestrito());
            stmt.setDate(3, new java.sql.Date(restricao.getDataInicio().getTime()));
            stmt.setDate(4, new java.sql.Date(restricao.getDataTermino().getTime()));
            stmt.setString(5, restricao.getMotivo());
            stmt.executeUpdate();
            resp = true;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            myConnection.closeConnection(con, stmt);
        }
        return resp;
    }

    public boolean atualizar(Restricao restricao) {
        boolean verificar = false;
        con = myConnection.getConnection();
        String sql = "UPDATE restricao SET restrito=?, dataInicio=?, dataTermino=?, motivo=? WHERE id_restricao=? AND usuario_id=?";

        try {
            stmt = con.prepareStatement(sql);
            stmt.setBoolean(1, restricao.isRestrito());
            stmt.setDate(2, new java.sql.Date(restricao.getDataInicio().getTime()));
            stmt.setDate(3, new java.sql.Date(restricao.getDataTermino().getTime()));
            stmt.setString(4, restricao.getMotivo());
            stmt.setInt(5, restricao.getId_restricao());
            stmt.setInt(6, restricao.getUsuario_id());
            stmt.executeUpdate();
            verificar = true;
        } catch (Exception e) {
            System.out.println("Erro ao tentar atualizar a restricao: " + e);
        } finally {
            myConnection.closeConnection(con, stmt);
        }
        return verificar;
    }

    public Restricao buscarRestricao(int idUsuario) {
        Restricao restricao = null;
        con = myConnection.getConnection();
        String sql = "SELECT * FROM restricao WHERE usuario_id = ? AND restrito = true ORDER BY dataTermino DESC LIMIT 1";

        try {
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, idUsuario);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                restricao = new Restricao();
                restricao.setId_restricao(rs.getInt("id_restricao"));
                restricao.setUsuario_id(rs.getInt("usuario_id"));
                restricao.setRestrito(rs.getBoolean("restrito"));
                restricao.setDataInicio(rs.getDate("dataInicio"));
                restricao.setDataTermino(rs.getDate("dataTermino"));
                restricao.setMotivo(rs.getString("motivo"));
            }
        } catch (Exception e) {
            System.out.println("Erro ao buscar restrição: " + e);
        } finally {
            myConnection.closeConnection(con, stmt);
        }

        return restricao;
    }

    public boolean atualizarRestricao(Restricao restricao) {
        boolean verificar = false;
        con = myConnection.getConnection();
        String sql = "UPDATE restricao SET restrito = ? WHERE id_restricao = ?";

        try {
            stmt = con.prepareStatement(sql);
            stmt.setBoolean(1, restricao.isRestrito());
            stmt.setInt(2, restricao.getId_restricao());
            stmt.executeUpdate();
            verificar = true;
        } catch (Exception e) {
            System.out.println("Erro ao tentar atualizar a restrição!" + e);
        } finally {
            myConnection.closeConnection(con, stmt);
        }
        return verificar;
    }

    public List<Restricao> buscarTodasRestricoes() {
        List<Restricao> restricoes = new ArrayList<>();
        con = myConnection.getConnection();
        String sql = "SELECT * FROM restricao";

        try {
            stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Restricao restricao = new Restricao();
                restricao.setId_restricao(rs.getInt("id_restricao"));
                restricao.setUsuario_id(rs.getInt("usuario_id"));
                restricao.setRestrito(rs.getBoolean("restrito"));
                restricao.setDataInicio(rs.getDate("dataInicio"));
                restricao.setDataTermino(rs.getDate("dataTermino"));
                restricao.setMotivo(rs.getString("motivo"));

                restricoes.add(restricao);
            }
        } catch (SQLException e) {
            System.out.println("Erro ao buscar restrições: " + e);
        } finally {
            myConnection.closeConnection(con, stmt);
        }

        return restricoes;
    }

    public List<Restricao> buscarTodasRestricoeUsuario(int usuarioId) {
        List<Restricao> restricoes = new ArrayList<>();
        con = myConnection.getConnection();
        String sql = "SELECT * FROM restricao WHERE usuario_id = ? ORDER BY dataInicio DESC";

        try {
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, usuarioId); // Define o valor do parâmetro usuario_id na consulta SQL
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Restricao restricao = new Restricao();
                restricao.setId_restricao(rs.getInt("id_restricao"));
                restricao.setUsuario_id(rs.getInt("usuario_id"));
                restricao.setRestrito(rs.getBoolean("restrito"));
                restricao.setDataInicio(rs.getDate("dataInicio"));
                restricao.setDataTermino(rs.getDate("dataTermino"));
                restricao.setMotivo(rs.getString("motivo"));

                restricoes.add(restricao);
            }
        } catch (SQLException e) {
            System.out.println("Erro ao buscar restrições: " + e);
        } finally {
            myConnection.closeConnection(con, stmt);
        }

        return restricoes;
    }

}
