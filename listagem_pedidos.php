<?php include('conexao.php'); ?>

<?php session_start() ?>

<?php
if (isset($_GET['delete_id'])) {
    $delete_id = $_GET['delete_id'];
    $sql = "DELETE FROM pedido WHERE id_pedido='$delete_id'";
    if ($conn->query($sql) === TRUE) {
        $mensagem = "Pedido excluído com sucesso!";
    } else {
        $mensagem = "Erro ao excluir Pedido: " . $conn->error;
    }
}

$pedido = $conn->query("SELECT p.id_pedido, p.data_pedido, p.status, p.valor_estimado, c.id_cliente, s.descricao_servico FROM Pedido p JOIN Cliente c, Servico s LIMIT 14");

?>

<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Listagem de Pedidos</title>
    <link rel="stylesheet" href="css/estilo.css">
</head>
<body>
    <div class="container">
        <h2>Listagem de Pedidos</h2>
        <?php if (isset($mensagem)) echo "<p class='message " . ($conn->error ? "error" : "success") . "'>$mensagem</p>"; ?>
        <table>
            <tr>
                <th>ID</th>
                <th>ID Cliente</th>
                <th>Descrição do Serviço</th>
                <th>Data do Pedido</th>
                <th>Status</th>
                <th>Preço</th>
            </tr>
            <?php while ($row = $pedido->fetch_assoc()): ?>
            <tr>
                <td><?php echo $row['id_pedido']; ?></td>
                <td><?php echo $row['id_cliente']; ?></td>
                <td><?php echo $row['descricao_servico']; ?></td>
                <td><?php echo $row['data_pedido']; ?></td>
                <td><?php echo $row['status']; ?></td>
                <td><?php echo $row['valor_estimado']; ?></td>
                <td>
                    <a href="listagem_pedidos.php?edit_id=<?php echo $row['id_pedido']; ?>">Editar</a>
                </td>
            </tr>
            <?php endwhile; ?>
        </table>
        <br>
        <a href="index.php">Voltar</a>
    </div>
</body>
</html>
