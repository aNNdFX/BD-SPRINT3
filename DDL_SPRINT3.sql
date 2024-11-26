DROP DATABASE OficinaMecanica;

-- Criação do banco de dados OficinaMecanica
CREATE DATABASE OficinaMecanica;

-- Uso do banco de dados OficinaMecanica
USE OficinaMecanica;

-- Criação da tabela Cliente
CREATE TABLE Cliente (
    CodCliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Endereco VARCHAR(50),
    Telefone CHAR(11),
    CNH CHAR(11) NOT NULL
);

-- Criação de um índice único no campo CNH
CREATE UNIQUE INDEX IDX_CNH ON
	Cliente(CNH);

-- Criação de um índice no campo Nome
CREATE INDEX IDX_Nome ON
	Cliente(Nome);

-- Criação da tabela Veiculo
CREATE TABLE Veiculo (
    Placa CHAR(7) NOT NULL PRIMARY KEY,
    CodCliente INT,
    Marca VARCHAR(20),
    Modelo VARCHAR(20),
    Ano CHAR(4),
    Renavam CHAR(9)
);

-- Criação de um índice sobre o campo Marca
CREATE INDEX IDX_Marca ON
	Veiculo(Marca);

-- Criação da relação (Chave Estrangeira) Cliente_Veiculo
ALTER TABLE Veiculo ADD
	CONSTRAINT FK_Cliente_Veiculo FOREIGN KEY(CodCliente)
	REFERENCES Cliente(CodCliente);

-- Criação da tabela Mecanico
CREATE TABLE Mecanico (
    CREA CHAR(5) NOT NULL PRIMARY KEY,
    Nome VARCHAR(30) NOT NULL,
    Endereco VARCHAR(50),
    Celular CHAR(11),
    CPF CHAR(11) NOT NULL
);

-- Criação do índice único sobre o campo CPF
CREATE UNIQUE INDEX IDX_CPF ON
	Mecanico(CPF);

-- Criação da tabela Revisão
CREATE TABLE Revisao (
    CodRevisao INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Placa CHAR(7),
    CREA CHAR(5),
    DataHoraRevisao DATETIME,
    ValorRevisao DECIMAL(8 , 2 ),
    Relatorio VARCHAR(200),
    TrocaPecas BIT
);

-- Criação de um índice sobre o campo DataHoraRevisão
CREATE INDEX IDX_DataHoraRevisao ON
	Revisao(DataHoraRevisao DESC);

-- Criação da relação (Chave Estrangeira) Veiculo_Revisão
ALTER TABLE Revisao ADD
	CONSTRAINT FK_Veiculo_Revisao FOREIGN KEY(Placa)
	REFERENCES Veiculo(Placa);

-- Criação da relação (Chave Estrangeira) Mecanico_Revisão
ALTER TABLE Revisao ADD
	CONSTRAINT FK_Mecanico_Revisao FOREIGN KEY(CREA)
	REFERENCES Mecanico(CREA);

-- Criação da tabela VeiculoPesado
CREATE TABLE VeiculoPesado (
    Placa CHAR(7) PRIMARY KEY,
    PesoToneladas DECIMAL(5 , 2 ) NOT NULL,
    NumeroEixos INT NOT NULL,
    ComprimentoMetros DECIMAL(4 , 2 ) NOT NULL
);

-- Criação da ralação (Chave Estrangeira) Veiculo_VeiculoPesado
ALTER TABLE VeiculoPesado ADD
	CONSTRAINT FK_Veiculo_VeiculoPesado FOREIGN KEY(Placa)
	REFERENCES Veiculo(Placa);

