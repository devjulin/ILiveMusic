<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Embedded Player</title>
    <!-- Inclua as bibliotecas necess�rias (jQuery e APlayer) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aplayer/1.10.1/APlayer.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aplayer/1.10.1/APlayer.min.css"/>
</head>
<body>
<div id="aplayer"></div>

<script>
    // Fun��o para receber o ID da m�sica do pai
    function switchSong(id) {
        ap.list.switch(id);
        ap.play();
    }

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
                name: 'RADIO SERTANEJO',
                artist: 'Live hunter',
                url: 'https://live.hunter.fm/sertanejo_high',
                cover: 'images/radio/sertanejo.jpg'
            },
            // Resto das m�sicas...
        ]
    });

    // Event listener para receber mensagens do pai
    window.addEventListener('message', function (event) {
        var data = event.data;
        if (data.type === 'switchSong') {
            switchSong(data.songId);
        }
    });
</script>
</body>
</html>
