<%-- 
    Document   : politicas
    Created on : 24/06/2023, 10:52:54
    Author     : julio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Politicas de Privacidade</title>
    <jsp:include page="includes/bootstrap_5_Lib.jsp"/>
    <jsp:include page="includes/w3.css_Lib.jsp"/>
</head>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 20px;
        background-color: #dddddd;
    }

    .container {
        max-width: 800px;
        margin: 0 auto;
        background-color: #ECEFF1;
        padding: 30px;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    h1 {
        text-align: center;
        margin-bottom: 20px;
        color: #333333;
    }

    .section {
        margin-bottom: 40px;
    }

    h2 {
        margin-bottom: 10px;
        color: #555555;
    }

    p {
        line-height: 1.5;
        color: #777777;
    }

    ul {
        margin: 0;
        padding-left: 20px;
        color: #777777;
    }

    li {
        margin-bottom: 5px;
    }

    #politicas {
        border-top: 1px solid #dddddd;
        padding-top: 20px;
    }

    #termos {
        border-top: 1px solid #dddddd;
        padding-top: 20px;
    }

    #cookies {
        border-top: 1px solid #dddddd;
        padding-top: 20px;
    }

    #pagamento {
        border-top: 1px solid #dddddd;
        padding-top: 20px;
    }

    #regras {
        border-top: 1px solid #dddddd;
        padding-top: 20px;
    }

    .container p:last-child,
    .container ul:last-child,
    .container div:last-child {
        margin-bottom: 0;
    }

    .container ul li::before {
        content: "\2022";
        color: #999999;
        font-weight: bold;
        display: inline-block;
        width: 1em;
        margin-left: -1em;
    }

    .container ul li {
        margin-bottom: 10px;
    }

    .container ul {
        list-style: none;
    }

    .container p,
    .container ul {
        font-size: 14px;
    }

    .container a {
        color: #337ab7;
        text-decoration: none;
    }

    .container a:hover {
        text-decoration: underline;
    }

    .image-container {
        text-align: center;
        margin-bottom: 30px;
    }

    .image-container img {
        max-width: 100%;
        height: auto;
        border-radius: 5px;
    }
</style>
</head>

<body>
<div class="container">
    <div class="image-container">
        <img src="images/logo-ilivemusic.png" alt="Imagem ilustrativa" width="200">
        <h1 style="color: purple;font-weight: bold;">Documentação de Políticas de Privacidade - ILiveMusic</h1>
    </div>
    <div id="politicas" class="section">
        <h2 style="color: purple">Políticas de Privacidade</h2>
        <p>A ILiveMusic está comprometida em proteger a sua privacidade online. Esta política de privacidade descreve
            como coletamos, usamos e protegemos as informações pessoais dos nossos usuários.</p>
        <p>As informações pessoais que coletamos podem incluir nome, endereço de e-mail, informações de pagamento como
            forma de pagamento utilizado, não armazenamos dados privados sobre o pagamento utilizado, armazenamos também
            outros dados necessários para fornecer nossos serviços. Essas informações são usadas para criar e gerenciar
            contas de usuários, processar pagamentos, personalizar a experiência do usuário e fornecer suporte ao
            cliente.</p>
        <p>Garantimos que suas informações pessoais sejam tratadas com segurança e informações como dados do cartão de
            crédito ou informações comprometedoras não são armazenadas internamente, e não passam pelo nosso sistema,
            sendo processadas através de API com empresas terceirizadas confiáveis que fornecem serviços de pagamento e
            processamento de dados.</p>
    </div>

    <div id="termos" class="section">
        <h2 style="color: purple">Termos e Condições</h2>
        <p>Ao utilizar a plataforma ILiveMusic, você concorda com os seguintes termos e condições:</p>
        <ul>
            <li>Você concorda em utilizar a plataforma apenas para fins legais e não violar direitos autorais ou outros
                direitos de propriedade intelectual.
            </li>
            <li>Você é responsável por manter a confidencialidade das suas credenciais de acesso e não compartilhá-las
                com terceiros.
            </li>
            <li>A ILiveMusic reserva-se o direito de suspender ou encerrar contas de usuários que violem os termos e
                condições.
            </li>
        </ul>
    </div>

    <div id="cookies" class="section">
        <h2 style="color: purple">Uso de Cookies</h2>
        <p>A ILiveMusic utiliza cookies para melhorar a experiência do usuário na plataforma. Os cookies são pequenos
            arquivos de texto armazenados no seu dispositivo que nos permitem reconhecê-lo e lembrar suas
            preferências.</p>
        <p>Ao utilizar a ILiveMusic, você concorda com o uso de cookies para personalizar conteúdos, fornecer recursos
            de segurança, analisar o desempenho da plataforma e oferecer anúncios relevantes.</p>
    </div>

    <div id="pagamento" class="section">
        <h2 style="color: purple">Formas de Pagamento</h2>
        <p>A ILiveMusic oferece as seguintes formas de pagamento:</p>
        <ul>
            <li>Pix</li>
            <li>Cartão de Crédito</li>
        </ul>
        <p>Para processar os pagamentos, utilizamos a API de empresas terceirizadas confiáveis, garantindo a segurança e
            proteção das suas informações financeiras. Nenhum dado de pagamento é armazenado internamente pela
            ILiveMusic.</p>
    </div>
    <div id="regras" class="section">
        <h2 style="color: purple">Regras ILiveMusic:</h2>
        <ul>
            <li>Todas as musicas são de uso particular da plataforma sem intuito comercial!</li>
            <li>É proibido o uso indevido dos contúdos fornecidos pela plataforma!.</li>
            <li>Caso detectado o uso de programas/recursos/ações indevidas dentro da plataforma a conta será banida
                permanentemente!
            </li>
        </ul>
    </div>
    <div class="text-center" style="color: purple">PARA O USO DA PLATAFORMA ILIVEMUSIC É NECESSÁRIO ACEITAR TODOS OS
        TERMOS NA PAGINA INICIAL DE CADASTRO/LOGIN
    </div>
</div>
</body>
</html>
