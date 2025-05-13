CREATE DATABASE db_ecommerce;

USE db_ecommerce;

CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255),
    quantidade INT,
    descricao VARCHAR(255),
    valor DECIMAL(8 , 2 ),
    PRIMARY KEY (id)
);

INSERT INTO tb_produtos (nome, quantidade, descricao, valor)
VALUES
("Notebook Dell Inspiron", 15, "Notebook 15'' com SSD 512GB e 16GB RAM", 4599.99),
("Smartphone Galaxy S21", 30, "Smartphone Samsung com 128GB de armazenamento", 3599.00),
("Monitor LG UltraWide", 10, "Monitor 29'' Full HD Ultrawide HDMI", 1499.90),
("Teclado Mecânico Redragon", 50, "Teclado mecânico RGB para jogos", 289.99),
("Mouse Gamer Logitech", 40, "Mouse óptico com 16000 DPI", 349.50),
("Cadeira Gamer ThunderX3", 8, "Cadeira ergonômica com ajuste de altura", 1299.00),
("HD Externo Seagate 2TB", 20, "HD externo USB 3.0 portátil", 479.90),
("Impressora HP DeskJet", 12, "Impressora multifuncional Wi-Fi", 599.00),
("Fonte Corsair 650W", 18, "Fonte modular para PC gamer", 439.99),
("Placa de Vídeo RTX 3060", 5, "Placa de vídeo NVIDIA GeForce RTX 12GB", 2399.99);

SELECT * FROM tb_produtos;

SELECT * FROM tb_produtos WHERE valor >= 500;

SELECT * FROM tb_produtos WHERE valor <= 500;

UPDATE tb_produtos SET quantidade = 10 WHERE id = 9;

