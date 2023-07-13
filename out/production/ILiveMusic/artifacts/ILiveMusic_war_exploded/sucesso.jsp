<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Painel de Administra��o</title>
    <!-- Inclua os arquivos CSS do Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <style>
        /* Estilos personalizados */
        .success-box {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            padding: 10px;
            background-color: #28a745;
            color: #fff;
            display: none;
        }
    </style>
</head>
<body>
<!-- Caixa de sucesso de login -->
<div class="success-box">
    Login realizado com sucesso!
</div>

<!-- Seu c�digo HTML existente -->
<!-- ... -->

<!-- Inclua os arquivos JavaScript do Bootstrap -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script>
    // Exibir a caixa de sucesso de login
    function showSuccessBox() {
        document.querySelector('.success-box').style.display = 'block';
    }
</script>
</body>
</html>
