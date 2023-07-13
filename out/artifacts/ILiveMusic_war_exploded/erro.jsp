<%-- 
    Document   : erro
    Created on : 28/04/2023, 17:03:03
    Author     : sala303b
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>ERRO</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<jsp:include page="includes/menus_sidebar/menu.jsp"/>
<h1 class="alert alert-danger">${msg}</h1>
</body>
</html>
