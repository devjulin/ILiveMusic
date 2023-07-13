<%-- 
    Document   : menu_painel_adm
    Created on : 19/05/2023, 23:49:05
    Author     : julio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Painel de Administração</title>
    <script src="js/script.js"></script>
</head>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
    }

    .container {
        max-width: 800px;
        margin: 20px auto;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        padding: 20px;
        border-radius: 10px;
    }

    h1 {
        text-align: center;
        color: #333;
        margin-bottom: 30px;
    }

    p {
        text-align: center;
        color: #555;
        font-size: 18px;
        margin-bottom: 30px;
    }

    .section {
        margin-bottom: 40px;
        text-align: center;
    }

    h2 {
        color: #555;
        margin-bottom: 20px;
    }

    .content {
        text-align: justify;
        line-height: 1.5;
        color: #777;
    }

    .link {
        color: #333;
        font-weight: bold;
        text-decoration: none;
    }

    .link:hover {
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

    .modo-escuro .container {
        background-color: #333;
    }
</style>
<body class="modo-claro">
<jsp:include page="includes/modo_noturno.jsp"/>
<div class="container ">
    <div class="image-container">
        <img src="images/logo-ilivemusic.png" alt="Imagem ilustrativa" width="200">
        <h1 style="color: #A020F0;font-weight: bold;">ILiveMusic Documentação ADM</h1>
    </div>
    <h1>Bem-vindo ao Painel de Administração</h1>
    <p>Aqui você terá todo o controle de usuários, pagamentos, assinaturas e restrições da plataforma ILiveMusic.</p>

    <div class="section">
        <h2 style="color: #A020F0;">Usuários</h2>
        <div class="content">
            <p>No painel de administração, você poderá gerenciar todos os usuários da plataforma. Será possível criar
                novos usuários, editar informações, excluir contas e aplicar restrições, se necessário.</p>
            <p>É importante lembrar que o tratamento adequado dos usuários e ações dentro das normas da administração
                são fundamentais para uma experiência positiva na plataforma.</p>
        </div>
    </div>

    <div class="section">
        <h2 style="color: #A020F0;">Pagamentos</h2>
        <div class="content">
            <p>O controle de pagamentos permite monitorar todas as transações financeiras realizadas na plataforma. Você
                terá acesso aos dados dos pagamentos efetuados pelos usuários, incluindo informações como valor, status
                e histórico.</p>
            <p>Essas informações são importantes para garantir a integridade e transparência do sistema de pagamento da
                plataforma de músicas.</p>
        </div>
    </div>

    <div class="section">
        <h2 style="color: #A020F0;">Assinaturas Premium</h2>
        <div class="content">
            <p>As assinaturas premium oferecem benefícios exclusivos aos usurios da plataforma. No painel de
                administração, você poderá gerir todas as assinaturas premium dos usuários.</p>
            <p>Isso inclui a criação, edição e cancelamento de assinaturas, bem como o monitoramento dos pagamentos e
                benefícios associados a cada plano premium.</p>
            <p>Garanta que os usuários tenham uma experiência premium satisfatória e estejam recebendo todos os
                benefícios pelos quais pagaram.</p>
        </div>
    </div>
    <div class="section">
        <h2 style="color: #A020F0;">Restrições</h2>
        <div class="content">
            <p>Em certos casos, pode ser necessário aplicar restrições a usuários específicos. O painel de administração
                permite definir restrições personalizadas, como bloqueio de acesso a determinadas funcionalidades,
                suspensão temporária ou permanente de uma conta, entre outras medidas.</p>
            <p>Lembre-se de agir com responsabilidade ao aplicar restrições, seguindo as diretrizes e políticas da
                plataforma.</p>
        </div>
    </div>

    <div class="image-container">
        <img src="images/adm.gif" alt="Imagem ilustrativa" width="400">
    </div>

    <p class="text-center">Leia atentamente e tenha ciencia de suas atitudes <a href="#" class="link">traga a melhor
        experiência possivel para nossos usuarios!</a>.</p>
</div>
</body>
</html>