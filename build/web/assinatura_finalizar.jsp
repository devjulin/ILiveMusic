<%-- 
    Document   : assinatura
    Created on : 05/06/2023, 15:32:14
    Author     : sala303b
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>SEJA ASSINANTE PREMIUM</title>
    <link rel="icon" type="image/png" href="images/logo-ilivemusic.png">
    <link rel="stylesheet" href="css/style.css">
    <script src="js/script.js"></script>
    <jsp:include page="includes/bootstrap_5_Lib.jsp"/>
    <jsp:include page="includes/w3.css_Lib.jsp"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
</head>
<style>
    <jsp:include page = "includes/permissoes_css.jsp" />
    * {
        transition: all 0.7s ease-in-out;
    }

    #seja-premium {
        display: none;
    }

    @media (max-width: 850px) {
        #seja-premium {
            display: none;
            transition: all 2s ease-in-out;
        }
    }

    @media (max-width: 768px) {
        .row {
            margin-top: 5%;
        }

        .plano {
            min-width: 20em;
            margin: auto;
        }

        .plano_g {
            min-width: 20em;
            margin: auto;
        }

        transition: all 2s ease-in-out;
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

    /* Duração das transições */
    #main, #mySidebar {
        transition: all 1s ease;
    }

    #openNav {
        transition: all 1s ease;
    }

    .ilivemusic-topo {
        transition: all 1s ease;
    }

    html {
        height: 100%
    }

    p {
        color: grey
    }

    #heading {
        text-transform: uppercase;
        color: #673AB7;
        font-weight: bold;
    }

    #msform {
        text-align: center;
        position: relative;
        margin-top: 20px;
    }

    #msform fieldset {
        background: white;
        border: 0 none;
        border-radius: 0.5rem;
        box-sizing: border-box;
        width: 100%;
        margin: 0;
        padding-bottom: 20px;
        position: relative
    }

    #msform fieldset:not(:first-of-type) {
        display: none
    }

    #msform input,
    #msform textarea {
        padding: 8px 15px 8px 15px;
        border: 1px solid #ccc;
        border-radius: 0px;
        margin-bottom: 25px;
        margin-top: 2px;
        width: 100%;
        box-sizing: border-box;
        font-family: montserrat;
        color: #2C3E50;
        background-color: #ECEFF1;
        font-size: 16px;
        letter-spacing: 1px
    }

    #msform input:focus,
    #msform textarea:focus {
        -moz-box-shadow: none !important;
        -webkit-box-shadow: none !important;
        box-shadow: none !important;
        border: 1px solid #673AB7;
        outline-width: 0
    }

    #msform .action-button {
        width: 10em;
        background: #673AB7;
        font-weight: bold;
        color: white;
        border: 0 none;
        border-radius: 7px;
        cursor: pointer;
        float: right;
        transform: scale(1.5);
        transition: transform 0.2s ease-in-out;
    }

    #msform .action-button:hover,
    #msform .action-button:focus {
        background-color: #616161;
        transform: scale(1.7);
        transition: transform 0.2s ease-in-out;
    }

    #msform .action-button-reset {
        width: 5em;
        background: #616161;
        font-weight: bold;
        color: white;
        border: 0 none;
        border-radius: 7px;
        cursor: pointer;
        float: right;
        transform: scale(1.5);
        transition: transform 0.2s ease-in-out;
    }

    #msform .action-button-reset:hover,
    #msform .action-button-reset:focus {
        background: #673AB7;
        transform: scale(1.7);
        transition: transform 0.2s ease-in-out;
    }


    .fs-title {
        font-size: 25px;
        color: #673AB7;
        margin-bottom: 15px;
        font-weight: normal;
        text-align: left
    }

    .purple-text {
        color: #673AB7;
        font-weight: normal
    }

    .steps {
        font-size: 25px;
        color: gray;
        margin-bottom: 10px;
        font-weight: normal;
        text-align: right
    }

    .fieldlabels {
        color: gray;
        text-align: left
    }

    #progressbar {
        overflow: hidden;
        color: lightgrey
    }

    #progressbar .active {
        color: #673AB7
    }

    #progressbar li {
        list-style-type: none;
        font-size: 15px;
        width: 25%;
        float: left;
        position: relative;
        font-weight: 400
    }

    #progressbar li:before {
        width: 50px;
        height: 50px;
        line-height: 45px;
        display: block;
        font-size: 20px;
        color: #ffffff;
        background: lightgray;
        border-radius: 50%;
        margin: 0 auto 10px auto;
        padding: 2px
    }

    #progressbar li:after {
        content: '';
        width: 100%;
        height: 2px;
        background: lightgray;
        position: absolute;
        left: 0;
        top: 25px;
        z-index: -1
    }

    #progressbar li.active:before,
    #progressbar li.active:after {
        background: #673AB7
    }

    .progress {
        height: 20px
    }

    .progress-bar {
        background-color: #673AB7
    }

    .fit-image {
        width: 100%;
        object-fit: cover
    }

    .corpo {
        width: 95%;
        box-shadow: 5px 10px 10px rgba(0, 0, 0, 0.3);
    }

    .row {
        display: flex;
        justify-content: space-between;
        padding: 1%;
    }

    @media (max-width: 1920px) {
        .finalizar-checkout-info img {
            width: 15em;
            max-width: 15em;
            height: 15em;
            margin-top: 15px;
        }

        .finalizar-checkout-info {
            width: 10em;
            max-width: 10em;
            height: 41em;
        }

        .finalizar-checkout-info input {
            position: relative;
            bottom: 2em;
        }

        .finalizar_checkout img {
            width: 15em;
            max-width: 15em;
        }

        .finalizar_checkout img {
            width: 15em;
            max-width: 15em;
        }

        .finalizar_checkout img {
            width: 120%;
            height: 100%;
            max-width: 32em;
            min-width: 20em;
            border-radius: 20px;
            box-shadow: 8px 8px 16px rgba(0, 0, 0, 0.2),
            -8px -8px 16px rgba(255, 255, 255, 0.2);
            transition: transform 0.3s;
            margin-bottom: 10px;
        }

        .plano_g {
            max-width: 15em;
            min-width: 15em;
            min-height: 15em;
            /*reajuste ideal full-hd*/
            height: 37em;
            padding: 20px;
            background-color: #fff;
            border-radius: 20px;
            box-shadow: 8px 8px 16px rgba(0, 0, 0, 0.2),
            -8px -8px 16px rgba(255, 255, 255, 0.2);
            transition: transform 0.3s;
            margin-bottom: 10px;
        }

        .plano_g h2 {
            font-size: 20px;
        }

        .plano_g a {
            display: block;
            color: #fff;
            text-align: center;
            padding: 5px;
            border-radius: 5px;
            font-weight: bold;
            text-decoration: none;
        }

        .plano_g img {
            width: 100%;
            height: 15em;
        }

        .plano_g ul {
            list-style: none;
            padding-left: 0;
            height: 1.5em;
        }

        .plano_g li {
            /*reajuste ideal full-hd*/
            height: 0.8em;
        }

        .plano_g .nao-incluso {
            color: red;
        }

        .plano_g button {
            display: block;
            width: 100%;
            background-color: #4CAF50;
            color: white;
            text-align: center;
            padding: 10px;
            border: none;
            border-radius: 5px;
            margin-top: 15px;
            font-weight: bold;
            text-decoration: none;
            cursor: pointer;
        }

        .plano_g button:hover {
            background-color: #45a049;
        }

        .plano_g-container {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .plano_g-container .plano {
            margin-left: -10px;
        }

        .plano_g2 {
            width: 30%;
            min-width: 18em;
            max-width: 18em;
            /*reajuste ideal full-hd*/
            height: 31em;
            padding: 20px;
            background-color: #fff;
            border-radius: 20px;
            box-shadow: 8px 8px 16px rgba(0, 0, 0, 0.2),
            -8px -8px 16px rgba(255, 255, 255, 0.2);
            transition: transform 0.3s;
        }

        .plano_g2 h2 {
            font-size: 20px;
        }

        .plano_g2 a {
            display: block;
            color: #fff;
            text-align: center;
            padding: 5px;
            border-radius: 5px;
            font-weight: bold;
            text-decoration: none;
        }

        .plano_g2 img {
            width: 100%;
            height: 12em;
        }

        .plano_g2 ul {
            list-style: none;
            padding-left: 0;
            height: 1.5em;
        }

        .plano_g2 li {
            margin-bottom: 5px;
            /*reajuste ideal full-hd*/
            height: 0.5em;
        }

        .plano_g2 .nao-incluso {
            color: red;
        }

        .plano_g2 button {
            display: block;
            width: 100%;
            background-color: #4CAF50;
            color: white;
            text-align: center;
            padding: 10px;
            border: none;
            border-radius: 5px;
            margin-top: 15px;
            font-weight: bold;
            text-decoration: none;
            cursor: pointer;
        }

        .plano_g2 button:hover {
            background-color: #45a049;
        }

        .plano_g2-container {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .plano_g2-container .plano {
            margin-left: -10px;
        }

        .plano {
            width: 15em;
            min-width: 15em;
            max-width: 15em;
            /*reajuste ideal full-hd*/
            height: 37em;
            padding: 20px;
            background-color: #fff;
            border-radius: 20px;
            box-shadow: 8px 8px 16px rgba(0, 0, 0, 0.2),
            -8px -8px 16px rgba(255, 255, 255, 0.2);
            transition: transform 0.3s;
            margin-bottom: 10px;
        }

        .plano:hover {
            transform: translate(2px, 2px);
            box-shadow: 6px 6px 12px rgba(0, 0, 0, 0.2),
            -6px -6px 12px rgba(255, 255, 255, 0.2);
            transform: scale(1.05);
        }

        .plano h2 {
            font-size: 20px;
            margin-bottom: 10px;
        }

        .plano a {
            display: block;
            color: #fff;
            text-align: center;
            padding: 5px;
            border-radius: 5px;
            font-weight: bold;
            text-decoration: none;
        }

        .plano img {
            width: 100%;
            height: 11em;
        }

        .plano ul {
            list-style: none;
            padding-left: 0;
            height: 1.5em;
        }

        .plano li {
            /*reajuste ideal full-hd*/
            height: 0.7em;
        }

        .plano .nao-incluso {
            color: red;
        }

        .plano button {
            display: block;
            max-width: 7em;
            background-color: #4CAF50;
            color: white;
            text-align: center;
            padding: 10px;
            border: none;
            border-radius: 5px;
            position: relative;
            top: 7em;
            font-weight: bold;
            text-decoration: none;
            cursor: pointer;
        }

        .plano button:hover {
            background-color: #45a049;
        }

        .plano-container {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .plano-container .plano {
            margin-left: -10px;
        }

        .card-informativo {

            max-width: 20em;
            width: 15em;
            height: 31em;
        }

        .card-informativo h1 {
            margin-top: -3em;
            height: 1em;
        }

        .card-informativo p {
            margin-top: 1em;
            height: 5em;
            margin-bottom: 1em;
        }

        .card-informativo input {
            height: 1.5em;
            position: relative;
            top: 15%;
        }
    }

    .plano_g2 {
        width: 30%;
        min-width: 18em;
        max-width: 18em;
        /*reajuste ideal full-hd*/
        height: 31em;
        padding: 20px;
        background-color: #fff;
        border-radius: 20px;
        box-shadow: 8px 8px 16px rgba(0, 0, 0, 0.2),
        -8px -8px 16px rgba(255, 255, 255, 0.2);
        transition: transform 0.3s;
    }

    .plano_g2 h2 {
        font-size: 20px;
    }

    .plano_g2 a {
        display: block;
        color: #fff;
        text-align: center;
        padding: 5px;
        border-radius: 5px;
        font-weight: bold;
        text-decoration: none;
    }

    .plano_g2 img {
        width: 100%;
        height: 12em;
    }

    .plano_g2 ul {
        list-style: none;
        padding-left: 0;
        height: 1.5em;
    }

    .plano_g2 li {
        margin-bottom: 5px;
        /*reajuste ideal full-hd*/
        height: 0.5em;
    }

    .plano_g2 .nao-incluso {
        color: red;
    }

    .plano_g2 button {
        display: block;
        width: 100%;
        background-color: #4CAF50;
        color: white;
        text-align: center;
        padding: 10px;
        border: none;
        border-radius: 5px;
        margin-top: 15px;
        font-weight: bold;
        text-decoration: none;
        cursor: pointer;
    }

    .plano_g2 button:hover {
        background-color: #45a049;
    }

    .plano_g2-container {
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .plano_g2-container .plano {
        margin-left: -10px;
    }

    .finalizar-checkout-info input {
        position: relative;
        bottom: 2em;
    }

    .finalizar-checkout-info {
        width: 15em;
        min-width: 22em;
        max-width: 15em;
        padding: 20px;
        background-color: #fff;
        border-radius: 20px;
        box-shadow: 8px 8px 16px rgba(0, 0, 0, 0.2),
        -8px -8px 16px rgba(255, 255, 255, 0.2);
        transition: transform 0.3s;
        margin-bottom: 10px;
    }

    .finalizar-checkout-info img {
        width: 15em;
        margin-top: 15px;
    }

    .finalizar_checkout {
        width: 30em;
        max-width: 30em;
    }

    .finalizar_checkout img {
        width: 20em;
        max-width: 20em;
        height: 41em;
        max-height: 41em;
        border-radius: 20px;
        box-shadow: 8px 8px 16px rgba(0, 0, 0, 0.2),
        -8px -8px 16px rgba(255, 255, 255, 0.2);
        transition: transform 0.3s;
        margin-bottom: 10px;
    }

    .plano_g {
        width: 30%;
        max-width: 18em;
        padding: 20px;
        background-color: #fff;
        border-radius: 20px;
        box-shadow: 8px 8px 16px rgba(0, 0, 0, 0.2),
        -8px -8px 16px rgba(255, 255, 255, 0.2);
        transition: transform 0.3s;
        margin-bottom: 10px;
    }

    .plano_g h2 {
        font-size: 20px;
        margin-bottom: 10px;
    }

    .plano_g a {
        display: block;
        color: #fff;
        text-align: center;
        padding: 5px;
        border-radius: 5px;
        font-weight: bold;
        text-decoration: none;
    }

    .plano_g img {
        width: 100%;
        margin-top: 15px;
    }

    .plano_g ul {
        margin-top: 15px;
        list-style: none;
        padding-left: 0;
    }

    .plano_g li {
        margin-bottom: 5px;
    }

    .plano_g .nao-incluso {
        color: red;
    }

    .plano_g button {
        display: block;
        width: 100%;
        background-color: #4CAF50;
        color: white;
        text-align: center;
        padding: 10px;
        border: none;
        border-radius: 5px;
        margin-top: 15px;
        font-weight: bold;
        text-decoration: none;
        cursor: pointer;
    }

    .plano_g button:hover {
        background-color: #45a049;
    }

    .plano_g-container {
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .plano_g-container .plano {
        margin-left: -10px;
    }

    .plano {
        width: 30%;
        max-width: 18em;
        padding: 20px;
        background-color: #fff;
        border-radius: 20px;
        box-shadow: 8px 8px 16px rgba(0, 0, 0, 0.2),
        -8px -8px 16px rgba(255, 255, 255, 0.2);
        transition: transform 0.3s;
        margin-bottom: 10px;
    }

    .plano:hover {
        transform: translate(2px, 2px);
        box-shadow: 6px 6px 12px rgba(0, 0, 0, 0.2),
        -6px -6px 12px rgba(255, 255, 255, 0.2);
        transform: scale(1.05);
    }

    .plano h2 {
        font-size: 20px;

    }

    .plano a {
        display: block;
        color: #fff;
        text-align: center;
        padding: 5px;
        border-radius: 5px;
        font-weight: bold;
        text-decoration: none;
    }

    .plano img {
        width: 100%;
        margin-top: 15px;
    }

    .plano ul {
        margin-top: 15px;
        list-style: none;
        padding-left: 0;
    }

    .plano li {
        margin-bottom: 5px;
    }

    .plano .nao-incluso {
        color: red;
    }

    .plano button {
        display: block;
        width: 100%;
        background-color: #4CAF50;
        color: white;
        text-align: center;
        padding: 10px;
        border: none;
        border-radius: 5px;
        margin-top: 15px;
        font-weight: bold;
        text-decoration: none;
        cursor: pointer;
    }

    .plano button:hover {
        background-color: #45a049;
    }

    .plano-container {
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .plano-container .plano {
        margin-left: -10px;
    }

    .recursos {
        list-style-type: none;
        padding: 0;
        margin-bottom: 20px;
    }

    .recursos li {
        display: flex;
        align-items: center;
        margin-bottom: 10px;
    }

    .recursos li::before {
        content: '✔';
        margin-right: 10px;
        color: green;
    }

    .recursos li.nao-incluso::before {
        content: '✘';
        color: red;
    }

    .borda_reaj {
        border-radius: 20px;
        box-shadow: 8px 8px 16px rgba(0, 0, 0, 0.2),
        -8px -8px 16px rgba(255, 255, 255, 0.2);
        transition: transform 0.3s;
    }

    .btn-confirmar-pgt {
        background-color: purple;
        color: white;
    }

    .btn-confirmar-pgt:hover {
        background-color: #fff;
        color: #090909;
    }

    .btn-cancelar-pgt:hover {
        background-color: #fff;
        color: #090909;
    }

    .card-informativo {
        max-width: 20em;
        max-height: 31em;
        min-width: 18em;
    }

    .card-informativo h1 {
        margin-top: -3em;
        height: 1em;
    }

    .card-informativo p {
        margin-top: 1em;
        height: 5em;
        margin-bottom: 1em;
    }

    .card-informativo input {
        height: 1.5em;
        position: relative;
        top: 15%;
    }

    .reaj-topo {
        margin-top: 7em;
    }

    @media (max-width: 1000px) {
        .card-informativo {
            min-width: 18em;
        }
    }

    @media (max-width: 768px) {

        .ocultar-res-baixa {
            display: none;
        }

        #btn-sair {
            display: none;
        }

        #seja-premium {
            display: none;
        }

        .reaj-topo {
            margin-top: 15%;
        }

        transition: all 2s ease-in-out;
    }

    .reaj_rodape {
        margin-bottom: 10em;
    }

    <jsp:include page = "includes/rodape_css.jsp" />
    <jsp:include page = "includes/modo_noturno.jsp" />
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--Redirecionamento de pagina para usuario RESTRITO -->
<c:if test="${restrito_jsp.restrito}">
    <script>
        window.location.replace("inicial.jsp");
    </script>
</c:if>
<div class="container-fluid" style="margin-top: 3%;">
    <div class="row justify-content-center reaj-topo">
        <div class="col-11 col-sm-10 col-md-10 col-lg-6 col-xl-5 text-center p-0 mt-1 mb-1 corpo rounded">
            <h2 id="heading">Descubra o plano perfeito para você!</h2>
            <p class="mb-1">Mergulhe em uma experiência musical personalizada, repleta de diversidade e emoção.</p>
            <div id="msform" class="reaj_rodape">
                <!-- progressbar -->
                <ul id="progressbar">
                    <li
                    <i class="bi bi-bag-check active" style="width: 100%;margin-left: -0.5%;"></i><strong
                        class="texto-modos">Finalizar</strong></li>
                </ul>
                <div class="progress">
                    <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar"
                         aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <br>
                <!-- fieldsets -->
                <fieldset id="finalizar-checkout" class="bg-transparent">
                    <div class="row d-flex justify-content-around">
                        <div class="finalizar_checkout">
                            <img id="imagem-assinatura" src="${imagemAssinatura}">
                        </div>
                        <div class="finalizar-checkout-info">
                            <h2 class="bg-success text-white p-2 text-center fw-bold rounded fs-6"> SUCESSO!!</h2>
                            <h2 class="bg-secondary text-white p-2 text-center fw-bold rounded fs-6"> SOLICITAÇÃO DE
                                ASSINATURA ENVIADA!</h2>
                            <img src="images/assinatura/finalizar-checkout.gif" alt="Plano Mensal">
                            <ul class="recursos fw-bold">
                                <p class="text-dark">Um de nossos colaboradores, irá verificar o pagamento e liberar sua
                                    ASSINATURA em até 7 dias úteis, caso o pagamento tenha sido concluído!</p>
                                <h3 class="fw-bold fs-5 text-danger">INSIRA O CÓDIGO ABAIXO NA DESCRIÇÃO DO PAGAMENTO
                                    PIX</h3>
                                <input type="text" class="rounded text-center text-dark mt-5 fw-bold fs-3" name="codigo"
                                       placeholder="${codigoHash}" readonly="">
                            </ul>
                        </div>
                        <div class="position-absolute d-flex d-none" id="confetes" style="margin-top:30em;">
                            <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
                            <lottie-player src="https://assets8.lottiefiles.com/packages/lf20_lg6lh7fp.json"
                                           background="transparent" speed="1.5" style="width: 300px; height: 300px;"
                                           loop autoplay></lottie-player>
                            <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
                            <lottie-player src="https://assets8.lottiefiles.com/packages/lf20_lg6lh7fp.json"
                                           background="transparent" speed="1.5" style="width: 300px; height: 300px;"
                                           loop autoplay></lottie-player>
                            <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
                            <lottie-player src="https://assets8.lottiefiles.com/packages/lf20_lg6lh7fp.json"
                                           background="transparent" speed="1.5" style="width: 300px; height: 300px;"
                                           loop autoplay></lottie-player>
                            <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
                            <lottie-player src="https://assets8.lottiefiles.com/packages/lf20_lg6lh7fp.json"
                                           background="transparent" speed="1.5" style="width: 300px; height: 300px;"
                                           loop autoplay></lottie-player>
                            <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
                            <lottie-player src="https://assets8.lottiefiles.com/packages/lf20_lg6lh7fp.json"
                                           background="transparent" speed="1.5" style="width: 300px; height: 300px;"
                                           loop autoplay></lottie-player>
                            <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
                            <lottie-player src="https://assets8.lottiefiles.com/packages/lf20_lg6lh7fp.json"
                                           background="transparent" speed="1.5" style="width: 300px; height: 300px;"
                                           loop autoplay></lottie-player>
                            <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
                            <lottie-player src="https://assets8.lottiefiles.com/packages/lf20_lg6lh7fp.json"
                                           background="transparent" speed="1.5" style="width: 300px; height: 300px;"
                                           loop autoplay></lottie-player>
                        </div>
                    </div>

                    <div class="d-flex justify-content-around bg-secondary mt-5 rounded mx-auto">
                        <a class="action-button text-decoration-none" href="index.jsp">Retornar para ILiveMusic</a>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
</div>
<jsp:include page="includes/rodape.jsp"/>
<jsp:include page="includes/rodape_script.jsp"/>
<script>
    // Obtém a referência do elemento <div>
    var divConfetes = document.getElementById('confetes');

    // Remove a classe 'd-none' para exibir o elemento
    divConfetes.classList.remove('d-none');

    // Aguarda 7 segundos e adiciona a classe 'd-none' novamente
    setTimeout(function () {
        divConfetes.classList.add('d-none');
    }, 10000);

</script>
<script>
    function resetToFirstFieldset() {
        // Encontra o formulário
        var form = document.getElementById('seu-formulario');

        // Reseta o formulário
        form.reset();

        // Encontra todos os fieldsets
        var fieldsets = document.getElementsByTagName('fieldset');

        // Define o primeiro fieldset como ativo
        fieldsets[0].style.display = 'block';

        // Esconde os demais fieldsets
        for (var i = 1; i < fieldsets.length; i++) {
            fieldsets[i].style.display = 'none';
        }
    }
</script>
<script>
    $(document).ready(function () {
        var current_fs, next_fs, previous_fs; // fieldsets
        var opacity;
        var current = 1;
        var steps = $("fieldset").length;

        setProgressBar(current);

        $(".next").click(function () {
            current_fs = $(this).parent();
            next_fs = $(this).parent().next();

            // Add Class Active
            $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

            // Show the next fieldset
            next_fs.show();

            // Hide the current fieldset with style
            current_fs.animate({opacity: 0}, {
                step: function (now) {
                    // For making fieldset appear animation
                    opacity = 1 - now;

                    current_fs.css({
                        'display': 'none',
                        'position': 'relative'
                    });
                    next_fs.css({'opacity': opacity});
                },
                duration: 500
            });
            setProgressBar(++current);
        });

        function setProgressBar(curStep) {
            var percent = parseFloat(100 / steps) * curStep;
            percent = percent.toFixed();
            $(".progress-bar").css("width", percent + "%");
        }

        function selecionarPlanoMensal() {
            current_fs = $("fieldset").eq(0);
            next_fs = $("#plano-mensal-fieldset");

            // Add Class Active
            $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

            // Show the next fieldset
            next_fs.show();

            // Hide the current fieldset with style
            current_fs.animate({opacity: 0}, {
                step: function (now) {
                    // For making fieldset appear animation
                    opacity = 1 - now;

                    current_fs.css({
                        'display': 'none',
                        'position': 'relative'
                    });
                    next_fs.css({'opacity': opacity});
                },
                duration: 500
            });
            setProgressBar(2);
        }

        function selecionarPlanoTrimestral() {
            current_fs = $("fieldset").eq(0);
            next_fs = $("#plano-trimestral-fieldset");

            // Add Class Active
            $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

            // Show the next fieldset
            next_fs.show();

            // Hide the current fieldset with style
            current_fs.animate({opacity: 0}, {
                step: function (now) {
                    // For making fieldset appear animation
                    opacity = 1 - now;

                    current_fs.css({
                        'display': 'none',
                        'position': 'relative'
                    });
                    next_fs.css({'opacity': opacity});
                },
                duration: 500
            });
            setProgressBar(3);
        }

        function finalizarCheckout() {
            // Enviar o formulário
            document.getElementById("form_pgto").submit();

            current_fs = $("fieldset").eq(0);
            next_fs = $("#finalizar-checkout");

            // Add Class Active
            $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

            // Show the next fieldset
            next_fs.show();
            document.getElementById("plano-mensal-fieldset").style.display = "none";
            // Hide the current fieldset with style
            current_fs.animate({opacity: 0}, {
                step: function (now) {
                    // For making fieldset appear animation
                    opacity = 1 - now;
                    $('.modal-backdrop').remove();
                    current_fs.css({
                        'display': 'none',
                        'position': 'relative'
                    });
                    document.getElementById("imagem-assinatura").src = "images/assinatura/pix-mensal.png";
                    next_fs.css({'opacity': opacity});
                },
                duration: 500
            });
            setProgressBar(5);
        }

        function finalizarCheckout2() {
            // Enviar o formulário
            document.getElementById("form_pgto2").submit();
            current_fs = $("fieldset").eq(0);
            next_fs = $("#finalizar-checkout");

            // Add Class Active
            $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

            // Show the next fieldset
            next_fs.show();
            document.getElementById("plano-trimestral-fieldset").style.display = "none";
            // Hide the current fieldset with style
            current_fs.animate({opacity: 0}, {
                step: function (now) {
                    // For making fieldset appear animation
                    opacity = 1 - now;
                    $('.modal-backdrop').remove();
                    current_fs.css({
                        'display': 'none',
                        'position': 'relative'
                    });
                    document.getElementById("imagem-assinatura").src = "images/assinatura/pix-trimestral.png";
                    next_fs.css({'opacity': opacity});
                },
                duration: 500
            });
            setProgressBar(5);
        }

        $("#selecionar-plano-mensal").click(selecionarPlanoMensal);
        $("#selecionar-plano-trimestral").click(selecionarPlanoTrimestral);
        $("#finalizar-ck").click(finalizarCheckout);
        $("#finalizar-ck2").click(finalizarCheckout2);
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
            document.getElementById("ilivemusic-topo").style.opacity = "0";
        } else {
            document.getElementById("main").style.marginLeft = "30%";
            document.getElementById("mySidebar").style.width = "30%";
            document.getElementById("mySidebar").style.display = "block";
            document.getElementById("openNav").style.display = 'none';
            document.getElementById("ilivemusic-topo").style.opacity = "0";
        }
    }

    function w3_close() {
        document.getElementById("main").style.marginLeft = "0%";
        document.getElementById("mySidebar").style.display = "none";
        document.getElementById("openNav").style.display = "inline-block";
        document.getElementById("ilivemusic-topo").style.opacity = "1";
    }
    ;
</script>
<!--https://codepen.io/monbrielle/pen/dyYRgPm-->
</body>
</html>
