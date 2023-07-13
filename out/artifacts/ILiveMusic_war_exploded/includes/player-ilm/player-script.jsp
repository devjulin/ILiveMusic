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
                "Paradise Circus",
                "Dawn",
                "Me & You",
                "Electro Boy",
                "Home",
                "Proxy (Original Mix)"
            ],
            trackNames = [
                "ILIVEMUSIC",
                "Skylike - Dawn",
                "Alex Skrindo - Me & You",
                "Kaaze - Electro Boy",
                "Jordan Schor - Home",
                "Martin Garrix - Proxy"
            ],
            albumArtworks = ["_1", "_2", "_3", "_4", "_5"],
            trackUrl = [
                "teste2/paradise_circus.mp3",
                "https://raw.githubusercontent.com/himalayasingh/music-player-1/master/music/2.mp3",
                "https://raw.githubusercontent.com/himalayasingh/music-player-1/master/music/1.mp3",
                "https://raw.githubusercontent.com/himalayasingh/music-player-1/master/music/3.mp3",
                "https://raw.githubusercontent.com/himalayasingh/music-player-1/master/music/4.mp3",
                "https://raw.githubusercontent.com/himalayasingh/music-player-1/master/music/5.mp3"
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

        function playPause() {
            var playPauseButton = document.getElementById("playPauseButton");
            playPauseButton.addEventListener("click", playPause);
            setTimeout(function () {
                if (audio.paused) {
                    playerTrack.addClass("active");
                    albumArt.addClass("active");
                    checkBuffering();
                    i.attr("class", "fas fa-pause");
                    audio.play();
                } else {
                    playerTrack.removeClass("active");
                    albumArt.removeClass("active");
                    clearInterval(buffInterval);
                    albumArt.removeClass("buffering");
                    i.attr("class", "fas fa-play");
                    audio.pause();
                    // Adicione a chamada da fun��o selectTrack() aqui para exibir o card ao pausar a m�sica
                    selectTrack(currIndex);
                }
            }, 300);
        }

        // Adicione um evento de clique ao bot�o play-pause-button
        playPauseButton.on("click", function () {
            playPause();
        });

        function play() {
            if (currIndex === -1) {
                selectTrack(currIndex + 1);
            }

            playerTrack.addClass("active");
            albumArt.addClass("active");
            checkBuffering();
            i.attr("class", "fas fa-pause");
            audio.play();
        }


        function pause() {
            playerTrack.removeClass("active");
            albumArt.removeClass("active");
            clearInterval(buffInterval);
            albumArt.removeClass("buffering");
            i.attr("class", "fas fa-play");
            audio.pause();
            // Adicione a chamada da fun��o selectTrack() aqui para exibir o card ao pausar a m�sica
            selectTrack(currIndex);
        }

        // Adicione um evento de clique ao bot�o play-pause-btn
        var playPauseButton = $("#play-pause-btn");
        playPauseButton.on("click", function () {
            if (audio.paused) {
                play();
            } else {
                pause();
            }
        });

        // Adicione eventos de clique aos bot�es play-previous e play-next
        playPreviousTrackButton.on("click", function () {
            selectTrack(currIndex - 1);
        });

        playNextTrackButton.on("click", function () {
            selectTrack(currIndex + 1);
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
                // Mesma m�sica selecionada, apenas inverte o estado de reprodu��o
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
                $("#ilivemusic-logo").addClass("active");

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

                    // Aguarde um pequeno atraso antes de reproduzir a m�sica
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

            // Selecione a faixa apenas quando o usu�rio clicar em uma m�sica espec�fica
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
                selectTrack(currIndex - 1);
            });

            playNextTrackButton.on("click", function () {
                selectTrack(currIndex + 1);
            });

            // Adicione um manipulador de eventos para o clique fora dos elementos relevantes
            $(document).on("click", function (event) {
                var target = $(event.target);

                // Verifica se o elemento clicado � um dos elementos relevantes para reprodu��o
                if (
                    !target.hasClass("album") &&
                    !target.hasClass("play-pause-button") &&
                    !target.hasClass("fa") &&
                    !target.hasClass("current-time") &&
                    !target.hasClass("progress") &&
                    !target.hasClass("track-length") &&
                    !target.hasClass("ins-time")
                ) {
                    // Elemento clicado n�o � relevante, retorna sem iniciar a reprodu��o
                    return;
                }

                // Restante do c�digo para iniciar a reprodu��o...
                // ...
                // (o c�digo existente que vem depois dessa parte)
            });
        }


        initPlayer();
    });

</script>