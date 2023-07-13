package dao;

import connection.ConnectionFactory;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Assinatura;

public class AssinaturaDAO {

    Assinatura assinatura = new Assinatura();
    private ConnectionFactory myConnection = new ConnectionFactory();
    private Connection con;
    private PreparedStatement stmt;
    private ResultSet rs;

    public boolean cadastrar_assinatura(Assinatura assinatura) {
        boolean resp = false;
        try {
            con = myConnection.getConnection();

            String sql = "INSERT INTO assinatura (usuario_id, codigo_hash_pgto, status_assinatura, data_inicio, data_termino) VALUES (?, ?, ?, ?, ?)";
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, assinatura.getUsuario_id());
            stmt.setInt(2, assinatura.getCodigo_hash_pgto());
            stmt.setBoolean(3, assinatura.isStatus_assinatura());
            stmt.setDate(4, new java.sql.Date(assinatura.getData_inicio().getTime()));
            stmt.setDate(5, new java.sql.Date(assinatura.getData_termino().getTime()));
            stmt.executeUpdate();
            resp = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            myConnection.closeConnection(con, stmt);
        }
        return resp;
    }

    public boolean obterStatusAssinatura(int idUsuario) {
        boolean statusAssinatura = false;

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = ConnectionFactory.getConnection();
            String query = "SELECT status_assinatura FROM assinatura WHERE usuario_id = ? ORDER BY data_termino DESC LIMIT 1";
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, idUsuario);
            rs = stmt.executeQuery();

            if (rs.next()) {
                statusAssinatura = rs.getBoolean("status_assinatura");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionFactory.closeConnection(conn, stmt, rs);
        }

        return statusAssinatura;
    }

    public Assinatura obterDataAssinaturaPorId(int id) {
        Assinatura assinatura = null;

        try {
            con = myConnection.getConnection();
            // Construir a consulta SQL
            String query = "SELECT data_inicio, data_termino FROM assinatura WHERE usuario_id = ? AND status_assinatura = ? ORDER BY data_termino DESC LIMIT 1";
            stmt = con.prepareStatement(query);
            stmt.setInt(1, id);
            stmt.setBoolean(2, true);

            // Executar a consulta SQL
            rs = stmt.executeQuery();

            // Verificar se há resultados
            if (rs.next()) {
                // Obter os valores das colunas data_inicio e data_termino
                Date dataInicio = rs.getDate("data_inicio");
                Date dataTermino = rs.getDate("data_termino");

                // Criar o objeto Assinatura e atribuir as datas
                assinatura = new Assinatura();
                assinatura.setData_inicio(dataInicio);
                assinatura.setData_termino(dataTermino);
            }
        } catch (SQLException e) {
            // Tratar exceções de banco de dados
            e.printStackTrace();
        } finally {
            myConnection.closeConnection(con, stmt, rs);
        }

        return assinatura;
    }

    public Assinatura ListarDataAssinaturaPorId(int id) {
        Assinatura assinatura = null;

        try {
            con = myConnection.getConnection();
            // Construir a consulta SQL
            String query = "SELECT data_inicio, data_termino FROM assinatura WHERE usuario_id = ?";
            stmt = con.prepareStatement(query);
            stmt.setInt(1, id);
            stmt.setBoolean(2, true);

            // Executar a consulta SQL
            rs = stmt.executeQuery();

            // Verificar se há resultados
            if (rs.next()) {
                // Obter os valores das colunas data_inicio e data_termino
                Date dataInicio = rs.getDate("data_inicio");
                Date dataTermino = rs.getDate("data_termino");

                // Criar o objeto Assinatura e atribuir as datas
                assinatura = new Assinatura();
                assinatura.setData_inicio(dataInicio);
                assinatura.setData_termino(dataTermino);
            }
        } catch (SQLException e) {
            // Tratar exceções de banco de dados
            e.printStackTrace();
        } finally {
            myConnection.closeConnection(con, stmt, rs);
        }

        return assinatura;
    }

    public List<Assinatura> obterTodasAssinaturas() {
        List<Assinatura> assinaturas = new ArrayList<>();

        try {
            con = myConnection.getConnection();
            String query = "SELECT * FROM assinatura";
            stmt = con.prepareStatement(query);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Assinatura assinatura = new Assinatura();
                assinatura.setId_assinatura(rs.getInt("id_assinatura"));
                assinatura.setData_termino(rs.getDate("data_termino"));
                assinatura.setStatus_assinatura(rs.getBoolean("status_assinatura"));

                assinaturas.add(assinatura);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            myConnection.closeConnection(con, stmt, rs);
        }

        return assinaturas;
    }

    public void atualizarAssinatura(Assinatura assinatura) {
        try {
            con = myConnection.getConnection();
            String query = "UPDATE assinatura SET status_assinatura = ? WHERE id_assinatura = ?";
            stmt = con.prepareStatement(query);
            stmt.setBoolean(1, assinatura.isStatus_assinatura());
            stmt.setInt(2, assinatura.getId_assinatura());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            myConnection.closeConnection(con, stmt);
        }
    }

    public List<Assinatura> read() {
        List<Assinatura> assinaturas = new ArrayList<>();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            con = myConnection.getConnection();
            String sql = "SELECT assinatura.*, usuario.nome AS nome_usuario FROM assinatura INNER JOIN usuario ON assinatura.usuario_id = usuario.idUsuario ORDER BY data_inicio DESC";
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Assinatura assinatura = new Assinatura(); // Criar uma nova instância em cada iteração para listar sempre um novo.
                assinatura.setId_assinatura(rs.getInt("id_assinatura"));
                assinatura.setUsuario_id(rs.getInt("usuario_id"));
                assinatura.setNome_usuario(rs.getString("nome_usuario"));
                assinatura.setCodigo_hash_pgto(rs.getInt("codigo_hash_pgto"));
                assinatura.setStatus_assinatura(rs.getBoolean("status_assinatura"));
                assinatura.setData_inicio(rs.getDate("data_inicio"));
                assinatura.setData_termino(rs.getDate("data_termino"));

                assinaturas.add(assinatura);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            myConnection.closeConnection(con, stmt, rs);
        }

        return assinaturas;
    }

    public boolean excluir(int id) {
        boolean resp = false;
        con = myConnection.getConnection();
        String sql = "delete from assinatura where id_assinatura=?";
        try {
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.executeUpdate();
            resp = true;
        } catch (Exception e) {
            System.out.println("Erro ao tentar excluir o assinatura!" + e);
        } finally {
            myConnection.closeConnection(con, stmt, rs);
        }
        return resp;
    }
}
