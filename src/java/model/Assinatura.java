package model;

import java.util.Date;

public class Assinatura {

    Integer id_assinatura;
    Integer usuario_id;
    String nome_usuario;
    Integer codigo_hash_pgto;
    boolean status_assinatura;
    Date data_inicio;
    Date data_termino;

    public Assinatura() {
    }

    public Assinatura(Integer id_assinatura, Integer usuario_id, String nome_usuario, Integer codigo_hash_pgto, boolean status_assinatura, Date data_inicio, Date data_termino) {
        this.id_assinatura = id_assinatura;
        this.usuario_id = usuario_id;
        this.nome_usuario = nome_usuario;
        this.codigo_hash_pgto = codigo_hash_pgto;
        this.status_assinatura = status_assinatura;
        this.data_inicio = data_inicio;
        this.data_termino = data_termino;
    }

    public Integer getId_assinatura() {
        return id_assinatura;
    }

    public void setId_assinatura(Integer id_assinatura) {
        this.id_assinatura = id_assinatura;
    }

    public Integer getUsuario_id() {
        return usuario_id;
    }

    public void setUsuario_id(Integer usuario_id) {
        this.usuario_id = usuario_id;
    }

    public String getNome_usuario() {
        return nome_usuario;
    }

    public void setNome_usuario(String nome_usuario) {
        this.nome_usuario = nome_usuario;
    }

    public Integer getCodigo_hash_pgto() {
        return codigo_hash_pgto;
    }

    public void setCodigo_hash_pgto(Integer codigo_hash_pgto) {
        this.codigo_hash_pgto = codigo_hash_pgto;
    }

    public boolean isStatus_assinatura() {
        return status_assinatura;
    }

    public void setStatus_assinatura(boolean status_assinatura) {
        this.status_assinatura = status_assinatura;
    }

    public Date getData_inicio() {
        return data_inicio;
    }

    public void setData_inicio(Date data_inicio) {
        this.data_inicio = data_inicio;
    }

    public Date getData_termino() {
        return data_termino;
    }

    public void setData_termino(Date data_termino) {
        this.data_termino = data_termino;
    }

}
