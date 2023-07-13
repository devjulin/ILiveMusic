<style>
    .album-artistas-gratuito {
        filter: grayscale(100%);
        position: relative;
        display: block;
        border-radius: 35px;
        overflow: hidden;
        box-shadow: 0 15px 35px black;
        opacity: 0.5;
    }

    .diagonal {
        transform: rotate(-35deg);
        display: inline-block;
    }

    <jsp:include page = "../permissoes_css.jsp" />
</style>
<div class="row">
    <div class="col">
        <div class="principal">
            <div class="container">
                <div class="row text-center">
                    <div class="col-md-12">
                        <h3 class="bi-soundwave text-center fw-bold p-2 rounded reaj-titulo"> RADIO em Destaque <span
                                class="efeito-pulsar">HUNTER FM</span></h3>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class=" mx-auto col-12">
                                <div class="swiper-container">
                                    <div class="swiper-wrapper p-5">
                                        <div class="swiper-slide">
                                            <a class="album" data-switch="0">
                                                <img src="images/radio/gospel.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album" data-switch="1">
                                                <img src="images/radio/sertanejo.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album" data-switch="2">
                                                <img src="images/radio/modas.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album" data-switch="3">
                                                <img src="images/radio/hitsbrasil.jpg" alt="">
                                            </a>
                                        </div>

                                        <div class="swiper-slide">
                                            <a class="album" data-switch="4">
                                                <img src="images/radio/popmusic.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album" data-switch="5">
                                                <img src="images/radio/pagodemusic.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album" data-switch="6">
                                                <img src="images/radio/pisadinhamusic.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album" data-switch="7">
                                                <img src="images/radio/rockmusic.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album" data-switch="8">
                                                <img src="images/radio/poprockmusic.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album" data-switch="9">
                                                <img src="images/radio/tropical.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album" data-switch="10">
                                                <img src="images/radio/80retro.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album" data-switch="11">
                                                <img src="images/radio/lofi.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album" data-switch="0">
                                                <img src="images/radio/gospel.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album" data-switch="1">
                                                <img src="images/radio/sertanejo.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album" data-switch="2">
                                                <img src="images/radio/modas.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album" data-switch="3">
                                                <img src="images/radio/hitsbrasil.jpg" alt="">
                                            </a>
                                        </div>

                                        <div class="swiper-slide">
                                            <a class="album" data-switch="4">
                                                <img src="images/radio/popmusic.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album" data-switch="5">
                                                <img src="images/radio/pagodemusic.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album" data-switch="6">
                                                <img src="images/radio/pisadinhamusic.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album" data-switch="7">
                                                <img src="images/radio/rockmusic.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album" data-switch="8">
                                                <img src="images/radio/poprockmusic.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album" data-switch="9">
                                                <img src="images/radio/tropical.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album" data-switch="10">
                                                <img src="images/radio/80retro.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album" data-switch="11">
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

                    <style>
                        /* Estilos para o pop-up */
                        .modo-claro .popup-overlay {
                            position: fixed;
                            top: 0;
                            left: 0;
                            width: 100%;
                            height: 100%;
                            background-color: rgba(0, 0, 0, 0.7);
                            color: white;
                            display: flex;
                            align-items: center;
                            justify-content: center;
                            z-index: 9999;
                            opacity: 0;
                            visibility: hidden;
                            transition: opacity 0.3s ease, visibility 0.3s ease;
                        }

                        .modo-claro .popup {
                            background-color: #fff;
                            padding: 20px;
                            border-radius: 5px;
                            text-align: center;
                        }

                        .modo-claro .popup h2 {
                            margin-top: 0;
                        }

                        .modo-claro .popup-close {
                            cursor: pointer;
                            position: absolute;
                            top: 10px;
                            right: 10px;
                        }

                        .modo-escuro .popup-overlay {
                            position: fixed;
                            top: 0;
                            left: 0;
                            width: 100%;
                            height: 100%;
                            background-color: rgba(0, 0, 0, 0.7);
                            color: black;
                            display: flex;
                            align-items: center;
                            justify-content: center;
                            z-index: 9999;
                            opacity: 0;
                            visibility: hidden;
                            transition: opacity 0.3s ease, visibility 0.3s ease;
                        }

                        .modo-escuro .popup {
                            background-color: #333;
                            padding: 20px;
                            border-radius: 5px;
                            text-align: center;
                        }

                        .modo-escuro .popup h2 {
                            margin-top: 0;
                        }

                        .modo-escuro .popup-close {
                            cursor: pointer;
                            position: absolute;
                            top: 10px;
                            right: 10px;
                        }
                    </style>
                    <div class="container">
                        <div class="row" style="margin-left: 0.1em;">
                            <div class="col-md-12">
                                <h3 class="bi-soundwave text-center fw-bold reaj-titulo rounded p-2"
                                    style="z-index: 9999; "> Escolha Seu Artista ou Banda Preferidos!<a
                                        href="assinatura.jsp"
                                        class="text-decoration-none permissao-premium diagonal fs-5 p-3 fw-bold">
                                    PREMIUM</a></h3>
                            </div>
                            <div class=" mx-auto col-12">
                                <div class="swiper-container">
                                    <div class="swiper-wrapper p-5">
                                        <div class="swiper-slide">
                                            <a href="artista/ncs.jsp" class="album-artistas text-decoration-none">
                                                <h4 class=" p-2 fs-3 bg-white text-dark">LIVRE</h4>
                                                <img class="album-artistas" src="images/artistas/ncs.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album-artistas-gratuito text-decoration-none">
                                                <h4 class="bg-warning text-dark p-2 fs-3">PREMIUM</h4>
                                                <img class="album-artistas-gratuito" src="images/artistas/proximity.jpg"
                                                     alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album-artistas-gratuito text-decoration-none">
                                                <h4 class="bg-warning text-dark p-2 fs-3">PREMIUM</h4>
                                                <img class="album-artistas-gratuito" src="images/artistas/spinnin.jpg"
                                                     alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album-artistas-gratuito text-decoration-none">
                                                <h4 class="bg-warning text-dark p-2 fs-3">PREMIUM</h4>
                                                <img class="album-artistas-gratuito" src="images/artistas/doja-cat.jpg"
                                                     alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album-artistas-gratuito text-decoration-none">
                                                <h4 class="bg-warning text-dark p-2 fs-3">PREMIUM</h4>
                                                <img class="album-artistas-gratuito"
                                                     src="images/artistas/don-toliver.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album-artistas-gratuito text-decoration-none">
                                                <h4 class="bg-warning text-dark p-2 fs-3">PREMIUM</h4>
                                                <img class="album-artistas-gratuito"
                                                     src="images/artistas/henrique-juliano.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album-artistas-gratuito text-decoration-none">
                                                <h4 class="bg-warning text-dark p-2 fs-3">PREMIUM</h4>
                                                <img class="album-artistas-gratuito"
                                                     src="images/artistas/thalles-roberto.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album-artistas-gratuito text-decoration-none">
                                                <h4 class="bg-warning text-dark p-2 fs-3">PREMIUM</h4>
                                                <img class="album-artistas-gratuito"
                                                     src="images/artistas/fernandinho.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album-artistas-gratuito text-decoration-none">
                                                <h4 class="bg-warning text-dark p-2 fs-3">PREMIUM</h4>
                                                <img class="album-artistas-gratuito"
                                                     src="images/artistas/baroes-pisadinha.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album-artistas-gratuito text-decoration-none">
                                                <h4 class="bg-warning text-dark p-2 fs-3">PREMIUM</h4>
                                                <img class="album-artistas-gratuito"
                                                     src="images/artistas/roberto-carlos.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a href="artista/ncs.jsp" class="album-artistas text-decoration-none">
                                                <h4 class=" p-2 fs-3 bg-white text-dark">LIVRE</h4>
                                                <img class="album-artistas" src="images/artistas/ncs.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album-artistas-gratuito text-decoration-none">
                                                <h4 class="bg-warning text-dark p-2 fs-3">PREMIUM</h4>
                                                <img class="album-artistas-gratuito" src="images/artistas/proximity.jpg"
                                                     alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album-artistas-gratuito text-decoration-none">
                                                <h4 class="bg-warning text-dark p-2 fs-3">PREMIUM</h4>
                                                <img class="album-artistas-gratuito" src="images/artistas/spinnin.jpg"
                                                     alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album-artistas-gratuito text-decoration-none">
                                                <h4 class="bg-warning text-dark p-2 fs-3">PREMIUM</h4>
                                                <img class="album-artistas-gratuito" src="images/artistas/doja-cat.jpg"
                                                     alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album-artistas-gratuito text-decoration-none">
                                                <h4 class="bg-warning text-dark p-2 fs-3">PREMIUM</h4>
                                                <img class="album-artistas-gratuito"
                                                     src="images/artistas/don-toliver.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album-artistas-gratuito text-decoration-none">
                                                <h4 class="bg-warning text-dark p-2 fs-3">PREMIUM</h4>
                                                <img class="album-artistas-gratuito"
                                                     src="images/artistas/henrique-juliano.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album-artistas-gratuito text-decoration-none">
                                                <h4 class="bg-warning text-dark p-2 fs-3">PREMIUM</h4>
                                                <img class="album-artistas-gratuito"
                                                     src="images/artistas/thalles-roberto.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album-artistas-gratuito text-decoration-none">
                                                <h4 class="bg-warning text-dark p-2 fs-3">PREMIUM</h4>
                                                <img class="album-artistas-gratuito"
                                                     src="images/artistas/fernandinho.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album-artistas-gratuito text-decoration-none">
                                                <h4 class="bg-warning text-dark p-2 fs-3">PREMIUM</h4>
                                                <img class="album-artistas-gratuito"
                                                     src="images/artistas/baroes-pisadinha.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="album-artistas-gratuito text-decoration-none">
                                                <h4 class="bg-warning text-dark p-2 fs-3">PREMIUM</h4>
                                                <img class="album-artistas-gratuito"
                                                     src="images/artistas/roberto-carlos.jpg" alt="">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <div class="swiper-button-next text-primary"></div>
                                        <div class="swiper-button-prev text-primary"></div>
                                    </div>
                                </div>
                                <div class="popup-overlay texto-modos" id="popupOverlay">
                                    <div class="popup">
                                        <h2 class="permissao-premium fw-bold">RECURSO PREMIUM!!</h2>
                                        <p>É necessário efetuar a assinatura <a
                                                class="permissao-premium fw-bold text-decoration-none">PREMIUM</a> para
                                            ter acesso aos artistas, músicas e todos os recursos completos da
                                            ILiveMusic!</p>
                                        <span class="popup-close" onclick="closePopup()">&times;</span>
                                        <div class="" style="position: absolute;right: 10em;">
                                            <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
                                            <lottie-player
                                                    src="https://assets9.lottiefiles.com/packages/lf20_0gfEPCHLKZ.json"
                                                    background="transparent" speed="1"
                                                    style="width: 300px; height: 300px;" loop autoplay></lottie-player>
                                        </div>
                                    </div>
                                </div>
                                <script>
                                    // Funï¿½ï¿½o para exibir o pop-up
                                    function showPopup() {
                                        var popupOverlay = document.getElementById("popupOverlay");
                                        popupOverlay.style.opacity = "1";
                                        popupOverlay.style.visibility = "visible";
                                    }

                                    // Funï¿½ï¿½o para fechar o pop-up
                                    function closePopup() {
                                        var popupOverlay = document.getElementById("popupOverlay");
                                        popupOverlay.style.opacity = "0";
                                        popupOverlay.style.visibility = "hidden";
                                    }

                                    // Adicione um evento para exibir o pop-up ao clicar em um artista
                                    var artistas = document.getElementsByClassName("album-artistas-gratuito");
                                    for (var i = 0; i < artistas.length; i++) {
                                        artistas[i].addEventListener("click", showPopup);
                                    }

                                    // Feche o pop-up ao clicar fora dele
                                    var popupOverlay = document.getElementById("popupOverlay");
                                    popupOverlay.addEventListener("click", function (event) {
                                        if (event.target === popupOverlay) {
                                            closePopup();
                                        }
                                    });
                                </script>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>