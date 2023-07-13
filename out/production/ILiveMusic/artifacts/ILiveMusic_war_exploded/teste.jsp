<%-- 
    Document   : teste
    Created on : 02/06/2023, 00:13:54
    Author     : julio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <jsp:include page="includes/bootstrap_5_Lib.jsp"/>
    <jsp:include page="includes/w3.css_Lib.jsp"/>

</head>
<body>
<!-- Tracks used in this music/audio player application are free to use. I downloaded them from Soundcloud and NCS websites. I am not the owner of these tracks. -->
<style>

    #app-cover {

        right: 0;
        left: 0;
        width: 430px;
        height: 100px;
        margin: -4px auto;
    }

    #player {
        position: relative;
        height: 100%;
        z-index: 3;
    }

    #player-track {
        position: absolute;
        top: 0;
        right: 15px;
        left: 15px;
        padding: 13px 22px 10px 184px;
        background-color: #343a40;
        border-radius: 15px 15px 0 0;
        transition: 0.3s ease top;
        z-index: 1;
    }

    #player-track.active {
        top: -92px;
    }

    #album-name {
        color: #afb7c1;
        font-size: 17px;
        font-weight: bold;
    }

    #track-name {
        color: #afb7c1;
        font-size: 13px;
        margin: 2px 0 13px 0;
    }

    #track-time {
        height: 12px;
        margin-bottom: 3px;
        overflow: hidden;
    }

    #current-time {
        float: left;
    }

    #track-length {
        float: right;
    }

    #current-time,
    #track-length {
        color: transparent;
        font-size: 11px;
        background-color: #ffe8ee;
        border-radius: 10px;
        transition: 0.3s ease all;
    }

    #track-time.active #current-time,
    #track-time.active #track-length {
        color: #f86d92;
        background-color: transparent;
    }

    #s-area,
    #seek-bar {
        position: relative;
        height: 4px;
        border-radius: 4px;
    }

    #s-area {
        background-color: purple;
        cursor: pointer;
    }

    #ins-time {
        position: absolute;
        top: -29px;
        color: #fff;
        font-size: 12px;
        white-space: pre;
        padding: 5px 6px;
        border-radius: 4px;
        display: none;
    }

    #s-hover {
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        opacity: 0.2;
        z-index: 2;
    }

    #ins-time,
    #s-hover {
        background-color: #3b3d50;
    }

    #seek-bar {
        content: "";
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        width: 0;
        background-color: #fd6d94;
        transition: 0.2s ease width;
        z-index: 1;
    }

    #player-content {
        position: relative;
        height: 100%;
        background-color: #afb7c1;
        box-shadow: 0 30px 80px #656565;
        border-radius: 15px;
        z-index: 2;
    }

    #album-art {
        position: absolute;
        top: -40px;
        width: 115px;
        height: 115px;
        margin-left: 40px;
        transform: rotateZ(0);
        transition: 0.3s ease all;
        box-shadow: 0 0 0 10px #fff;
        border-radius: 50%;
        overflow: hidden;
    }

    #album-art.active {
        top: -60px;
        box-shadow: 0 0 0 4px #afb7c1, 0 30px 50px -15px #afb7c1;
    }

    #album-art:before {
        content: "";
        position: absolute;
        top: 50%;
        right: 0;
        left: 0;
        width: 20px;
        height: 20px;
        margin: -10px auto 0 auto;
        background-color: #d6dee7;
        border-radius: 50%;
        box-shadow: inset 0 0 0 2px #fff;
        z-index: 2;
    }

    #album-art img {
        display: block;
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        opacity: 0;
        z-index: -1;
    }

    #album-art img.active {
        opacity: 1;
        z-index: 1;
    }

    #album-art.active img.active {
        z-index: 1;
        animation: rotateAlbumArt 3s linear 0s infinite forwards;
    }

    @keyframes rotateAlbumArt {
        0% {
            transform: rotateZ(0);
        }
        100% {
            transform: rotateZ(360deg);
        }
    }

    #buffer-box {
        position: absolute;
        top: 50%;
        right: 0;
        left: 0;
        height: 13px;
        color: #1f1f1f;
        font-size: 13px;
        font-family: Helvetica;
        text-align: center;
        font-weight: bold;
        line-height: 1;
        padding: 6px;
        margin: -12px auto 0 auto;
        background-color: rgba(255, 255, 255, 0.19);
        opacity: 0;
        z-index: 2;
    }

    #album-art img,
    #buffer-box {
        transition: 0.1s linear all;
    }

    #album-art.buffering img {
        opacity: 0.25;
    }

    #album-art.buffering img.active {
        opacity: 0.8;
        filter: blur(2px);
        -webkit-filter: blur(2px);
    }

    #album-art.buffering #buffer-box {
        opacity: 1;
    }

    #player-controls {
        width: 250px;
        height: 100%;
        margin: 0 5px 0 141px;
        float: right;
        overflow: hidden;
    }

    .control {
        width: 33.333%;
        float: left;
        padding: 12px 0;
    }

    .button-player {
        width: 26px;
        height: 26px;
        padding: 25px;
        background-color: #fff;
        border-radius: 6px;
        cursor: pointer;
    }

    .button-player i {
        display: block;
        color: purple;
        font-size: 26px;
        text-align: center;
        line-height: 1;
    }

    .button-player,
    .button-player i {
        transition: 0.2s ease all;
    }

    .button-player:hover {
        background-color: #d6d6de;
    }

    .button-player:hover i {
        color: #fff;
    }

