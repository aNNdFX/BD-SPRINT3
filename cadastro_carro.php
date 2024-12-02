<?php include('conexao.php'); ?>

<?php session_start() ?>

<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $_POST['id'];
    $id_funcionario = $_POST['id_funcionario'];
    $modelo = $_POST['modelo'];
    $descricao = $_POST['descricao'];
    $placa = $_POST['placa'];

    if ($id) {
        $sql = "UPDATE carro SET id_funcionario='$id_funcionario', modelo='$modelo', descricao='$descricao', placa='$placa' WHERE id='$id'";
        $mensagem = "Carro atualizado com sucesso!";
    } else {
        $sql = "INSERT INTO carro (id_funcionario, modelo, descricao, placa) VALUES ('$id_funcionario', '$modelo', '$descricao', '$placa')";
        $mensagem = "Carro cadastrado com sucesso!";
    }

    if ($conn->query($sql) !== TRUE) {
        $mensagem = "Erro: " . $conn->error;
    }
}

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

$carro_edit = null;
if (isset($_GET['edit_id'])) {
    $edit_id = $_GET['edit_id'];
    $carro_edit = $conn->query("SELECT * FROM carro WHERE id='$edit_id'")->fetch_assoc();
}

$funcionario = $conn->query("SELECT id_funcionario, nome_funcionario FROM funcionario");
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Carro</title>
    <link rel="stylesheet" href="css/estilo.css">
</head>
<body>
    <div class="container">
        <h2>Cadastro de Carro</h2>
        <form method="post" action="">
            <input type="hidden" name="id" value="<?php echo $carro_edit['id'] ?? ''; ?>">
            <label for="id_funcionario">Mecânico:</label>
            <select name="id_funcionario" required>
                <?php while ($row = $funcionario->fetch_assoc()): ?>
                    <option value="<?php echo $row['id_funcionario']; ?>" <?php if ($carro_edit && $carro_edit['id_funcionario'] == $row['id_funcionario']) echo 'selected'; ?>><?php echo $row['nome_funcionario']; ?></option>
                <?php endwhile; ?>
            </select>
            <label for="modelo">Modelo:</label>
            <input type="text" name="modelo" value="<?php echo $carro_edit['modelo'] ?? ''; ?>" required>
            <label for="descricao">Descrição:</label>
            <textarea name="descricao"><?php echo $carro_edit['descricao'] ?? ''; ?></textarea>
            <label for="placa">Placa:</label>
            <input type="text" name="placa" value="<?php echo $carro_edit['placa'] ?? ''; ?>" required>
            <button type="submit"><?php echo $carro_edit ? 'Atualizar' : 'Cadastrar'; ?></button>
        </form>

        <?php if (isset($mensagem)) echo "<p class='message " . ($conn->error ? "error" : "success") . "'>$mensagem</p>"; ?>

        <h2>Listagem de Carros</h2>
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
                    <a href="?edit_id=<?php echo $row['id']; ?>">Editar</a>
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
