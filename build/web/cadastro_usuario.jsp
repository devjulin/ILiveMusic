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
<style>
    body {
        background-image: url("images/cadastro_usuario/bg_cadastro_usuario.jpg");
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
    }
</style>
<body class="modo-claro">
<!--Menu Lateral Esquerdo -->
<jsp:include page="includes/menus_sidebar/menu.jsp"/>

<div id="main">
    <div class="bg-menu-lateral d-flex justify-content-between">
        <button id="openNav" class=" bg-menu-lateral w3-button w3-xlarge text-white" onclick="w3_open()">&#9776;
        </button>
        <div class="w3-container">

            <%
                HttpSession sessao = request.getSession();
                if (sessao.getAttribute("user") == null) { %>
            <!-- Botão para abrir o modal -->
            <h1 class="text-white fw-bold " style="margin-left: 14%;width: 100%">&nbsp; Cadastro de Conta <i
                    class="bi bi-person-badge"></i></h1>

        </div>
        <a href="#" class="btn btn-link text-black" data-bs-toggle="modal" data-bs-target="#loginModal">
            <i class="bi bi-person-circle fs-1"></i>
        </a>
        <jsp:include page="includes/modal_login.jsp"/>
        <%
        } else {
            response.sendRedirect("index.jsp");
        %>
        <!-- <h1 class="text-white fw-bold " style="margin-left: 37%;width: 100%">&nbsp; Cadastro de Conta <i class="bi bi-person-badge"></i></h1>
       
               </div>
               <form action="login" method="post" class="d-flex">
                   <p class="text-center text-white fw-bold fs-4 p-1 mx-5"><%/* "Bem vindo " + sessao.getAttribute("user")*/%></p>
                   <button type="submit" value="logout" name="acao" class="btn btn-link text-black px-3"><i class="bi bi-box-arrow-right fs-1"></i></button>
               </form> -->
        <%}%>

    </div>
    <div class="d-flex justify-content-center align-items-center vh-100 ">
        <div class="container row w-50 h-50 " style="border-radius: 15px">
            <div class="mt-5 px-5 ">
                <form action="usrv" method="POST" class=" form p-5 rounded">
                    <h2 class="fw-bold text-center">DADOS DO USUARIO</h2>
                    <label for="txtNome " class="fw-bold">Digite seu Nome: </label>
                    <input class="form-control input-modificado" type="text" id="txtNome" name="txtNome"
                           placeholder="Digite seu Nome..." required>
                    <br>
                    <label for="txtUsuario" class="fw-bold">Digite seu Usuario de Login: </label>
                    <input class="form-control input-modificado" type="text" id="txtUsuario" name="txtUsuario"
                           placeholder="Nome de usuario / Login..." required>
                    <br>
                    <label for="txtEmail" class="fw-bold">Digite seu endereço de email: </label>
                    <input class="form-control input-modificado" type="mail" id="txtEmail" name="txtEmail"
                           placeholder="Digite seu email aqui..." required>
                    <br>
                    <label for="txtTel" class="fw-bold ">Digite sua Senha: </label>
                    <input class="form-control input-modificado" type="password" id="txtSenha" name="txtSenha"
                           placeholder="Digite sua senha..." required=>
                    <br>
                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" id="regras" required>
                        <label class="form-check-label fw-bold" for="regras">Eu li e concordo com as <a href="#"
                                                                                                        data-toggle="modal"
                                                                                                        class="text-warning"
                                                                                                        data-target="#meuModal">regras</a>
                            do formulário</label>
                    </div>
                    <br>
                    <input type="hidden" value="cad_usuario" id="acao" name="acao">
                    <input class="btn btn-secondary texto-branco" type="submit" value="Cadastrar">
                    <input class="btn btn-danger texto-branco" type="reset" value="Limpar">
                </form>
                <!-- Modal -->
                <div class="modal fade " id="meuModal">
                    <div class="modal-dialog ">
                        <div class="modal-content bg-escuro">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="fw-bold m-auto">REGRAS ILIVEMUSIC&nbsp;&nbsp;<i
                                        class="bi bi-exclamation-triangle"></i></h4>
                                <button type="button" class="btn close fs-2 texto-modos" data-dismiss="modal">&times;
                                </button>
                            </div>
                            <!-- Modal body -->
                            <div class="modal-body ">
                                <p class="fw-bold">REGRAS</p>
                                <ul>
                                    <li>Todas as musicas são de uso particular da plataforma sem intuito comercial!</li>
                                    <li>É proibido o uso indevido dos contúdos fornecidos pela plataforma!.</li>
                                    <li>Caso detectado o uso de programas/recursos/ações indevidas dentro da plataforma
                                        a conta será banida permanentemente!
                                    </li>
                                </ul>
                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-success" data-dismiss="modal">Li as Regras</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

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
