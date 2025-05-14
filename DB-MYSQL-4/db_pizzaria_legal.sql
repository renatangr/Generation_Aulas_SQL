DROP DATABASE db_pizzaria_legal;

CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_categorias (
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(100),
    categoria ENUM('Premium', 'Simples'),
    PRIMARY KEY (id)
);
    
CREATE TABLE tb_pizzas (
	id BIGINT AUTO_INCREMENT,
    categoria_id BIGINT,
    nome VARCHAR(100),
    descricao VARCHAR(255),
    tamanho ENUM('Família', 'Broto'),
    preco DECIMAL(6,2),
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias(nome, categoria) 
VALUES
  	  ("Salgada", 'Premium'),
	  ("Doce", 'Premium'),
	  ("Salgada", 'Simples'),
	  ("Doce", 'Simples'),
      ("Agridoce", 'Simples'),
      ("Agridoce", 'Premium');

SELECT * FROM tb_categorias;

INSERT INTO tb_pizzas (categoria_id, nome, descricao, tamanho, preco) VALUES
(1, 'Quatro Queijos Gourmet', 'Mussarela, parmesão, gorgonzola e catupiry.', 'Família', 59.90),
(1, 'Calabresa Especial', 'Calabresa artesanal com cebola roxa e orégano fresco.', 'Família', 57.50),
(2, 'Brigadeiro Supremo', 'Chocolate ao leite com granulado belga.', 'Família', 52.00),
(2, 'Romeu e Julieta Premium', 'Goiabada cascão com queijo cremoso.', 'Broto', 29.90),
(3, 'Mussarela Tradicional', 'Queijo mussarela e orégano.', 'Família', 42.00),
(3, 'Frango com Catupiry', 'Frango desfiado com catupiry.', 'Broto', 25.00),
(4, 'Banana com Canela', 'Banana, açúcar e canela.', 'Broto', 22.00),
(4, 'Chocolate Simples', 'Chocolate cremoso com confeitos.', 'Família', 38.00),
(5, 'Frango com Abacaxi', 'Frango temperado e pedaços de abacaxi.', 'Família', 40.00),
(6, 'Camarão Tropical', 'Camarão com molho agridoce e manga.', 'Família', 65.00);

SELECT * FROM tb_pizzas;

-- Faça um SELECT que retorne todas as pizzas cujo valor seja maior do que R$ 45,00.
SELECT * FROM tb_pizzas WHERE preco >= 45;

-- Faça um SELECT que retorne todas as pizzas cujo valor esteja no intervalo R$ 50,00 e R$ 100,00.
SELECT * FROM tb_pizzas WHERE preco BETWEEN 50 AND 100;

-- Faça um SELECT utilizando o operador LIKE, buscando todas as pizzas que possuam a letra M no atributo nome.
SELECT * FROM tb_pizzas WHERE nome LIKE "%M%";

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias.
SELECT 
    p.nome AS 'Pizza',
    p.descricao 'Ingredientes',
    c.nome AS 'Sabor',
    c.categoria AS 'Categoria',
    p.tamanho AS 'Tamanho'
FROM
    tb_pizzas p
        INNER JOIN
    tb_categorias c ON p.categoria_id = c.id;

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias, 
-- onde traga apenas as pizzas que pertençam a uma categoria específica (Exemplo: Todas as pizzas que são doce).

SELECT 
    p.nome AS 'Pizza',
    p.descricao 'Ingredientes',
    c.nome AS 'Sabor',
    c.categoria AS 'Categoria',
    p.tamanho AS 'Tamanho'
FROM
    tb_pizzas p
        INNER JOIN
    tb_categorias c ON p.categoria_id = c.id
HAVING c.categoria = 'Premium' AND c.nome = 'Agridoce';

