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
        },
    ]
});
