-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/

CREATE DATABASE faithsupport;

USE faithsupport;


CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50)
);

CREATE TABLE devocional (
	idDevocional INT PRIMARY KEY AUTO_INCREMENT,
	livro varchar(100),
	capitulo int,
	versiculo INT,
    anotacao varchar(450),
    oracao varchar(450),
    dataHorario datetime,
    fkUsuario int,
	FOREIGN KEY (fkUsuario) REFERENCES usuario(id)
);

create table contato(
idContato int primary key auto_increment,
nome varchar(45),
email varchar(450),
mensagem varchar(450),
dtContato datetime
);

select * from contato;

select * from usuario;

select * from devocional;

SELECT DATE(dataHorario) AS data, COUNT(*) AS total_devocionais
FROM devocional
WHERE fkUsuario = 2
GROUP BY DATE(dataHorario);

-- Inserção de devocionais fictícias
INSERT INTO devocional (livro, capitulo, versiculo, anotacao, oracao, dataHorario, fkUsuario) VALUES
('Mateus', 6, 33, 'Anotação 1', 'Oração 1', '2024-06-01 08:00:00', 2),
('Mateus', 6, 33, 'Anotação 2', 'Oração 2', '2024-06-01 12:00:00', 2),
('Mateus', 6, 33, 'Anotação 3', 'Oração 3', '2024-06-02 08:00:00', 2),
('Mateus', 6, 33, 'Anotação 4', 'Oração 4', '2024-06-03 08:00:00', 2),
('Mateus', 6, 33, 'Anotação 5', 'Oração 5', '2024-06-03 12:00:00', 2);

-- Consulta para verificar se há devocionais feitas em um determinado dia
SELECT COUNT(*) AS total_devocionais
FROM devocional
WHERE DATE(dataHorario) = '2024-06-02' AND fkUsuario = 1;


