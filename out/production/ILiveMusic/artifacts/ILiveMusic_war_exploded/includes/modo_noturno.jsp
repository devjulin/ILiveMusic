<style>
    #modo-btn {
        background-color: #fff;
        color: #333;
        border: 1px solid #333;
        padding: 8px 16px;
        border-radius: 4px;
        cursor: pointer;
    }

    .modo-claro {
        background-color: #fff;
    }

    .modo-claro .table {
        background-color: rgba(255, 255, 255, 0.1);
    }

    .modo-claro th {
        color: #fff;
        background-color: rgba(255, 255, 255, 0.2);
    }

    .modo-claro.album {
        color: #fff;
    }

    .modo-claro tr {
        background-color: rgba(255, 255, 255, 0.05);
    }

    .modo-claro tr:hover {
        background-color: rgba(255, 255, 255, 0.1);
    }

    .modo-claro a,
    .modo-claro p,
    .modo-claro h1,
    .modo-claro h2,
    .modo-claro h3,
    .modo-claro h4,
    .modo-claro h5,
    .modo-escuro .texto-modos {
        color: #333;
    }

    .modo-claro label {
        color: #333;
    }

    .modo-claro tr {
        font-weight: bold;
    }

    .modo-claro td {
        font-weight: bold;
    }

    .modo-claro .input-modificado {
        background-color: #C1CDCD;
    }

    .modo-claro .txt-branco {
        color: white;
    }

    .modo-claro .form {
        background-color: rgba(255, 255, 255, 0.3);
        transition: background-color 1s ease-out;
    }

    .modo-claro .form-login-modificado {
        background-color: rgba(255, 255, 255, 0.8);
        transition: background-color 1s ease-out;
    }

    .modo-claro .bg-editado {
        background-color: rgba(255, 255, 255, 0.5);
        padding: 2%;
        border-radius: 20px;
        box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
    }

    .modo-escuro {
        background-color: #333;
    }

    .modo-escuro a,
    .modo-escuro p,
    .modo-escuro h1,
    .modo-escuro h2,
    .modo-escuro h3,
    .modo-escuro h4,
    .modo-escuro li,
    .modo-escuro .texto-modos,
    .modo-escuro h5 {
        color: #fff;
    }

    .modo-escuro .table {
        background-color: rgba(20, 20, 20, 0.1);
    }

    .modo-escuro th {
        color: #fff;
        background-color: rgba(20, 20, 20, 0.2);
    }

    .modo-escuro .album {
        color: #fff;
    }

    .modo-escuro tr {
        background-color: rgba(20, 20, 20, 0.05);
    }

    .modo-escuro tr:hover {
        background-color: rgba(20, 20, 20, 0.1);
    }

    .modo-escuro .card-header {
        background-color: #414141;
    }

    .modo-escuro .modal-body {
        background-color: rgba(20, 20, 20, 0.3);
    }

    .modo-escuro .modal-header {
        background-color: #414141;
    }

    .modo-escuro .card-body {
        background-color: #212121;
    }

    .modo-escuro .card {
        background-color: #212121;
    }

    .modo-escuro tr {
        background-color: #C1CDCD;
        font-weight: bold;
    }

    .modo-escuro tr:nth-child(even) {
        background-color: gray;
        font-weight: bold;
    }

    .modo-escuro label {
        color: white;
    }

    .modo-escuro .form {
        background-color: rgba(0, 0, 0, 0.4);
        transition: background-color 1s ease-out;
    }

    .modo-escuro .form-login-modificado {
        background-color: rgba(0, 0, 0, 0.8);
        transition: background-color 1s ease-out;
    }

    .modo-escuro .bg-escuro {
        background-color: #333;
    }

    .modo-claro, modal-body, modal {
        background-color: white;
    }

    .btn-link {
        background-color: transparent;
        border: none;
        padding: 0;
        margin-right: 5%;
    }

    body.modo-claro {
        background-color: #fff;
        color: #333;
        transition: background-color 1s ease-out;
    }

    body.modo-escuro {
        background-color: #333;
        color: #fff;
        transition: background-color 1s ease-out;
    }

    .modo-escuro #modo-btn {
        background-color: #212121;; /* cor de fundo no modo escuro */
        color: #fff; /* cor do texto no modo escuro */
    }

    .modo-escuro .bg-editado {
        background-color: rgba(0, 0, 0, 0.5);
        padding: 2%;
        border-radius: 20px;
        box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
    }

</style>