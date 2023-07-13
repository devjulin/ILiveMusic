<%-- 
    Document   : cadastro_usuario
    Created on : 11 de mai. de 2023, 21:50:09
    Author     : julio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cadastro de Usuario</title>
    <!-- Jquery Link -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    <link rel="stylesheet" href="css/style.css">
    <script src="js/script.js"></script>
    <jsp:include page="includes/bootstrap_5_Lib.jsp"/>
    <jsp:include page="includes/w3.css_Lib.jsp"/>


</head>
<body class="modo-claro">
<%
    HttpSession sessao = request.getSession();
    String permissao = String.valueOf(sessao.getAttribute("permissao"));
    if (!permissao.equals("adm")) {
        response.sendRedirect("index.jsp");
    }%>
<!--Menu Lateral Esquerdo -->
<jsp:include page="includes/modo_noturno.jsp"/>
<div class="bg-menu-lateral d-flex justify-content-center fixed-top">
    <div class="w3-container">

        <h1 class="text-white fw-bold d-flex " style="width: 100%">&nbsp; Cadastro de Conta <i
                class="bi bi-person-badge"></i></h1>
    </div>
</div>
<div class="d-flex justify-content-center align-items-center vh-100" style="margin-top: 15%;">
    <div class="container row w-100 w-md-50 h-100">
        <div class="mt-5 px-5">
            <form action="usrv" method="POST" class="form p-5 rounded">
                <h2 class="fw-bold text-center">DADOS DO USUARIO</h2>
                <label for="txtNome" class="fw-bold">Digite o Nome do Usuario:</label>
                <input class="form-control input-modificado" type="text" id="txtNome" name="txtNome"
                       placeholder="Digite seu Nome..." required>
                <br>
                <label for="txtUsuario" class="fw-bold">Digite o Login do Usuario:</label>
                <input class="form-control input-modificado" type="text" id="txtUsuario" name="txtUsuario"
                       placeholder="Nome de usuario / Login..." required>
                <br>
                <label for="txtEmail" class="fw-bold">Digite o endereço de email:</label>
                <input class="form-control input-modificado" type="mail" id="txtEmail" name="txtEmail"
                       placeholder="Digite seu email aqui..." required>
                <br>
                <label for="txtTel" class="fw-bold">Digite a senha do usuario:</label>
                <input class="form-control input-modificado mb-3" type="password" id="txtSenha" name="txtSenha"
                       placeholder="Digite sua senha..." required>
                <label class="texto-modos fw-bold mb-2 fs-7" for="job">Tipo de Usuario: Ex: ADM / COMUM </label>
                <select class="text-dark rounded fw-bold fs-5 mb-3" id="cbPermissao" name="cbPermissao">
                    <optgroup class="text-dark fw-bold fs-5 p-3" label="Tipo">
                        <option class="text-dark" value="comum">comum</option>
                        <option class="text-dark" value="adm">Administrador</option>
                    </optgroup>
                </select>
                <br>
                <input type="hidden" value="cad_usuario_painel_adm" id="acao" name="acao">
                <div class="d-flex justify-content-center">
                    <input class="btn btn-secondary texto-branco me-3" type="submit" value="Cadastrar">
                    <input class="btn btn-danger texto-branco" type="reset" value="Limpar">
                </div>
            </form>
        </div>
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
</body>
</html>
