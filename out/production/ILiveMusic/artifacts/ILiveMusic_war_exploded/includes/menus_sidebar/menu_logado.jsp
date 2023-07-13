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

    .modo-escuro #modo-corpo {
        background-color: #333;
    }

    .modo-escuro .modo-corpo {
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
<% HttpSession sessao = request.getSession();
    String permissao = String.valueOf(sessao.getAttribute("permissao"));
    String assinante = String.valueOf(sessao.getAttribute("assinante_status"));
%>
<div class="w3-sidebar w3-bar-block w3-card w3-animate-left text-white fw-bold bg-menulateral-aberto"
     style="display:none; z-index: 9999;" id="mySidebar">
    <button class="text-center hover-vermelho w3-bar-item  w3-button w3-large"
            onclick="w3_close()"> Fechar
    </button>
    <a href="usrv?acao=atualizar_foto_index&id=${usuario.idUsuario}"
       class="menulateral txt-branco w3-bar-item w3-button bi bi-house"> | Inicio</a>
    <a href="usrv?acao=editar2&id=${usuario.idUsuario}"
       class="menulateral txt-branco w3-bar-item w3-button bi bi bi-person-badge"> | Seu Perfil</a>
    <% if (assinante.equals("true") || (permissao.equals("adm"))) {%>
    <button type="button" class="w3-bar-item w3-button permissao-premium" data-bs-toggle="collapse"
            data-bs-target="#efeitos">EFEITOS PREMIUM
    </button>
    <buttom id="efeitos" class="collapse">
        <button id="efeitos-centro" class="w3-bar-item w3-button text-white">Efeitos Centro</button>
        <button id="efeitos-laterais" class="w3-bar-item w3-button text-white">Efeitos Laterais</button>
    </buttom>

    <script>
        document.getElementById('efeitos').addEventListener('show.bs.collapse', function () {
            document.getElementById('efeitos-centro').style.display = 'block';
            document.getElementById('efeitos-laterais').style.display = 'block';
        });

        document.getElementById('efeitos').addEventListener('hide.bs.collapse', function () {
            document.getElementById('efeitos-centro').style.display = 'none';
            document.getElementById('efeitos-laterais').style.display = 'none';
        });
    </script>

    <%}%>
    <!--Bot�o modo escuro -->
    <button id="modo-btn" class="modo-claro w-100" onclick="toggleModo()">Modo Claro</button>
</div>
