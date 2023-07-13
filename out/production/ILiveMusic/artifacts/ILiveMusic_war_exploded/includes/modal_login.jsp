<style>
    .texto-branco {
        color: white;
    }

    .texto-branco:hover {
        color: purple;
    }

    .hover-vermelho:hover {
        color: red;
    }
</style>

<!-- Modal de login -->
<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered ">
        <div class="modal-content bg-transparent border-0 ">
            <div class="modal-header form-login-modificado border-0 ">
                <h5 class="modal-title texto-modos fw-bold " id="loginModalLabel">ENTRAR NO ILIVEMUSIC</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fechar"></button>
            </div>
            <div class="modal-body form-login-modificado rounded p-4">
                <form action="login" method="POST">
                    <div class="mb-3">
                        <label for="text" class="form-label texto-modos fw-bold">Usuario / Login</label>
                        <input type="text" class="form-control border-0" id="usuario" name="user" required
                               placeholder="Digite seu usuario de login...">
                    </div>
                    <div class="mb-3">
                        <label for="senha" class="form-label texto-modos fw-bold">Senha</label>
                        <input type="password" class="form-control border-0" id="senha" name="pass" required
                               placeholder="Digite sua senha...">
                    </div>
                    <div class="modal-footer border-0">
                        <button onclick="window.location.href = 'cadastro_usuario.jsp'" type="button"
                                class="btn texto-modos  btn-outline-secondary border-0">Cadastrar</a>
                            <button type="submit" value="logar" name="acao"
                                    class="btn btn-outline-secondary texto-modos border-0">Entrar
                            </button>
                            <button style="text-decoration: none; " type="button"
                                    class="btn btn-link hover-vermelho border-0" data-bs-dismiss="modal">Cancelar
                            </button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>