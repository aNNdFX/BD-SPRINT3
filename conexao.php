<?php

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "motorpro";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn -> connect_error) {
    die("A conexão falhou " . $conn->connect_error);
}

//echo "Conectado com sucesso";
?>