<%-- 
    Document   : Painel ADM
    Created on : 27/04/2023, 16:44:02
    Author     : julio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>ILiveMusic Painel ADM Editar</title>
    <script src="js/script.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


</head>
<style>
    .bg-menu-lateral {
        background-color: #7C00FF;
    }

    .card-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
    }

    .card {
        width: calc(33% - 20px); /* Defina a largura desejada para os cards */
        margin-bottom: 20px;
        padding: 10px;
        background-color: #fff;
        box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
    }

    .card-header {
        margin-bottom: 10px;
    }

    .card-header h5, .card-header h6 {
        margin: 0;
    }

    .card-body p {
        margin: 0;
    }

    .ativo {
        color: green;
    }

    .expirado {
        color: red;
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

    /* Estilos para o modal */
    .modal-overlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5); /* Cor de fundo semi-transparente */
        display: none;
        z-index: 9999;
    }

    .modal-content {
        /* ... */
        display: none;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: #333;
        padding: 20px;
        border-radius: 5px;
        z-index: 10000;
    }

    .checkbox-modificado {
        transform: scale(2); /* Ajuste o valor conforme necessário para aumentar ou diminuir o tamanho */
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
<h1 class="text-white bg-menu-lateral p-3 fw-bold d-flex justify-content-center" style="width: 100%">&nbsp; Editar
    usuario <i class="bi bi-person-badge"></i></h1>
<div class="container w-50">

    <div class="mt-5 px-5">
        <div class="bg-editado">
            <form action="usrv" method="post">
                <h3 class="text-center">DADOS DO USUARIO</h3>
                <div class="profile-picture-perfil">
                    <img src="${empty usuario.foto_perfil ? 'images/logo-ilivemusic.png' : usuario.foto_perfil}"
                         alt="Foto de Perfil" id="preview-image">

                </div>
                <input type="hidden" value="${usuario.idUsuario}" id="idUsuario" name="idUsuario">
                <label for="txtNome">Nome: </label>
                <input value="${usuario.nome}" class="form-control input-modificado" type="text" id="txtNome"
                       name="txtNome" placeholder="Seu nome aqui" required>
                <br>
                <label for="txtUsuario">Login: </label>
                <input value="${usuario.usuario}" class="form-control input-modificado" type="text" id="txtUsuario"
                       name="txtUsuario" placeholder="Seu nome de usuario aqui" required>
                <br>
                <label for="txtEmail">E-mail: </label>
                <input value="${usuario.email}" class="form-control input-modificado" type="email" id="txtEmail"
                       name="txtEmail" placeholder="EX: contato@gmail.com" required>
                <br>
                <label for="txtTel">Senha: </label>
                <input value="${usuario.senha}" class="form-control input-modificado" type="password" id="txtSenha"
                       name="txtSenha" placeholder="********">
                <br>
                <label for="txtIdade">Tipo de Conta:</label>
                <select class="text-dark rounded input-modificado  mb-3" id="cbPermissao" name="cbPermissao" required>
                    <optgroup class="text-dark   p-3" label="Tipo">
                        <option class="text-dark" value="comum" ${usuario.permissao == 'comum' ? 'selected' : ''}>
                            Comum
                        </option>
                        <option class="text-dark" value="adm" ${usuario.permissao == 'adm' ? 'selected' : ''}>
                            Administrador
                        </option>
                    </optgroup>
                </select>
                <br>
                <div class="d-flex justify-content-center align-items-center">
                    <input type="hidden" value="atualizar" id="acao" name="acao">
                    <input class="btn btn-outline-primary w-100 fw-bold" type="submit" value="Atualizar">
                </div>
            </form>
        </div>
        <br>
        <div class="bg-dark rounded w-100 border border-2 border-secondary">
            <h1 class="text-center mx-auto pt-5 text-white">Restrições de Usuário!</h1>
            <div class="d-flex justify-content-center align-items-center">

                <button onclick="abrirModal()" class="btn btn-warning mt-5 w-50 fw-bold">Ver Restrição Ativa</button>

                <div id="modalOverlay" class="modal-overlay" onclick="fecharModal()"></div>
                <div id="modalContent" class="modal-content w-50 rounded bg-dark " style="opacity: 90%;">
                    <form class="d-flex flex-column align-items-center" action="rsrv" method="post">
                        <input type="hidden" value="${restricao.id_restricao}" id="id_restricao" name="id_restricao">
                        <input type="hidden" value="${usuario.idUsuario}" id="usuario_id" name="usuario_id">
                        <label class="fw-bold text-danger elementos-ocultos fw-bold">Restringir Usuario?</label>
                        <br>
                        <input type="checkbox" value="${restricao.restrito}" id="txtRestrito" name="txtRestrito"
                               class="elementos-ocultos checkbox-modificado" onclick="">
                        <br>
                        <label for="dataInicio" class="elementos-ocultos fw-bold">Data de Início:</label>
                        <input type="date" id="dataInicio" value="${restricao.dataInicio}" name="dataInicio"
                               class="elementos-ocultos w-25 form-control input-modificado" readonly>
                        <br>
                        <label for="dataTermino" class="elementos-ocultos fw-bold">Data de Término:</label>
                        <input type="date" id="dataTermino" value="${restricao.dataTermino}" name="dataTermino"
                               class="elementos-ocultos w-25 form-control input-modificado">
                        <br>
                        <label for="motivo" class="elementos-ocultos fw-bold">Motivo:</label>
                        <textarea id="txtMotivo" value="${restricao.motivo}" name="txtMotivo" rows="4"
                                  class="elementos-ocultos w-100 input-modificado fw-bold text-center" maxlength="100"
                                  oninput="contarCaracteres(this)">${restricao.motivo}</textarea>
                        <p id="contadorCaracteres">Caracteres restantes: <span id="contador">100</span></p>
                        <br>
                        <input type="hidden" value="atualizar_restricao" id="acao" name="acao">
                        <button type="submit" class="btn btn-success mt-3 fw-bold">Atualizar</button>
                    </form>
                </div>
                <br>
                <button onclick="abrirModalCreate()" class="btn btn-danger mt-5 w-50 fw-bold">Criar Restrição</button>
            </div>
            <div id="modalOverlayCreate" class="modal-overlay" onclick="fecharModalCreate()"></div>
            <div id="modalContentCreate" class="modal-content w-50 rounded bg-dark " style="opacity: 90%;">
                <form class="d-flex flex-column align-items-center" action="rsrv" method="post">
                    <input type="hidden" value="${usuario.idUsuario}" id="usuario_id" name="usuario_id">
                    <label class="fw-bold text-danger elementos-ocultos fw-bold">Restringir Usuario?</label>
                    <br>
                    <input type="checkbox" id="txtRestrito" name="txtRestrito"
                           class="elementos-ocultos checkbox-modificado" onclick="">
                    <br>
                    <label for="dataInicio" class="elementos-ocultos fw-bold">Data de Início:</label>
                    <input type="date" id="dataInicioCreate" name="dataInicioCreate" id="dataInicioCreate"
                           class="elementos-ocultos w-25 form-control input-modificado" readonly>
                    <br>
                    <label for="dataTermino" class="elementos-ocultos fw-bold">Data de Término:</label>
                    <input type="date" id="dataTermino" name="dataTermino"
                           class="elementos-ocultos w-25 form-control input-modificado">
                    <br>
                    <label for="motivo" class="elementos-ocultos fw-bold">Motivo:</label>
                    <textarea id="txtMotivo" name="txtMotivo" rows="4"
                              class="elementos-ocultos w-100 input-modificado fw-bold text-center" maxlength="100"
                              oninput="contarCaracteresCreate(this)"></textarea>
                    <p id="contadorCaracteres">Caracteres restantes: <span id="contadorCreate">100</span></p>
                    <br>
                    <input type="hidden" value="reg_restricao" id="acao" name="acao">
                    <button type="submit" class="btn btn-danger mt-3 fw-bold">Restringir</button>
                </form>
            </div>
        </div>
        <div class="card-container d-flex justify-content-center mt-4">
            <c:forEach items="${buscarRestricoes}" var="res">
                <div class="card w-75">
                    <div class="card-header text-center">
                        <h5 class="fw-bold">ID-RESTRICAO: <c:out value="${res.id_restricao}"/></h5>
                        <h6 class="fw-bold">ID-USUARIO: <c:out value="${res.usuario_id}"/></h6>
                    </div>
                    <div class="card-body text-center">
                        <p>
                            <strong>RESTRIÇÃO:</strong>
                            <c:choose>
                                <c:when test="${res.restrito}">
                                    <span class="ativo fw-bold">Ativa</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="expirado fw-bold">Expirado</span>
                                </c:otherwise>
                            </c:choose>
                        </p>
                        <p><strong>DATA-INICIO:</strong> <c:out value="${res.dataInicio}"/></p>
                        <p><strong>DATA-TERMINO:</strong> <c:out value="${res.dataTermino}"/></p>
                        <p><strong>MOTIVO:</strong> <c:out value="${res.motivo}"/></p>
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
    </div>
</div>
<script>
    $(document).ready(function () {
        $('#txtRestrito').change(function () {
            if ($(this).is(':checked')) {
                $('label[for="restricao"]').removeClass('text-success').addClass('text-danger');
            } else {
                $('label[for="restricao"]').removeClass('text-danger').addClass('text-success');
            }
        });
    });

</script>
<script>
    function abrirModal() {
        var modalOverlay = document.getElementById("modalOverlay");
        var modalContent = document.getElementById("modalContent");

        modalOverlay.style.display = "block";
        modalContent.style.display = "block";
    }


    function fecharModal() {
        var modalOverlay = document.getElementById("modalOverlay");
        var modalContent = document.getElementById("modalContent");

        modalOverlay.style.display = "none";
        modalContent.style.display = "none";
    }


</script>
<script>
    function abrirModalCreate() {
        var modalOverlay = document.getElementById("modalOverlayCreate");
        var modalContent = document.getElementById("modalContentCreate");

        modalOverlay.style.display = "block";
        modalContent.style.display = "block";
    }


    function fecharModalCreate() {
        var modalOverlay = document.getElementById("modalOverlayCreate");
        var modalContent = document.getElementById("modalContentCreate");

        modalOverlay.style.display = "none";
        modalContent.style.display = "none";


    }
    ;

</script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        var today = new Date();
        var dd = String(today.getDate()).padStart(2, '0');
        var mm = String(today.getMonth() + 1).padStart(2, '0'); // Janeiro é 0!
        var yyyy = today.getFullYear();

        var todayFormatted = yyyy + '-' + mm + '-' + dd;
        document.getElementById("dataInicioCreate").value = todayFormatted;
    });