</style>
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
                <img src="images/logo-ilivemusic.png" class="active" id="ilivemusic-logo">
                <!-- <img src="https://raw.githubusercontent.com/himalayasingh/music-player-1/master/img/_2.jpg" id="_2"> -->
                <div id="buffer-box">Buffering ...</div>
            </div>
            <div id="player-controls">
                <div class="control">
                    <div class="button-player bg-transparent" id="play-previous">
                        <i class="fas fa-backward"></i>
                    </div>
                </div>
                <div class="control">
                    <div class="button-player bg-transparent" id="play-pause-button">
                        <i class="fas fa-play"></i>
                    </div>
                </div>
                <div class="control">
                    <div class="button-player bg-transparent" id="play-next">
                        <i class="fas fa-forward"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
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

        function playPause() {
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
                }
            }, 300);
        }

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

        function selectTrack(flag) {
            if (flag == 0 || flag == 1)
                ++currIndex;
            else
                --currIndex;

            if (currIndex > -1 && currIndex < albumArtworks.length) {
                if (flag == 0)
                    i.attr("class", "fa fa-play");
                else {
                    albumArt.removeClass("buffering");
                    i.attr("class", "fa fa-pause");
                }

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

                if (flag != 0) {
                    audio.play();
                    playerTrack.addClass("active");
                    albumArt.addClass("active");

                    clearInterval(buffInterval);
                    checkBuffering();
                }

                albumName.text(currAlbum);
                trackName.text(currTrackName);
                albumArt.find("img.active").removeClass("active");
                $("#ilivemusic-logo").addClass("active");


                bgArtworkUrl = $("#" + currArtwork).attr("src");

                bgArtwork.css({"background-image": "url(" + bgArtworkUrl + ")"});
            } else {
                if (flag == 0 || flag == 1)
                    --currIndex;
                else
                    ++currIndex;
            }
        }

        function initPlayer() {
            audio = new Audio();

            selectTrack(0);

            audio.loop = false;

            playPauseButton.on("click", playPause);

            sArea.mousemove(function (event) {
                showHover(event);
            });

            sArea.mouseout(hideHover);

            sArea.on("click", playFromClickedPos);

            $(audio).on("timeupdate", updateCurrTime);

            playPreviousTrackButton.on("click", function () {
                selectTrack(-1);
            });
            playNextTrackButton.on("click", function () {
                selectTrack(1);
            });
        }

        initPlayer();
    });

</script>

</body>
</html>
