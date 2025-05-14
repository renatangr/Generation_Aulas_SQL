DROP DATABASE cidade_dos_vegetais;

CREATE DATABASE cidade_dos_vegetais;

USE cidade_dos_vegetais;

CREATE TABLE tb_categorias (
	id BIGINT AUTO_INCREMENT,
    tipo ENUM('Legume', 'Fruta', 'Verdura', 'Outros', 'Tempero'),
    fornecedor VARCHAR(100),
    PRIMARY KEY (id)
);
    
CREATE TABLE tb_produtos (
	id BIGINT AUTO_INCREMENT,
    categoria_id BIGINT,
    nome VARCHAR(100),
    preco DECIMAL(6,2),
    dtvalidade DATE,
    quantidade_estoque INT,
    peso_unitario_medio_g DECIMAL (5,2),
    selo_organico BOOLEAN,
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (tipo, fornecedor) VALUES
('Verdura', 'VerdeVida Orgânicos'),       
('Legume', 'Raiz Forte Distribuidora'),   
('Fruta', 'Frutaria do Vale'),            
('Tempero', 'Ervas da Serra'),            
('Outros', 'Natureza Alternativa');

SELECT * FROM tb_categorias;

INSERT INTO tb_produtos ( categoria_id, nome, preco, dtvalidade, quantidade_estoque, peso_unitario_medio_g, selo_organico) 
VALUES
	(1, 'Alface Roxa', 3.80, '2025-05-30', 100, 150, TRUE),
	(1, 'Couve Manteiga', 4.20, '2025-06-02', 90, 200, TRUE),
	(2, 'Batata Inglesa', 3.50, '2025-06-15', 150, 300, FALSE),
	(2, 'Inhame', 5.00, '2025-06-18', 70, 350, TRUE),
	(3, 'Banana Prata', 6.00, '2025-05-25', 120, 120, FALSE),
	(3, 'Manga Palmer', 7.80, '2025-06-10', 80, 500, FALSE),
	(4, 'Salsinha', 1.90, '2025-05-20', 60, 40, TRUE),
	(4, 'Cebolinha Verde', 2.10, '2025-05-22', 55, 50, TRUE),
	(5, 'Broto de Alfafa', 9.00, '2025-05-24', 40, 100, TRUE),
	(5, 'Tofu Artesanal', 55.00, '2025-06-01', 30, 250, TRUE);
    
SELECT * FROM tb_produtos;

-- Faça um SELECT que retorne todes os produtos cujo valor seja maior do que R$ 50,00.
SELECT * FROM tb_produtos WHERE preco >= 50;

-- Faça um SELECT que retorne todes os produtos cujo valor esteja no intervalo R$ 50,00 e R$ 150,00.
SELECT * FROM tb_produtos WHERE preco <= 50;

-- Faça um SELECT utilizando o operador LIKE, buscando todes os produtos que possuam a letra C no atributo nome.
SELECT * FROM tb_produtos WHERE nome LIKE "%C%";

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias.
SELECT @@lc_time_names;
SET lc_time_names = 'pt_BR';

SELECT 
    p.nome AS 'Nome do Produto',
    c.tipo AS 'Categoria',
    CONCAT('R$ ', FORMAT(p.preco, 2, 'pt_BR')) AS 'Preço Unitário',
    DATE_FORMAT(p.dtvalidade, '%d de %M de %Y') AS 'Data de Validade'
FROM
    tb_produtos p
        INNER JOIN
    tb_categorias c ON p.categoria_id = c.id;

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias,
-- onde traga apenas os produtos que pertençam a uma categoria específica (Exemplo: Todes os produtos que pertencem a categoria aves ou frutas)

SELECT 
    p.nome AS 'Nome do Produto',
    IF(p.selo_organico, 'Sim', 'Não') AS 'Possui selo orgânico?',
    c.tipo AS 'Categoria',
    CONCAT('R$ ', FORMAT(p.preco, 2, 'pt_BR')) AS 'Preço Unitário',
    DATE_FORMAT(p.dtvalidade, '%d de %M de %Y') AS 'Data de Validade'
FROM
    tb_produtos p
        INNER JOIN
    tb_categorias c ON p.categoria_id = c.id
WHERE p.selo_organico = 1 AND c.tipo IN('Fruta', 'Legume','Outros');
