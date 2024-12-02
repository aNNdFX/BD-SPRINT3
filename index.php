<?php
session_start()
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Painel Principal</title>
    <link rel="stylesheet" href="css/estilo.css">
</head>
<body>
    <div class="container">
        <h2>Bem-vindo,  <?php echo $_SESSION['_adminlogin']; ?></h2>
        <ul>
            <li><a href="cadastro_funcionario.php">Cadastro de Mecanicos</a></li>
            <li><a href="cadastro_carro.php">Cadastro de Carros</a></li>
            <li><a href="listagem_carro.php">Listagem de Carros</a></li>
            <li><a href="listagem_servicos.php">Serviços</a></li>
            <li><a href="listagem_pedidos.php">Pedidos</a></li>
            <li><a href="logout.php">Sair</a></li>
        </ul>
    </div>
</body>
</html>