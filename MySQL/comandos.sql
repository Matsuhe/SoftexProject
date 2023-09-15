--Descrevendo o Banco de Dados
--Categoria (ID_PK,Descricao)
--Marca		(ID_PK,Descricao)
--Produto	(ID_PK,Descricao, Preco, ID_Marca_FK, ID_Categoria_FK)
-- site importante para desligar o full only group: https://tableplus.com/blog/2018/08/mysql-how-to-turn-off-only-full-group-by.html]
--SELECT @@sql_mode;
--SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
-- restart services mysql; 
use sistema_gestao_estoque;
-- Comandos DDL (Data Definition Language)
--Mostrar os banco de dados
SHOW DATABASES;
--criar banco de dados e seleciona-lo
create database sistema_gestao_estoque;
SHOW DATABASES;
use sistema_gestao_estoque;
--criando tabelas
CREATE 	TABLE Categoria (
	ID int auto_increment,
	descricao varchar(255),
	PRIMARY KEY (ID)
);

CREATE 	TABLE Marca (
	ID int auto_increment PRIMARY KEY,
	descricao varchar(255)
);

CREATE 	TABLE Produto (
	ID int auto_increment,
	ID_Marca int,
	ID_Categoria int,
	descricao varchar(255),
	preco DOUBLE (5,2), -- reservando 5 casas decimais e 2 de precisão
	PRIMARY KEY (ID),
	FOREIGN KEY (ID_Marca) REFERENCES Marca(ID),
	FOREIGN KEY (ID_Categoria) REFERENCES Categoria(ID)
);



----------------------------------COMO USAR COMANDOS DDL BÁSICOS CREATE, DESC, SHOW E DROP ---------------------
--Apagar banco de dados:
DROP DATABASE sistema_gestao_estoque;
--Mostrar banco de dados
show databases;
--usar um banco de dados
use sistema_gestao_estoque; 
use sakila; 
--mostrar as tabelas
show tables;
--ver colunas da tabela
desc actor;
--criar tabela
create table tabela_teste (
	-> id int auto_increment,
	-> nome varchar(255),
	-> primary key (id)
	-> );

show TABLES;
	
#excluir tabela
drop table tabela_teste;
#ver categoria
DESC categoria;
#colocar dados em uma tabela
INSERT INTO nomedatabela (descricao) VALUES ("Tênis");
INSERT INTO nomedatabela (descricao) VALUES ("Tênis"),("Sapataos"),("Chinelo ");
#fazer comentarios é --
--comentarios 
#selecionando e mosntrando valores
SELECT descricao FROM categoria
#retorna todas as linhas e todas as colunas da tabela "produto". 
SELECT * FROM produto
#para atualizar tabelas
UPDATE tabela SET descricao = "tenis" where id = 4;
#deletar
DELETE FROM tabela WHERE id = 4;  
##########Junções####################
INNER JOIN / LEFT JOIN / RIGHT JOIN / FULL JOIN


SELECT p.id AS codigo produto,
		p.descricao AS nome produto,
		m.descricao AS nome marca,	
		p.preco AS preco,
		c.descricao AS nome categoria
FROM produto p
INNER JOIN marca m ON (p.id marca = m.id)
INNER JOIN categoria c ON (p.id categoria = c.id)

ORDER BY p.id DESC,	 p.preco ASC;


#Mostrar banco de dados
show databases;
#usar um banco de dados
use sistema_gestao_estoque; 
#mostrar as tabelas
show tables;
#ver colunas da tabela
desc actor;
#criar tabela
create table tabela_teste (
	-> id int auto_increment,
	-> nome varchar(255),
	-> primary key (id)
	-> );
	
#excluir tabela
drop table tabela_teste;
#colocar dados em uma tabela
#INSERT INTO nomedatabela (descricao) VALUES ("Tênis");
---------- Inserindo dados no banco de dados ----------------------
INSERT INTO Categoria (descricao) VALUES ("Tênis"),("Sapatilhas Feminanas"),("Chinelo");
INSERT INTO Marca (descricao) VALUES ("Olympikus"),("Adidas"),("Mizuno"),("Shimano")
,("Grendene");

