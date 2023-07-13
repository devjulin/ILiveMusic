<%-- 
    Document   : inicial
    Created on : 24/05/2023, 21:34:58
    Author     : julio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <title>Bem Vindo ao ILiveMusic</title>
    <link rel="icon" type="image/png" href="images/logo-ilivemusic.png">
    <jsp:include page="includes/bootstrap_5_Lib.jsp"/>
    <jsp:include page="includes/w3.css_Lib.jsp"/>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="icon" type="image/png" href="images/logo-ilivemusic.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


</head>
<style>

    @import url("https://fonts.googleapis.com/css?family=Fira+Sans");

    * {
        transition: all 0.7s ease-in-out;
    }

    html, body {
        position: relative;
        min-height: 100vh;
        background-image: url('images/3.jpg');
        background-repeat: no-repeat;
        background-size: 100% 100%;
        background-attachment: fixed;
        display: flex;
        align-items: center;
        justify-content: center;
        font-family: "Fira Sans", Helvetica, Arial, sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
    }

    .form-structor:hover {
        transform: translateY(-1%) translateY(-1px);
    }

    .form-structor {
        margin-left: 25%;
        background-color: #222;
        border-radius: 15px;
        height: 650px;
        width: 450px;
        top: 2%;
        position: relative;
        overflow: hidden;
        transition: transform 0.3s ease-in-out;

        &::after {
            content: '';
            opacity: .8;
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
            background-image: url('images/inicial-bg.jpg');
        }

        .signup {
            position: absolute;
            top: 50%;
            left: 50%;
            -webkit-transform: translate(-50%, -50%);
            width: 65%;
            z-index: 5;
            -webkit-transition: all .3s ease;


            &.slide-up {
                top: 5%;
                -webkit-transform: translate(-50%, 0%);
                -webkit-transition: all .3s ease;
            }

            &.slide-up .form-holder,
            &.slide-up .submit-btn {
                opacity: 0;
                visibility: hidden;
            }

            &.slide-up .form-title {
                font-size: 2em;
                cursor: pointer;
            }

            &.slide-up .form-title span {
                margin-right: 5px;
                opacity: 1;
                visibility: visible;
                -webkit-transition: all .3s ease;
            }

            .form-title {
                color: #fff;
                font-size: 2.5em;
                text-align: center;

                span {
                    color: rgba(0, 0, 0, 0.4);
                    opacity: 0;
                    visibility: hidden;
                    -webkit-transition: all .3s ease;
                }
            }

            .form-holder {
                border-radius: 15px;
                background-color: #fff;
                overflow: hidden;
                margin-top: 50px;
                opacity: 1;
                visibility: visible;
                -webkit-transition: all .3s ease;

                .input {
                    border: 0;
                    outline: none;
                    box-shadow: none;
                    display: block;
                    height: 40px;
                    line-height: 40px;
                    padding: 8px 25px;
                    border-bottom: 1px solid #eee;
                    width: 100%;
                    font-size: 16px;

                    &:last-child {
                        border-bottom: 0;
                    }

                    &::-webkit-input-placeholder {
                        color: rgba(0, 0, 0, 0.4);
                    }
                }
            }

            .submit-btn {
                background-color: rgba(255, 255, 255, 0.8);
                color: rgba(256, 256, 256, 0.7);
                border: 0;
                color: black;
                border-radius: 15px;
                display: block;
                margin: 15px auto;
                padding: 15px 45px;
                width: 100%;
                margin-bottom: 30%;
                font-size: 17px;
                font-weight: bold;
                cursor: pointer;
                opacity: 1;
                visibility: visible;
                -webkit-transition: all .3s ease;

                &:hover {
                    transition: all .3s ease;
                    color: white;
                    background-color: rgba(0, 0, 0, 0.8);
                }
            }
        }

        .login {
            position: absolute;
            top: 20%;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #fff;
            z-index: 5;
            -webkit-transition: all .3s ease;

            &::before {
                content: '';
                position: absolute;
                left: 50%;
                top: -20px;
                -webkit-transform: translate(-50%, 0);
                background-color: #fff;
                width: 200%;
                height: 250px;
                border-radius: 50%;
                z-index: 4;
                -webkit-transition: all .3s ease;
            }

            .center {
                position: absolute;
                top: calc(50% - 10%);
                left: 50%;
                -webkit-transform: translate(-50%, -50%);
                width: 65%;
                z-index: 5;
                -webkit-transition: all .3s ease;

                .form-title {
                    color: #000;
                    font-size: 1.7em;
                    text-align: center;

                    span {
                        color: rgba(0, 0, 0, 0.4);
                        opacity: 0;
                        visibility: hidden;
                        -webkit-transition: all .3s ease;
                    }
                }

                .form-holder {
                    border-radius: 15px;
                    background-color: #fff;
                    border: 1px solid #eee;
                    overflow: hidden;
                    margin-top: 50px;
                    opacity: 1;
                    visibility: visible;
                    -webkit-transition: all .3s ease;

                    .input {
                        border: 0;
                        outline: none;
                        box-shadow: none;
                        display: block;
                        height: 30px;
                        line-height: 30px;
                        padding: 8px 15px;
                        border-bottom: 1px solid #eee;
                        width: 100%;
                        font-size: 17px;

                        &:last-child {
                            border-bottom: 0;
                        }

                        &::-webkit-input-placeholder {
                            color: rgba(0, 0, 0, 0.4);
                        }
                    }
                }

                .submit-btn {
                    background-color: purple;
                    color: rgba(256, 256, 256, 0.7);
                    border: 0;
                    border-radius: 15px;
                    display: block;
                    margin: 15px auto;
                    padding: 15px 45px;
                    width: 100%;
                    font-size: 17px;
                    margin-top: 15%;
                    font-weight: bold;
                    cursor: pointer;
                    opacity: 1;
                    visibility: visible;
                    -webkit-transition: all .3s ease;

                    &:hover {
                        transition: all .3s ease;
                        background-color: rgba(0, 0, 0, 0.8);
                    }
                }
            }

            &.slide-up {
                top: 90%;
                -webkit-transition: all .3s ease;
            }

            &.slide-up .center {
                top: 10%;
                -webkit-transform: translate(-50%, 0%);
                -webkit-transition: all .3s ease;
            }

            &.slide-up .form-holder,
            &.slide-up .submit-btn {
                opacity: 0;
                visibility: hidden;
                -webkit-transition: all .3s ease;
            }

            &.slide-up .form-title {
                font-size: 1em;
                margin: 0;
                padding: 0;
                cursor: pointer;
                -webkit-transition: all .3s ease;
            }

            &.slide-up .form-title span {
                margin-right: 5px;
                opacity: 1;
                visibility: visible;
                -webkit-transition: all .3s ease;
            }
        }
    }

    .borda-personalizada {
        border-radius: 30px;
    }

    .carrossel-reaj {
        width: 600px;
        height: 500%;
        top: 50%;
        left: -40%;
        transform: translateY(-50%);
        transition: transform 0.3s ease-in-out;
    }

    .carrossel-reaj:hover {
        transform: translateY(-50%) translateY(-10px);
    }

    .h1-topo {
        position: relative;
        transform: translateY(70%);
        background-color: rgba(20, 20, 20, 0.9);
        width: 30%;
        right: 7%;
        border-radius: 10px;
        color: #222;
        font-weight: bold;
        animation: pulsar 3s infinite;
    }

    @keyframes pulsar {
        0% {
            color: #333;
        }
        50% {
            color: #FFF;
        }
        100% {
            color: #333;
        }
    }

    .box-pers {
        width: 85%;
        padding: 5%;
        background-color: rgba(20, 20, 20, 0.8);
        border-radius: 20px;
        background-size: 200% 100%;
        animation: gradientTransition 7s linear infinite;
    }


    /* Estilo do popup */
    .popup-ban {
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: #fefefe;
        border-radius: 8px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
        padding: 20px;
        z-index: 9999;
        display: block;
    }

    .popup-content-ban {
        text-align: center;
    }

    .popup-ban h2 {
        margin-top: 0;
    }

    .popup-ban p {
        margin-bottom: 0;
    }

    @media (max-width: 1300px) {

        #carrossel {
            display: none;
        }

        .h1-topo {
            position: relative;
            transform: translateY(70%);
            background-color: rgba(20, 20, 20, 0.9);
            width: 40%;
            right: -7%;
            border-radius: 10px;
            color: #222;
            font-weight: bold;
            animation: pulsar 3s infinite;
        }

        .box-pers {
            margin-left: 15%;
        }

        .form-structor {
            margin-left: -55%;
        }

        .reaj {
            margin-left: -42%;
            margin-right: 10%;
            transition: margin 1s ease, margin 1s ease;
        }

        .h1-topo {
            width: 50%;
        }
    }

    @media (max-width: 768px) {
        .h1-topo {
            position: relative;
            transform: translateY(70%);
            background-color: rgba(20, 20, 20, 0.9);
            width: 40%;
            right: -3%;
            margin-bottom: 3%;
            border-radius: 10px;
            color: #222;
            font-weight: bold;
            animation: pulsar 3s infinite;
        }

        .box-pers {
            margin-left: 7%;
        }

        .form-structor {
            margin-left: -50%;
            margin-top: 3%;
        }
    }

    @media (max-width: 550px) {

        #carrossel {
            display: none;
        }

        .h1-topo {
            width: 50%;
        }
    }

    .anim-popup-sucesso {
        position: relative;
        bottom: 0em;
        left: 92%;
        transform: translateX(-50%) scale(1);
        width: 100%;
        text-align: center;
    }

    .mensagem {
        visibility: hidden;
        margin-top: 10px;
        text-align: right;
        font-weight: bold;
    }

    .mensagem.red {
        color: red;
        font-weight: bold;
        font-size: 25px;
        margin: auto;
    }

    .mensagem.green {
        color: green;
        font-weight: bold;
        font-size: 25px;
        margin: auto;
    }

    <jsp:include page = "includes/permissoes_css.jsp" />
