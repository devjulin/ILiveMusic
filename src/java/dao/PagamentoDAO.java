package dao;

import connection.ConnectionFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import model.Pagamento;

public class PagamentoDAO {

    private ConnectionFactory myConnection = new ConnectionFactory();
    private Connection con;
    private PreparedStatement stmt;
    private ResultSet rs;

    public boolean cadastrar(Pagamento pagamento) {
        boolean resp = false;
        try {
            Connection con = myConnection.getConnection();
            int codigoAleatorio = gerarCodigoAleatorio();

            while (codigoJaExiste(con, codigoAleatorio)) {
                codigoAleatorio = gerarCodigoAleatorio();
            }

            int usuarioId = pagamento.getUsuario_id();
            String codigoHash = String.valueOf(usuarioId) + codigoAleatorio;
            pagamento.setCodigo_hash(codigoAleatorio);

            String sql = "INSERT INTO pagamento (usuario_id, status_pagamento, data_expiracao, qtd_dias_premium, codigo_hash) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, usuarioId);
            stmt.setBoolean(2, pagamento.isStatus_pagamento());
            stmt.setDate(3, new java.sql.Date(pagamento.getData_espiracao().getTime()));
            stmt.setInt(4, pagamento.getQtd_dias_premium());
            stmt.setString(5, codigoHash);
            stmt.executeUpdate();
            resp = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            myConnection.closeConnection(con, stmt);
        }
        return resp;
    }

    private int gerarCodigoAleatorio() {
        Random random = new Random();
        return random.nextInt(1000000); // Intervalo de tempo para o código aleatório.
    }

    private boolean codigoJaExiste(Connection con, int codigo) {
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT COUNT(*) FROM pagamento WHERE codigo_hash = ?";
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, codigo);
            rs = stmt.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            myConnection.closeConnection(null, stmt, rs);
        }
        return false;
    }

    public int buscarUltimoCodigoHash(int usuarioId) {
        int ultimoCodigoHash = -1;
        Connection con = null;
        PreparedStatement stmt = null;

        try {
            con = myConnection.getConnection();
            String sql = "SELECT codigo_hash FROM pagamento WHERE usuario_id = ? ORDER BY id_pagamento DESC LIMIT 1";
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, usuarioId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                ultimoCodigoHash = rs.getInt("codigo_hash");
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            myConnection.closeConnection(con, stmt);
        }

        return ultimoCodigoHash;
    }

    public List<Pagamento> read() {
        List<Pagamento> pagamentos = new ArrayList<>();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            con = myConnection.getConnection();
            String sql = "SELECT * FROM pagamento ORDER BY data_expiracao DESC";
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Pagamento pagamento = new Pagamento();
                pagamento.setUsuario_id(rs.getInt("usuario_id"));
                pagamento.setStatus_pagamento(rs.getBoolean("status_pagamento"));
                pagamento.setData_espiracao(rs.getDate("data_expiracao"));
                pagamento.setQtd_dias_premium(rs.getInt("qtd_dias_premium"));
                pagamento.setCodigo_hash(rs.getInt("codigo_hash"));

                pagamentos.add(pagamento);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            myConnection.closeConnection(con, stmt, rs);
        }

        return pagamentos;
    }

    public void excluirPagamentosExpirados() {
        Connection con = null;
        PreparedStatement stmt = null;

        try {
            con = myConnection.getConnection();
            String sql = "DELETE FROM pagamento WHERE status_pagamento = false AND data_expiracao <= CURDATE()";
            stmt = con.prepareStatement(sql);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            myConnection.closeConnection(con, stmt);
        }
    }

    public boolean alterarStatusPagamento(int cod_hash_pgto, boolean novoStatus) {
        boolean sucesso = false;
        Connection con = null;
        PreparedStatement stmt = null;

        try {
            con = myConnection.getConnection();
            String sql = "UPDATE pagamento SET status_pagamento = ? WHERE codigo_hash = ?";
            stmt = con.prepareStatement(sql);
            stmt.setBoolean(1, novoStatus);
            stmt.setInt(2, cod_hash_pgto);
            int rowsUpdated = stmt.executeUpdate();
            sucesso = rowsUpdated > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            myConnection.closeConnection(con, stmt);
        }

        return sucesso;
    }

}