UPDATE Categoria SET descricao = "Sapatilhas Feminanas" where id = 2;
SELECT ID, descricao from Marca;
SELECT * FROM produto;	
INSERT INTO produto (ID_marca, ID_Categoria, descricao, preco) VALUES
					(1, 1, "Breed 2",89.99);
INSERT INTO produto (ID_Marca, ID_Categoria, descricao, preco) VALUES
					(2, 1, "Duramo lite 2",149.99);
INSERT INTO produto (ID_Marca, ID_Categoria, descricao, preco) VALUES
					(2, 1, "Run Falco Feminino",169.99);
INSERT INTO produto (ID_Marca, ID_Categoria, descricao, preco) VALUES
					(3, 1, "Space Masculino",159.99);
INSERT INTO produto (ID_Marca, ID_Categoria, descricao, preco) VALUES
					(4, 3, "Speed Shwr61",328.99);
INSERT INTO produto (ID_Marca, ID_Categoria, descricao, preco) VALUES
					(5, 3, "Monstrinhos",24.99);
--comentarios 
#selecionando e mosntrando valores
SELECT descricao FROM categoria

#retorna todas as linhas e todas as colunas da tabela "produto". 
SELECT * FROM produto

#para atualizar tabelas
UPDATE produto SET descricao = "Speed Shwr61" where id = 5;
UPDATE produto SET preco = 169.99 where id = 3;
UPDATE produto SET preco = 159.99 where id = 4;

UPDATE produto SET id_categoria = 1 where id = 4;

UPDATE produto SET id_categoria = 2 where id = 5;

#deletar
DELETE FROM tabela WHERE id = 4;  
##########Junções####################
INNER JOIN / LEFT JOIN / RIGHT JOIN / FULL JOIN
--OBS: mysql n tem suporte para full join
--VAMOS INSERIR UM TESTE PARA AS VERIFICAÇÕES
INSERT INTO produto (ID_Marca, ID_Categoria, descricao, preco) VALUES
					(NULL, 2, "Produto Teste",999.99);

--INNER JOIN TESTES
SELECT *from produto p 
INNER JOIN marca m on (p.id_marca = m.id);

SELECT  p.id AS codigo_produto,
		p.descricao AS nome_produto,
		m.descricao AS nome_marca,
		p.preco AS preco
FROM produto p
INNER JOIN marca m ON (p.id_marca = m.id);


--LEFT JOIN TESTES

SELECT  p.id AS codigo_produto,
		p.descricao AS nome_produto,
		m.descricao AS nome_marca,
		p.preco AS preco
FROM produto p
LEFT JOIN marca m ON (p.id_marca = m.id);

--Right JOIN TESTES

SELECT  p.id AS codigo_produto,
		p.descricao AS nome_produto,
		m.descricao AS nome_marca,
		p.preco AS preco
FROM produto p
RIGHT JOIN marca m ON (p.id_marca = m.id);


SELECT  p.id AS codigo_produto,
		p.descricao AS nome_produto,
		m.descricao AS nome_marca,
		p.preco AS preco,
		c.descricao AS nome_categoria
FROM produto p
RIGHT JOIN marca m ON (p.id_marca = m.id)
INNER JOIN categoria c ON (p.id_categoria = c.id);

--ORDER BY xx DESC
--ORDER BY XX ASC
SELECT  p.id AS codigo_produto,
		p.descricao AS nome_produto,
		m.descricao AS nome_marca,
		p.preco AS preco,
		c.descricao AS nome_categoria
FROM produto p
RIGHT JOIN marca m ON (p.id_marca = m.id)
INNER JOIN categoria c ON (p.id_categoria = c.id)
ORDER BY p.preco DESC;

SELECT  p.id AS codigo_produto,
		p.descricao AS nome_produto,
		m.descricao AS nome_marca,
		p.preco AS preco,
		c.descricao AS nome_categoria
FROM produto p
RIGHT JOIN marca m ON (p.id_marca = m.id)
INNER JOIN categoria c ON (p.id_categoria = c.id)
ORDER BY p.id DESC,	 p.preco ASC;


