USE OficinaMecanica;

DESCRIBE Cliente;

SELECT *
FROM Cliente;

-- Preenchimento da tabela Cliente
INSERT INTO Cliente(Nome, Endereco, Telefone, CNH)
	VALUES('João da Silva', 'Rua Dez, 20 - Vila Verde', '1144556677', '12234456678');
INSERT INTO Cliente(Nome, Endereco, Telefone, CNH)
	VALUES('Maria dos Santos', 'Rua Onze, 12 - Parque Paulada', '11998765432', '23345567789');
INSERT INTO Cliente(Nome, Endereco, Telefone, CNH)
	VALUES('Roberto Borges', 'Rua Doze, 13 - Vila Velha', '1145678901', '34456678890');
INSERT INTO Cliente(Nome, Endereco, Telefone, CNH)
	VALUES('Paula Margareth', 'Rua Treze, 14 - Parque Pan', '1144445567', '45567789901');
INSERT INTO Cliente(Nome, Endereco, Telefone, CNH)
	VALUES('Mario Castilho', 'Rua Catorze, 15 - Vila Vento', '1144434323', '56678890012');
INSERT INTO Cliente(Nome, Endereco, Telefone, CNH)
	VALUES('Adriano Braulio', 'Rua Quinze, 16 - Jardim Júpter', '11967789001', '67789901123');
INSERT INTO Cliente(Nome, Endereco, Telefone, CNH)
	VALUES('Henrique Romeu Pinto', 'Rua Dezesseis, 17 - Vila Vergalhão', '1144333223', '78890012234');

DESCRIBE Veiculo;

SELECT *
FROM Veiculo;

-- Inserindo dados na tabela Veiculo
INSERT INTO Veiculo(Placa, CodCliente, Marca, Modelo, Ano, Renavam)
	VALUES('ABC1234', 1, 'VW', 'Gol', '2010', '122344566');
INSERT INTO Veiculo(Placa, CodCliente, Marca, Modelo, Ano, Renavam)
	VALUES('BCD2345', 5, 'GM', 'Classic', '2012', '233455677');
INSERT INTO Veiculo(Placa, CodCliente, Marca, Modelo, Ano, Renavam)
	VALUES('CDE3456', 1, 'Scanea', 'Truck', '2005', '344566788');
INSERT INTO Veiculo(Placa, CodCliente, Marca, Modelo, Ano, Renavam)
	VALUES('DEF4567', 4, 'Honda', 'Titan', '2008', '455677899');
INSERT INTO Veiculo(Placa, CodCliente, Marca, Modelo, Ano, Renavam)
	VALUES('EFG5678', 3, 'Mercedes', 'Acelo', '2009', '566788900');
INSERT INTO Veiculo(Placa, CodCliente, Marca, Modelo, Ano, Renavam)
	VALUES('FGH6789', 5, 'Volvo', 'F', '2013', '677899011');
INSERT INTO Veiculo(Placa, Marca, Modelo, Ano, Renavam)
	VALUES('GHI7890', 'Volkswagen', 'Worker', '2010', '788900122');
INSERT INTO Veiculo(Placa, Marca, Modelo, Ano, Renavam)
	VALUES('HIJ8901', 'Iveco', '15219', '2005', '899011233');

DESCRIBE Mecanico;

SELECT *
FROM Mecanico;

-- Inserindo dados na tabela Mecanico
INSERT INTO Mecanico(CREA, Nome, Endereco, Celular, CPF)
	VALUES('12345', 'Joaquim Pereira', 'Rua Vinte, 30', '11988776655', '12345678901');
INSERT INTO Mecanico(CREA, Nome, Endereco, Celular, CPF)
	VALUES('23456', 'Renata Ferreira', 'Rua Trinta, 40', '11977665544', '23456789012');
INSERT INTO Mecanico(CREA, Nome, Endereco, Celular, CPF)
	VALUES('34567', 'Roberto Figueira', 'Rua Quarenta, 50', '11966554433', '34567890123');
INSERT INTO Mecanico(CREA, Nome, Endereco, Celular, CPF)
	VALUES('45678', 'Carlos Pitangueira', 'Rua Cinquenta, 60', '11955443322', '45678901234');
