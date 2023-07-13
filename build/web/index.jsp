<%--
    Document   : index
    Created on : 29 de abr. de 2023, 16:29:14
    Author     : julio

--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>ILiveMusic</title>
        <link rel="icon" type="image/png" href="images/logo-ilivemusic.png">
        <link rel="stylesheet" href="css/style.css">
        <script src="js/script.js"></script>
        <jsp:include page="includes/bootstrap_5_Lib.jsp"/>
        <jsp:include page="includes/w3.css_Lib.jsp"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
        <!-- Swiper -->
        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/aplayer/1.10.1/APlayer.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/aplayer/1.10.1/APlayer.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.12.1/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
        <!--PLAYER ILM -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <!--Animações PREMIUM -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    </head>

    <style>
        * {
            transition: all 0.7s ease-in-out;
        }

        <jsp:include page = "includes/permissoes_css.jsp" />
        <jsp:include page = "includes/2.jsp" />
        .border-radius {
            border-radius: 10px;
        }

        .principal {
            padding: 40px 0;
        }

        .coluna-md-3 {
            margin-bottom: 40px;
        }

        .album {
            position: relative;
            display: block;
            border-radius: 40px;
            overflow: hidden;
            box-shadow: 0 15px 35px black;
            transition: all ease 0.4s;
            width: 100%;
            height: 13em;
            z-index: 9999;
        }

        .swiper-slide img {
            width: 100%;
            min-height: 250px;
        }

        .album:hover {
            box-shadow: 0 15px 35px white;
            transform: scale(0.98) translateY(10px);
        }

        .album-artistas {
            position: relative;
            display: block;
            border-radius: 25px;
            overflow: hidden;
            box-shadow: 0 15px 35px black;
            transition: all ease 0.4s;
            width: 100%;
            height: 100%;
        }

        .album-artistas:hover {
            box-shadow: 0 15px 35px white;
            transform: scale(0.98) translateY(10px);
        }

        h3 {
            font-size: 34px;
            margin-bottom: 34px;
            border-bottom: 4px solid #e6e6e6;
            padding-bottom: 15px;
        }

        p {
            font-size: 15px;
        }

        h4 {
            font-size: 16px;
            text-transform: uppercase;
            margin-top: 15px;
            font-weight: 700;
        }

        .borda-personalizada {
            border-radius: 10px;
        }

        .ajuste-carrossel {
            width: 100%;
            height: 100%;
        }

        .coluna-md-3 {
            flex: 0 0 25%;
            max-width: 25%;
        }

        .hover-vermelho:hover {
            color: red;
        }

        .reaj-carrossel {
            margin-top: 2.3%;
            max-width: 1400px;
            min-width: 300px;

        }

        .reaj-player {
            margin-bottom: 10%;
        }

        #seja-premium {
            margin-right: 5%;
            margin-left: -20%;
            position: relative;
            margin-top: 2.8em;
            transform: scale(1.3);
        }

        @media (max-width: 950px) {
            #seja-premium {
                display: none;

            }
        }

        @media (max-width: 1600px) {
            .album {
                position: relative;
                display: block;
                border-radius: 20px;
                overflow: hidden;
                box-shadow: 0 15px 35px black;
                transition: all ease 0.4s;
                width: 11em;
                height: 13.5em;
                z-index: 9999;
            }

            .reaj-carrossel {
                margin-top: 5%;
            }

            .reaj-player {
                margin-bottom: 10%;
            }

            .album-artistas-gratuito {
                width: 9.7em;
            }

            transition: all 2s ease-in-out;
        }

        @media (max-width: 2500px) {

            .reaj-carrossel {
                margin-top: 3%;
            }

            .reaj-player {
                margin-bottom: 10%;
            }

            .album-artistas {
                border-radius: 40px;
                width: 9.7em;
            }

            transition: all 2s ease-in-out;
        }

        @media (max-width: 768px) {
            .principal p {
                display: none;
            }

            .ajuste-carrossel {
                width: 100%;
                height: 100%;
            }

            .album-container {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
                align-items: center;
            }

            .album-artistas {
                border-radius: 40px;
                width: 9.7em;
            }

            .album {
                position: relative;
                display: block;
                border-radius: 20px;
                overflow: hidden;
                box-shadow: 0 15px 35px black;
                transition: all ease 0.4s;
                width: 11em;
                height: 13.5em;
                z-index: 9999;
            }

            .album:hover {
                box-shadow: 0 15px 35px white;
                transform: scale(0.98) translateY(10px);
            }

            .coluna-md-3 {
                padding: 4%;
                flex: 0 0 33.33%;
                max-width: 33.33%;

            }

            .coluna-md-3 a {
                flex: 0 0 100%;
                max-width: 100%;
                max-height: 45%;
            }

            .ocultar-res-baixa {
                display: none;
            }

            .reaj-carrossel {
                margin-top: 15%;
                height: 300px;
                width: 1000px;
            }

            .reaj-carrossel img {
                height: 200px;
                width: 100%;
            }

            .reaj-player {
                margin-bottom: 30%;
            }

            #btn-sair {
                display: none;
            }

            #seja-premium {
                display: none;
            }
            .reaj-carrossel {
                max-height: 500px;

            }
            .reaj-carrossel img{
                max-height: 400px;
            }

            transition: all 2s ease-in-out;
        }

        @media (max-width: 1500px) {

            .album-artistas {
                border-radius: 20px;
            }

            .swiper-slide {
                padding: 1%;
            }

            transition: all 2s ease-in-out;
        }

        .swiper-container {
            max-width: 100%; /* Define o tamanho máximo do contêiner */
            overflow: hidden; /* Oculta os slides excedentes */
        }

        .swiper-container {
            position: relative;
        }

        .swiper-button-next,
        .swiper-button-prev {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
        }

        .swiper-button-next {
            right: 10px; /* Ajuste a posição horizontal conforme necessário */
        }

        .swiper-button-prev {
            left: 10px; /* Ajuste a posição horizontal conforme necessário */
        }

        .profile-menu {
            position: relative;
        }

        /*.dropdown-menu{
         transition: none;
        }*/

        .profile-menu .dropdown-menu {
            width: 200px;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            background-color: #fff;
        }

        .profile-menu .dropdown-menu img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .marquee {
            width: 100%;
            overflow: hidden;
            white-space: nowrap;
        }

        .marquee span {
            display: inline-block;
            animation: marquee 10s linear infinite;
        }

        @keyframes marquee {
            0% {
                transform: translateX(100%);
            }
            100% {
                transform: translateX(-100%);
            }
        }

        /* Duração das transições */
        #main, #mySidebar {
            transition: all 1s ease;
        }

        #album-art {
            transition: all 1s;
        }

        #app-cover {
            transition: all 1s;
        }

        #openNav {
            transition: all 1s ease;
        }

        .ilivemusic-topo {
            transition: all 1s ease;
        }

        .reaj-bg {
            background-color: rgba(20, 20, 20, 0.7);
            width: 35%;
            margin-left: -10%;
            border-radius: 20px;
            cursor: pointer;
            transition: all 0.2s ease-in-out;
        }

        .reaj-bg:hover {
            background-color: rgba(255, 255, 255, 0.1);
            border-color: red;
            transform: scale(1.1);
            transition: all 0.2s ease-in-out;
        }

        /* Estilos CSS para as animações do premium*/
        .barra_esquerda {
            width: 2%;
            margin-right: -50em;
            position: fixed;
            z-index: -1;
            opacity: 0;
            top: 0;
            left: 0;
            background-color: white;
            animation: pulse2 5s infinite;
        }

        .barra_direita {
            width: 2%;
            margin-left: 98%;
            position: fixed;
            opacity: 0;
            z-index: -1;
            top: 0;
            left: 0;
            background-color: white;
            animation: pulse2 5s infinite;
        }

        .barra1 {
            width: 2%;
            opacity: 0;
            margin-left: 70%;
            position: fixed;
            z-index: -1;
            top: 0;
            left: 0;
            background-color: white;
            animation: pulse 2s infinite;

            .s {
                background-color: black;
            }
        }

        .barra2 {
            width: 2%;
            margin-left: 50%;
            position: fixed;
            opacity: 0;
            z-index: -1;
            top: 0;
            left: 0;
            background-color: white;
            animation: pulse 2s infinite;
        }

        .barra3 {
            width: 2%;
            margin-left: 30%;
            position: fixed;
            opacity: 0;
            z-index: -1;
            top: 0;
            left: 0;
            background-color: white;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0%, 20%, 80%, 100% {
                background-color: white;
            }
            40%, 60% {
                background-color: purple;
            }
            50% {
                background-color: black;
            }
        }

        @keyframes pulse2 {
            0%, 20%, 80%, 100% {
                background-color: white;
            }
            40%, 60% {
                background-color: black;
            }
            50% {
                background-color: white;
            }
        }

        /**/
        @keyframes pulsar {
            0% {
                color: purple;
                transform: scale(1);
            }

            25% {
                color: #6a00ff;
                transform: scale(1.05);
            }

            50% {
                color: white;
                transform: scale(1.05);
            }

            100% {
                color: purple;
                transform: scale(1);
            }
        }

        .efeito-pulsar {
            width: 200px;
            height: 200px;
            border-radius: 20px;
            color: #c7aa00;
            padding: 0.3%;
            animation: pulsar 3s linear infinite;
        }

        .modo-claro .reaj-titulo {
            background-color: #1C1C1C;
            color: #e6e6e6;
        }

        .modo-escuro .reaj-titulo {
            background-color: #e6e6e6;
            color: #1C1C1C;
        }

        .footer {
            background-color: #090909;
            color: #fff;
            padding: 20px 0;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .footer-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .footer-logo img {
            max-width: 150px;
        }

        .footer-links ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .footer-links ul li {
            display: inline-block;
            margin-right: 10px;
        }

        .footer-links ul li a {
            color: #fff;
            text-decoration: none;
        }

        .footer-social ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .footer-social ul li {
            display: inline-block;
            margin-right: 10px;
        }

        .footer-social ul li a {
            color: #fff;
            text-decoration: none;
            font-size: 20px;
        }

        .footer-bottom2 {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-top: 1px solid #fff;
            padding-top: 20px;
            font-size: 14px;
        }

        .footer-bottom2 ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .footer-bottom2 ul li {
            display: inline-block;
            margin-right: 10px;
        }

        .footer-bottom2 ul li a {
            color: #fff;
            text-decoration: none;
        }

        .fundo-superior {
            width: 105%;
            height: 100%;
            margin-top: 0em;
            margin-left: -2em;
            z-index: -9;
            position: absolute;
            background: linear-gradient(to bottom, rgba(88, 0, 151, 0.7), rgba(0, 0, 0, 0.01));
        }

        .carousel-caption {
            cursor: pointer;
        }

        .carousel-caption h5 {
            color: #333;
            margin-bottom: 5px;
        }

        .carousel-caption p {
            color: #777;
            margin: 0;
        }

        .reaj-rodape {
            margin-bottom: 15%;
            background-color: #090909;
        }

        .popup-superior {
            display: block;
            position: fixed;
            z-index: 1;
            right: 20em; /* Alinha o elemento à direita */
            top: 0em;
            max-width: 40%;
            pointer-events: none;
            height: 100%;
        }


        .popup-content {
            background-color: rgba(82, 0, 92, 0.94);
            color: white;
            margin: 5% 75%;
            z-index: 9999;
            padding: 20px;
            border: none;
            width: 50%;
            border-radius: 10px;
            position: relative;
            animation: popup-appear 0.5s ease-out;
            overflow: hidden; /* Adicionado para conter o progress bar */
        }

        @keyframes popup-appear {
            from {
                opacity: 0;
                transform: translateY(-50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .progress-container {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 10px;
            background-color: rgba(0, 0, 0, 0.3);
            border-radius: 10px;
            overflow: hidden;
        }

        .progress-bar {
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.6);
            animation: progress-bar 5s linear;
            transform-origin: left;
        }

        @keyframes progress-bar {
            0% {
                width: 100%;
            }
            100% {
                width: 0%;
            }
        }

        .shake {
            animation: shake 0.5s ease-in-out;
        }

        @keyframes shake {
            0% {
                transform: rotate(0deg);
            }
            10% {
                transform: rotate(4deg);
            }
            20% {
                transform: rotate(-4deg);
            }
            30% {
                transform: rotate(2deg);
            }
            40% {
                transform: rotate(-3deg);
            }
            50% {
                transform: rotate(5deg);
            }
            60% {
                transform: rotate(-2deg);
            }
            70% {
                transform: rotate(4deg);
            }
            80% {
                transform: rotate(-4deg);
            }
            90% {
                transform: rotate(2deg);
            }
            100% {
                transform: rotate(0deg);
            }
        }

        .impacto {
            animation-name: impacto;
            animation-duration: 1.2s;
            animation-iteration-count: 1;
            animation-timing-function: ease-in-out;
        }

        @keyframes impacto {
            0% {
                box-shadow: 0 0 0 0 rgba(255, 255, 255, 0.8);
                transform: scale(0);
            }
            50% {
                box-shadow: 0 0 0 1000px rgba(255, 255, 255, 0);
                transform: scale(1.2);
            }
            100% {
                box-shadow: 0 0 0 0 rgba(255, 255, 255, 0);
                transform: scale(1);
            }
        }

        .movement {
            background: linear-gradient(45deg, #333, #333, #fff, #333, #333);
            background-size: 500% 500%;
            opacity: 0.9;
            animation: movement 4s ease infinite;
        }

        @keyframes movement {
            0% {
                transform: translateY(0);
                background-position: 0% 50%;
            }
            50% {
                transform: translateY(-20px);
                background-position: 100% 50%;
            }
            100% {
                transform: translateY(0);
                background-position: 0% 50%;
            }
        }


    </style>
    <body class="modo-claro">
        <div class="fundo-superior"></div>
        <!--Menu Lateral Esquerdo -->
        <% HttpSession sessao = request.getSession();
            String permissao = String.valueOf(sessao.getAttribute("permissao"));
            String assinante = String.valueOf(sessao.getAttribute("assinante_status"));
            if (sessao.getAttribute("user") == null) {
                permissao = null;
        %>
        <script>
            window.location.replace("inicial.jsp");
        </script>
        <%} else if (permissao.equals("adm")) {%>
        <jsp:include page="includes/menus_sidebar/menu_logado.jsp"/>
        <jsp:include page="includes/menus_navbar/menu_adm.jsp"/>
        <!--PREMIUM -->
        <%} else if (assinante.equals("true")) {%>
        <jsp:include page="includes/menus_sidebar/menu_logado.jsp"/>
        <jsp:include page="includes/menus_navbar/menu_premium.jsp"/>
        <!--GRATUITO -->
        <%} else if (permissao.equals("comum")) {%>
        <jsp:include page="includes/menus_sidebar/menu_logado.jsp"/>
        <jsp:include page="includes/menus_navbar/menu_gratuito.jsp"/>
        <%}%>
        <!--Redirecionamento de pagina para usuario RESTRITO -->
        <c:if test="${restrito_jsp.restrito}">
            <script>
                window.location.replace("inicial.jsp");
            </script>
        </c:if>

        <div class="container-fluid reaj-player">
            <div class="row ajuste-carrossel mx-auto">
                <div class="border-radius d-flex align-self-start z-1" style="width: 102%;">
                    <!-- Carrossel -->
                    <div id="carrossel" class="carousel border border-5 border-white rounded slide h-100 mx-auto reaj-carrossel"
                         data-bs-ride="carousel" style="width: 100%;margin-left: 0.5em;">
                        <!-- Indicadores -->
                        <div class="carousel-indicators d-none">
                            <button type="button" data-bs-target="#carrossel" data-bs-slide-to="0" class="active"></button>
                            <button type="button" data-bs-target="#carrossel" data-bs-slide-to="1"></button>
                            <button type="button" data-bs-target="#carrossel" data-bs-slide-to="2"></button>
                            <button type="button" data-bs-target="#carrossel" data-bs-slide-to="3"></button>
                            <button type="button" data-bs-target="#carrossel" data-bs-slide-to="4"></button>
                        </div>

                        <!-- Imagens dos slides -->
                        <div class="carousel-inner borda-personalizada" style="width: 100%;">
                            <div class="carousel-item active">
                                <img src="images/carrossel/c1.jpg" alt="0" class="d-block " style="width: 100%;height: 650px;">
                                <div class="carousel-caption d-none d-md-block reaj-bg"
                                     data-href="https://youtu.be/Fpn1imb9qZg">
                                    <h5 class="text-dark fw-bold fs-2 bg-warning">SHOW <span class="text-danger fw-bold">COLDPLAY</span>
                                    </h5>
                                    <p class="text-white fw-bold fs-5 p-2">Confira o novo Show do ColdPlay, quente do
                                        Forno!!</p>
                                </div>
                            </div>
                            <!-- <div class="carousel-item" >
                                <a>
                                    <img src="img/carrossel/c2.jpg" alt="1" class="d-block w-100">
                                </a>
                            </div>
                        </div> -->
                            <!-- Controles esquerda e direita -->
                            <button class="carousel-control-prev" type="button" data-bs-target="#carrossel"
                                    data-bs-slide="prev">
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carrossel"
                                    data-bs-slide="next">
                            </button>
                        </div>
                    </div>

                </div>

                <div class="barra_esquerda vh-100"></div>
                <div class="barra1 vh-100"></div>
                <div class="barra2 vh-100"></div>
                <div class="barra3 vh-100"></div>
                <div class="barra_direita vh-100"></div>

                <script></script>
                <% if (permissao != null && permissao.equals("adm")) {%>
                <jsp:include page="includes/paginas_index_permissoes/adm.jsp"/>
                <%} else if (assinante.equals("true")) {%>
                <jsp:include page="includes/paginas_index_permissoes/premium.jsp"/>
                <%} else if (permissao != null && permissao.equals("comum")) {%>
                <jsp:include page="includes/paginas_index_permissoes/gratuito.jsp"/>
                <%}%>

            </div>
            <div id="aplayer"></div>
            <div id="app-cover" class="fixed-bottom w-100">

                <div id="player">
                    <div id="player-track">
                        <div id="album-name"></div>
                        <div id="track-name"></div>
                        <div id="track-time">
                            <div id="current-time"></div>
                            <div id="track-length"></div>
                        </div>
                        <div id="s-area">
                            <div id="ins-time"></div>
                            <div id="s-hover"></div>
                            <div id="seek-bar"></div>
                        </div>
                    </div>
                    <div id="player-content">

                        <div id="album-art">
                            <img src="images/radio/gospel.jpg" class="active" id="_1">
                            <img src="images/radio/sertanejo.jpg" id="_2">
                            <img src="images/radio/modas.jpg" id="_3">
                            <img src="images/radio/hitsbrasil.jpg" id="_4">
                            <img src="images/radio/popmusic.jpg" id="_5">
                            <img src="images/radio/pagodemusic.jpg" id="_6">
                            <img src="images/radio/pisadinhamusic.jpg" id="_7">
                            <img src="images/radio/rockmusic.jpg" id="_8">
                            <img src="images/radio/poprockmusic.jpg" id="_9">
                            <img src="images/radio/tropical.jpg" id="_10">
                            <img src="images/radio/80retro.jpg" id="_11">
                            <img src="images/radio/lofi.jpg" id="_12">
                            <div id="buffer-box">Buffering ...</div>
                        </div>
                        <div id="efeito-audio" class="d-none position-absolute"
                             style="margin-left: 20%; margin-top: -7em; pointer-events: none;">
                            <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
                            <lottie-player src="https://lottie.host/d9ce8ab2-4e50-483e-8a21-2da6593a2745/I5O3123Pkk.json"
                                           background="transparent" speed="1" style="width: 100rem; height: 7em;" loop
                                           autoplay></lottie-player>
                        </div>
                        <div id="player-controls" class="player-controls">
                            <div class="control">
                                <div class="button-player bg-transparent" id="play-previous">
                                    <i class="fas fa-backward"></i>
                                </div>
                            </div>
                            <div class="control">
                                <div class="button-player bg-transparent" id="play-pause-btn">
                                    <i class="fas fa-play"></i>
                                </div>
                            </div>
                            <div class="control">
                                <div class="button-player bg-transparent" id="play-next">
                                    <i class="fas fa-forward"></i>
                                </div>
                            </div>
                            <div class="volume-control">
                                <div>
                                    <i class="fas fa-volume-up fa-2x roxo" id="volume-icon"></i>
                                    <input type="range" id="volume-slider" min="0" max="1" step="0.1" value="0.3"
                                           style="background-color: purple; display: none;">
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <footer class="footer">
                    <div class="container reaj-rodape">
                        <div class="footer-content">
                            <div class="footer-logo">
                                <img src="images/logo-ilivemusic.png" class="rounded-pill" style="height: 100px"
                                     alt="ILiveMusic Logo">
                            </div>
                            <div class="footer-links">
                                <ul>
                                    <li><a href="#">Sobre</a></li>
                                    <li><a href="#">Carreiras</a></li>
                                    <li><a href="#">Imprensa</a></li>
                                    <li><a href="#">Novidades</a></li>
                                </ul>
                            </div>
                            <div class="footer-social">
                                <ul>
                                    <li><a href="#"><i class="fab fa-facebook-f text-white"></i></a></li>
                                    <li><a href="#"><i class="fab fa-twitter text-white"></i></a></li>
                                    <li><a href="#"><i class="fab fa-instagram text-white"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="footer-bottom">
                            <p class="text-white">&copy; 2023 ILiveMusic. Todos os direitos reservados.</p>
                            <ul>
                                <li class="text-white"><a href="#" class="text-white text-decoration-none">Termos</a></li>
                                <li class="text-white"><a href="#" class="text-white text-decoration-none">Privacidade</a></li>
                                <li class="text-white"><a href="#" class="text-white text-decoration-none">Política de
                                        Cookies</a></li>
                            </ul>
                        </div>
                    </div>
                </footer>
            </div>
        </div>


        <script>
                document.addEventListener("DOMContentLoaded", function () {
                    var popup = document.getElementById("popupSuperior");
                    if (popup) { // Verifica se o elemento com id "popupSuperior" existe
                        var popupContent = popup.querySelector(".popup-content");
                        var progressBar = popup.querySelector(".progress-bar");
                        var popupHidden = false; // Flag para controlar se o popup já foi ocultado
                        var animationDuration = 15000; // Duração da animação em milissegundos (15 segundos)

                        progressBar.style.animationDuration = animationDuration + "ms";

                        progressBar.addEventListener("animationend", function () {
                            if (!popupHidden) { // Verifica se o popup ainda não foi ocultado
                                popup.style.display = "none";
                                popupHidden = true; // Atualiza a flag para indicar que o popup foi ocultado
                            }
                        });

                        setTimeout(function () {
                            popupContent.classList.remove("shake");
                        }, animationDuration);

                        popupContent.classList.remove("d-none"); // Remover a classe "d-none" do popupContent
                    } else {
                        var popupErro = document.getElementById("popupErroSuperior");
                        if (popupErro) {
                            popupErro.style.display = "block";
                            setTimeout(function () {
                                popupErro.style.display = "none";
                            }, 15000);
                        }
                    }
                });
        </script>
        <script>
            const div = document.querySelector('.carousel-caption');
            div.addEventListener('click', function () {
                const link = this.getAttribute('data-href');
                window.location.href = link;
            });
        </script>
        <script>
            /*Abrir menu lateral esquerdo*/
            function w3_open() {
                if (window.innerWidth > 768) {
                    document.getElementById("main").style.marginLeft = "15%";
                    document.getElementById("app-cover").style.marginLeft = "15%";
                    document.getElementById("mySidebar").style.width = "15%";
                    document.getElementById("mySidebar").style.display = "block";
                    document.getElementById("openNav").style.display = 'none';
                    document.getElementById("album-art").style.opacity = "0";
                    document.getElementById("ilivemusic-topo").style.opacity = "0";
                    document.getElementById("player-controls").style.marginLeft = "7%";
                    document.getElementById("app-cover").style.maxWidth = "85%";
                } else {
                    document.getElementById("main").style.marginLeft = "30%";
                    document.getElementById("app-cover").style.marginLeft = "30%";
                    document.getElementById("mySidebar").style.width = "30%";
                    document.getElementById("mySidebar").style.display = "block";
                    document.getElementById("openNav").style.display = 'none';
                    document.getElementById("app-cover").style.maxWidth = "70%";
                    document.getElementById("player-controls").style.marginLeft = "-7%";
                    document.getElementById("album-art").style.opacity = "0";
                    document.getElementById("ilivemusic-topo").style.opacity = "0";
                }
            }

            function w3_close() {
                document.getElementById("main").style.marginLeft = "0%";
                document.getElementById("app-cover").style.marginLeft = "0%";
                document.getElementById("mySidebar").style.display = "none";
                document.getElementById("openNav").style.display = "inline-block";
                document.getElementById("ilivemusic-topo").style.opacity = "1";
                document.getElementById("album-art").style.opacity = "1";
                document.getElementById("player-controls").style.marginLeft = "-7%";
                document.getElementById("app-cover").style.maxWidth = "100%";
            }
            ;
        </script>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var swiper = new Swiper('.swiper-container', {
                    slidesPerView: 'auto', // Ajusta o número de slides visíveis automaticamente
                    spaceBetween: 10, // Espaçamento entre os slides
                    navigation: {
                        nextEl: '.swiper-button-next', // Elemento HTML para a seta de próxima
                        prevEl: '.swiper-button-prev', // Elemento HTML para a seta anterior
                    },
                    loop: true, // Reinicia o carrossel quando chegar ao final
                    freeMode: true,
                    mousewheel: {
                        sensitivity: 1 // Ajusta a sensibilidade da rolagem do mouse
                    },
                    breakpoints: {
                        0: {
                            slidesPerView: 3, // Número de slides visíveis em telas menores
                            spaceBetween: 20, // Espaçamento reduzido em telas menores
                            width: 400, // Largura fixa do slide em telas menores
                            height: 100 // Altura fixa do slide em telas menores
                        },
                        576: {
                            slidesPerView: 3, // Número de slides visíveis em telas maiores que 576px
                            width: 400, // Largura fixa do slide em telas maiores que 576px
                            height: 300 // Altura fixa do slide em telas maiores que 576px
                        },
                        768: {
                            slidesPerView: 3, // Número de slides visíveis em telas maiores que 768px
                            width: 400, // Largura fixa do slide em telas maiores que 768px
                            height: 350 // Altura fixa do slide em telas maiores que 768px
                        },
                        992: {
                            slidesPerView: 4, // Número de slides visíveis em telas maiores que 992px
                            width: 600, // Largura fixa do slide em telas maiores que 992px
                            height: 400 // Altura fixa do slide em telas maiores que 992px
                        },
                        1200: {
                            slidesPerView: 7, // Número de slides visíveis em telas maiores que 1200px
                            width: 1200, // Largura fixa do slide em telas maiores que 1200px
                            height: 450 // Altura fixa do slide em telas maiores que 1200px
                        },
                        1400: {
                            slidesPerView: 7, // Número de slides visíveis em telas maiores que 1200px
                            width: 1200, // Largura fixa do slide em telas maiores que 1200px
                            height: 450 // Altura fixa do slide em telas maiores que 1200px
                        }
                    }
                });

                // Redimensionar o carrossel quando a janela for redimensionada
                window.addEventListener('resize', function () {
                    swiper.update();
                });
            });
        </script>
        <!-- Jquery Link -->
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
        <!-- Bootstrap Link -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <!-- Adicione o código JavaScript para inicializar o carrossel -->
        <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
        <script>
            var efeitosCentroButton = document.getElementById("efeitos-centro");
            var efeitosLateraisButton = document.getElementById("efeitos-laterais");
            var barrasCentroVisible = localStorage.getItem("barrasCentroVisible") === "true";
            var barrasLateraisVisible = localStorage.getItem("barrasLateraisVisible") === "true";

            function toggleBarrasCentro() {
                var barra1 = document.querySelector(".barra1");
                var barra2 = document.querySelector(".barra2");
                var barra3 = document.querySelector(".barra3");

                barrasCentroVisible = !barrasCentroVisible;

                if (barrasCentroVisible) {
                    barra1.style.opacity = "1";
                    barra2.style.opacity = "1";
                    barra3.style.opacity = "1";
                    barra1.style.transform = "scale(1)";
                    barra2.style.transform = "scale(1)";
                    barra3.style.transform = "scale(1)";
                } else {
                    barra1.style.transform = "scale(100)";
                    barra2.style.transform = "scale(100)";
                    barra3.style.transform = "scale(100)";
                    setTimeout(function () {
                        barra1.style.opacity = "0";
                        barra2.style.opacity = "0";
                        barra3.style.opacity = "0";
                    }, 500);
                }

                localStorage.setItem("barrasCentroVisible", barrasCentroVisible);
            }

            function toggleBarrasLaterais() {
                var barraDireita = document.querySelector(".barra_direita");
                var barraEsquerda = document.querySelector(".barra_esquerda");

                barrasLateraisVisible = !barrasLateraisVisible;

                if (barrasLateraisVisible) {
                    barraDireita.style.opacity = "1";
                    barraEsquerda.style.opacity = "1";

                    barraDireita.style.transform = "scale(1)";
                    barraEsquerda.style.transform = "scale(1)";
                } else {
                    barraDireita.style.transform = "scale(100)";
                    barraEsquerda.style.transform = "scale(100)";
                    setTimeout(function () {
                        barraDireita.style.opacity = "0";
                        barraEsquerda.style.opacity = "0";
                    }, 500);
                }

                localStorage.setItem("barrasLateraisVisible", barrasLateraisVisible);
            }

            efeitosCentroButton.addEventListener("click", toggleBarrasCentro);
            efeitosLateraisButton.addEventListener("click", toggleBarrasLaterais);

            // Restaura o estado dos botões e a opacidade ao carregar a página novamente
            if (barrasCentroVisible) {
                var barra1 = document.querySelector(".barra1");
                var barra2 = document.querySelector(".barra2");
                var barra3 = document.querySelector(".barra3");


                barra1.style.transform = "scale(100)";
                barra2.style.transform = "scale(100)";
                barra3.style.transform = "scale(100)";


                barra1.style.opacity = "1";
                barra2.style.opacity = "1";
                barra3.style.opacity = "1";

                setTimeout(function () {
                    barra1.style.transition = "transform 0.5s";
                    barra2.style.transition = "transform 0.5s";
                    barra3.style.transition = "transform 0.5s";

                    barra1.style.transform = "scale(1)";
                    barra2.style.transform = "scale(1)";
                    barra3.style.transform = "scale(1)";
                }, 100);
            }

            if (barrasLateraisVisible) {
                var barraDireita = document.querySelector(".barra_direita");
                var barraEsquerda = document.querySelector(".barra_esquerda");

                barraDireita.style.transform = "scale(100)";
                barraEsquerda.style.transform = "scale(100)";

                barraDireita.style.opacity = "1";
                barraEsquerda.style.opacity = "1";

                setTimeout(function () {
                    barraDireita.style.transition = "transform 0.5s";
                    barraEsquerda.style.transition = "transform 0.5s";

                    barraDireita.style.transform = "scale(1)";
                    barraEsquerda.style.transform = "scale(1)";
                }, 100);
            }
        </script>
        <script>
            $(function () {
                var playerTrack = $("#player-track"),
                        bgArtwork = $("#bg-artwork"),
                        bgArtworkUrl,
                        albumName = $("#album-name"),
                        trackName = $("#track-name"),
                        albumArt = $("#album-art"),
                        sArea = $("#s-area"),
                        seekBar = $("#seek-bar"),
                        trackTime = $("#track-time"),
                        insTime = $("#ins-time"),
                        sHover = $("#s-hover"),
                        playPauseButton = $("#play-pause-button"),
                        i = playPauseButton.find("i"),
                        playPauseButton2 = $("#play-pause-btn"),
                        i = playPauseButton2.find("i"),
                        tProgress = $("#current-time"),
                        tTime = $("#track-length"),
                        seekT,
                        seekLoc,
                        seekBarPos,
                        cM,
                        ctMinutes,
                        ctSeconds,
                        curMinutes,
                        curSeconds,
                        durMinutes,
                        durSeconds,
                        playProgress,
                        bTime,
                        nTime = 0,
                        buffInterval = null,
                        tFlag = false,
                        albums = [
                            "RADIO GOSPEL",
                            "RADIO SERTANEJO",
                            "RADIO MODA SERTANEJA",
                            "RADIO HITS-BRASIL",
                            "RADIO POP",
                            "RADIO PAGODE",
                            "RADIO PISADINHA",
                            "RADIO ROCK",
                            "RADIO POP-ROCK",
                            "RADIO TROPICAL",
                            "RADIO ANOS 80 RETRO",
                            "RADIO LO-FI"
                        ],
                        trackNames = [
                            "Live Hunter",
                            "Live Hunter",
                            "Live Hunter",
                            "Live Hunter",
                            "Live Hunter",
                            "Live Hunter",
                            "Live Hunter",
                            "Live Hunter",
                            "Live Hunter",
                            "Live Hunter",
                            "Live Hunter",
                            "Live Hunter"
                        ],
                        albumArtworks = [
                            "_1",
                            "_2",
                            "_3",
                            "_4",
                            "_5",
                            "_6",
                            "_7",
                            "_8",
                            "_9",
                            "_10",
                            "_11",
                            "_12"],
                        trackUrl = [
                            "https://live.hunter.fm/gospel_high",
                            "https://live.hunter.fm/sertanejo_high",
                            "https://live.hunter.fm/modasertaneja_high",
                            "https://live.hunter.fm/hitsbrasil_high",
                            "https://live.hunter.fm/pop_high",
                            "https://live.hunter.fm/pagode_high",
                            "https://live.hunter.fm/pisadinha_high",
                            "https://live.hunter.fm/rock_high",
                            "https://live.hunter.fm/pop2k_high",
                            "https://live.hunter.fm/tropical_high",
                            "https://live.hunter.fm/80s_high",
                            "https://live.hunter.fm/lofi_high"
                        ],
                        playPreviousTrackButton = $("#play-previous"),
                        playNextTrackButton = $("#play-next"),
                        currIndex = -1;

                $(".album").on("click", function (e) {
                    var dataSwitchId = $(this).attr("data-switch");
                    selectTrack(parseInt(dataSwitchId));
                    playPause();
                    $("#aplayer").addClass("showPlayer");
                });

                function toggleAudioDisplay() {
                    var elemento = document.getElementById('efeito-audio');
                    if (audio.paused) {
                        elemento.classList.add('d-none');
                    } else {
                        elemento.classList.remove('d-none');
                    }
                }

                // Adicione um event listener aos elementos com data-switch
                var switchElements = document.querySelectorAll('[data-switch]');
                switchElements.forEach(function (element) {
                    element.addEventListener('click', function () {
                        var switchValue = element.getAttribute('data-switch');
                        toggleAudioDisplay();

                        if (audio.paused) {
                            play();
                        } else {
                            pause();
                        }

                        selectTrack(parseInt(switchValue));
                    });
                });

                function playPause() {

                    var playPauseButton = document.getElementById("playPauseButton");
                    playPauseButton.addEventListener("click", playPause);

                    setTimeout(function () {

                        if (audio.paused) {
                            playerTrack.addClass("active");
                            albumArt.addClass("active");
                            checkBuffering();
                            i.attr("class", "fas fa-pause");
                            var triangles = document.querySelectorAll(".triangle");
                            triangles.forEach(function (triangle) {
                                triangle.parentNode.removeChild(triangle);
                            });
                            audio.play();
                            toggleAudioDisplay(); // Exibe o elemento #efeito-audio
                        } else {
                            playerTrack.removeClass("active");
                            albumArt.removeClass("active");
                            clearInterval(buffInterval);
                            albumArt.removeClass("buffering");
                            i.attr("class", "fas fa-play");
                            audio.pause();
                            toggleAudioDisplay(); // Oculta o elemento #efeito-audio

                            // Adicione a chamada da função selectTrack() aqui para exibir o card ao pausar a música
                            selectTrack(currIndex);
                        }
                    }, 300);
                }


                // Adicione um evento de clique ao botão play-pause-button
                playPauseButton.on("click", function () {
                    playPause();
                });

                function play() {
                    if (currIndex === -1) {
                        selectTrack(currIndex + 1);
                    }
                    var elemento = document.getElementById('efeito-audio');
                    elemento.classList.remove('d-none');
                    playerTrack.addClass("active");
                    albumArt.addClass("active");
                    checkBuffering();
                    i.attr("class", "fas fa-pause");
                    audio.play();
                    toggleAudioDisplay(); // Oculta o elemento #efeito-audio
                    var elemento = document.getElementById('efeito-audio');
                    elemento.classList.remove('d-none');
                }


                function pause() {
                    playerTrack.removeClass("active");
                    albumArt.removeClass("active");
                    clearInterval(buffInterval);
                    albumArt.removeClass("buffering");
                    i.attr("class", "fas fa-play");
                    var elemento = document.getElementById('efeito-audio');
                    elemento.classList.add('d-none');
                    audio.pause();
                    toggleAudioDisplay(); // Oculta o elemento #efeito-audio
                    // Adicione a chamada da função selectTrack() aqui para exibir o card ao pausar a música
                    selectTrack(currIndex);
                }

                // Adicione um evento de clique ao botão play-pause-btn
                var playPauseButton = $("#play-pause-btn");
                playPauseButton.on("click", function () {
                    if (audio.paused) {
                        var elemento = document.getElementById('efeito-audio');
                        elemento.classList.remove('d-none');
                        play();
                    } else {
                        pause();
                        var elemento = document.getElementById('efeito-audio');
                        elemento.classList.add('d-none');
                    }
                });


                // Adicione eventos de clique aos botões play-previous e play-next
                playPreviousTrackButton.on("click", function () {
                    selectTrack(currIndex - 1);
                });

                playNextTrackButton.on("click", function () {
                    selectTrack(currIndex + 1);
                });


                //Controlador de volume
                var volumeIcon = document.getElementById('volume-icon');
                var volumeSlider = document.getElementById('volume-slider');
                var audio = document.getElementById('player');

                volumeIcon.addEventListener('click', function () {
                    volumeSlider.style.display = volumeSlider.style.display === 'none' ? 'block' : 'none';
                });

                volumeSlider.addEventListener('input', function () {
                    audio.volume = volumeSlider.value;
                });

                document.addEventListener('click', function (event) {
                    var targetElement = event.target;

                    // Verificar se o clique ocorre fora do controle de volume
                    if (targetElement !== volumeIcon && targetElement !== volumeSlider) {
                        volumeSlider.style.display = 'none';
                    }
                });

                function showHover(event) {
                    seekBarPos = sArea.offset();
                    seekT = event.clientX - seekBarPos.left;
                    seekLoc = audio.duration * (seekT / sArea.outerWidth());

                    sHover.width(seekT);

                    cM = seekLoc / 60;

                    ctMinutes = Math.floor(cM);
                    ctSeconds = Math.floor(seekLoc - ctMinutes * 60);

                    if (ctMinutes < 0 || ctSeconds < 0)
                        return;

                    if (ctMinutes < 0 || ctSeconds < 0)
                        return;

                    if (ctMinutes < 10)
                        ctMinutes = "0" + ctMinutes;
                    if (ctSeconds < 10)
                        ctSeconds = "0" + ctSeconds;

                    if (isNaN(ctMinutes) || isNaN(ctSeconds))
                        insTime.text("--:--");
                    else
                        insTime.text(ctMinutes + ":" + ctSeconds);

                    insTime.css({left: seekT, "margin-left": "-21px"}).fadeIn(0);
                }

                function hideHover() {
                    sHover.width(0);
                    insTime.text("00:00").css({left: "0px", "margin-left": "0px"}).fadeOut(0);
                }

                function playFromClickedPos() {
                    audio.currentTime = seekLoc;
                    seekBar.width(seekT);
                    hideHover();
                }

                function updateCurrTime() {
                    nTime = new Date();
                    nTime = nTime.getTime();

                    if (!tFlag) {
                        tFlag = true;
                        trackTime.addClass("active");
                    }

                    curMinutes = Math.floor(audio.currentTime / 60);
                    curSeconds = Math.floor(audio.currentTime - curMinutes * 60);

                    durMinutes = Math.floor(audio.duration / 60);
                    durSeconds = Math.floor(audio.duration - durMinutes * 60);

                    playProgress = (audio.currentTime / audio.duration) * 100;

                    if (curMinutes < 10)
                        curMinutes = "0" + curMinutes;
                    if (curSeconds < 10)
                        curSeconds = "0" + curSeconds;

                    if (durMinutes < 10)
                        durMinutes = "0" + durMinutes;
                    if (durSeconds < 10)
                        durSeconds = "0" + durSeconds;

                    if (isNaN(curMinutes) || isNaN(curSeconds))
                        tProgress.text("00:00");
                    else
                        tProgress.text(curMinutes + ":" + curSeconds);

                    if (isNaN(durMinutes) || isNaN(durSeconds))
                        tTime.text("00:00");
                    else
                        tTime.text(durMinutes + ":" + durSeconds);

                    if (
                            isNaN(curMinutes) ||
                            isNaN(curSeconds) ||
                            isNaN(durMinutes) ||
                            isNaN(durSeconds)
                            )
                        trackTime.removeClass("active");
                    else
                        trackTime.addClass("active");

                    seekBar.width(playProgress + "%");

                    if (playProgress == 100) {
                        i.attr("class", "fa fa-play");
                        seekBar.width(0);
                        tProgress.text("00:00");
                        albumArt.removeClass("buffering").removeClass("active");
                        clearInterval(buffInterval);
                    }
                }

                function checkBuffering() {
                    clearInterval(buffInterval);
                    buffInterval = setInterval(function () {
                        if (nTime == 0 || bTime - nTime > 1000)
                            albumArt.addClass("buffering");
                        else
                            albumArt.removeClass("buffering");

                        bTime = new Date();
                        bTime = bTime.getTime();
                    }, 100);
                }

                function selectTrack(index) {
                    if (index === currIndex) {
                        // Mesma música selecionada, apenas inverte o estado de reprodução
                        playPause();
                        return;
                    }

                    if (index >= 0 && index < albumArtworks.length) {
                        currIndex = index;

                        albumArt.removeClass("buffering");
                        i.attr("class", "fa fa-pause");
                        seekBar.width(0);
                        trackTime.removeClass("active");
                        tProgress.text("00:00");
                        tTime.text("00:00");

                        currAlbum = albums[currIndex];
                        currTrackName = trackNames[currIndex];
                        currArtwork = albumArtworks[currIndex];

                        audio.src = trackUrl[currIndex];

                        nTime = 0;
                        bTime = new Date();
                        bTime = bTime.getTime();

                        playPauseButton.on("click", function () {
                            audio.play();
                        });
                        playerTrack.addClass("active");
                        albumArt.addClass("active");

                        clearInterval(buffInterval);
                        checkBuffering();

                        albumName.text(currAlbum);
                        trackName.text(currTrackName);
                        albumArt.find("img").removeClass("active");

                        // Adiciona a classe "active" apenas na imagem com o ID "ilivemusic-logo"
                        $("#" + currArtwork).addClass("active");


                        bgArtworkUrl = $("#" + currArtwork).attr("src");
                        bgArtwork.css({"background-image": "url(" + bgArtworkUrl + ")"});

                        playPause();
                    }
                }

                function checkBuffering() {
                    clearInterval(buffInterval);
                    buffInterval = setInterval(function () {
                        if (audio.readyState === 4 && (nTime === 0 || bTime - nTime > 1000)) {
                            albumArt.removeClass("buffering");

                            // Aguarde um pequeno atraso antes de reproduzir a música
                            setTimeout(function () {
                                audio.play();
                            }, 100);
                        } else {
                            albumArt.addClass("buffering");
                        }

                        bTime = new Date();
                        bTime = bTime.getTime();
                    }, 100);
                }


                function initPlayer() {
                    audio = new Audio();

                    // Selecione a faixa apenas quando o usuário clicar em uma música específica
                    // selectTrack(0);

                    audio.loop = false;

                    playPauseButton.on("click", playPause);

                    sArea.mousemove(function (event) {
                        showHover(event);
                    });

                    sArea.mouseout(hideHover);

                    sArea.on("click", playFromClickedPos);

                    $(audio).on("timeupdate", updateCurrTime);

                    playPreviousTrackButton.on("click", function () {
                        if (currIndex === 0) {
                            selectTrack(albumArtworks.length - 1);
                        } else {
                            selectTrack(currIndex - 1);
                        }
                    });

                    playNextTrackButton.on("click", function () {
                        if (currIndex === albumArtworks.length - 1) {
                            selectTrack(0);
                        } else {
                            selectTrack(currIndex + 1);
                        }
                    });


                    // Adicione um manipulador de eventos para o clique fora dos elementos relevantes
                    $(document).on("click", function (event) {
                        var target = $(event.target);

                        // Verifica se o elemento clicado é um dos elementos relevantes para reprodução
                        if (
                                !target.hasClass("album") &&
                                !target.hasClass("play-pause-button") &&
                                !target.hasClass("fa") &&
                                !target.hasClass("current-time") &&
                                !target.hasClass("progress") &&
                                !target.hasClass("track-length") &&
                                !target.hasClass("ins-time")
                                ) {
                            // Elemento clicado não é relevante, retorna sem iniciar a reprodução
                            return;
                        }

                        // Restante do código para iniciar a reprodução...
                        // ...
                        // (o código existente que vem depois dessa parte)
                    });
                }


                initPlayer();
            });

        </script>
        <!--Popup-->
        <div id="${popupSuperior}" class="popup-superior" style="margin-top: 10%;">
            <div id="d-none" class="text-center d-none popup-content ${animacao}"${cor_fundo}>
                <h2 class="text-center fw-bold ${cor_titulo}">${titulo}</h2>
                <p class="text-center fw-bold ${cor_msg}">${msg}</p>
                <div class="progress-container">
                    <div class="progress-bar"></div>
                </div>
                <div class="  d-flex justify-content-center ${anim_popup}">
                    ${anim}
                </div>
            </div>
        </div>
    </body>
</html>
