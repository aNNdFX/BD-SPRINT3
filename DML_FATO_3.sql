INSERT INTO Admin (_adminlogin, _adminpassword)
VALUES
('Andre', 'ablublublu'),
('andre', 'ablublublu');

INSERT INTO Cliente (nome_cliente, telefone, email)
VALUES
('João Silva', '11987654321', 'joao@gmail.com'),
('Maria Oliveira', '21912345678', 'maria@hotmail.com'),
('Carlos Pereira', '11999998888', 'carlos.pereira@gmail.com'),
('Ana Santos', '21955554444', 'ana.santos@gmail.com');

INSERT INTO Servico (descricao_servico, preco_base)
VALUES
('Troca de óleo', 100.00),
('Alinhamento e balanceamento', 200.00),
('Revisão completa', 500.00),
('Troca de pneus', 400.00);

INSERT INTO Funcionario (nome_funcionario, cargo, salario)
VALUES
('Carlos Souza', 'Mecânico', 2500.00),
('Ana Pereira', 'Atendente', 1800.00),
('Paulo Silva', 'Supervisor', 3000.00),
('Joana Lima', 'Mecânica', 2600.00);

INSERT INTO Pedido (id_cliente, id_servico, data_pedido, status, valor_estimado)
VALUES
(1, 1, '2024-11-20', 'Concluido', 120.00),
(2, 2, '2024-11-21', 'Concluido', 220.00),
(2, 3, '2024-11-22', 'Pendente', 550.00),
(4, 4, '2024-11-23', 'Cancelado', 450.00);

-- Inserindo na tabela Carro com FOREIGN KEY
INSERT INTO Carro (id_funcionario, modelo, descricao, placa)
VALUES
(1, 'Ford Ka', 'Troca de óleo', 'ASG8I47');

SELECT * FROM Cliente;
SELECT * FROM Fato;
SELECT * FROM Funcionario;
SELECT * FROM Pedido;
SELECT * FROM Servico;
SELECT * FROM Admin;
SELECT * FROM Carro;