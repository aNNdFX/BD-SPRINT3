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
(1, 1, '2024-11-20', 'Concluído', 120.00),
(2, 2, '2024-11-21', 'Concluído', 220.00),
(3, 3, '2024-11-22', 'Pendente', 550.00),
(4, 4, '2024-11-23', 'Cancelado', 450.00);

INSERT INTO Fato (id_cliente, id_servico, id_funcionario, data_servico, valor_total, duracao_servico)
VALUES
(1, 1, 1, '2024-11-21', 120.00, '01:30:00'),
(2, 2, 1, '2024-11-22', 220.00, '02:00:00'),
(3, 3, 2, '2024-11-23', 550.00, '03:30:00'),
(4, 4, 3, '2024-11-24', 400.00, '02:15:00');

INSERT INTO Admin (_adminlogin, _adminpassword)
VALUES
('Andre', 'ablublublu'),
('andre', 'ablublublu');

SELECT * FROM Cliente;
SELECT * FROM Fato;
SELECT * FROM Funcionario;
SELECT * FROM Pedido;
SELECT * FROM Servico;