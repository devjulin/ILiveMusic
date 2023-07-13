footer {
position: fixed;
bottom: 0;
left: 0;
width: 100%;
height: 0;
opacity: 0;
transition: opacity 0.5s ease;
z-index: 999;
}

.rodape-linha {
width: 100%;
height: 1px;
background-color: #090909;
transition: background-color 0.5s ease;
}

.rodape-conteudo {
display: flex;
flex-direction: column;
align-items: center;
justify-content: center;
height: 100px;
background-color: #090909;
color: white;
transition: color 0.5s ease;
opacity: 1;
}

/* Quando o rodap� atingir o fim da p�gina, ele se tornar� vis�vel */
.rodape-visivel {
height: 100px;
opacity: 1;
}

/* Quando o rodap� atingir o fim da p�gina, a barra ficar� preta */
.rodape-visivel .rodape-linha {
background-color: black;
}

/* Quando o rodap� atingir o fim da p�gina, a cor do texto ser� alterada para preto */
.rodape-visivel .rodape-conteudo span {
color: white;
margin-bottom: 5em;
font-weight: bold;
transition: all 1s ease-in-out;
}

/* Quando o rodap� n�o estiver vis�vel, ele ficar� oculto */
.rodape-invisivel {
height: 0;
opacity: 0;
transition: all 1s ease-in-out;
}

/* Quando o rodap� n�o estiver vis�vel, a barra ficar� transparente */
.rodape-invisivel .rodape-linha {
background-color: transparent;
}

/* Quando o rodap� n�o estiver vis�vel, a cor do texto ser� alterada para transparente */
.rodape-invisivel .rodape-conteudo span {
color: transparent;
transition: all 1s ease-in-out;
}


/* Quando o rodap� atingir o fim da p�gina, ele se tornar� vis�vel */
.rodape-visivel {
height: 100px;
opacity: 1;
transition: all 1s ease-in-out;
}

/* Quando o rodap� atingir o fim da p�gina, a barra ficar� roxa */
.rodape-visivel .rodape-linha {
background-color: #090909;
transition: all 1s ease-in-out;
}