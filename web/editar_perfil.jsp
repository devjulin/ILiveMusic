<%-- 
    Document   : editar_perfil
    Created on : 27/04/2023, 16:44:02
    Author     : julio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Editar Meu Perfil</title>
    <link rel="icon" type="image/png" href="images/logo-ilivemusic.png">
    <script src="js/script.js"></script>
    <jsp:include page="includes/w3.css_Lib.jsp"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">

</head>
<style>
    * {
        transition: all 0.7s ease-in-out;
    }

    body {
        background: linear-gradient(45deg, #e91e63, #9c27b0, #2196f3, #00bcd4);
        background-size: 800% 800%;
        animation: gradient 7s ease infinite;
        height: 100vh;
        font-family: Arial, sans-serif;
    }

    @keyframes gradient {
        0% {
            background-position: 0% 50%;
        }
        50% {
            background-position: 100% 50%;
        }
        100% {
            background-position: 0% 50%;
        }
    }

    .card {
        background-color: rgba(255, 255, 255, 0.15);
        backdrop-filter: blur(10px);
        border-radius: 10px;
        padding: 20px;
        max-width: 400px;
        width: 100%;
        box-sizing: border-box;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        backdrop-filter: blur(10px);
        color: white;
    }

    .form-group {
        margin-bottom: 20px;
    }

    .form-group label {
        display: block;
        margin-bottom: 5px;
    }

    .form-control {
        width: 100%;
        padding: 10px;
        border: none;
        border-radius: 5px;
        background-color: rgba(255, 255, 255, 0.2);
        color: white;
        outline: none;
    }

    .form-control::placeholder {
        color: rgba(255, 255, 255, 0.6);
    }

    .form-control:focus {
        background-color: rgba(255, 255, 255, 0.3);
    }

    .pagina-container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100%;
    }

    .corpo-central {
        max-width: 600px;
        padding: 30px;
        background-color: rgba(255, 255, 255, 0.2);
        backdrop-filter: blur(10px);
        border-radius: 10px;
        box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
    }

    .corpo-central h3 {
        text-align: center;
        color: #ffffff;
    }

    .modo-escuro .corpo-central {
        background-color: #1f2937;
        box-shadow: 0 8px 32px rgba(0, 0, 0, 0.5);
        border: 1px solid rgba(255, 255, 255, 0.1);
    }

    .bg-menu-lateral {
        background-color: #7C00FF;
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


    .btn2 {
        display: inline-block;
        padding: 10px 20px;
        font-size: 16px;
        text-align: center;
        text-decoration: none;
        background-color: #333;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    .btn2:hover {
        background-color: #555;
    }

    #seja-premium {
        margin-right: 5%;
        margin-left: -20%;
        position: relative;
        margin-top: 2.8em;
        transform: scale(1.3);
    }

    #ilivemusic-topo {
        margin-top: 0.6em;
    }

    .input-desativado {
        background-color: rgba(20, 20, 20, 0.1);

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

    @media (max-width: 950px) {
        #seja-premium {
            display: none;

        }

        #btn-sair {
            display: none;
        }
    }

    .custom-file-upload {
        padding: 8px 12px;
        cursor: pointer;
        border: 1px solid #ccc;
        border-radius: 4px;
        background-color: #f2f2f2;
        color: #333;
        transition: background-color 0.3s ease;
    }

    .custom-file-upload:hover {
        background-color: #e0e0e0;
    }

    .profile-picture-perfil {
        position: relative;
    }

    .profile-picture-perfil img {
        width: 150px;
        height: 150px;
        object-fit: cover;
        border-radius: 50%;
    }

    .change-photo-icon {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: transparent;
        border-radius: 50%;
        padding: 10px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .change-photo-icon i {
        color: #333;
        font-size: 50px;
        transition: all 0.2s ease-in-out;
    }

    .change-photo-icon i:hover {
        font-size: 70px;
        color: white;
        transition: all 0.2s ease-in-out;
    }

    <jsp:include page = "includes/permissoes_css.jsp" />
    /**/
</style>
<body class="modo-claro">
<% HttpSession sessao = request.getSession();
    String permissao = String.valueOf(sessao.getAttribute("permissao"));
    String assinante = String.valueOf(sessao.getAttribute("assinante_status"));
    if (sessao.getAttribute("user") == null) {
        permissao = null;
%>
<script>
    window.location.replace("inicial.jsp");
</script>
<%} else if (permissao.equals("adm")) {%>
<jsp:include page="includes/menus_sidebar/menu_logado.jsp"/>
<jsp:include page="includes/menus_navbar/menu_adm.jsp"/>
<!--PREMIUM -->
<%} else if (assinante.equals("true")) {%>
<jsp:include page="includes/menus_sidebar/menu_logado.jsp"/>
<jsp:include page="includes/menus_navbar/menu_premium.jsp"/>
<!--GRATUITO -->
<%} else if (permissao.equals("comum")) {%>
<jsp:include page="includes/menus_sidebar/menu_logado.jsp"/>
<jsp:include page="includes/menus_navbar/menu_gratuito.jsp"/>
<%}%>
<!--Redirecionamento de pagina para usuario RESTRITO -->
<c:if test="${restrito_jsp.restrito}">
    <script>
        window.location.replace("inicial.jsp");
    </script>
</c:if>
<div class="container-fluid">
    <div class="row">
        <div id="foco" class="card mx-auto" style="margin-top: 20%;margin-bottom: 20%;">
            <h3 class=" rounded p-2 text-center text-white" style="background-color: rgba(20,20,20,0.3);">Editar Perfil
                ILiveMusic</h3>
            <div class="form-group">
                <div class="profile-picture-perfil">
                    <% String fotoPerfil = (String) session.getAttribute("foto_perfil"); %>
                    <% if (fotoPerfil != null && !fotoPerfil.isEmpty()) {%>
                    <img src="<%= fotoPerfil%>" alt="Foto de Perfil" id="preview-image">
                    <% } else { %>
                    <img src="images/logo-ilivemusic.png" alt="Imagem Alternativa" id="preview-image">
                    <% }%>
                    <div class="change-photo-icon" onclick="selectImage()">
                        <i class="bi bi-camera"></i>
                    </div>
                </div>

                <form action="usrv" method="post" enctype="multipart/form-data">
                    <input type="hidden" value="${usuario.idUsuario}" id="idUsu" name="idUsu">
                    <div class="form-group">
                        <input type="file" id="foto_perfil" class="d-none" name="foto_perfil" accept="image/*">
                    </div>
                    <input type="hidden" value="atualizar_foto_perfil" id="acao" name="acao">
                    <input class="btn btn-outline-dark fw-bold mx-auto w-100 bg-tr" type="submit" value="Salvar Foto">
                </form>
                <form action="usrv" method="post" onsubmit="return validarFormulario()">
                    <input type="hidden" value="${usuario.idUsuario}" id="idUsu" name="idUsu">
            </div>

            <div class="form-group">
                <label for="txtNome">Nome:</label>
                <input value="${usuario.nome}" class="form-control" type="text" id="txtNome" name="txtNome"
                       placeholder="Seu nome aqui" required>
            </div>

            <div class="form-group">
                <label for="txtNome">Usuario/Login:</label>
                <input value="${usuario.usuario}" class="form-control text-dark input-desativado" type="text"
                       id="txtNome" name="txtNome" style="cursor: not-allowed;" placeholder="Seu nome aqui" readonly
                       onfocus="this.blur();">
            </div>

            <div class="form-group">
                <label for="txtEmail">E-mail:</label>
                <input value="${usuario.email}" class="form-control" type="email" id="txtEmail" name="txtEmail"
                       placeholder="EX: contato@email.com" required>
            </div>

            <div class="form-group">
                <label for="txtTel">Senha:</label>
                <input value="${usuario.senha}" class="form-control" type="password" id="txtSenha" name="txtSenha"
                       placeholder="********">
            </div>
            <div class="form-group">
                <label for="txtTel">Confirmar Senha:</label>
                <input type="password" name="txtConfirmarSenha" id="txtConfirmarSenha" class="form-control"
                       placeholder="********" required/>
            </div>
            <input type="hidden" value="atualizar_meu_perfil" id="acao" name="acao">
            <input class="btn2 btn-dark fw-bold w-100" type="submit" value="Salvar">
            </form>
        </div>
    </div>
</div>
</div>
<script>
    function selectImage() {
        document.getElementById('foto_perfil').click();
    }
</script>
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
    function validarFormulario() {
        var senha = document.getElementById("txtSenha").value;
        var confirmarSenha = document.getElementById("txtConfirmarSenha").value;

        if (senha !== confirmarSenha) {
            alert("As senhas não correspondem. Por favor, digite novamente.");
            return false;
        }

        return true;
    }
</script>
<script>
    window.addEventListener('load', function () {
        var elemento = document.getElementById('foco');
        if (elemento) {
            elemento.style.marginTop = '500px'; // Ajuste o valor da margem superior conforme necessário
            elemento.scrollIntoView({behavior: 'smooth'});
        }
    });

</script>
<script>
    /*Abrir menu lateral esquerdo*/
    function w3_open() {
        if (window.innerWidth > 768) {
            document.getElementById("main").style.marginLeft = "15%";
            document.getElementById("mySidebar").style.width = "15%";
            document.getElementById("mySidebar").style.display = "block";
            document.getElementById("openNav").style.display = 'none';
        } else {
            document.getElementById("main").style.marginLeft = "30%";
            document.getElementById("mySidebar").style.width = "30%";
            document.getElementById("mySidebar").style.display = "block";
            document.getElementById("openNav").style.display = 'none';
        }
    }

    function w3_close() {
        document.getElementById("main").style.marginLeft = "0%";
        document.getElementById("mySidebar").style.display = "none";
        document.getElementById("openNav").style.display = "inline-block";
    }
    ;
</script>
</body>
</html>