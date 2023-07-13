<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <!-- Inclua as bibliotecas necess�rias (jQuery e APlayer) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aplayer/1.10.1/APlayer.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aplayer/1.10.1/APlayer.min.css"/>
    <style>
        #iframePlayer {
            width: 100%;
            height: 400px;
        }
    </style>
</head>
<body>
<a href="#" class="album" data-switch="0">
    <img src="images/radio/gospel.jpg" alt="">
</a>

<a href="#" class="album" data-switch="1">
    <img src="images/radio/sertanejo.jpg" alt="">
</a>

<!-- Mais �lbuns... -->

<iframe id="iframePlayer" src="testando2.jsp" frameborder="0"></iframe>

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
