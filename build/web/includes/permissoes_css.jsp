.permissao-premium {
display: inline-block;
font-size: px;
animation: corPulsando 2s infinite, moveRight 4s infinite linear;
}

@keyframes corPulsando {
0% { color: yellow; }
50% { color: magenta; }
100% { color: yellow; }
}

.permissao-adm {
font-size: 24px;
position: relative;
display: inline-block;
color: gold;
animation: brilho 2s linear infinite;
}

@keyframes brilho {
0% {
opacity: 0;
text-shadow: none;
}
50% {
opacity: 1;
text-shadow: 0 0 5px gold, 0 0 20px gold, 0 0 30px gold, 0 0 40px gold, 0 0 50px gold, 0 0 60px gold, 0 0 70px gold;
}
100% {
opacity: 0;
text-shadow: none;
}
}
.permissao-banido {
font-size: 24px;
position: relative;
display: inline-block;
color: red;
text-decoration: line-through;
animation: blink 1s linear infinite;
}

@keyframes blink {
0% {
opacity: 1;
}
50% {
opacity: 0.8;
}
100% {
opacity: 1;
}
}