<?php include('conexao.php'); ?>
<?php session_start() ?>
<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id_funcionario = $_POST['id_funcionario'];
    $nome_funcionario = $_POST['nome_funcionario'];
    $cargo = $_POST['cargo'];
    $salario = $_POST['salario'];

    if ($id_funcionario) {
        $sql = "UPDATE funcionario SET nome_funcionario='$nome_funcionario', cargo='$cargo', salario='$salario' WHERE id_funcionario='$id_funcionario'";
        $mensagem = "Funcionario atualizado com sucesso!";
    } else {
        $sql = "INSERT INTO funcionario (nome_funcionario, cargo, salario) VALUES ('$nome_funcionario', '$cargo', '$salario')";
        $mensagem = "Funcionario cadastrado com sucesso!";
    }

    if ($conn->query($sql) !== TRUE) {
        $mensagem = "Erro: " . $conn->error;
    }
} 

//Código para deletar dados.
if (isset($_GET['delete_id'])) {
    $delete_id = $_GET['delete_id'];
    $sql = "DELETE FROM funcionario WHERE id_funcionario='$delete_id'";
    if ($conn->query($sql) === TRUE) {
        $mensagem = "Funcionario excluído com sucesso!";
    } else {
        $mensagem = "Erro ao excluir Funcionario: " . $conn->error;
    }
}

//Código para editar dados.
$funcionario = $conn->query("SELECT * FROM funcionario");

$funcionario_edit = null;

if (isset($_GET['edit_id'])) {
    $edit_id = $_GET['edit_id'];
    $funcionario_edit = $conn->query("SELECT * FROM funcionario WHERE id_funcionario='$edit_id'")->fetch_assoc();
}
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Funcionário</title>
    <link rel="stylesheet" href="css/estilo.css">
</head>
<body>
    <div class="container">
        <h2>Cadastro de Funcionário</h2>
        <form method="post" action="">
            <input type="hidden" name="id_funcionario" value="<?php echo $funcionario_edit['id_funcionario'] ?? ''; ?>" required>
            <label for="nome">Nome:</label>
            <input type="text" name="nome_funcionario" value="<?php echo $funcionario_edit['nome_funcionario'] ?? ''; ?>" required>
            <label for="cargo">Cargo:</label>
            <input type="text" name="cargo" value="<?php echo $funcionario_edit['cargo'] ?? ''; ?>" required>
            <label for="salario">Salario:</label>
            <input type="text" name="salario" value="<?php echo $funcionario_edit['salario'] ?? ''; ?>" required>
            <button type="submit"><?php echo $funcionario_edit ? 'Atualizar' : 'Cadastrar'; ?></button>
        </form>
        <?php if (isset($mensagem)) echo "<p class='message " . ($conn->error ? "error" : "success") . "'>$mensagem</p>"; ?>

        <h2>Listagem de Mecanicos</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Cargo</th>
                <th>Salario</th>
                <th>Ações</th>
            </tr>
            <?php while ($row = $funcionario->fetch_assoc()): ?>
            <tr>
                <td><?php echo $row['id_funcionario']; ?></td>
                <td><?php echo $row['nome_funcionario']; ?></td>
                <td><?php echo $row['cargo']; ?></td>
                <td><?php echo $row['salario']; ?></td>
                <td>
                    <a href="?edit_id=<?php echo $row['id_funcionario']; ?>">Editar</a>
                    <br>
                    <a href="?delete_id=<?php echo $row['id_funcionario']; ?>" onclick="return confirm('Tem certeza que deseja excluir?')">Excluir</a>
                </td>
            </tr>
            <?php endwhile; ?>
        </table>
        <br>
        <a href="index.php">Voltar</a>
    </div>
</body>
</html>