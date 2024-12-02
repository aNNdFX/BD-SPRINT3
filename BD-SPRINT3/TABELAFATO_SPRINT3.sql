-- tabelas FATO e DIMENSIONADA

DROP DATABASE IF EXISTS motorpro;

CREATE DATABASE motorpro;

USE motorpro;

CREATE TABLE Admin (
_adminlogin varchar(10),
_adminpassword varchar(10)
);

CREATE TABLE Servico (
id_servico INT AUTO_INCREMENT PRIMARY KEY,
descricao_servico VARCHAR(100) NOT NULL,
preco_base DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Cliente (
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
nome_cliente VARCHAR(100) NOT NULL,
telefone VARCHAR(15),
email VARCHAR(100),
CNH CHAR(11)
);

CREATE TABLE Funcionario (
id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
nome_funcionario VARCHAR(100) NOT NULL,
cargo VARCHAR(50),
salario DECIMAL(10, 2)
);

CREATE TABLE Carro (
id INT AUTO_INCREMENT PRIMARY KEY,
id_funcionario INT,
modelo VARCHAR(100) NOT NULL,
descricao TEXT,
placa VARCHAR(8),
FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
);

CREATE TABLE Pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_servico INT NOT NULL,
    data_pedido DATE NOT NULL,
    status VARCHAR(50) NOT NULL CHECK (status IN ('Pendente', 'Concluido', 'Cancelado')),
    valor_estimado DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_servico) REFERENCES Servico(id_servico)
);


CREATE TABLE Fato (
id_fato INT AUTO_INCREMENT PRIMARY  KEY,
id_cliente INT NOT NULL,
id_servico INT NOT NULL,
id_funcionario INT NOT NULL,
data_servico DATE NOT NULL,
valor_total DECIMAL(10, 2)NOT NULL,
duracao_servico TIME NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
FOREIGN KEY (id_servico) REFERENCES Servico(id_servico),
FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id_funcionario)
);
