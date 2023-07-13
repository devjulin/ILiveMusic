<!DOCTYPE html>
<html>
<head>
    <title>Painel de Administra��o</title>
    <!-- Inclua os arquivos CSS do Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <link rel="icon" type="image/png" href="images/logo-ilivemusic.png">
</head>
<style>
    body {
        background-color: #7C00FF;
    }

    /* Estilos para o menu lateral */
    .menu {
        background-color: rgba(20, 20, 20, 0);
        backdrop-filter: blur(10px);
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        width: 100%;
    }

    .menu h4 {
        color: #fff;
        font-size: 18px;
        margin-bottom: 10px;
        font-weight: bold;
        text-align: center;
    }

    .menu ul {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .menu li {
        margin-bottom: 10px;
    }

    .menu a {
        display: block;
        padding: 10px;
        background-color: rgba(255, 255, 255, 0.2);
        color: #fff;
        font-weight: bold;
        text-align: center;
        border-radius: 30px;
        text-decoration: none;
        transition: background-color 0.3s ease;
    }

    .menu a:hover {
        background-color: #212121;
        color: white;
    }

    .conteudo {
        padding: 20px;
    }

    /* Estilos para o iframe */
    iframe {
        width: 100%;
        height: 100%;
        border: none;
    }

    @keyframes colorAnimation {
        0% {
            background-position: left;
        }
        100% {
            background-position: right;
        }
        0% {
            background-position: left;
        }
    }

    .texto-animado {
        font-size: 36px;
        font-weight: bold;
        background-image: linear-gradient(to right, purple, purple, purple, white, white, purple, purple, purple, purple);
        background-size: 200% 100%;
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        animation: colorAnimation 4s linear infinite;
    }
</style>
<body>
<jsp:include page="includes/modo_noturno.jsp"/>
<%
    HttpSession sessao = request.getSession();
    String permissao = String.valueOf(sessao.getAttribute("permissao"));
    if (!permissao.equals("adm")) {
        response.sendRedirect("index.jsp");
    }%>
<div class="container-fluid">
    <div class="row">
        <div class=" menu">
            <h1 class="texto-animado text-center fs-1 bg-dark rounded-pill">Painel ADM ILiveMusic</h1>
            <ul class="w-25 mx-auto">
                <i class="bi bi-arrow-90deg-down"
                   style="margin-left: -2%;top: 22%;position: absolute;transform: scale(2);"></i>
                <li><a href="painel_adm_cadastro.jsp" target="conteudo">Cadastrar Usuario</a></li>
                <i class="bi bi-arrow-90deg-down"
                   style="margin-left: -2%;top: 35%;position: absolute;transform: scale(2);"></i>
                <li><a href="usrv?acao=listar_usuarios" target="conteudo">Usuarios</a></li>
                <i class="bi bi-arrow-90deg-down"
                   style="margin-left: -2%;top: 49%;position: absolute;transform: scale(2);"></i>
                <li><a href="pgtosrv?acao=listar_pagamentos" target="conteudo">Pagamentos</a></li>
                <i class="bi bi-arrow-90deg-down"
                   style="margin-left: -2%;top: 62%;position: absolute;transform: scale(2);"></i>
                <li><a href="asrv?acao=listar_assinaturas" target="conteudo">Assinaturas</a></li>
                <i class="bi bi-arrow-90deg-down"
                   style="margin-left: -2%;top: 75%;position: absolute;transform: scale(2);"></i>
                <li><a href="index.jsp">Voltar Para ILiveMusic</a></li>

                <button id="modo-btn" class="modo-claro w-100" onclick="toggleModo()">Modo Claro</button>
            </ul>
        </div>
    </div>
    <div class="row conteudo w-100 mx-auto">
        <iframe id="iframe" class="vh-100" src="menu_painel_adm.jsp" name="conteudo"
                style=" border-radius: 30px"></iframe>
    </div>
</div>

<!-- Inclua os arquivos JavaScript do Bootstrap -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/js/bootstrap.min.js"></script>
<script>
    /*Modo Claro & Escuro*/
    function toggleModo() {
        var body = document.body;
        var btn = document.getElementById("modo-btn");
        if (body.classList.contains("modo-claro")) {
            body.classList.remove("modo-claro");
            body.classList.add("modo-escuro");
            btn.textContent = "Modo Escuro";
            btn.classList.remove("modo-claro");
            btn.classList.add("modo-escuro");
            localStorage.setItem("modo", "escuro"); // armazena a sele��o do usu�rio como "escuro"
            var iframe = document.getElementById("iframe");
            iframe.src = iframe.src;
        } else {
            body.classList.remove("modo-escuro");
            body.classList.add("modo-claro");
            btn.textContent = "Modo Claro";
            btn.classList.remove("modo-escuro");
            btn.classList.add("modo-claro");
            localStorage.setItem("modo", "claro"); // armazena a sele��o do usu�rio como "claro"
            var iframe = document.getElementById("iframe");
            iframe.src = iframe.src;
        }
    }

    window.addEventListener("load", function () {
        var modo = localStorage.getItem("modo");
        var body = document.body;
        var btn = document.getElementById("modo-btn");
        if (modo === "escuro") {
            body.classList.add("modo-escuro");
            btn.textContent = "Modo Claro/Escuro";
            btn.classList.remove("modo-claro");
            btn.classList.add("modo-escuro");
        } else {
            body.classList.add("modo-claro");
            btn.textContent = "Modo Escuro";
            btn.classList.remove("modo-escuro");
            btn.classList.add("modo-claro");
        }
    });
</script>
</body>
</html>