</style>
<body>
<c:if test="${restrito_jsp.restrito}">
    <!-- Popup de banimento -->
    <div id="banPopup" class="popup-ban">
        <div class="popup-content-ban">
            <h2 class="text-danger fw-bold">SUA CONTA FOI BLOQUEADA!</h2>

            <p>Data de Expiração do Bloqueio: ${dataTermino}</p>
            <p class="bg-danger rounded text-white">Motivo: ${restrito_jsp.motivo}</p>
            <p>Você foi banido e não pode acessar mais o ILiveMusic.</p>
        </div>
    </div>

    <script>
        // Exibir o popup de banimento por 5 segundos
        setTimeout(function () {
            var banPopup = document.getElementById('banPopup');
            banPopup.style.display = 'none';
        }, 15000);
    </script>

</c:if>

<!--Popup-->
<div id="${popupSuperior}" class="popup-superior" style="margin-top: 10%;">
    <div id="d-none" class="d-none popup-content ${animacao}"${cor_fundo}>
        <h2 class="text-center fw-bold "${cor_titulo}>${titulo}</h2>
        <p class="text-center text-white fw-bold"${cor_msg}>${msg}</p>
        <div class="progress-container">
            <div class="progress-bar"></div>
        </div>
        <div class="  d-flex justify-content-center ${anim_popup}">
            ${anim}
        </div>
    </div>
