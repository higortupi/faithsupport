create database venda;
use venda;

create table produto(
idProduto int primary key,
nome varchar(45),
descricao varchar(100),
preco decimal(8,2)
);


insert into produto values(1,"Aspirador de Pó","Aspirador de pó com 5000 de potencia, Marca: Philips",250),
(2,"Geladeira EletroLux","Geladeira Eletrolux 4 portas, Frost-free, Degelo automatico, Marca: Eletrolux",5500),
(3,"Celular Iphone 14","Iphone 14, 256gb de memória, 2 Chips, Display infinito, Marca: Apple",7000),
(4,"Cortinas VestCasa","Cortina VestCasa Cor: Verde, Material: Algodão",100);

select * from produto;

create table cliente(
idCliente int primary key,
nome varchar(45),
email varchar(100),
bairro varchar(60),
cidade varchar(60),
cep char(9),
numero int,
fkIndicador int,
constraint fkClienteIndicador foreign key(fkIndicador)
references cliente(idCliente)
);

insert into cliente values(1,"Higor Tupinambá","higor@hotmail.com","Bairro do Limoeiro","São Paulo","01234-124","12",null);
insert into cliente values(2,"Raphael Veiga","raphael@hotmail.com","Bairro do Chulé","São Paulo","01234-123","11",1);
insert into cliente values(3,"Renato Augusto","renato@hotmail.com","Bairro do Abacate","Osasco","01234-122","16",1);
insert into cliente values(4,"Endrick Felipe","endrick@hotmail.com","Bairro da Maçã","São Caetano","01234-125","22",null);
insert into cliente values(5,"Jhon Jhon","jhon@hotmail.com","Bairro da Pera","São Roque","01234-126","25",4);

select * from cliente;

create table venda(
idVenda int,
fkCliente int,
fkProduto int,
totalVenda decimal(10,2),
dataVenda date,
quantidade int,
desconto decimal(10,2),
constraint pkComposta primary key(idVenda,fkCliente,fkProduto),
constraint fkClienteVenda foreign key (fkCliente) 
references cliente(idCliente),
constraint fkProdutoVenda foreign key (fkProduto)
references produto(idProduto)
);

insert into venda values(1,1,3,null,"2024-05-05",2,0);
insert into venda values(2,1,3,null,"2024-05-05",2,0);
insert into venda values(1,2,4,null,"2024-05-05",1,10);
insert into venda values(2,2,1,null,"2024-05-05",2,0);
insert into venda values(1,3,2,null,"2024-05-05",1,110);
insert into venda values(2,3,4,null,"2024-05-05",2,10);
insert into venda values(1,4,3,null,"2024-05-05",2,400);
insert into venda values(2,4,2,null,"2024-05-05",1,0);
insert into venda values(1,5,3,null,"2024-05-05",1,0);
insert into venda values(2,5,4,null,"2024-05-05",4,30);

select * from venda;

select * from venda join cliente
on fkCliente = idCliente;

select c.nome as NomeCliente,
i.nome as NomeIndicador
from cliente as c join cliente as i
on i.fkIndicador = c.Idcliente;

SELECT c.nome AS Cliente_Indicado, i.nome AS Cliente_Indicador
FROM cliente AS c 
JOIN cliente AS i ON i.idCliente = c.fkIndicador
WHERE i.nome = 'Raphael Veiga'; 

SELECT c1.nome AS Cliente, c2.nome AS Cliente_Indicador, v.*, p.*
FROM cliente AS c1
LEFT JOIN cliente AS c2 ON c1.fkIndicador = c2.idCliente
JOIN venda AS v ON c1.idCliente = v.fkCliente
JOIN produto AS p ON v.fkProduto = p.idProduto;

SELECT v.dataVenda, p.nome AS Produto, v.quantidade
FROM venda AS v
JOIN produto AS p ON v.fkProduto = p.idProduto
WHERE v.idVenda = 1; 

SELECT p.nome AS Produto, p.preco AS Valor_Produto, SUM(v.quantidade) AS Quantidade_Vendida
FROM venda AS v
JOIN produto AS p ON v.fkProduto = p.idProduto
GROUP BY p.nome, p.preco;
