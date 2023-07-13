<style>
    .profile-picture {
        margin: auto;
        width: 50px;
        height: 50px;
        overflow: hidden;
        border-radius: 50%;
        margin-bottom: 10px;
    }

    .profile-picture img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    #ilivemusic-topo {
        margin-top: 0.6em;
    }

</style>
<div id="main">
    <div class="bg-menu-lateral fixed-top z-5">
        <div class="w3-container">
            <div class=" w-75">
                <!--Ajuste do navbar -->
                <div class=" d-flex mx-auto" style="width: 132%;">
                    <button id="openNav" class=" bg-menu-lateral float-start w3-button  w3-xlarge text-white"
                            onclick="w3_open()">&#9776;
                    </button>
                    <h1 id="ilivemusic-topo" class="text-white fw-bold mx-auto ">&nbsp; ILiveMusic <i
                            class="ocultar-res-baixa bi bi-boombox"></i></h1>
                    <a class=" fw-bold text-decoration-none permissao-premium" id="seja-premium" href="assinatura.jsp">PREMIUM
                        PERMANENTE</a>
                    <a class="btn btn-dark  " href="#" role="button" id="profileDropdown" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        <div class="profile-picture">
                            <% String fotoPerfil = (String) session.getAttribute("foto_perfil"); %>
                            <% if (fotoPerfil != null && !fotoPerfil.isEmpty()) {%>
                            <img src="<%= fotoPerfil%>" alt="Foto de Perfil" id="preview-image">
                            <% } else { %>
                            <img src="images/logo-ilivemusic.png" alt="Imagem Alternativa" id="preview-image">
                            <% }%>
                        </div>
                        <div class="text-white"><i class="bi bi-arrow-down-short"></i></div>
                    </a>
                    <ul class=" p-3 dropdown-menu bg-secondary" aria-labelledby="profileDropdown">
                        <li>
                            <div class="d-flex align-items-center">
                                <div class="profile-picture">
                                    <% if (fotoPerfil != null && !fotoPerfil.isEmpty()) {%>
                                    <img src="<%= fotoPerfil%>" alt="Foto de Perfil" id="preview-image">
                                    <% } else { %>
                                    <img src="images/logo-ilivemusic.png" alt="Imagem Alternativa" id="preview-image">
                                    <% }%>
                                </div>
                                <span class="text-dark fw-bold  mx-2 fs-4 text-center">Meu Perfil</span>
                            </div>
                        </li>
                        <li>
                            <a class="dropdown-item text-warning text-center fs-8 fw-bold" href="painel_adm.jsp">Painel
                                ADM</a>
                            <!--<a class="dropdown-item text-warning text-center fs-8 fw-bold" href="drag/index.html">drag</a>-->
                            <!--<a class="dropdown-item permissao-premium text-center fs-8 fw-bold" href="painel_premium.jsp">Painel Premium</a>-->
                            <a class="dropdown-item text-dark text-center fs-8 fw-bold"
                               href="usrv?acao=editar2&id=${usuario.idUsuario}">Editar Perfil</a>
                            <a class="dropdown-item text-dark text-center fs-8 fw-bold" href="psrv?acao=listarPlaylistsUsu&id=${usuario.idUsuario}">Minhas Playlists</a>

                            <form action="login" method="post" class="d-flex">
                                <button type="submit" value="logout" name="acao"
                                        class="dropdown-item text-dark text-center fs-8 fw-bold">Sair
                                </button>
                            </form>
                            <div class="marquee">
                                <span class="text-white fw-bold">Bem Vindo: ${usuario.nome}</span>
                            </div>
                            <div class="text-dark fw-bold  mx-2 text-center" style="font-size: 80%">Usuario: <a
                                    class="permissao-adm text-warning text-decoration-none">*ADM*</a></div>
                        </li>
                    </ul>

                    <form action="login" method="post" class="d-flex">
                        <button type="submit" value="logout" name="acao" id="btn-sair" class="btn px-3"><i
                                class=" text-white  bi bi-box-arrow-right fs-1"></i></button>
                    </form>
                </div>
            </div>
        </div>
    </div>