</div>
<jsp:include page="includes/popups/popup_css.jsp"/>
<jsp:include page="includes/popups/popup_js.jsp"/>

<div class="container">
    <h1 class="text-center mx-auto h1-topo">ILiveMusic</h1>
    <div class="row box-pers">
        <div class="col-6">
            <!-- Carrossel -->
            <div id="carrossel" class="carrossel-reaj carousel slide h-100" data-bs-ride="carousel"
                 data-bs-interval="10000">
                <!-- Imagens dos slides -->
                <div class="carousel-inner borda-personalizada">
                    <div class=" d-flex justify-content-center mx-auto">
                        <button type="button" data-bs-target="#carrossel" data-bs-slide-to="0"
                                class="active btn btn-secondary fw-bold permissao-premium flex-grow-1">PREMIUM
                        </button>
                        <button type="button" data-bs-target="#carrossel" data-bs-slide-to="1"
                                class="btn btn-secondary flex-grow-1">GRATUITO
                        </button>

                    </div>
                    <div class="carousel-item active">
                        <a>
                            <img src="images/inicial/premium.jpg" alt="0" class="d-block w-100">
                        </a>
                    </div>
                    <div class="carousel-item">
                        <a>
                            <img src="images/inicial/comum2.jpg" alt="1" class="d-block w-100">
                        </a>
                    </div>
                </div>
                <!-- Controles esquerda e direita -->
                <button class="carousel-control-prev" type="button" data-bs-target="#carrossel" data-bs-slide="prev">

                    <path fill-rule="evenodd"
                          d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm11.5 5.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"/>
                    </path>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carrossel" data-bs-slide="next">

                    <path fill-rule="evenodd"
                          d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm4.5 5.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"/>

                    </path>
                </button>
            </div>
        </div>
        <div class="col-6 reaj">
            <div class="form-structor">
                <form action="usrv" method="POST" onsubmit="return validarFormulario()">
                    <div class="signup">
                        <h2 class="form-title" id="signup">Cadastrar</h2>
                        <div class="form-holder p-3">
                            <input type="text" name="txtNome" class="input" placeholder="Digite seu nome" required/>
                            <div class="d-flex justify-content-between">
                                <input type="text" name="txtUsuario" id="txtUsuario" class="input w-50"
                                       placeholder="Login" required/>
                                <a href="#" onclick="verificarUsuario()"
                                   class="w-50 my-auto d-flex justify-content-center text-decoration-none fw-bold"
                                   style="color: purple;">Verificar</a>
                                <a type="button" id="duvida"
                                   class="btn btn-outline-secondary my-auto opacity-50  rounded-circle"
                                   data-bs-toggle="tooltip" title="Verificar Disponibilidade de Login de Usuario!"
                                   style="height: 35px;">?</a>
                                <div id="mensagem" class="mensagem"></div>
                            </div>
                            <input type="email" name="txtEmail" class="input" placeholder="Seu Email" required/>
                            <input type="password" name="txtSenha" id="txtSenha" class="input" placeholder="Sua senha"
                                   required/>
                            <input type="password" name="txtConfirmarSenha" id="txtConfirmarSenha" class="input"
                                   placeholder="Confirmar senha" required/>
                            <div class="form-group form-check">
                                <input type="checkbox" class="form-check-input my-2" id="regras" required>
                                <label class="form-check-label fw-bold fs-8 my-2" for="regras">Eu li e concordo com as
                                    <a href="#" data-bs-toggle="modal" class="text-warning" data-bs-target="#meuModal">Politicas
                                        de Privacidade</a> do ILiveMusic</label>
                            </div>
                        </div>
                        <input type="hidden" value="cad_usuario" id="acao" name="acao">
                        <button type="submit" value="Cadastrar" class="submit-btn" onclick="validateCheckbox()">
                            cadastrar
                        </button>
                    </div>
                </form>
                <form action="login" method="POST">
                    <div class="login slide-up">
                        <div class="center">
                            <h2 class="form-title fs-4 fw-bold" id="login">Entrar no ILiveMusic</h2>
                            <form action="login" method="post">
                                <div class="form-holder">
                                    <input type="text" class="input" name="user" id="usuario" required
                                           placeholder="Usuario / Login"/>
                                    <input type="password" class="input" name="pass" id="senha" required
                                           placeholder="Senha"/></div>
                                <button type="submit" value="logar" name="acao" class="submit-btn">Entrar</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade " id="meuModal">
        <div class="modal-dialog ">
            <div class="modal-content bg-dark text-white">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="fw-bold mx-auto">POLITICAS DE PRIVACIDADE ILIVEMUSIC&nbsp;&nbsp;<i
                            class="bi bi-exclamation-triangle"></i></h4>
                    <button type="button" class="btn close fs-2 texto-modos" data-bs-dismiss="modal">&times;</button>
                </div>
                <!-- Modal body -->
                <div class="modal-body ">
                    <p>Leia nossas politicas de privacidade clicando no botão abaixo!</p>
                </div>
                <!-- Modal footer -->
                <div class="modal-footer">
                    <a href="politicas.jsp" target="_blank" type="button" class="btn fw-bold mx-auto w-100 btn-warning">Ler
                        Politicas de Privacidade</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function verificarUsuario() {
        var txtUsuario = document.getElementById("txtUsuario").value;
        var url = "usrv?acao=verificUsu&txtUsuario=" + encodeURIComponent(txtUsuario);

        // Remover o elemento de dúvida apenas se existir
        var duvidaElement = document.getElementById("duvida");
        if (duvidaElement) {
            duvidaElement.parentNode.removeChild(duvidaElement);
        }
        $.ajax({
            url: url,
            type: "GET",
            success: function (response) {
                if (response === "existente") {
                    exibirMensagem("", "red", "bi-x-circle");
                } else if (response === "disponivel") {
                    exibirMensagem("", "green", "bi-check-circle");
                } else {
                    exibirMensagem("Erro!", "red", "");
                }
            },
            error: function (xhr, status, error) {
                console.log(error);
            }
        });
    }

    function exibirMensagem(mensagem, cor, icone) {
        var mensagemElement = document.getElementById("mensagem");
        mensagemElement.innerHTML = mensagem;

        if (icone !== "") {
            var iconeElement = document.createElement("i");
            iconeElement.className = "bi " + icone;
            mensagemElement.prepend(iconeElement);
        }

        mensagemElement.className = "mensagem " + cor;
        mensagemElement.style.visibility = "visible";
    }

