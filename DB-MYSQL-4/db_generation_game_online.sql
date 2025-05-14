DROP DATABASE db_generation_game_online;

CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

CREATE TABLE tb_classes (
    id BIGINT AUTO_INCREMENT,
    nome_classe VARCHAR(100),
    papel VARCHAR(100),
    habilidade_principal VARCHAR(100),
    tipo_dano VARCHAR(100),
    PRIMARY KEY (id)
);

CREATE TABLE tb_personagens (
	id BIGINT AUTO_INCREMENT,
	classe_id BIGINT,
    nome VARCHAR(100),
	vida INT,
	nivel INT,
	valor_habilidade_principal INT,
    poder_ataque INT,
    poder_defesa INT,
	status_personagem ENUM('ativo', 'morto', 'inconsciente'),
	historia TEXT,
	PRIMARY KEY(id),
	FOREIGN KEY(classe_id) REFERENCES tb_classes(id)
);

-- Insira 5 registros na tabela tb_classes
INSERT INTO tb_classes (nome_classe, papel, habilidade_principal, tipo_dano) 
VALUES
	('Guerreira', 'Tank', 'Força', 'Físico'),
	('Maga', 'Damage Per Second', 'Inteligência', 'Mágico'),
	('Arqueira', 'Damage Per Second', 'Destreza', 'À distância'),
	('Clériga', 'Suporte', 'Sabedoria', 'Mágico'),
	('Bárbara', 'Tank/Damage Per Second', 'Constituição', 'Físico');

SELECT * FROM tb_classes;

-- Insira 8 registros na tabela tb_personagens, preenchendo a Chave Estrangeira para criar a relação com a tabela tb_classes
INSERT INTO tb_personagens (nome, classe_id, vida, nivel, valor_habilidade_principal, status_personagem, historia, poder_ataque, poder_defesa) 
VALUES
	('Beyoncé', 1, 11000, 5, 2200, 'ativo', 'Rainha do palco, com uma presença inigualável.', 2800, 2600),
	('Lady Gaga', 2, 9000, 4, 2000, 'ativo', 'Mago da transformação, sempre surpreendendo.', 3000, 1800),
	('Rihanna', 3, 10000, 4, 2100, 'ativo', 'Guerreira à distância, com atitude destemida.', 2600, 2000),
	('Madonna', 4, 8500, 5, 2300, 'ativo', 'Clériga sábia e magnética, líder de sua era.', 1400, 2400),
	('Ariana Grande', 3, 9500, 4, 1900, 'ativo', 'Ágil e precisa, ataca com incrível velocidade.', 2700, 1500),
	('Mariah Carey', 2, 8500, 3, 1800, 'ativo', 'Maga de feitiçarias e notas altas imbatíveis.', 3200, 1200),
	('Shakira', 1, 10500, 4, 2000, 'ativo', 'Guerreira de corpo a corpo com incrível ritmo.', 2500, 2800),
	('Brittney Spears', 5, 11500, 4, 1600, 'ativo', 'Bárbara com força e ataques rápidos e devastadores.', 2900, 2500);
    
-- Faça um SELECT que retorne todes os personagens cujo poder de ataque seja maior do que 2000.
SELECT * FROM tb_personagens WHERE poder_ataque >= 2000;

-- Faça um SELECT que retorne todes os personagens cujo poder de defesa esteja no intervalo 1000 e 2000.
SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;

-- Faça um SELECT utilizando o operador LIKE, buscando todes os personagens que possuam a letra C no atributo nome.
SELECT * FROM tb_personagens WHERE nome LIKE "%C%";

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes.
SELECT * FROM tb_personagens p INNER JOIN tb_classes c ON p.classe_id = c.id;

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes, 
-- onde traga apenas os personagens que pertençam a uma classe específica (Exemplo: Todes os personagens da classe dos arqueiros).
SELECT c.nome_classe, p.nome FROM tb_personagens p INNER JOIN tb_classes c ON p.classe_id = c.id WHERE c.nome_classe IN("Guerreira");

SELECT * FROM tb_personagens;


    