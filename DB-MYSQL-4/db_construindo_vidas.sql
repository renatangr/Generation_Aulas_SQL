DROP DATABASE db_construindo_vidas;

CREATE DATABASE db_construindo_vidas;

USE db_construindo_vidas;

CREATE TABLE tb_categorias (
	id BIGINT AUTO_INCREMENT,
    tipo ENUM('Estrutura', 'Revestimento', 'Acabamento', 'Decoração', 'Outros'),
    fornecedor VARCHAR(100),
    PRIMARY KEY (id)
);
    
CREATE TABLE tb_produtos (
	id BIGINT AUTO_INCREMENT,
    categoria_id BIGINT,
    nome VARCHAR(100),
    preco DECIMAL(6,2),
    quantidade_estoque INT,
    marca VARCHAR(100),
    limite_quantidade_cliente INT,
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (tipo, fornecedor) VALUES
('Estrutura', 'Construcerto Ltda'),
('Revestimento', 'Casa Nova Revestimentos'),
('Acabamento', 'Detalhes Finais'),
('Decoração', 'Estilo & Design'),
('Outros', 'MultiMateriais');

SELECT * FROM tb_categorias;

INSERT INTO tb_produtos (categoria_id, nome, preco, quantidade_estoque, marca, limite_quantidade_cliente) 
VALUES
(1, 'Cimento CP-II', 280.50, 200, 'Votoran', 10),
(1, 'Areia Média Ensacada', 120.00, 150, 'Areial Sul', 20),
(2, 'Porcelanato Branco Brilho 60x60', 175.90, 80, 'Porto Design', 12),
(2, 'Rejunte Acrílico Branco 1kg', 15.00, 100, 'Quartzolit', 5),
(3, 'Interruptor Simples Branco', 9.80, 300, 'Pial Legrand', 15),
(3, 'Torneira de Metal para Lavabo', 89.90, 40, 'Deca', 2),
(4, 'Vaso Decorativo de Cerâmica', 45.00, 60, 'Urban Style', 4),
(5, 'Espuma Expansiva 500ml', 29.90, 70, 'Tekbond', 6);

SELECT * FROM tb_produtos;

-- Faça um SELECT que retorne todes os produtos cujo valor seja maior do que R$ 100,00.
SELECT * FROM tb_produtos WHERE preco >= 100;

-- Faça um SELECT que retorne todes os produtos cujo valor esteja no intervalo R$ 70,00 e R$ 150,00.
SELECT * FROM tb_produtos WHERE preco BETWEEN 70 AND 150;

-- Faça um SELECT utilizando o operador LIKE, buscando todes os produtos que possuam a letra C no atributo nome.
SELECT * FROM tb_produtos WHERE nome LIKE "%C%";

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias.
SELECT 
    p.nome AS 'Nome do Produto',
    c.tipo AS 'Categoria',
    c.fornecedor AS 'Fornecedor',
    CONCAT('R$ ', FORMAT(p.preco, 2, 'pt_BR')) AS 'Preço Unitário'
FROM
    tb_produtos p
        INNER JOIN
    tb_categorias c ON p.categoria_id = c.id;

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias,
-- onde traga apenas os produtos que pertençam a uma categoria específica (Exemplo: Todes os produtos que pertencem a categoria hidráulica).
SELECT 
    p.nome AS 'Nome do Produto',
    c.tipo AS 'Categoria',
    c.fornecedor AS 'Fornecedor',
    CONCAT('R$ ', FORMAT(p.preco, 2, 'pt_BR')) AS 'Preço Unitário'
FROM
    tb_produtos p
        INNER JOIN
    tb_categorias c ON p.categoria_id = c.id
WHERE c.tipo IN('Revestimento','Decoração');