INSERT INTO Mecanico(CREA, Nome, Endereco, Celular, CPF)
	VALUES('56789', 'Ronaldo Gafieira', 'Rua Sessenta, 70', '11944332211', '56789012345');

DESCRIBE Revisao;

SELECT *
FROM Revisao;

UPDATE Revisao
SET Placa = 'ABC1234'
WHERE CodRevisao = 2;

UPDATE Revisao
SET CREA = NULL
WHERE CodRevisao = 2;

-- DELETE FROM Mecanico
-- WHERE CREA = '12345';


-- Inserindo dados na tabela Revisão
INSERT INTO Revisao(Placa, CREA, DataHoraRevisao, ValorRevisao, Relatorio, TrocaPecas)
	VALUES('EFG5678', '12345', '2014-04-15 10:00', 315.25, 'Revisão geral do auto, troca de óleo e alinhamento', 0);
INSERT INTO Revisao(Placa, CREA, DataHoraRevisao, ValorRevisao, Relatorio, TrocaPecas)
	VALUE(NULL, NULL, '2014-04-15 08:00', 200.25, 'Alinhamento e balanceamento', 0);
INSERT INTO Revisao(Placa, CREA, DataHoraRevisao)
	VALUE('DEF4567', '23456', '2014-04-16 08:00');
INSERT INTO Revisao(Placa, CREA, DataHoraRevisao)
	VALUES('CDE3456', '12345', '2014-04-16 10:00');
INSERT INTO Revisao(Placa, CREA, DataHoraRevisao)
	VALUES('DEF4567', '34567', '2014-04-16 14:00');

DESCRIBE VeiculoPesado;

SELECT *
FROM VeiculoPesado;

-- Inserindo dados na tabela VeiculoPesado
INSERT INTO VeiculoPesado(Placa, PesoToneladas, NumeroEixos, ComprimentoMetros)
	VALUES('CDE3456', 54.750, 6, 12.25);
INSERT INTO VeiculoPesado(Placa, PesoToneladas, NumeroEixos, ComprimentoMetros)
	VALUES('EFG5678', 40.0, 8, 8.50);
INSERT INTO VeiculoPesado(Placa, PesoToneladas, NumeroEixos, ComprimentoMetros)
	VALUES('FGH6789', 35.0, 6, 10.0);
INSERT INTO VeiculoPesado(Placa, PesoToneladas, NumeroEixos, ComprimentoMetros)
	VALUES('GHI7890', 40.0, 8, 12.75);
INSERT INTO VeiculoPesado(Placa, PesoToneladas, NumeroEixos, ComprimentoMetros)
	VALUES('HIJ8901', 20.0, 8, 11.5);

-- Exercício 1
select *
from Cliente
where CodCliente > 5;

-- Exercício 2
select Placa, Marca, Modelo
from Veiculo;

-- Exercício 3
select Placa, Relatorio, DataHoraRevisao
from Revisao
where DataHoraRevisao = 2014-04-18;

-- Exercício 4
select c.Nome, c.Telefone, v.placa, v.marca, v.modelo, v.ano
from Cliente as c, Veiculo as v
where c.CodCliente = v.CodCliente;

-- Exercício 5
select v.Placa, v.Marca, v.Modelo, vp.NumeroEixos, vp.PesoToneladas
from Veiculo as v, VeiculoPesado as vp
where v.Placa = vp.Placa;

-- Exercício 6
select Nome, CNH, Endereco
from Cliente
where CodCliente <> 5;

-- Exercício 7
select Nome, Telefone
from Cliente
where Nome like 'A%';

-- Exercício 8
select Placa, ComprimentoMetros, PesoToneladas
from VeiculoPesado
where ComprimentoMetros >= 12 and PesoToneladas >= 35;

-- Exercício 9
select Placa, Marca, Modelo
from Veiculo
where Ano >= 2000 and Ano <= 2005;

-- Exercício 10
select Nome, Endereco, Celular
from Mecanico
where CREA = 12345 or CREA = 34567 or CREA = 56789;