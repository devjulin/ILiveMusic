<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <!-- APlayer CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aplayer/1.10.1/APlayer.min.css"/>

    <title>Online music streaming website using html,css And javascript</title>
    <style>
        body {
            background-color: #f7f7f7;
            font-family: Open sans;
        }

        img {
            width: 100%;
            min-height: 250px;
        }

        .main {
            padding: 40px 0;
        }

        .col-md-3 {
            margin-bottom: 40px;
        }

        .album-poster {
            position: relative;
            display: block;
            border-radius: 7px;
            overflow: hidden;
            box-shadow: 0 15px 35px #3d2173a1;
            transition: all ease 0.4s;
        }

        .album-poster:hover {
            box-shadow: none;
            transform: scale(0.98) translateY(5px);
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
            background-color: #fff;
            transition: all ease 0.5s;
        }

        #aplayer.showPlayer {
            bottom: 0;
        }


        /*MUSIC PLAYER CUSTOMIZING STYLE*/
        span {
            color: #000 !important;
            font-size: 16px;
        }

        .aplayer .aplayer-info .aplayer-controller .aplayer-bar-wrap .aplayer-bar .aplayer-loaded {
            background: #e0e0e0;
            height: 4px;
        }

        .aplayer .aplayer-info .aplayer-controller .aplayer-bar-wrap .aplayer-bar .aplayer-played {
            height: 4px;
            background-color: #2196F3 !important;
        }

        .aplayer .aplayer-info .aplayer-controller .aplayer-bar-wrap .aplayer-bar .aplayer-played .aplayer-thumb {
            background-color: #2196F3 !important;
        }

        .aplayer .aplayer-icon {
            width: 20px;
            height: 20px;
        }

        .aplayer .aplayer-info .aplayer-controller .aplayer-time .aplayer-icon path {
            fill: #000;
        }

        .aplayer .aplayer-info .aplayer-music {
            margin-bottom: 5px;
        }


    </style>
</head>
<body>

<div id="aplayer"></div>
<!-- Jquery Link -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<!-- Bootstrap Link -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!-- APlayer Jquery link -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/aplayer/1.10.1/APlayer.min.js"></script>
<script>


    // NOW I CLICK album-poster TO GET CURRENT SONG ID
    $(".album-poster").on('click', function (e) {
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
                name: 'Invisible Beauty',
                artist: 'Artist Name',
                url: 'source/invisible_beauty.mp3',
                cover: 'https://images.pexels.com/photos/1699161/pexels-photo-1699161.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
            },
            {
                name: 'Just Stay', // SONG NAME
                artist: 'Artist Name', //ARTIST NAME
                url: 'source/just_stay.mp3', // PATH NAME AND SONG URL
                cover: 'https://images.pexels.com/photos/838702/pexels-photo-838702.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500' // COVER IMAGE
            },
            {
                name: 'Liquid Time',
                artist: 'Artist Name',
                url: 'source/liquid_time.mp3',
                cover: 'https://images.pexels.com/photos/838696/pexels-photo-838696.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
            },
            {
                name: 'Silky Smooth',
                artist: 'Artist Name',
                url: 'source/silky_smooth.mp3',
                cover: 'https://images.pexels.com/photos/1370545/pexels-photo-1370545.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
            },
        ]
    });

</script>
<script>
    window.addEventListener('beforeunload', function () {
        localStorage.setItem('currentSongPosition', audio.currentTime);
    });

</script>
<script>
    window.addEventListener('load', function () {
        var currentSongPosition = localStorage.getItem('currentSongPosition');
        if (currentSongPosition) {
            audio.currentTime = currentSongPosition;
            audio.play();
        }
    });

</script>
<script>
    // A fun��o a seguir armazena o estado atual do player no localStorage
    function storeCurrentTrack(trackName) {
        localStorage.setItem('currentTrack', trackName);
    }

    // A fun��o a seguir recupera o estado atual do player do localStorage
    function getCurrentTrack() {
        return localStorage.getItem('currentTrack');
    }

    // Inicialize a m�sica atual a partir do localStorage (se houver)
    let currentTrack = getCurrentTrack();

    // Se a m�sica atual foi armazenada no localStorage, configure o player com a m�sica atual
    if (currentTrack) {
        audio.src = currentTrack;
    }

    // Adicione um ouvinte de evento para atualizar o localStorage sempre que houver uma mudan�a no player
    audio.addEventListener('play', function () {
        storeCurrentTrack(audio.src);
    });

</script>

</body>
</html>