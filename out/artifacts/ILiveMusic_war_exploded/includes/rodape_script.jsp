<script>
    window.addEventListener('scroll', function () {
        var rodape = document.querySelector('footer');
        var rodapeAltura = rodape.offsetHeight;
        var rodapePosicao = rodape.offsetTop;
        var alturaJanela = window.innerHeight;
        var posicaoScroll = window.pageYOffset;

        var limiteVisivel = rodapePosicao - alturaJanela + rodapeAltura;

        if (posicaoScroll > limiteVisivel) {
            rodape.classList.add('rodape-visivel');
            rodape.classList.remove('rodape-invisivel');
            rodape.style.opacity = '1';
        } else {
            var percentualVisivel = (posicaoScroll - rodapePosicao) / (limiteVisivel - rodapePosicao);
            rodape.style.opacity = percentualVisivel.toFixed(2);
            rodape.classList.add('rodape-invisivel');
            rodape.classList.remove('rodape-visivel');
        }
    });
</script>