</script>

<script>
    function contarCaracteres(textarea) {
        const contador = document.getElementById("contador");
        const caracteresRestantes = 100 - textarea.value.length;
        contador.textContent = caracteresRestantes >= 0 ? caracteresRestantes : 0;
    }

    // Chama a função contarCaracteres ao carregar a página
    window.addEventListener("load", function () {
        const textarea = document.getElementById("motivo");
        contarCaracteres(textarea);
    });
</script>
<script>
    function contarCaracteresCreate(textarea) {
        const contador = document.getElementById("contadorCreate");
        const caracteresRestantes = 100 - textarea.value.length;
        contador.textContent = caracteresRestantes >= 0 ? caracteresRestantes : 0;
    }

    // Chama a função contarCaracteres ao carregar a página
    window.addEventListener("load", function () {
        const textarea = document.getElementById("motivo");
        contarCaracteres(textarea);
    });
</script>
<script>
    // Obtém a referência para o elemento checkbox
    var checkbox = document.getElementById("txtRestrito");

    // Função para marcar ou desmarcar o checkbox com base no valor passado
    function marcarCheckbox(restrito) {
        if (restrito) {
            checkbox.checked = true; // Marcar o checkbox
            $('label[for="restricao"]').removeClass('text-success').addClass('text-danger');
        } else {
            checkbox.checked = false; // Desmarcar o checkbox
            $('label[for="restricao"]').removeClass('text-danger').addClass('text-success');
        }
    }

    // Chama a função marcarCheckbox() ao carregar a página para definir o estado inicial do checkbox
    marcarCheckbox(${restricao.restrito});
</script>


</body>
</html>
