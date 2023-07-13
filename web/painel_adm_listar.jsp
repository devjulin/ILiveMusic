<%-- 
    Document   : painel_adm_listar
    Created on : 03/06/2023, 14:06:47
    Author     : julio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>LISTAGEM DE USUARIOS</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/script.js"></script>
</head>
<style>

    * {
        transition: all 0.2s ease-in-out;
    }

    .bg-menu-lateral {
        background-color: #7C00FF;
    }

    <jsp:include page = "includes/permissoes_css.jsp" />
    .card {
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), 0 5px 15px rgba(0, 0, 0, 0.1);
    }

    .card:hover {
        transform: scale(1.1);
        cursor: pointer;
    }

    .profile-picture-perfil {
        margin: auto;
        width: 150px;
        height: 150px;
        overflow: hidden;
        border-radius: 50%;
        margin-bottom: 10px;
    }

    .profile-picture-perfil img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .permissao-premium2 {
        animation: corPulsando 2s infinite, moveRight 4s infinite linear;
    }

    @keyframes corPulsando {
        0% {
            color: yellow;
        }
        50% {
            color: magenta;
        }
        100% {
            color: yellow;
        }
    }

    .corFogo {
        position: relative;
        animation: animacaoTexto 2s infinite;
        background: linear-gradient(45deg, #ff0000, #ff9900);
        background-clip: text;
        -webkit-background-clip: text;
    }

    @keyframes animacaoTexto {
        0% {
            transform: translateX(0px) rotate(0);
            color: white;
        }
        25% {
            transform: translateX(20px) rotate(5deg);
            color: black;
        }
        50% {
            transform: translateX(-20px) rotate(-5deg);
            color: white;
        }
        75% {
            transform: translateX(0px) rotate(0);
            color: white;
        }
    }

    @keyframes pulsate {
        0% {
            opacity: 1;
            transform: scale(1);
        }
        50% {
            opacity: 0.5;
            transform: scale(1.2);
        }
        100% {
            opacity: 1;
            transform: scale(1);
        }
    }

    .pulsating {
        animation: pulsate 1s ease-in-out infinite;
    }


</style>
<body class="modo-claro">
<jsp:include page="includes/modo_noturno.jsp"/>
<%
    HttpSession sessao = request.getSession();
    String permissao = String.valueOf(sessao.getAttribute("permissao"));
    if (!permissao.equals("adm")) {
        response.sendRedirect("index.jsp");
    }%>
<div class="fixed-top bg-secondary">
    <h1 class="text-white bg-menu-lateral p-3 fw-bold d-flex justify-content-center" style="width: 100%">&nbsp; Listagem
        de Usuarios <i class="bi bi-person-badge"></i></h1>
    <h4 class="fw-bold text-white text-center">Pesquisar pelo nome do usuario</h4>
    <input type="text" id="searchInput" class=" text-center form-control input-modificado fw-bold mt-4"
           placeholder="Pesquisar pelo nome do usuario"></div>

<div class="container">
    <div class="row" style="margin-top: 15em;">
        <c:forEach items="${usuarios}" var="usuario">
            <div class="col-md-4 my-3">
                <div class="card mb-3">
                    <div class="card-body fw-bold">
                        <div class="profile-picture-perfil">
                            <img src="${empty usuario.foto_perfil ? 'images/logo-ilivemusic.png' : usuario.foto_perfil}"
                                 alt="Foto de Perfil" id="preview-image">

                        </div>
                        <c:choose>
                            <c:when test="${sessionScope.diasRestantesUsuarios[usuario.idUsuario] != null}">
                                <h5 class="text-center my-4 fw-bold corFogo"><span class="bg-secondary rounded p-2"
                                                                                   style=""> ${usuario.nome}</span></h5>
                            </c:when>
                            <c:otherwise>
                                <h5 class="text-center my-4 fw-bold"><span class="bg-secondary rounded p-2"
                                                                           style="color: white;"> ${usuario.nome}</span>
                                </h5>
                            </c:otherwise>
                        </c:choose>

                        <p class="card-text text-center">ID:<span class="text-primary"> ${usuario.idUsuario}</span></p>
                        <p class="card-text text-center">Login:<span class="text-primary"> ${usuario.usuario}</span></p>
                        <p class="card-text text-center">Email:<span class="text-primary"> ${usuario.email}</span></p>
                        <p class="card-text text-center">
                            Senha:
                            <script>
                                var senha = "${usuario.senha}";
                                var senhaAsteriscos = "*".repeat(senha.length);
                                document.write(senhaAsteriscos);
                            </script>
                        </p>
                        <p class=" card-text text-center permissao-premium2">
                            <c:choose>
                            <c:when test="${usuario.permissao eq 'adm'}">
                            Premium: Permanente
                            </c:when>
                            <c:when test="${sessionScope.diasRestantesUsuarios[usuario.idUsuario] != null}">
                            Premium: ${sessionScope.diasRestantesUsuarios[usuario.idUsuario]} dias restantes
                            </c:when>
                            <c:otherwise>
                            <span class="text-secondary text-center">Premium: Inativo</span>
                            </c:otherwise>
                            </c:choose>

                        <p class="card-text text-center fw-bold">
                            <c:choose>
                                <c:when test="${requestScope.restricoesBanido[usuario.idUsuario] == true}">
                                    <span class="text-danger pulsating">Banido</span>
                                </c:when>

                                <c:when test="${usuario.permissao == 'comum'}">
                                    <span class="permissao-gratuito">${usuario.permissao}</span>
                                </c:when>
                                <c:when test="${usuario.permissao == 'adm'}">
                                    <span class="permissao-adm">${usuario.permissao}</span>
                                </c:when>
                                <c:otherwise>
                                    ${usuario.permissao}
                                </c:otherwise>
                            </c:choose>

                        </p>
                        <div class="text-center">
                            <a href="usrv?acao=editar&id=${usuario.idUsuario}" class="btn btn-outline-dark">Editar</a>
                            <a href="usrv?acao=excluir&id=${usuario.idUsuario}" class="btn btn-outline-danger"
                               onclick="return confirm('Tem certeza que deseja excluir este usuário?')">Excluir</a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<!--Popup-->
<div id="${popupSuperior}" class="popup-superior" style="margin-top: 15%;">
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
<!--JS da barra de Pesquisa -->
<script>
    const searchInput = document.getElementById('searchInput');
    const cards = document.querySelectorAll('.card');

    searchInput.addEventListener('input', function () {
        const searchTerm = searchInput.value.toLowerCase();

        cards.forEach(function (card) {
            const userName = card.querySelector('.card-body h5').textContent.toLowerCase();

            if (userName.includes(searchTerm)) {
                card.style.display = '';
            } else {
                card.style.display = 'none';
            }
        });
    });
</script>

</body>
</html>
