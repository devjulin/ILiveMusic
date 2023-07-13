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
    <link rel="stylesheet" href="css/style.css">
    <script src="js/script.js"></script>
    <jsp:include page="includes/bootstrap_5_Lib.jsp"/>
    <jsp:include page="includes/w3.css_Lib.jsp"/>
    <!-- APlayer CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aplayer/1.10.1/APlayer.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <!-- Swiper -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aplayer/1.10.1/APlayer.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/aplayer/1.10.1/APlayer.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.12.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">


    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>

<style>

    .border-radius {
        border-radius: 10px;
    }

    img {
        width: 100%;
        min-height: 250px;
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
        border-radius: 75px;
        overflow: hidden;
        box-shadow: 0 15px 35px black;
        transition: all ease 0.4s;
    }

    .album:hover {
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


    /*default is hide music player*/
    #aplayer {
        position: fixed;
        bottom: -100%;
        left: 0;
        width: 100%;
        margin: 0;
        box-shadow: 0 -2px 2px #dadada;
        background-color: #D167FF;
        transition: all ease 0.5s;
        z-index: 9999;

    }

    #aplayer.showPlayer {
        bottom: 0;
    }


    /*MUSIC PLAYER CUSTOMIZING STYLE*/
    span {
        color: white !important;
        font-size: 16px;
    }

    .aplayer .aplayer-info .aplayer-controller .aplayer-bar-wrap .aplayer-bar .aplayer-loaded {
        background: #e0e0e0;
        height: 4px;
    }

    .aplayer .aplayer-info .aplayer-controller .aplayer-bar-wrap .aplayer-bar .aplayer-played {
        height: 4px;
        background-color: white !important;
    }

    .aplayer .aplayer-info .aplayer-controller .aplayer-bar-wrap .aplayer-bar .aplayer-played .aplayer-thumb {
        background-color: white !important;
    }

    .aplayer .aplayer-icon {
        width: 20px;
        height: 20px;
    }

    .aplayer .aplayer-info .aplayer-controller .aplayer-time .aplayer-icon path {
        fill: white;
    }

    .aplayer .aplayer-info .aplayer-music {
        margin-bottom: 5px;
    }

    .borda-personalizada {
        border-radius: 30px;
    }

    .ajuste-carrossel {
        width: 85%;
        height: 75%;
    }

    .coluna-md-3 {
        flex: 0 0 25%;
        max-width: 25%;
    }

    .hover-vermelho:hover {
        color: red;
    }

    /*Ajuste @media para telas menores que 768 pixels de largura "celulares"*/
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

        .album {
            display: block;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 15px 35px black;
            transition: all ease 0.4s;
            max-width: 100%;
            max-height: 25%;

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

</style>
<body class="modo-claro">
<!--Menu Lateral Esquerdo -->


<% HttpSession sessao = request.getSession();
    String permissao = String.valueOf(sessao.getAttribute("permissao"));
%>

<%
    if (sessao.getAttribute("user") == null) {
        permissao = null;
%>
<jsp:include page="includes/menus_sidebar/menu.jsp"/>
<div id="main">
    <div class="bg-menu-lateral d-flex justify-content-between">
        <button id="openNav" class=" bg-menu-lateral w3-button w3-xlarge text-white" onclick="w3_open()">&#9776;
        </button>
        <div class="w3-container">
            <!-- Botão para abrir o modal -->
            <h1 class="text-white fw-bold" style="margin-left: 20%;width: 100%">&nbsp; ILiveMusic <i
                    class="bi bi-boombox"></i></h1>

        </div>
        <a href="#" class="btn btn-link text-black" data-bs-toggle="modal" data-bs-target="#loginModal">
            <i class="bi bi-person-circle fs-1"></i>
        </a>
        <jsp:include page="includes/modal_login.jsp"/>
    </div>


    <!--ADMINISTRADOR -->
    <%} else if (permissao.equals("adm")) {%>
    <jsp:include page="includes/menus_sidebar/menu_logado.jsp"/>
    <jsp:include page="includes/menus_navbar/menu_adm.jsp"/>
    <!--PREMIUM -->
    <%} else if (permissao.equals("premium")) {%>
    <jsp:include page="includes/menus_sidebar/menu_logado.jsp"/>
    <jsp:include page="includes/menus_navbar/menu_premium.jsp"/>
    <!--GRATUITO -->
    <%} else if (permissao.equals("gratuito")) {%>
    <jsp:include page="includes/menus_sidebar/menu_logado.jsp"/>
    <jsp:include page="includes/menus_navbar/menu_gratuito.jsp"/>
    <%}%>

    <div class="container-fluid ">
        <div class="row ajuste-carrossel mx-auto mt-5">
            <div class="border-radius d-flex align-self-start">

                <!-- Carrossel -->
                <div id="carrossel" class="carousel slide w-100 h-100" data-bs-ride="carousel">

                    <!-- Indicadores -->
                    <div class="carousel-indicators d-none">
                        <button type="button" data-bs-target="#carrossel" data-bs-slide-to="0" class="active"></button>
                        <button type="button" data-bs-target="#carrossel" data-bs-slide-to="1"></button>
                        <button type="button" data-bs-target="#carrossel" data-bs-slide-to="2"></button>
                        <button type="button" data-bs-target="#carrossel" data-bs-slide-to="3"></button>
                        <button type="button" data-bs-target="#carrossel" data-bs-slide-to="4"></button>
                    </div>
                    <!-- Imagens dos slides -->
                    <div class="carousel-inner borda-personalizada">
                        <div class="carousel-item active">
                            <a href="index.jsp">
                                <img src="img/carrossel/c1.webp" alt="0" class="d-block w-100">
                            </a>
                        </div>
                        <div class="carousel-item">
                            <a href="index.jsp">
                                <img src="img/carrossel/c2.jpg" alt="1" class="d-block w-100">
                            </a>
                        </div>
                        <div class="carousel-item">
                            <a href="index.jsp">
                                <img src="img/carrossel/c3.webp" alt="2" class="d-block w-100">
                            </a>
                        </div>
                        <div class="carousel-item">
                            <a href="index.jsp">
                                <img src="img/carrossel/c4.jpg" alt="3" class="d-block w-100">
                            </a>
                        </div>
                        <div class="carousel-item">
                            <a href="index.jsp">
                                <img src="img/carrossel/c5.jpg" alt="4" class="d-block w-100">
                            </a>
                        </div>
                    </div>
                    <!-- Controles esquerda e direita -->
                    <button class="carousel-control-prev" type="button" data-bs-target="#carrossel"
                            data-bs-slide="prev">

                        <path fill-rule="evenodd"
                              d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm11.5 5.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"/>
                        </path>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carrossel"
                            data-bs-slide="next">

                        <path fill-rule="evenodd"
                              d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm4.5 5.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"/>

                        </path>
                    </button>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="principal">
                    <div class="container">
                        <div class="row text-center">
                            <div class="col-md-12">
                                <h3 class="bi-soundwave text-center fw-bold"> Curta sua Radio 24hs!</h3>
                            </div>
                            <div class="container">
                                <div class="row">
                                    <div class=" mx-auto col-12">
                                        <div class="swiper-container">
                                            <div class="swiper-wrapper p-5">
                                                <div class="swiper-slide">
                                                    <a href="#" class="album" data-switch="0">
                                                        <img src="images/radio/gospel.jpg" alt=""> </a>
                                                </div>
                                                <div class="swiper-slide">
                                                    <a href="#" class="album" data-switch="1">
                                                        <img src="images/radio/sertanejo.jpg" alt="">
                                                    </a>
                                                </div>
                                                <div class="swiper-slide">
                                                    <a href="#" class="album" data-switch="2">
                                                        <img src="images/radio/modas.jpg" alt="">
                                                    </a>
                                                </div>
                                                <div class="swiper-slide">
                                                    <a href="#" class="album" data-switch="3">
                                                        <img src="images/radio/hitsbrasil.jpg" alt="">
                                                    </a>
                                                </div>

                                                <div class="swiper-slide">
                                                    <a href="#" class="album" data-switch="4">
                                                        <img src="images/radio/popmusic.jpg" alt="">
                                                    </a>
                                                </div>
                                                <div class="swiper-slide">
                                                    <a href="#" class="album" data-switch="5">
                                                        <img src="images/radio/pagodemusic.jpg" alt="">
                                                    </a>
                                                </div>
                                                <div class="swiper-slide">
                                                    <a href="#" class="album" data-switch="6">
                                                        <img src="images/radio/pisadinhamusic.jpg" alt="">
                                                    </a>
                                                </div>
                                                <div class="swiper-slide">
                                                    <a href="#" class="album" data-switch="7">
                                                        <img src="images/radio/rockmusic.jpg" alt="">
                                                    </a>
                                                </div>
                                                <div class="swiper-slide">
                                                    <a href="#" class="album" data-switch="8">
                                                        <img src="images/radio/poprockmusic.jpg" alt="">
                                                    </a>
                                                </div>
                                                <div class="swiper-slide">
                                                    <a href="#" class="album" data-switch="9">
                                                        <img src="images/radio/tropical.jpg" alt="">
                                                    </a>
                                                </div>
                                                <div class="swiper-slide">
                                                    <a href="#" class="album" data-switch="10">
                                                        <img src="images/radio/80retro.jpg" alt="">
                                                    </a>
                                                </div>
                                                <div class="swiper-slide">
                                                    <a href="#" class="album" data-switch="11">
                                                        <img src="images/radio/lofi.jpg" alt="">
                                                    </a>
                                                </div>

                                            </div>
                                            <div class="col-auto">
                                                <div class="swiper-button-next"></div>
                                                <div class="swiper-button-prev"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Crie o HTML do carrossel -->
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-12">
                                        <h3 class="bi-soundwave text-center fw-bold"> Escolha Seu Artista ou Banda
                                            Preferidos!</h3>
                                    </div>
                                    <div class=" mx-auto col-12">
                                        <div class="swiper-container">
                                            <div class="swiper-wrapper p-5">
                                                <div class="swiper-slide">
                                                    <a href="#" class="album" data-switch="1">
                                                        <img src="https://images.pexels.com/photos/1699161/pexels-photo-1699161.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
                                                             alt="">
                                                    </a>
                                                    <h4>RADIO 24HS POP</h4>
                                                </div>
                                                <div class="swiper-slide">
                                                    <a href="#" class="album" data-switch="2">
                                                        <img src="https://images.pexels.com/photos/838702/pexels-photo-838702.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
                                                             alt="">
                                                    </a>
                                                    <h4>Repellat illo</h4>
                                                </div>
                                                <div class="swiper-slide">
                                                    <a href="#" class="album" data-switch="3">
                                                        <img src="https://images.pexels.com/photos/838702/pexels-photo-838702.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
                                                             alt="">
                                                    </a>
                                                    <h4>Repellat illo</h4>
                                                </div>
                                                <div class="swiper-slide">
                                                    <a href="#" class="album" data-switch="4">
                                                        <img src="https://images.pexels.com/photos/838702/pexels-photo-838702.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
                                                             alt="">
                                                    </a>
                                                    <h4>Repellat illo</h4>
                                                </div>
                                                <div class="swiper-slide">
                                                    <a href="#" class="album" data-switch="5">
                                                        <img src="https://images.pexels.com/photos/838702/pexels-photo-838702.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
                                                             alt="">
                                                    </a>
                                                    <h4>Repellat illo</h4>
                                                </div>
                                                <div class="swiper-slide">
                                                    <a href="#" class="album" data-switch="6">
                                                        <img src="https://images.pexels.com/photos/838702/pexels-photo-838702.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
                                                             alt="">
                                                    </a>
                                                    <h4>Repellat illo</h4>
                                                </div>
                                                <div class="swiper-slide">
                                                    <a href="#" class="album" data-switch="7">
                                                        <img src="https://images.pexels.com/photos/838702/pexels-photo-838702.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
                                                             alt="">
                                                    </a>
                                                    <h4>Repellat illo</h4>
                                                </div>
                                                <div class="swiper-slide">
                                                    <a href="#" class="album" data-switch="8">
                                                        <img src="https://images.pexels.com/photos/838702/pexels-photo-838702.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
                                                             alt="">
                                                    </a>
                                                    <h4>Repellat illo</h4>
                                                </div>
                                                <div class="swiper-slide">
                                                    <a href="#" class="album" data-switch="9">
                                                        <img src="https://images.pexels.com/photos/838702/pexels-photo-838702.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
                                                             alt="">
                                                    </a>
                                                    <h4>Repellat illo</h4>
                                                </div>
                                                <div class="swiper-slide">
                                                    <a href="#" class="album" data-switch="10">
                                                        <img src="https://images.pexels.com/photos/838702/pexels-photo-838702.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
                                                             alt="">
                                                    </a>
                                                    <h4>Repellat illo</h4>
                                                </div>
                                                <div class="swiper-slide">
                                                    <a href="#" class="album" data-switch="11">
                                                        <img src="https://images.pexels.com/photos/838702/pexels-photo-838702.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
                                                             alt="">
                                                    </a>
                                                    <h4>Repellat illo</h4>
                                                </div>
                                                <div class="swiper-slide">
                                                    <a href="#" class="album" data-switch="12">
                                                        <img src="https://images.pexels.com/photos/838702/pexels-photo-838702.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
                                                             alt="">
                                                    </a>
                                                    <h4>Repellat illo</h4>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <div class="swiper-button-next"></div>
                                                <div class="swiper-button-prev"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="aplayer"></div>
</div>
<script>
    /*Abrir menu lateral esquerdo*/
    function w3_open() {
        if (window.innerWidth > 768) {
            document.getElementById("main").style.marginLeft = "15%";
            document.getElementById("aplayer").style.marginLeft = "15%";
            document.getElementById("mySidebar").style.width = "15%";
            document.getElementById("mySidebar").style.display = "block";
            document.getElementById("openNav").style.display = 'none';
            document.getElementById("aplayer").style.maxWidth = "calc(85% - 20px)";
        } else {
            document.getElementById("main").style.marginLeft = "30%";
            document.getElementById("aplayer").style.marginLeft = "30%";
            document.getElementById("mySidebar").style.width = "30%";
            document.getElementById("mySidebar").style.display = "block";
            document.getElementById("openNav").style.display = 'none';
            document.getElementById("aplayer").style.maxWidth = "70%";
            document.getElementById("aplayer").style.padding = "2%";
            document.getElementById("aplayer").style.marginBottom = "10px";
        }
    }

    function w3_close() {
        document.getElementById("main").style.marginLeft = "0%";
        document.getElementById("aplayer").style.marginLeft = "0%";
        document.getElementById("mySidebar").style.display = "none";
        document.getElementById("openNav").style.display = "inline-block";
        document.getElementById("aplayer").style.maxWidth = "100%";
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
            breakpoints: {
                0: {
                    slidesPerView: 2, // Número de slides visíveis em telas menores
                    spaceBetween: 20, // Espaçamento reduzido em telas menores
                    width: 300, // Largura fixa do slide em telas menores
                    height: 150 // Altura fixa do slide em telas menores
                },
                576: {
                    slidesPerView: 2, // Número de slides visíveis em telas maiores que 576px
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
                    slidesPerView: 5, // Número de slides visíveis em telas maiores que 1200px
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
    $(".album").on('click', function (e) {
        e.preventDefault();
        var dataSwitchId = $(this).attr('data-switch');
        var iframe = document.getElementById('iframePlayer');
        iframe.contentWindow.postMessage({
            type: 'switchSong',
            songId: dataSwitchId
        }, '*');
    });
</script>
</body>
</html>
