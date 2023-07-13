package model;

import java.util.Date;

public class Pagamento {

    Integer id_pagamento;
    Integer usuario_id;
    boolean status_pagamento;
    Date data_espiracao;
    int qtd_dias_premium;
    Integer codigo_hash;

    public Pagamento() {
    }

    public Pagamento(Integer id_pagamento, Integer usuario_id, boolean status_pagamento, Date data_espiracao, int qtd_dias_premium, Integer codigo_hash) {
        this.id_pagamento = id_pagamento;
        this.usuario_id = usuario_id;
        this.status_pagamento = status_pagamento;
        this.data_espiracao = data_espiracao;
        this.qtd_dias_premium = qtd_dias_premium;
        this.codigo_hash = codigo_hash;
    }

    public Integer getId_pagamento() {
        return id_pagamento;
    }

    public void setId_pagamento(Integer id_pagamento) {
        this.id_pagamento = id_pagamento;
    }

    public Integer getUsuario_id() {
        return usuario_id;
    }

    public void setUsuario_id(Integer usuario_id) {
        this.usuario_id = usuario_id;
    }

    public boolean isStatus_pagamento() {
        return status_pagamento;
    }

    public void setStatus_pagamento(boolean status_pagamento) {
        this.status_pagamento = status_pagamento;
    }

    public Date getData_espiracao() {
        return data_espiracao;
    }

    public void setData_espiracao(Date data_espiracao) {
        this.data_espiracao = data_espiracao;
    }

    public int getQtd_dias_premium() {
        return qtd_dias_premium;
    }

    public void setQtd_dias_premium(int qtd_dias_premium) {
        this.qtd_dias_premium = qtd_dias_premium;
    }

    public Integer getCodigo_hash() {
        return codigo_hash;
    }

    public void setCodigo_hash(Integer codigo_hash) {
        this.codigo_hash = codigo_hash;
    }

}
