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
        de Solicitações de Pagamento <i class="bi bi-person-badge"></i></h1>
    <h4 class="fw-bold text-white text-center">Pesquisar Pagamentos por HASH</h4>
    <input type="text" id="searchInput" class=" text-center form-control input-modificado fw-bold mt-4"
           placeholder="Pesquisar por codigo HASH"></div>
<div class="card-container" style="margin-top: 15em;">
    <c:forEach items="${pagamento}" var="pgto">
        <div class="card mb-5 mx-auto">
            <div class="card-header">
                <h4 class="card-title fw-bold">HASH:<span class="fw-bold text-primary"> ${pgto.codigo_hash}</span></h4>
            </div>
            <div class="card-body fw-bold">
                <h5 class="card-text">ID:<span class="fw-bold text-primary"> ${pgto.usuario_id}</span></h5>
                <p class="card-text">Status Pagamento:
                    <span class="fw-bold ${pgto.status_pagamento ? 'text-success' : 'text-warning'}">
                            ${pgto.status_pagamento ? 'Ativo' : 'Pendente'}
                    </span>
                </p>
                <p class="card-text fw-bold">Data Expiração Pgto: <span
                        class="text-primary fw-bold"> ${pgto.data_espiracao}</span></p>
                <p class="card-text">Qtd Dias Premium: <span
                        class="text-primary fw-bold"> ${pgto.qtd_dias_premium} Dias</span></p>
            </div>
            <button type="button" class="btn btn-success" data-bs-toggle="modal"
                    data-bs-target="#createModal-${pgto.codigo_hash}">
                Ativar Assinatura
            </button>
        </div>
        <div class="modal fade" id="createModal-${pgto.codigo_hash}" tabindex="-1"
             aria-labelledby="createModalLabel-${pgto.codigo_hash}" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="createModalLabel">Ativar Assinatura <span class="permissao-premium">PREMIUM</span>
                        </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="asrv" method="post">
                            <input type="hidden" name="acao" value="cadastrar_assinatura">
                            <div class="mb-3">
                                <label for="usuarioId" class="form-label">ID do Usuário</label>
                                <input type="text" class="form-control" value="${pgto.usuario_id}" id="usuarioId"
                                       name="usuarioId" required readonly>
                            </div>
                            <div class="mb-3">
                                <label for="cod_hash_pgto" class="form-label">HASH do Pagamento</label>
                                <input type="text" class="form-control" value="${pgto.codigo_hash}" id="cod_hash_pgto"
                                       name="cod_hash_pgto" required readonly>
                            </div>
                            <div class="mb-3">
                                <label for="statusAssinatura" class="form-label">Status da Assinatura</label>
                                <select class="form-select" id="statusAssinatura" name="statusAssinatura" required
                                        readonly>
                                    <option value="true">Ativo</option>
                                    <option value="false">Pendente</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="dataTermino" class="form-label">Qtd dias Premium</label>
                                <input type="text" class="form-control" id="dataTermino"
                                       value="${pgto.qtd_dias_premium}" name="qtdDiasPremium" required>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-success fw-bold w-100">Ativar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
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
<!--Preenche o Data de Inicio com a data atual -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        var today = new Date();
        var dd = String(today.getDate()).padStart(2, '0');
        var mm = String(today.getMonth() + 1).padStart(2, '0'); // Janeiro é 0!
        var yyyy = today.getFullYear();

        var todayFormatted = yyyy + '-' + mm + '-' + dd;
        document.getElementById("dataInicio").value = todayFormatted;
    });
</script>
<!--JS da barra de Pesquisa a partir do inicio -->
<script>
    const searchInput = document.getElementById('searchInput');
    const cards = document.querySelectorAll('.card');

    searchInput.addEventListener('input', function () {
        const searchTerm = searchInput.value.toLowerCase();

        cards.forEach(function (card) {
            const hash = card.querySelector('.card-title').textContent.toLowerCase();

            if (hash.startsWith(searchTerm) || hash.includes(' ' + searchTerm)) {
                card.style.display = 'block';
            } else {
                card.style.display = 'none';
            }
        });
    });
</script>

</body>
</html>
