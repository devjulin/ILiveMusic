<%-- 
    Document   : listar_pagamentos
    Created on : 03/05/2023, 14:06:47
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

    .card:hover {
        transform: scale(1.1);
        cursor: pointer;
    }

    .bg-menu-lateral {
        background-color: #7C00FF;
    }

    <jsp:include page = "includes/permissoes_css.jsp" />

    .card {
        border: none;
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), 0 5px 15px rgba(0, 0, 0, 0.1);
        background-color: #fff;
        padding: 1rem;
        max-width: 500px;
        text-align: center;
    }

    .card-header {
        background-color: #f8f9fa;
        padding: 1rem;
        border-radius: 10px 10px 0 0;
    }

    .card-title {
        margin-bottom: 0;
        font-weight: bold;
        color: #333;
    }

    .card-body {
        padding: 1rem;
    }

    .card-text {
        margin-bottom: 0.5rem;
        color: #555;
    }

    <jsp:include page = "includes/permissoes_css.jsp" />
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
        de Assinaturas <i class="bi bi-person-badge"></i></h1>
    <h4 class="fw-bold text-white text-center">Pesquisar Assinatura pelo nome do usuario</h4>
    <input type="text" id="searchInput" class=" text-center form-control input-modificado fw-bold mt-4"
           placeholder="Pesquisar pelo nome do usuario"></div>
<div class="card-container" style="margin-top: 15em;">
    <c:forEach items="${assinatura}" var="ass">
        <div class="card mb-5 mx-auto">
            <div class="card-header">
                <h4 class="card-title fw-bold">HASH:<span class="fw-bold text-primary"> ${ass.codigo_hash_pgto}</span>
                </h4>
            </div>
            <div class="card-body fw-bold">
                <h5 class="card-text">ID Assinatura:<span class="fw-bold text-primary "> ${ass.id_assinatura}</span>
                </h5>
                <h5 class="card-text">Nome Usuario:<span
                        class="fw-bold text-primary card-text-nome"> ${ass.nome_usuario}</span></h5>
                <h5 class="card-text">ID Usuario:<span
                        class="fw-bold text-primary card-text-id"> ${ass.usuario_id}</span></h5>
                <p class="card-text">Status Pagamento:
                    <span class="fw-bold ${ass.status_assinatura ? 'text-success' : 'text-danger'}">
                            ${ass.status_assinatura ? 'Ativo' : 'Expirada'}
                    </span>
                </p>
                <p class="card-text fw-bold">Inicio da Assinatura: <span
                        class="text-primary fw-bold"> ${ass.data_inicio}</span></p>
                <p class="card-text fw-bold">Termino da Assinatura: <span
                        class="text-primary fw-bold"> ${ass.data_termino}</span></p>
            </div>
            <a href="asrv?acao=excluir&id=${ass.id_assinatura}" class="btn btn-outline-danger"
               onclick="return confirm('Tem certeza que deseja excluir esta assinatura?')">Excluir</a>
        </div>
    </c:forEach>
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
<!--JS da barra de Pesquisa a partir do inicio -->
<script>
    const searchInput = document.getElementById('searchInput');
    const cards = document.querySelectorAll('.card');

    searchInput.addEventListener('input', function () {
        const searchTerm = searchInput.value.toLowerCase();

        cards.forEach(function (card) {
            const nomeUsuario = card.querySelector('.card-text-nome').textContent.toLowerCase();
            const idUsuario = card.querySelector('.card-text-id').textContent.toLowerCase();

            if (nomeUsuario.includes(searchTerm) || idUsuario.includes(searchTerm)) {
                card.style.display = 'block';
            } else {
                card.style.display = 'none';
            }
        });
    });
</script>

</body>
</html>
