<style>
    .bg-menulateral-aberto button {
        background-color: #4A0494;
    }

    .bg-menulateral-aberto {
        background-color: #2F045C;
    }

    #modo-btn {
        background-color: #fff;
        color: #333;
        border: 1px solid #333;
        padding: 8px 16px;
        border-radius: 4px;
        cursor: pointer;
    }

    .modo-claro {
        background-color: #fff;
    }

    .modo-claro a,
    .modo-claro p,
    .modo-claro h1,
    .modo-claro h2,
    .modo-claro h3,
    .modo-claro h4,
    .modo-claro h5,
    .modo-escuro .texto-modos {
        color: #333;
    }

    .modo-claro label {
        color: #333;
    }

    .modo-claro .input-modificado {
        background-color: #C1CDCD;
    }

    .modo-claro .txt-branco {
        color: white;
    }

    .modo-claro .form {
        background-color: rgba(255, 255, 255, 0.3);
        transition: background-color 1s ease-out;
    }

    .modo-claro .form-login-modificado {
        background-color: rgba(255, 255, 255, 0.8);
        transition: background-color 1s ease-out;
    }


    .modo-escuro {
        background-color: #333;
    }

    .modo-escuro a,
    .modo-escuro p,
    .modo-escuro h1,
    .modo-escuro h2,
    .modo-escuro h3,
    .modo-escuro h4,
    .modo-escuro li,
    .modo-escuro .texto-modos,
    .modo-escuro h5 {
        color: #fff;
    }

    .modo-escuro label {
        color: white;
    }

    .modo-escuro .form {
        background-color: rgba(0, 0, 0, 0.4);
        transition: background-color 1s ease-out;
    }

    .modo-escuro .form-login-modificado {
        background-color: rgba(0, 0, 0, 0.8);
        transition: background-color 1s ease-out;
    }

    .modo-escuro .bg-escuro {
        background-color: #333;
    }

    .modo-claro, modal-body, modal {
        background-color: white;
    }

    .btn-link {
        background-color: transparent;
        border: none;
        padding: 0;
        margin-right: 5%;
    }

    body.modo-claro {
        background-color: #fff;
        color: #333;
        transition: background-color 1s ease-out;
    }

    body.modo-escuro {
        background-color: #333;
        color: #fff;
        transition: background-color 1s ease-out;
    }


    .text-black {
        color: black;
    }

    .modo-escuro #modo-btn {
        background-color: #212121;; /* cor de fundo no modo escuro */
        color: #fff; /* cor do texto no modo escuro */
    }
</style>

<div class="w3-sidebar w3-bar-block w3-card w3-animate-left text-white fw-bold bg-menulateral-aberto"
     style="display:none;" id="mySidebar">
    <button class="text-center hover-vermelho w3-bar-item  w3-button w3-large"
            onclick="w3_close()"> Fechar
    </button>
    <a href="index.jsp" class="menulateral txt-branco w3-bar-item w3-button bi bi-house"> | Inicio</a>
    <a href="cadastro_usuario.jsp" class="menulateral txt-branco w3-bar-item w3-button bi bi bi-person-badge"> |
        Cadastrar Conta</a>
    <a href="musica/index.html" class="menulateral txt-branco w3-bar-item w3-button bi bi bi-music-note-list"> |
        Explorar Generos</a>
    <a href="3.jsp" class="menulateral txt-branco w3-bar-item w3-button bi bi-music-note-beamed"> TESTE</a>
    <a href="musica/index.html" class="menulateral txt-branco w3-bar-item w3-button bi bi-music-note-beamed"> | Radios
        24hs</a>
    <!--Bot�o modo escuro -->
    <button id="modo-btn" class="modo-claro w-100" onclick="toggleModo()">Modo Claro</button>
</div>
