<%-- 
    Document   : index
    Created on : 29 de abr. de 2023, 16:29:14
    Author     : julio

--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>ILiveMusic</title>
        <link rel="stylesheet" href="css/style.css">
        <script src="js/script.js"></script>
        <jsp:include page="includes/bootstrap_5_Lib.jsp"/>
        <jsp:include page="includes/w3.css_Lib.jsp"/>


        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    </head>

    <style>
        <jsp:include page = "includes/permissoes_css.jsp" />
        *{
            transition: all 0.7s ease-in-out;
        }
        body{
            background-color:rgba(0, 0, 0, 0.7);
        }
        .glassmorphism-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
            margin-top: 4em;

        }

        .glassmorphism {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(10px);
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            width: 400px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .add-playlist {
            display: none;
            background-color: rgba(20,20,20,0.3);
            padding: 1%;
            border-radius: 10px;
            margin-top: 20px;
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .modo-escuro .add-playlist {
            background-color: rgba(20,20,20,0.3);
        }
        .modo-claro .add-playlist {
            background-color: rgba(230,230,230,0.8);
        }

        .add-playlist.active {
            display: block;
            opacity: 1;
        }

        .toggle-button {
            width: 40px;
            height: 40px;
            background-color: #fff;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            transition: background-color 0.3s ease;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .toggle-button:hover {
            background-color: #f0f0f0;
        }

        .toggle-button:before {
            content: '+';
            font-size: 24px;
            color: #555;
            transition: transform 1s ease;
        }

        .toggle-button.active:before {
            content: '-';
            transform: rotate(180deg);
        }

        .add-playlist form {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .add-playlist label {
            color: #333;
            font-weight: bold;
        }

        .add-playlist input[type="text"],
        .add-playlist input[type="file"],
        .add-playlist input[type="submit"] {
            border: none;
            background: rgba(255, 255, 255, 0.1);
            padding: 10px;
            color: #333;
            border-radius: 5px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .add-playlist input[type="submit"] {
            background: linear-gradient(to right, purple 0%, #2F045C 100%);
            font-weight: bold;
            color: white;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .add-playlist input[type="submit"]:hover {
            filter: brightness(1.1);
        }
        .swiper-container {
            max-width: 100%; /* Define o tamanho máximo do contêiner */
            overflow: hidden; /* Oculta os slides excedentes */
        }

        .swiper-container {
            position: relative;
        }

        .swiper-button-next,
        .swiper-button-prev {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
        }

        .swiper-button-next {
            right: 10px; /* Ajuste a posição horizontal conforme necessário */
        }

        .swiper-button-prev {
            left: 10px; /* Ajuste a posição horizontal conforme necessário */
        }

        .profile-menu {
            position: relative;
        }

        .profile-menu .dropdown-menu {
            width: 200px;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            background-color: #fff;
        }

        .profile-menu .dropdown-menu img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .marquee {
            width: 100%;
            overflow: hidden;
            white-space: nowrap;
        }

        .marquee span {
            display: inline-block;
            animation: marquee 10s linear infinite;
        }

        @keyframes marquee {
            0% {
                transform: translateX(100%);
            }
            100% {
                transform: translateX(-100%);
            }
        }

        @media (max-width: 970px) {
            .ocultar-res-baixa {
                display: none;
            }
            #btn-sair {
                display: none;
            }

            #seja-premium {
                display: none;
            }
        }
        .playlist_img {
            margin: auto;
            width: 55px;
            max-width: 55px;
            height: 65px;
            overflow: hidden;
            margin-bottom: 10px;
        }
        .playlist_img img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 50%;
        }

        th{
            font-weight: bold;
            font-size: 1.5em;
        }
        tr{
            font-weight: bold;
            font-size: 1.1em;
        }

        .modo-escuro tr{
            color: #fff;
        }
        .modo-claro tr{
            color: #333;   
        }
        .modo-escuro th{
            color: #fff;
        }
        .modo-claro th{
            color: #333;   
        }
        .modo-escuro td{
            color: #fff;
        }
        .modo-claro td{
            color: #333;   
        }


        .modo-claro thead th {
            background-color: rgba(230, 230, 230, 0.5);
            backdrop-filter: blur(10px);
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.3);
        }

        .modo-claro tbody tr {
            background-color: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.3);
        }

        .modo-escuro thead {
            background-color: rgba(20, 20, 20, 0.5);
            backdrop-filter: blur(10px);
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.3);
        }

        .modo-escuro tbody tr {
            background-color: rgba(20, 20, 20, 0.1);
            backdrop-filter: blur(10px);
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.3);
        }   

        #seja-premium {
            margin-right: 5%;
            margin-left: -20%;
            position: relative;
            margin-top: 2.8em;
            transform: scale(1.3);
        }
        tr[data-href]:hover {
            background-color: rgba(220,220,220,0.8); /* Cor de fundo ao passar o mouse */
            cursor: pointer;
            transition: background-color 0.3s ease; /* Duração e tipo de transição */
        }


    </style>
    <body class="modo-claro">
        <% HttpSession sessao = request.getSession();
            String permissao = String.valueOf(sessao.getAttribute("permissao"));
            if (sessao.getAttribute("user") == null) {
                permissao = null;
        %>
        <script>
            window.location.replace("inicial.jsp");
        </script>
        <%} else if (permissao.equals("adm")) {%>
        ${restrito_jsp.restrito}
        ${restrito_jsp.motivo}
        <jsp:include page="includes/menus_sidebar/menu_logado.jsp"/>
        <jsp:include page="includes/menus_navbar/menu_adm.jsp"/>
        <!--PREMIUM -->
        <%} else if (permissao.equals("premium")) {%>
        <jsp:include page="includes/menus_sidebar/menu_logado.jsp"/>
        <jsp:include page="includes/menus_navbar/menu_premium.jsp"/>
        <!--GRATUITO -->
        <%} else if (permissao.equals("gratuito")) {%>
        <script>
            window.location.replace("index.jsp");
        </script>
        <%}%>
        <!--Redirecionamento de pagina para usuario RESTRITO -->
        <c:if test="${restrito_jsp.restrito}">
            <script>
                window.location.replace("inicial.jsp");
            </script>
        </c:if>
        <div class="container-fluid w-75 vh-100 " style="margin-top: 7em;">
            <div class="row glassmorphism w-100 mx-auto">
                <div class="col p-5">
                    <div class="glassmorphism-container my-auto flex-column">
                        <h2>Criar Playlist</h2>
                        <div class="toggle-button" id="toggleButton"></div>
                        <form class="add-playlist" method="post" action="psrv?acao=criarPlaylist" enctype="multipart/form-data">
                            <label for="nomePlaylist">Nome da Playlist:</label>
                            <input type="text" id="nomePlaylist" name="nomePlaylist" required><br>
                            <input type="hidden" id="idUsuario" name="idUsuario" value="${usuario.idUsuario}" readonly><br>
                            <label for="imagem">Imagem de Capa:</label>
                            <input type="file" id="imagem" name="imagem"><br>
                            <input class="w-100 mt-4" type="submit" value="Criar Playlist">
                        </form> 
                    </div>
                </div>
                <div class="col">
                    <div class="row">
                        <div class="glassmorphism w-100">
                            <table class="table tabela ">
                                <thead>
                                    <tr class="text-center">
                                        <th class="text-center texto-modos">Capa</th>
                                        <th class="reaj-res-menor texto-modos">Nome</th>
                                        <th class="reaj-res-menor texto-modos">Data de Criação</th>
                                        <th class="reaj-res-menor texto-modos">Alterar</th>
                                    </tr>
                                </thead>
                                <tbody class="text-center" id="music-list">
                                    <c:forEach var="playlist" items="${playlists}">
                                        <tr data-switch="0" class="playlist-row" data-href="psrv" data-acao="selecionarPlaylist" data-idPlaylist="${playlist.id_playlist}" onclick="enviarForm(this)">
                                    <input type="hidden" name="acao" value="selecionarPlaylist">
                                    <input type="hidden" name="idPlaylist" value="${playlist.id_playlist}">
                                    <td class="playlist_img">
                                        <img class="playlist_img" src="${pageContext.request.contextPath}/${playlist.caminho_imagem}" alt="Img_Playlist">
                                    </td>
                                    <td class="texto-modos">${playlist.nome_playlist}</td>
                                    <td class="texto-modos">${playlist.data_criacao}</td>
                                    <td class="text-modos" style="color: ${playlist.privado ? 'maroon' : 'purple'}">
                                        ${playlist.privado ? 'Privado' : 'Público'}
                                    </td>
                                    <td class="text-center texto-modos">
                                        <a href="psrv?acao=editar&id=${playlist.id_playlist}" class="btn btn-outline-dark bi bi-pencil-square"></a>
                                        <a href="psrv?acao=excluirPlaylist&idPlaylist=${playlist.id_playlist}&id=${usuario.idUsuario}" class="btn btn-outline-danger"
                                           onclick="return confirmDelete(event)">x</a>
                                    </td>
                                    </tr>

                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function enviarForm(element) {
                var href = element.getAttribute("data-href");
                var acao = element.getAttribute("data-acao");
                var idPlaylist = element.getAttribute("data-idPlaylist");

                var form = document.createElement("form");
                form.method = "post";
                form.action = href;

                var inputAcao = document.createElement("input");
                inputAcao.type = "hidden";
                inputAcao.name = "acao";
                inputAcao.value = acao;

                var inputIdPlaylist = document.createElement("input");
                inputIdPlaylist.type = "hidden";
                inputIdPlaylist.name = "idPlaylist";
                inputIdPlaylist.value = idPlaylist;

                form.appendChild(inputAcao);
                form.appendChild(inputIdPlaylist);

                document.body.appendChild(form);
                form.submit();
            }

            function adicionarEventoSubmit(tr) {
                tr.addEventListener("mouseover", function () {
                    this.style.cursor = "pointer";
                    this.addEventListener("click", function () {
                        enviarForm(this);
                    });
                });
            }

            // Obtenha todas as linhas de tabela com a classe "playlist-row"
            var playlistRows = document.getElementsByClassName("playlist-row");

            // Adicione o evento de envio ao passar o mouse sobre cada linha de tabela
            for (var i = 0; i < playlistRows.length; i++) {
                adicionarEventoSubmit(playlistRows[i]);
            }
        </script>


        <div id="aplayer"></div>
        <!--Popup-->
        <div id="${popupSuperior}" class="popup-superior" style="margin-top: 10%;">
            <div id="d-none" class="d-none popup-content ${animacao}"${cor_fundo}>
                <h2 class="text-center fw-bold "${cor_titulo}>${titulo}</h2>
                <p class="text-center text-white fw-bold"${cor_msg}>${msg}</p>
                <div class="progress-container">
                    <div class="progress-bar"></div>
                </div>
                <div class="  d-flex justify-content-center ${anim_popup}">
                    ${anim}
                </div>
            </div>
        </div>
        <jsp:include page="includes/popups/popup_css.jsp"/>
        <jsp:include page="includes/popups/popup_js.jsp"/>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var rows = document.querySelectorAll(".playlist-row");

                rows.forEach(function (row) {
                    row.addEventListener("click", function () {
                        window.location.href = this.dataset.href;
                    });
                });
            });
        </script>

        <script>
            function confirmDelete(event) {
                if (confirm('Tem certeza que deseja excluir esta playlist?')) {
                    return true;
                } else {
                    event.stopPropagation(); // Impede a propagação do evento de clique
                    return false;
                }
            }

            document.addEventListener("DOMContentLoaded", function () {
                var rows = document.querySelectorAll(".playlist-row");

                rows.forEach(function (row) {
                    row.addEventListener("click", function () {
                        var href = this.dataset.href;
                        if (!event.target.classList.contains("btn-outline-danger") && href) {
                            window.location.href = href;
                        }
                    });
                });
            });

            const toggleButton = document.getElementById('toggleButton');
            const addPlaylistForm = document.querySelector('.add-playlist');

            toggleButton.addEventListener('click', () => {
                toggleButton.classList.toggle('active');
                addPlaylistForm.classList.toggle('active');
            });

            window.addEventListener('click', (event) => {
                if (!addPlaylistForm.contains(event.target) && !toggleButton.contains(event.target)) {
                    toggleButton.classList.remove('active');
                    addPlaylistForm.classList.remove('active');
                }
            });
        </script>
        <script>
            /*Abrir menu lateral esquerdo*/
            function w3_open() {
                if (window.innerWidth > 768) {
                    document.getElementById("main").style.marginLeft = "15%";
                    document.getElementById("aplayer").style.marginLeft = "15%";
                    document.getElementById("mySidebar").style.width = "15%";
                    document.getElementById("mySidebar").style.display = "block";
                    document.getElementById("openNav").style.display = 'none';
                    document.getElementById("aplayer").style.maxWidth = "calc(85% - 20px)";
                } else {
                    document.getElementById("main").style.marginLeft = "30%";
                    document.getElementById("aplayer").style.marginLeft = "30%";
                    document.getElementById("mySidebar").style.width = "30%";
                    document.getElementById("mySidebar").style.display = "block";
                    document.getElementById("openNav").style.display = 'none';
                    document.getElementById("aplayer").style.maxWidth = "70%";
                    document.getElementById("aplayer").style.padding = "2%";
                    document.getElementById("aplayer").style.marginBottom = "10px";
                }
            }

            function w3_close() {
                document.getElementById("main").style.marginLeft = "0%";
                document.getElementById("aplayer").style.marginLeft = "0%";
                document.getElementById("mySidebar").style.display = "none";
                document.getElementById("openNav").style.display = "inline-block";
                document.getElementById("aplayer").style.maxWidth = "100%";
            }
            ;
        </script>
    </body>
</html>
