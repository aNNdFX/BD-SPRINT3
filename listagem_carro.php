<?php include('conexao.php'); ?>

<?php session_start() ?>

<?php
if (isset($_GET['delete_id'])) {
    $delete_id = $_GET['delete_id'];
    $sql = "DELETE FROM carro WHERE id='$delete_id'";
    if ($conn->query($sql) === TRUE) {
        $mensagem = "Carro excluído com sucesso!";
    } else {
        $mensagem = "Erro ao excluir Carro: " . $conn->error;
    }
}

$carro = $conn->query("SELECT c.id, c.modelo, c.descricao, c.placa, f.nome_funcionario AS nome_funcionario FROM carro c JOIN funcionario f ON c.id_funcionario = f.id_funcionario");
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Listagem de Carros</title>
    <link rel="stylesheet" href="css/estilo.css">
</head>
<body>
    <div class="container">
        <h2>Listagem de Carros</h2>
        <?php if (isset($mensagem)) echo "<p class='message " . ($conn->error ? "error" : "success") . "'>$mensagem</p>"; ?>
        <table>
            <tr>
                <th>ID</th>
                <th>Modelo</th>
                <th>Descrição</th>
                <th>Placa</th>
                <th>Mecânico</th>
                <th>Ações</th>
            </tr>
            <?php while ($row = $carro->fetch_assoc()): ?>
            <tr>
                <td><?php echo $row['id']; ?></td>
                <td><?php echo $row['modelo']; ?></td>
                <td><?php echo $row['descricao']; ?></td>
                <td><?php echo $row['placa']; ?></td>
                <td><?php echo $row['nome_funcionario']; ?></td>
                <td>
                    <a href="cadastro_carro.php?edit_id=<?php echo $row['id']; ?>">Editar</a>
                    <a href="?delete_id=<?php echo $row['id']; ?>" onclick="return confirm('Tem certeza que deseja excluir?')">Excluir</a>
                </td>
            </tr>
            <?php endwhile; ?>
        </table>
        <br>
        <a href="index.php">Voltar</a>
    </div>
</body>
</html>
