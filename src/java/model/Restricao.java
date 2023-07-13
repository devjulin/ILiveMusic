package model;

import java.util.Date;

public class Restricao {

    private int id_restricao;
    private int usuario_id;
    private boolean restrito;
    private Date dataInicio;
    private Date dataTermino;
    private String motivo;

    public Restricao() {
    }

    public Restricao(int id_restricao, int usuario_id, boolean restrito, Date dataInicio, Date dataTermino, String motivo) {
        this.id_restricao = id_restricao;
        this.usuario_id = usuario_id;
        this.restrito = restrito;
        this.dataInicio = dataInicio;
        this.dataTermino = dataTermino;
        this.motivo = motivo;
    }

    public int getId_restricao() {
        return id_restricao;
    }

    public void setId_restricao(int id_restricao) {
        this.id_restricao = id_restricao;
    }

    public int getUsuario_id() {
        return usuario_id;
    }

    public void setUsuario_id(int usuario_id) {
        this.usuario_id = usuario_id;
    }

    public boolean isRestrito() {
        return restrito;
    }

    public void setRestrito(boolean restrito) {
        this.restrito = restrito;
    }

    public Date getDataInicio() {
        return dataInicio;
    }

    public void setDataInicio(Date dataInicio) {
        this.dataInicio = dataInicio;
    }

    public Date getDataTermino() {
        return dataTermino;
    }

    public void setDataTermino(Date dataTermino) {
        this.dataTermino = dataTermino;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

}