--Filtros == WHERE
SELECT  p.id AS codigo_produto,
		p.descricao AS nome_produto,
		m.descricao AS nome_marca,
		p.preco AS preco,
		c.descricao AS nome_categoria
FROM produto p
RIGHT JOIN marca m ON (p.id_marca = m.id)
INNER JOIN categoria c ON (p.id_categoria = c.id)
WHERE p.descricao = "Breed 2"

SELECT  p.id AS codigo_produto,
		p.descricao AS nome_produto,
		m.descricao AS nome_marca,
		p.preco AS preco,
		c.descricao AS nome_categoria
FROM produto p
RIGHT JOIN marca m ON (p.id_marca = m.id)
INNER JOIN categoria c ON (p.id_categoria = c.id)
WHERE p.preco >=100.00 AND p.preco <= 200.00

--Filtros == LIKE
SELECT  p.id AS codigo_produto,
		p.descricao AS nome_produto,
		m.descricao AS nome_marca,
		p.preco AS preco,
		c.descricao AS nome_categoria
FROM produto p
RIGHT JOIN marca m ON (p.id_marca = m.id)
INNER JOIN categoria c ON (p.id_categoria = c.id)
WHERE p.descricao LIKE "Duramo%"


SELECT  p.id AS codigo_produto,
		p.descricao AS nome_produto,
		m.descricao AS nome_marca,
		p.preco AS preco,
		c.descricao AS nome_categoria
FROM produto p
RIGHT JOIN marca m ON (p.id_marca = m.id)
INNER JOIN categoria c ON (p.id_categoria = c.id)
WHERE p.preco BETWEEN 140.00 and 170.00

------ Parte 2 da criacao do banco de dados --------
CREATE TABLE Cliente(
	ID int auto_increment,
	nome varchar(255),
	cpf char(11),
	dt_nasc date,
	primary key(ID)
);
INSERT INTO Cliente (nome, cpf, dt_nasc) VALUES
("João", "36536578998", "1985-02-25"),
("Maria", "65278641387", "1990-01-02"),
("José", "38967859652", "1955-04-17");
SELECT *FROM Cliente;

CREATE TABLE Compra (
ID int auto_increment,
ID_cliente int,
dt_compra date,
primary key (ID),
foreign key (ID_cliente) references Cliente(ID)
);
INSERT INTO Compra (ID_cliente, dt_compra) VALUES
(1, "2020-05-15"),
(1, "2020-05-22");

SELECT *FROM Compra;

CREATE TABLE Compra_item(
    ID_compra int,
    ID_produto int,
    quantidade int,
    preco_unitario double,
    valor_total double,
    primary key(ID_compra, ID_produto),
    foreign key (ID_compra) references Compra(ID),
    foreign key (ID_produto) references Produto(ID)
);

INSERT INTO Compra_item (ID_compra, ID_produto, quantidade, preco_unitario, valor_total) VALUES
(1, 1, 2, 89.99, 179.98),
(1, 7, 2, 24.99, 49.98),
(2, 5, 10, 328.90, 3289.00);

SELECT *FROM Compra_item;


---------Caso de algo de errado retire e faça novamente---
DROP TABLE Cliente;
DROP TABLE Compra;
DROP TABLE Compra_item;


--Inserção de novos dados do banco de dados

-- GROUP BY 
SELECT c.id AS codigo_cliente,
	   c.nome,
	   co.dt_compra
FROM cliente c
INNER JOIN compra co ON (co.id_cliente = c.id);

SELECT c.id AS codigo_cliente,
	   c.nome,
	   co.dt_compra
FROM cliente c
LEFT JOIN compra co ON (co.id_cliente = c.id);

--Codigo com erro desmosntrado na aula
SELECT c.id AS codigo_cliente,
	   c.nome,
	   co.dt_compra
FROM cliente c
LEFT JOIN compra co ON (co.id_cliente = c.id)
GROUP BY c.id;

--Codigo adaptado
SELECT c.id AS codigo_cliente,
       c.nome,
       MAX(co.dt_compra) AS data_ultima_compra -- ou usar o min