</script>
<script>
    function validateCheckbox() {
        if (!document.getElementById("regras").checked) {
            alert("É necessário aceitar nossa política de privacidade ILiveMusic.");
        } else {
            // Abra a página de políticas de privacidade em uma nova guia aqui
        }
    }
</script>
<script>
    function validarFormulario() {
        var senha = document.getElementById("txtSenha").value;
        var confirmarSenha = document.getElementById("txtConfirmarSenha").value;

        if (senha !== confirmarSenha) {
            alert("As senhas não correspondem. Por favor, digite novamente.");
            return false;
        }

        return true;
    }
</script>
<script>
    console.clear();

    const loginBtn = document.getElementById('login');
    const signupBtn = document.getElementById('signup');

    // Oculta os elementos de login e signup inicialmente
    loginBtn.parentNode.parentNode.classList.add('slide-up');
    signupBtn.parentNode.classList.add('slide-up');

    loginBtn.addEventListener('click', (e) => {
        let parent = e.target.parentNode.parentNode;
        Array.from(e.target.parentNode.parentNode.classList).find((element) => {
            if (element !== "slide-up") {
                parent.classList.add('slide-up');
            } else {
                signupBtn.parentNode.classList.add('slide-up');
                parent.classList.remove('slide-up');
            }
        });
    });

    signupBtn.addEventListener('click', (e) => {
        let parent = e.target.parentNode;
        Array.from(e.target.parentNode.classList).find((element) => {
            if (element !== "slide-up") {
                parent.classList.add('slide-up');
            } else {
                loginBtn.parentNode.parentNode.classList.add('slide-up');
                parent.classList.remove('slide-up');
            }
        });
    });
</script>

</body>
</html>
