<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/estilo.css">
    <title>MotorPro - Login</title>
</head>
<?php
        session_start();
        include('conexao.php');

        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $_adminlogin = $_POST['_adminlogin'];
            $_adminpassword = $_POST['_adminpassword'];
    
            $sql = "SELECT * FROM Admin WHERE _adminlogin='$_adminlogin' AND _adminpassword='$_adminpassword'";
            $result = $conn->query($sql);
    
           if ($result->num_rows > 0) {
                $_SESSION['_adminlogin'] = $_adminlogin;
                header('Location: index.php');
            } else {
                $error = "Usuário ou senha inválidos.";
            }
        }
    ?>
<body>
    <div class="container">
        <h2>Login</h2>
        <form method="post" action="">
            <label for="_adminlogin">Usuário:</label>
            <input type="text" name="_adminlogin" required>
            <label for="_adminpassword">Senha:</label>
            <input type="password" name="_adminpassword" required>
            <button type="submit">Entrar</button>
            <?php if (isset($error)) echo "<p class='message error'>$error</p>"; ?>
        </form>
    </div>
</body>
</html>