FROM cliente c
LEFT JOIN compra co ON (co.id_cliente = c.id)
GROUP BY c.id, c.nome;

--erro novamente
SELECT c.id AS codigo_cliente,
       c.nome,
       DATE_FORMAT(c.dt_nasc, "%d/%m/%Y") AS data_nascimento,
       DATE_FORMAT(co.dt_compra, "%d/%m/%Y") AS data_compra
FROM cliente c
LEFT JOIN compra co ON (co.id_cliente = c.id)
GROUP BY c.id;

--adaptado
SELECT c.id AS codigo_cliente,
       c.nome,
       MIN(DATE_FORMAT(c.dt_nasc, "%d/%m/%Y")) AS data_nascimento,
       MIN(DATE_FORMAT(co.dt_compra, "%d/%m/%Y")) AS data_primeira_compra
FROM cliente c
LEFT JOIN compra co ON (co.id_cliente = c.id)
GROUP BY c.id, c.nome;


--GROUP BY + FUNCOES SUM , COUNT  e AVG

SELECT c.id AS codigo_cliente,
       c.nome,
       MIN(DATE_FORMAT(c.dt_nasc, "%d/%m/%Y")) AS data_nascimento,
       MIN(DATE_FORMAT(co.dt_compra, "%d/%m/%Y")) AS data_compra,
       SUM(ci.valor_total) AS valor_total_compra
FROM cliente c
LEFT JOIN compra co ON (co.id_cliente = c.id)
INNER JOIN compra_item ci ON (ci.id_compra = co.id)
GROUP BY c.id;

SELECT c.id AS codigo_cliente,
       c.nome,
       MIN(DATE_FORMAT(c.dt_nasc, "%d/%m/%Y")) AS data_nascimento,
       MIN(DATE_FORMAT(co.dt_compra, "%d/%m/%Y")) AS data_compra,
       SUM(ci.valor_total) AS valor_total_compra
FROM cliente c
LEFT JOIN compra co ON (co.id_cliente = c.id)
INNER JOIN compra_item ci ON (ci.id_compra = co.id)
GROUP BY co.id, c.nome;

SELECT c.id AS codigo_cliente,
       c.nome,
       MIN(DATE_FORMAT(c.dt_nasc, "%d/%m/%Y")) AS data_nascimento,
       MIN(DATE_FORMAT(co.dt_compra, "%d/%m/%Y")) AS data_compra,
       SUM(ci.valor_total) AS valor_total_compra,
	   COUNT (co.id) quantidade_vezes_comprou
FROM cliente c
LEFT JOIN compra co ON (co.id_cliente = c.id)
LEFT JOIN compra_item ci ON (ci.id_compra = co.id)
GROUP BY c.id;


-- GROUP BY + AVG
SELECT c.nome AS nome_cliente,
       AVG(ci.valor_total) AS media_valor
FROM compra co
JOIN compra_item ci ON (ci.id_compra = co.id)
JOIN cliente c ON (c.id = co.id_cliente)
GROUP BY c.id;


--FUNÇÕES DE AGREGAÇÃO: MIN, MAX, CLAUSULA HAVING e Sub query
DELETE FROM produto WHERE id = 6;  
-- Qual é o preço médio dos produtos em geral
select avg(p.preco) as preco_medio FROM produto p


-- Qual é o preço médio por categoria?
SELECT c.descricao as nome_categoria,
		avg(p.preco) as preco_medio
from produto p
INNER JOIN categoria c ON (c.id = p.id_categoria)
GROUP BY p.id_categoria;

-- Quais categorias tem o preço medio maior que 100 reais?
--HAVING = "desde que"
SELECT c.descricao as nome_categoria,
		avg(p.preco) as preco_medio
from produto p
INNER JOIN categoria c ON (c.id = p.id_categoria)
GROUP BY p.id_categoria HAVING avg(p.preco) > 100;


-- Qual(is) categorias tem produtos cujo preço é maior que a media dos demais preços?
SELECT c.descricao as nome_categoria,
		avg(p.preco) as preco_medio
from produto p
INNER JOIN categoria c ON (c.id = p.id_categoria)
GROUP BY p.id_categoria HAVING avg(p.preco) > (select avg(preco) FROM produto );

