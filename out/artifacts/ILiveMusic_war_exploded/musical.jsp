<%-- 
    Document   : teste
    Created on : 31/05/2023, 02:53:14
    Author     : julio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <jsp:include page="includes/bootstrap_5_Lib.jsp"/>
    <jsp:include page="includes/w3.css_Lib.jsp"/>
    <!-- APlayer CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aplayer/1.10.1/APlayer.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <!-- Swiper -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aplayer/1.10.1/APlayer.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/aplayer/1.10.1/APlayer.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
</head>
<style>
    body {
        background-color: #131312;
        width: 103%;
        margin-left: -2%;

    }

    .linha-superior {
        background: linear-gradient(to top, #262626, #696969);
        width: 100%;
        height: 250px;
    }

    .fixo {
        width: 102%;
    }

    iframe {
        width: 100%;
        height: 100%;
        position: absolute;
        border: none;
        overflow: hidden;

    }

    .album img {
        width: 250px;
        height: 250px;
        float: left;
        margin-left: 60px;
        margin-top: 30px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .titulo-playlist {
        font-size: 4em;
        color: white;
        float: start;
        margin-left: 2%;
        float: left;
        position: relative;
        transition: font-size 1s ease, margin 1s ease;

    }

    .tag-playlist {
        font-size: 1.5em;
        color: white;
        margin-bottom: -0.5%;
        margin-top: 2.5%;
        position: relative;
        left: 2%;
        transition: font-size 1s ease, margin 1s ease;
    }

    .reaj_album {
        margin-bottom: 100px;
        transition: font-size 1s ease, margin 1s ease;
    }

    @media (max-width: 1500px) {
        .titulo-playlist {
            font-size: 3em;
            color: white;
            left: 1%;
            right: 1%;
            transition: font-size 1s ease, margin 1s ease;

        }

        .tag-playlist {
            transition: font-size 1s ease, margin 1s ease;
            font-size: 1em;
            color: white;
            margin-bottom: -1.5%;
            margin-top: 5%;
            position: relative;
            left: 3%;
            right: 0;
        }
    }

    @media (max-width: 828px) {
        .titulo-playlist {
            display: none;
            transition: font-size 1s ease, margin 1s ease;

        }

        .tag-playlist {
            display: none;
            transition: font-size 1s ease, margin 1s ease;
        }

        .play-button2 {
            display: none;
        }

        .album img {
            width: 300px;
            height: 300px;
            margin-left: 70%;
            margin-top: 30px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: font-size 1s ease, margin 1s ease;
        }

        .reaj_album {
            margin-bottom: 170px;
            transition: font-size 1s ease, margin 1s ease;
        }
    }

    @media (max-width: 550px) {
        .titulo-playlist {
            display: none;
            transition: font-size 1s ease, margin 1s ease;

        }

        .tag-playlist {
            display: none;
            transition: font-size 1s ease, margin 1s ease;
        }

        .album img {
            width: 300px;
            height: 300px;
            margin-left: 30%;
            margin-top: 30px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: font-size 1s ease, margin 1s ease;
        }

        .reaj_album {
            margin-bottom: 170px;
            transition: font-size 1s ease, margin 1s ease;
        }

        #carrossel img {
            height: 300px;
        }
    }

    /*default is hide music player*/
    #aplayer {
        position: fixed;
        bottom: -100%;
        left: 0;
        width: 100%;
        margin: 0;
        box-shadow: 0 -2px 2px white;
        background-color: #1C1C1C;
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

    .table {
        width: 100%;
    }

    .table thead th {
        position: sticky;
        top: 0;
        z-index: 1;
        background-color: #343a40;
    }

    .table tbody tr:nth-child(even) {
        background-color: #212529;
    }

    .table tbody tr {
        height: 100px;
    }

    .table tbody tr:hover {
        background-color: #495057;
    }

    .table tbody td {
        vertical-align: middle;
    }

    .table td:first-child {
        position: relative;
    }

    .table td:first-child::before {
        content: "";
        position: absolute;
        top: 50%;
        left: -20px;
        transform: translateY(-50%);
        width: 16px;
        height: 16px;
        background-color: #fff;
        border-radius: 50%;
        opacity: 0;
        transition: opacity 0.3s ease;
    }

    .table td:first-child:hover::before {
        opacity: 1;
    }

    .table td:first-child::before {
        background-image: url("botao-play.png");
        background-size: cover;
    }

    .play-button {
        display: inline-block;
        width: 2em;
        height: 2em;
        background-color: #333;
        border-radius: 50%;
        text-align: center;
        line-height: 2em;
        cursor: pointer;
        transition: background-color 1s ease-in-out;
        transition: color 1s ease;
        font-size: 2em;
        margin-right: 5%;
        color: white;
        transition: background-color 1s ease-in, width 1s ease-in-out;
    }


    .play-button:hover {
        transition: background-color 1s ease-in, width 1s ease-in-out;
        display: inline-block;
        background-color: purple;
        color: purple;
        transition: background-color 1s ease-in-out;
        transition: color 1s ease-out;
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

    .play-button2 {
        position: relative;
        width: 80px;
        height: 80px;
        left: 28em;
        margin-top: -2em;
        border-radius: 50%;
        background-color: purple;
        border: none;
        cursor: pointer;
        overflow: hidden;
        transition: background-color 0.3s;
    }

    .play-button2:hover {
        background-color: black;
    }

    .triangle {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 0;
        height: 0;
        border-top: 20px solid transparent;
        border-bottom: 20px solid transparent;
        border-left: 35px solid white;
        transition: border-radius 0.3s;
    }

    .play-button2:hover .triangle {
        border-radius: 50%;
    }

    .tabela {
        background-color: #212529;
        color: white;
        border-collapse: collapse;
    }

    .tabela th,
    .tabela td {
        border: 1px solid transparent;
    }

    .tabela th {
        background-color: purple !important;
        border: 1px solid transparent;
    }

    .pointer {
        cursor: pointer;
    }

    .sair {
        font-size: 3em;
        margin-left: 5%;
        color: white;
        font-weight: bold;
    }

    .sair:hover {
        font-weight: bold;
        font-size: 3em;
        color: purple;
    }

    /*NOVO PLAYER*/
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


    #album-art img,
    #album-art.buffering img {
        opacity: 0.25;
    }

    #album-art.buffering img.active {
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
<body>
<div class="container-fluid">
    <div class="row fixo reaj_album">
        <div class="linha-superior">
            <div class="col-5">
                <a href="index.jsp"<i class="bi bi-box-arrow-up-left sair"></i></a>
                <div class="album">
                    <img src="images/artistas/playlists/ncs/ncs.jpg" alt="NCS Music">
                </div>
            </div>
            <div class="col-8 w-100">
                <h5 class="tag-playlist">Playlist</h5>
                <h2 class=" titulo-playlist fw-bold">NCS Albuns & Musicas</h2>
            </div>
        </div>
        <button class="play-button2 album" data-switch="0">
            <span class="triangle"></span>
        </button>
    </div>
</div>
<div class="container-fluid inferior mt-5">
    <div class="row">
        <table class="table tabela">
            <thead>
            <tr class="text-center">
                <th>Título</th>
                <th>Álbum</th>
                <th>Adicionado em</th>
                <th>Duração</th>
            </tr>
            </thead>
            <tbody class="text-center " id="music-list">
            <tr class="album pointer" data-switch="0">
                <td data-label="Título">
                    <span class="play-button album" data-switch="0">&#9658;</span>
                    Nome da Música 1
                </td>
                <td>Álbum 1</td>
                <td>30/05/2023</td>
                <td>03:30</td>
            </tr>
            <tr class="album pointer" data-switch="1">
                <td data-label="Título">
                    <span class="play-button album" data-switch="1">&#9658;</span>
                    Nome da Música 2
                </td>
                <td>Álbum 2</td>
                <td>30/05/2023</td>
                <td>04:15</td>
            </tr>
            <tr class="album pointer" data-switch="2">
                <td data-label="Título">
                    <span class="play-button album" data-switch="2">&#9658;</span>
                    Nome da Música 3
                </td>
                <td>Álbum 3</td>
                <td>30/05/2023</td>
                <td>02:45</td>
            </tr>
            <tr class="album pointer" data-switch="3">
                <td data-label="Título" data-switch="3">
                    <span class="play-button album" data-switch="3">&#9658;</span>
                    Nome da Música 4
                </td>
                <td>Álbum 4</td>
                <td>30/05/2023</td>
                <td>03:55</td>
            </tr>
            <tr class="album pointer" data-switch="4">
                <td data-label="Título">
                    <span class="play-button album" data-switch="4">&#9658;</span>
                    Nome da Música 5
                </td>
                <td>Álbum 5</td>
                <td>30/05/2023</td>
                <td>03:20</td>
            </tr>
            <tr class="album pointer" data-switch="5">
                <td data-label="Título" data-switch="5">
                    <span class="play-button album" data-switch="5">&#9658;</span>
                    Nome da Música 6
                </td>
                <td>Álbum 6</td>
                <td>30/05/2023</td>
                <td>04:10</td>
            </tr>
            <tr class="album pointer" data-switch="6">
                <td data-label="Título">
                    <span class="play-button album" data-switch="6">&#9658;</span>
                    Nome da Música 7
                </td>
                <td>Álbum 7</td>
                <td>30/05/2023</td>
                <td>03:45</td>
            </tr>
            <tr class="album pointer" data-switch="7">
                <td data-label="Título">
                    <span class="play-button album" data-switch="7">&#9658;</span>
                    Nome da Música 8
                </td>
                <td>Álbum 8</td>
                <td>30/05/2023</td>
                <td>04:30</td>
            </tr>

            <tr class="album pointer" data-switch="8">
                <td data-label="Título">
                    <span class="play-button album" data-switch="8">&#9658;</span>
                    Nome da Música 1
                </td>
                <td>Álbum 1</td>
                <td>30/05/2023</td>
                <td>03:30</td>
            </tr>
            <tr class="album pointer" data-switch="9">
                <td data-label="Título">
                    <span class="play-button album" data-switch="9">&#9658;</span>
                    Nome da Música 2
                </td>
                <td>Álbum 2</td>
                <td>30/05/2023</td>
                <td>04:15</td>
            </tr>
            <tr class="album pointer" data-switch="10">
                <td data-label="Título">
                    <span class="play-button album" data-switch="10">&#9658;</span>
                    Nome da Música 3
                </td>
                <td>Álbum 3</td>
                <td>30/05/2023</td>
                <td>02:45</td>
            </tr>
            <tr class="album pointer" data-switch="0">
                <td data-label="Título">
                    <span class="play-button album" data-switch="0">&#9658;</span>
                    Nome da Música 1
                </td>
                <td>Álbum 1</td>
                <td>30/05/2023</td>
                <td>03:30</td>
            </tr>
            <tr class="album pointer" data-switch="1">
                <td data-label="Título">
                    <span class="play-button album" data-switch="1">&#9658;</span>
                    Nome da Música 2
                </td>
                <td>Álbum 2</td>
                <td>30/05/2023</td>
                <td>04:15</td>
            </tr>
            <tr class="album pointer" data-switch="2">
                <td data-label="Título">
                    <span class="play-button album" data-switch="2">&#9658;</span>
                    Nome da Música 3
                </td>
                <td>Álbum 3</td>
                <td>30/05/2023</td>
                <td>02:45</td>
            </tr>
            <tr class="album pointer" data-switch="3">
                <td data-label="Título" data-switch="3">
                    <span class="play-button album" data-switch="3">&#9658;</span>
                    Nome da Música 4
                </td>
                <td>Álbum 4</td>
                <td>30/05/2023</td>
                <td>03:55</td>
            </tr>
            <tr class="album pointer" data-switch="4">
                <td data-label="Título">
                    <span class="play-button album" data-switch="4">&#9658;</span>
                    Nome da Música 5
                </td>
                <td>Álbum 5</td>
                <td>30/05/2023</td>
                <td>03:20</td>
            </tr>
            <tr class="album pointer" data-switch="5">
                <td data-label="Título" data-switch="5">
                    <span class="play-button album" data-switch="5">&#9658;</span>
                    Nome da Música 6
                </td>
                <td>Álbum 6</td>
                <td>30/05/2023</td>
                <td>04:10</td>
            </tr>
            <tr class="album pointer" data-switch="6">
                <td data-label="Título">
                    <span class="play-button album" data-switch="6">&#9658;</span>
                    Nome da Música 7
                </td>
                <td>Álbum 7</td>
                <td>30/05/2023</td>
                <td>03:45</td>
            </tr>
            <tr class="album pointer" data-switch="7">
                <td data-label="Título">
                    <span class="play-button album" data-switch="7">&#9658;</span>
                    Nome da Música 8
                </td>
                <td>Álbum 8</td>
                <td>30/05/2023</td>
                <td>04:30</td>
            </tr>

            <tr class="album pointer" data-switch="8">
                <td data-label="Título">
                    <span class="play-button album" data-switch="8">&#9658;</span>
                    Nome da Música 1
                </td>
                <td>Álbum 1</td>
                <td>30/05/2023</td>
                <td>03:30</td>
            </tr>
            <tr class="album pointer" data-switch="9">
                <td data-label="Título">
                    <span class="play-button album" data-switch="9">&#9658;</span>
                    Nome da Música 2
                </td>
                <td>Álbum 2</td>
                <td>30/05/2023</td>
                <td>04:15</td>
            </tr>
            <tr class="album pointer" data-switch="10">
                <td data-label="Título">
                    <span class="play-button album" data-switch="10">&#9658;</span>
                    Nome da Música 3
                </td>
                <td>Álbum 3</td>
                <td>30/05/2023</td>
                <td>02:45</td>
            </tr>
            <tr class="album pointer" data-switch="0">
                <td data-label="Título">
                    <span class="play-button album" data-switch="0">&#9658;</span>
                    Nome da Música 1
                </td>
                <td>Álbum 1</td>
                <td>30/05/2023</td>
                <td>03:30</td>
            </tr>
            <tr class="album pointer" data-switch="1">
                <td data-label="Título">
                    <span class="play-button album" data-switch="1">&#9658;</span>
                    Nome da Música 2
                </td>
                <td>Álbum 2</td>
                <td>30/05/2023</td>
                <td>04:15</td>
            </tr>
            <tr class="album pointer" data-switch="2">
                <td data-label="Título">
                    <span class="play-button album" data-switch="2">&#9658;</span>
                    Nome da Música 3
                </td>
                <td>Álbum 3</td>
                <td>30/05/2023</td>
                <td>02:45</td>
            </tr>
            <tr class="album pointer" data-switch="3">
                <td data-label="Título" data-switch="3">
                    <span class="play-button album" data-switch="3">&#9658;</span>
                    Nome da Música 4
                </td>
                <td>Álbum 4</td>
                <td>30/05/2023</td>
                <td>03:55</td>
            </tr>
            <tr class="album pointer" data-switch="4">
                <td data-label="Título">
                    <span class="play-button album" data-switch="4">&#9658;</span>
                    Nome da Música 5
                </td>
                <td>Álbum 5</td>
                <td>30/05/2023</td>
                <td>03:20</td>
            </tr>
            <tr class="album pointer" data-switch="5">
                <td data-label="Título" data-switch="5">
                    <span class="play-button album" data-switch="5">&#9658;</span>
                    Nome da Música 6
                </td>
                <td>Álbum 6</td>
                <td>30/05/2023</td>
                <td>04:10</td>
            </tr>
            <tr class="album pointer" data-switch="6">
                <td data-label="Título">
                    <span class="play-button album" data-switch="6">&#9658;</span>
                    Nome da Música 7
                </td>
                <td>Álbum 7</td>
                <td>30/05/2023</td>
                <td>03:45</td>
            </tr>
            <tr class="album pointer" data-switch="7">
                <td data-label="Título">
                    <span class="play-button album" data-switch="7">&#9658;</span>
                    Nome da Música 8
                </td>
                <td>Álbum 8</td>
                <td>30/05/2023</td>
                <td>04:30</td>
            </tr>

            <tr class="album pointer" data-switch="8">
                <td data-label="Título">
                    <span class="play-button album" data-switch="8">&#9658;</span>
                    Nome da Música 1
                </td>
                <td>Álbum 1</td>
                <td>30/05/2023</td>
                <td>03:30</td>
            </tr>
            <tr class="album pointer" data-switch="9">
                <td data-label="Título">
                    <span class="play-button album" data-switch="9">&#9658;</span>
                    Nome da Música 2
                </td>
                <td>Álbum 2</td>
                <td>30/05/2023</td>
                <td>04:15</td>
            </tr>
            <tr class="album pointer" data-switch="10">
                <td data-label="Título">
                    <span class="play-button album" data-switch="10">&#9658;</span>
                    Nome da Música 3
                </td>
                <td>Álbum 3</td>
                <td>30/05/2023</td>
                <td>02:45</td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="row">
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
                    <a>
                        <img src="images/artistas/playlists/ncs/ncs-bg-footer.jpg" alt="0" class="d-block w-100">
                    </a>
                </div>
                <div class="carousel-item">
                    <a>
                        <img src="images/artistas/playlists/ncs/ncs-bg-footer-2.jpg" alt="1" class="d-block w-100">
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
    <div id="aplayer" class="fixed-bottom"></div>
    <div class="row">
        <div class="col-12">
            <footer class="footer">
                <div class="container">
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
                                <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                                <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="footer-bottom">
                        <p>&copy; 2023 ILiveMusic. Todos os direitos reservados.</p>
                        <ul>
                            <li><a href="#">Termos</a></li>
                            <li><a href="#">Privacidade</a></li>
                            <li><a href="#">Política de Cookies</a></li>
                        </ul>
                    </div>
                </div>
            </footer>
        </div>
    </div>
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
                        <div class="button-player bg-transparent" id="play-pause-btn">
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
                // Adicione a chamada da função selectTrack() aqui para exibir o card ao pausar a música
                selectTrack(currIndex);
            }

            // Adicione um evento de clique ao botão play-pause-btn
            var playPauseButton = $("#play-pause-btn");
            playPauseButton.on("click", function () {
                if (audio.paused) {
                    play();
                } else {
                    pause();
                }
            });

            // Adicione eventos de clique aos botões play-previous e play-next
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
                    selectTrack(currIndex - 1);
                });

                playNextTrackButton.on("click", function () {
                    selectTrack(currIndex + 1);
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
    <script>

    </script>
    <!--
            <script>
                // NOW I CLICK album-poster TO GET CURRENT SONG ID
                $(".album").on('click', function (e) {
                    var dataSwitchId = $(this).attr('data-switch');
                    //console.log(dataSwitchId);

                    // and now i use aplayer switch function see
                    ap.list.switch(dataSwitchId); //this is static id but i use dynamic

                    // aplayer play function
                    // when i click any song to play
                    ap.play();

                    // click to slideUp player see
                    $("#aplayer").addClass('showPlayer');
                });

                const ap = new APlayer({
                    container: document.getElementById('aplayer'),
                    listFolded: true,
                    audio: [
                        {
                            name: 'RADIO GOSPEL',
                            artist: 'Live Hunter',
                            url: 'https://live.hunter.fm/gospel_high',
                            cover: 'images/radio/gospel.jpg'
                        },
                        {
                            name: 'RADIO SERTANEJO', // NOME SOM
                            artist: 'Live hunter', //NOME ARTISTA
                            url: 'https://live.hunter.fm/sertanejo_high', // CAMINHO DA PASTA ONDE ESTA A MUSICA
                            cover: 'images/radio/sertanejo.jpg' // IMAGEM
                        },
                        {
                            name: 'RADIO MODA SERTANEJA',
                            artist: 'Live Hunter',
                            url: 'https://live.hunter.fm/modasertaneja_high',
                            cover: 'images/radio/modas.jpg',
                        },
                        {
                            name: 'RADIO HITS-BRASIL',
                            artist: 'Live hunter',
                            url: 'https://live.hunter.fm/hitsbrasil_high',
                            cover: 'images/radio/hitsbrasil.jpg',
                        },
                        {
                            name: 'RADIO POP',
                            artist: 'Live hunter',
                            url: 'https://live.hunter.fm/pop_high',
                            cover: 'images/radio/popmusic.jpg',
                        },
                        {
                            name: 'RADIO PAGODE',
                            artist: 'Live hunter',
                            url: 'https://live.hunter.fm/pagode_high',
                            cover: 'images/radio/pagodemusic.jpg',
                        },
                        {
                            name: 'RADIO PISADINHA',
                            artist: 'Live hunter',
                            url: 'https://live.hunter.fm/pisadinha_high',
                            cover: 'images/radio/pisadinhamusic.jpg',
                        },
                        {
                            name: 'RADIO ROCK',
                            artist: 'Live hunter',
                            url: 'https://live.hunter.fm/rock_high',
                            cover: 'images/radio/rockmusic.jpg',
                        },
                        {
                            name: 'RADIO POP-ROCK',
                            artist: 'Live hunter',
                            url: 'https://live.hunter.fm/pop2k_high',
                            cover: 'images/radio/poprockmusic.jpg',
                        },
                        {
                            name: 'RADIO TROPICAL',
                            artist: 'Live hunter',
                            url: 'https://live.hunter.fm/tropical_high',
                            cover: 'images/radio/tropical.jpg',
                        },
                        {
                            name: 'RADIO ANOS 80 RETRO',
                            artist: 'Live hunter',
                            url: 'https://live.hunter.fm/80s_high',
                            cover: 'images/radio/80retro.jpg',
                        },
                        {
                            name: 'RADIO LO-FI',
                            artist: 'Live hunter',
                            url: 'https://live.hunter.fm/lofi_high',
                            cover: 'images/radio/lofi.jpg',
                        }
                    ]
                });
            </script>-->
</body>
</html>
