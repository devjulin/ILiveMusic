package model;

import java.sql.Timestamp;

public class Playlist {

    private Integer id_playlist;
    private Integer usuario_id;
    private String caminho_pasta;
    private String nome_playlist;
    private Timestamp data_criacao;
    private String caminho_imagem;
    private boolean privado;

    public Playlist() {
    }

    public Playlist(Integer id_playlist, Integer usuario_id, String caminho_pasta, String nome_playlist, Timestamp data_criacao, String caminho_imagem, boolean privado) {
        this.id_playlist = id_playlist;
        this.usuario_id = usuario_id;
        this.caminho_pasta = caminho_pasta;
        this.nome_playlist = nome_playlist;
        this.data_criacao = data_criacao;
        this.caminho_imagem = caminho_imagem;
        this.privado = privado;
    }

    public Integer getId_playlist() {
        return id_playlist;
    }

    public void setId_playlist(Integer id_playlist) {
        this.id_playlist = id_playlist;
    }

    public Integer getUsuario_id() {
        return usuario_id;
    }

    public void setUsuario_id(Integer usuario_id) {
        this.usuario_id = usuario_id;
    }

    public String getCaminho_pasta() {
        return caminho_pasta;
    }

    public void setCaminho_pasta(String caminho_pasta) {
        this.caminho_pasta = caminho_pasta;
    }

    public String getNome_playlist() {
        return nome_playlist;
    }

    public void setNome_playlist(String nome_playlist) {
        this.nome_playlist = nome_playlist;
    }

    public Timestamp getData_criacao() {
        return data_criacao;
    }

    public void setData_criacao(Timestamp data_criacao) {
        this.data_criacao = data_criacao;
    }

    public String getCaminho_imagem() {
        return caminho_imagem;
    }

    public void setCaminho_imagem(String caminho_imagem) {
        this.caminho_imagem = caminho_imagem;
    }

    public boolean isPrivado() {
        return privado;
    }

    public void setPrivado(boolean privado) {
        this.privado = privado;
    }

}