-- preço do produt mais caro de cada categoria	
 SELECT c.descricao as nomeCategoria,
		MAX(p.preco) as ProdutoMaisCaro
 from produto p
 INNER JOIN Categoria c ON (c.id = p.id_categoria)
 GROUP BY p.id_categoria;

-- Qual é o produto mais caro de cada marca?
SELECT m.descricao AS nomeMarca,
MAX(p.preco) AS PrecoMaisCaro
FROM produto p
JOIN marca m ON (m.id = p.id_marca)
GROUP BY p.id_marca;

-- Qual é o produto mais caro de todos?
SELECT MAX(p.preco) from produto p;
--outro modo
SELECT * FROM produto p  WHERE p.preco = (SELECT MAX(preco) from produto );
-- completo
SELECT p.descricao AS nome_produto,
p.preco AS preco,
m.descricao AS nome_marca,
C.descricao AS nome_categoria
FROM produto p
JOIN marca m ON (m.id = p.id_marca)
JOIN categoria c ON (c.id = p.id_categoria)
WHERE p.preco = (SELECT MAX(preco) FROM produto);

-- Qual é o produto mais barato de todos?
SELECT p.descricao AS nome_produto,
p.preco AS preco,
m.descricao AS nome_marca,
C.descricao AS nome_categoria
FROM produto p
JOIN marca m ON (m.id = p.id_marca)
JOIN categoria c ON (c.id = p.id_categoria)
WHERE p.preco = (SELECT MIN(preco) FROM produto);

-- Quais produtos custam acima da média dos demais?

SELECT p.descricao AS nome_produto,
MAX(p.preco) AS preco_mais_caro
FROM produto p
GROUP BY p.id HAVING MAX(p.preco) > (SELECT AVG(preco) FROM produto)

-- FUNÇÕES MAIS COMUNS PARA TRABALHARMOS COM DATAS NO MYSQL

-- CURDATE() Retorna a data atual no formato aaaa-mm-dd.
SELECT CURDATE();
-- CURTIME() Retorna a hora atual no formato hh:mm:ss
SELECT CURTIME();
-- NOW()
SELECT NOW();

--------------------- EXTRAÇÃO DE INFORMAÇÕES ----------

-- DATE FORMAT(D, <formato>) Retorna a data D no formato especificado

-- YEAR(D) Retorna o ano de uma data D
SELECT YEAR('2020-06-23');	
SELECT YEAR(CURDATE()) as ano_atual;
-- MONTH(D) Retorna o mês de uma data D
SELECT MONTH(CURRENT_DATE) asmes_atual;
-- DAY(D) Retorna o dia de uma data D
SELECT DAY(CURRENT_TIMESTAMP) as dia_atual;
-- WEEKDAY(D) Retorna o dia da semana que inicia com segunda-feira para uma data D
SELECT WEEKDAY ('2020-06-23') as dia_semana;
-- WEEK(D) Retorna a semana do ano para a data D
SELECT WEEK ('2020-06-23') as dia_semana;

------------------ OPERAÇÕES COM DATAS:
--DATEDIFF
SELECT DATEDIFF(CURRENT_DATE,'2022-09-13') AS dias;
--TIMESTAMPDIFF
SELECT TIMESTAMPDIFF(DAY,'2023-03-20',CURRENT_DATE) as dias_quarentena;



-- CONTINUAÇÃO FUNÇÕES DE DATA E TEMPO
-- http://sqglfiddle.com/
-- DATE ADD (data, INTERVAL)|
--Adiciona um intervalo à data. A data pode ser uma data seguida de um horário.
-- O intervalo a ser somado pode ser em dias, dias e horas e minutos, dias e segundos, minutos e segundos.
 SELECT DATE_ADD("2017-06-15", INTERVAL 10 DAY);

-- DATE SUB (data, INTERVAL)
-- Subtrai um intervalo à data. A data pode ser uma data seguida de um horário.
-- O intervalo a ser subtraído pode ser em dias, dias e horas e minutos, dias e segundos, minutos e segundos.

 SELECT DATE_SUB('2009-09-22', INTERVAL 2 DAY);
