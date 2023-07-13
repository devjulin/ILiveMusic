package model;

public class Usuario {

    private Integer idUsuario;
    private String nome;
    private String usuario;
    private String email;
    private String senha;
    private String permissao;
    private String foto_perfil;

    public Usuario() {
    }

    public Usuario(Integer idUsuario, String nome, String usuario, String email, String senha, String permissao, String foto_perfil) {
        this.idUsuario = idUsuario;
        this.nome = nome;
        this.usuario = usuario;
        this.email = email;
        this.senha = senha;
        this.permissao = permissao;
        this.foto_perfil = foto_perfil;
    }

    public Integer getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getPermissao() {
        return permissao;
    }

    public void setPermissao(String permissao) {
        this.permissao = permissao;
    }

    public String getFoto_perfil() {
        return foto_perfil;
    }

    public void setFoto_perfil(String foto_perfil) {
        this.foto_perfil = foto_perfil;
    }

}
