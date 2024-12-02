<?php include('conexao.php'); ?>

<?php session_start() ?>

<?php
if (isset($_GET['delete_id'])) {
    $delete_id = $_GET['delete_id'];
    $sql = "DELETE FROM servico WHERE id_servico='$delete_id'";
    if ($conn->query($sql) === TRUE) {
        $mensagem = "Carro excluído com sucesso!";
    } else {
        $mensagem = "Erro ao excluir Carro: " . $conn->error;
    }
}

$servico = $conn->query("SELECT s.descricao_servico, s.preco_base, s.id_servico AS id_servico FROM Servico s");

?>

<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Listagem de Serviços</title>
    <link rel="stylesheet" href="css/estilo.css">
</head>
<body>
    <div class="container">
        <h2>Listagem de Serviços</h2>
        <?php if (isset($mensagem)) echo "<p class='message " . ($conn->error ? "error" : "success") . "'>$mensagem</p>"; ?>
        <table>
            <tr>
                <th>ID</th>
                <th>Descrição</th>
                <th>Preço Base</th>
            </tr>
            <?php while ($row = $servico->fetch_assoc()): ?>
            <tr>
                <td><?php echo $row['id_servico']; ?></td>
                <td><?php echo $row['descricao_servico']; ?></td>
                <td><?php echo $row['preco_base']; ?></td>
                <td>
                    <a href="listagem_servicos.php?edit_id=<?php echo $row['id_servico']; ?>">Editar</a>
                </td>
            </tr>
            <?php endwhile; ?>
        </table>
        <br>
        <a href="index.php">Voltar</a>
    </div>
</body>
</html>
