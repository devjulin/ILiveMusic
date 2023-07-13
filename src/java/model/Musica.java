package model;

public class Musica {

    private int idMusica;
    private int playlistId;
    private String caminhoMusica;
    private String imagemMusica;

    public Musica() {
    }

    public Musica(int playlistId, String caminhoMusica, String imagemMusica) {
        this.playlistId = playlistId;
        this.caminhoMusica = caminhoMusica;
        this.imagemMusica = imagemMusica;
    }

    public int getIdMusica() {
        return idMusica;
    }

    public void setIdMusica(int idMusica) {
        this.idMusica = idMusica;
    }

    public int getPlaylistId() {
        return playlistId;
    }

    public void setPlaylistId(int playlistId) {
        this.playlistId = playlistId;
    }

    public String getCaminhoMusica() {
        return caminhoMusica;
    }

    public void setCaminhoMusica(String caminhoMusica) {
        this.caminhoMusica = caminhoMusica;
    }

    public String getImagemMusica() {
        return imagemMusica;
    }

    public void setImagemMusica(String imagemMusica) {
        this.imagemMusica = imagemMusica;
    }
}