-- SELECT DATE SUB('2009-09-22', INTERVAL 2 MONTH);
-- SELECT DATE SUB('2009-09-22', INTERVAL 2 YEAR);

SELECT LAST_DAY(CURRENT_DATE);
SELECT DAY(LAST_DAY(CURRENT_DATE)) as ultimo_dia;

-- FUNÇÕES PARA TRABALHAR COM HORAS - TEMPO HH:MM:SS
-- CURTIME() CURRENT TIME() CURRENT TIME, CURRENT TIMESTAMH

-- FUNÇÕES DE EXTRAÇÃO
-- HOUR(), MINUTE() E SECOND()
SELECT HOUR(CURRENT_TIME) AS hora_agora;
SELECT MINUTE (CURRENT_TIME) AS minuto_agora;
SELECT SECOND (CURRENT_TIME) AS segundo_agora;
-- TIME FORMAT()
-- %h  Hora (01..12)
-- %H  Hora (00..23)
-- $i  Minutos, numérico (00..59)
-- %s  Segundos (00..59)
-- %r  Tempo, 12 horas (hh:mm:ss seguido por AM ou Pm)
-- %T  Horário, 24 horas (hh:mm:ss)

SELECT TIME_FORMAT (CURRENT_TIME, '%r') AS hora_agora;


-- TIME()
SELECT TIME(CURRENT_TIMESTAMP);

-- SEC TO TIME()

-- Converter 1000 segundos em formato de hora (hh:mm:ss)
SELECT SEC_TO_TIME(1000);

-- Extrair os minutos do valor convertido (hh:mm:ss)
SELECT MINUTE(SEC_TO_TIME(1000));

-- Converter uma string de tempo ('00:16:40') em segundos
SELECT TIME_TO_SEC('00:16:40');

-- Converter a hora atual em segundos
SELECT TIME_TO_SEC(CURRENT_TIME);

-- Calcular a diferença de tempo entre duas datas e horas
SELECT TIMEDIFF('2017-06-25 13:10:11', '2017-06-15 13:10:10');

SELECT MONTH(CURRENT_TIME) 

SELECT CURRENT_DATE;

-- FUNÇÕES PARA TRABALHAR COM STRINGS

-- name: tIAGO anTONIO DA silvA 
SET @nome = 'tIAGO anTONIO DA silvA';

-- LOWER = todas minusculas
SELECT LOWER(@nome);
-- UPPER = todas maiusculas
SELECT UPPER(@nome);
-- LENGTH = conta caracteres
SELECT LENGTH (@nome);
-- SUBSTRING = cora uma string com base em posições
SELECT SUBSTRING(@nome,1,5);
-- RTRIM = remove espaços no final de uma string
SELECT LENGTH (@nome); -- 22 chars
SELECT LENGTH ('tIAGO anTONIO DA silvA   '); -- 25 char
SELECT LENGTH (RTRIM('tIAGO anTONIO DA silvA   ')); -- 22
-- LTRIM = remove espaços a esquerda de uma string
SELECT LENGTH (@nome); -- 22 chars
SELECT LENGTH ('    tIAGO anTONIO DA silvA'); -- 26
SELECT LENGTH (LTRIM('  tIAGO anTONIO DA silvA')); -- 22
SELECT LENGTH (TRIM('   tIAGO anTONIO DA silvA    '));
-- REPLACE = substitui uma ocorrencia na string
SELECT REPLACE('TIAGO da SILVA','da','DA');
-- FORMAT = adiciona casas decimais numa string US
SELECT FORMAT("100000",2);

-- FUNÇÕES MATEMÁTICAS COMUNS: ARREDONDAMENTOS NÃO TÃO CORRIQUEIRAS
SELECT FLAOR(9.563);

SELECT CEIL(9.563);

SELECT TRUNCATE(9.563, 2);

SELECT ABS(-243.5);

SELECT MOD(3, 2);

SELECT POW(4, 2);

SELECT SQRT(64);

SELECT RAND();

SELECT GREATEST(3, 12, 34, 8, 25);






