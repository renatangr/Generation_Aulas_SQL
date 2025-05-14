DROP DATABASE db_curso_da_minha_vida;

CREATE DATABASE db_curso_da_minha_vida;

USE db_curso_da_minha_vida;

CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    coordenador_categoria VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE tb_cursos (
    id BIGINT AUTO_INCREMENT,
    categoria_id BIGINT,
    nome VARCHAR(150),
    valor DECIMAL (6,2),
    descricao VARCHAR(255),
    duracao_horas DECIMAL(4,2),
    nivel ENUM('Iniciante', 'Intermediário', 'Avançado'),
    promo_gratuito BOOLEAN,
    instrutor VARCHAR(100),
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (nome, coordenador_categoria) 
VALUES
	('Tecnologia da Informação', 'Paula Mendes'),
	('Negócios e Empreendedorismo', 'Rosana Lima'),
	('Design e Criatividade', 'Juliana Rocha'),
	('Idiomas', 'Rosana Lima'),
	('Saúde e Bem-Estar', 'Marina Duarte');

SELECT * FROM tb_categorias;

INSERT INTO tb_cursos (categoria_id, nome, valor, descricao, duracao_horas, nivel, promo_gratuito, instrutor) 
VALUES
	(1, 'Lógica de Programação com Java', 1909.90, 'Aprenda os fundamentos da programação com Java desde o zero.', 40.00, 'Iniciante', FALSE, 'André Silveira'),
	(1, 'Desenvolvimento Web Full Stack', 2330.00, 'Curso gratuito e completo de front-end e back-end com projetos práticos.', 60.00, 'Intermediário', TRUE, 'Camila Vieira'),
	(1, 'Banco de Dados com MySQL', 1590.00, 'Domine modelagem, SQL e consultas em banco de dados relacionais.', 30.00, 'Iniciante', FALSE, 'Eduardo Braga'),
	(2, 'Como Montar seu Primeiro Negócio', 890.90, 'Aprenda o passo a passo para tirar sua ideia do papel.', 25.00, 'Iniciante', FALSE, 'Fernanda Azevedo'),
	(2, 'Gestão Financeira para Pequenas Empresas', 1200.00, 'Organize as finanças do seu negócio e aumente sua margem de lucro.', 35.00, 'Intermediário', FALSE, 'Carlos Soares'),
	(3, 'Design Gráfico com Canva', 2210.00, 'Curso gratuito de criação visual para redes sociais e marcas pessoais.', 20.00, 'Iniciante', TRUE, 'Juliana Rocha'),
	(3, 'UX/UI Design para Iniciantes', 210.00, 'Crie interfaces amigáveis com foco na experiência do usuário.', 45.00, 'Intermediário', FALSE, 'Thiago Martins'),
	(4, 'Inglês para Viagens', 99.00, 'Curso prático com vocabulário essencial para viajantes.', 18.00, 'Iniciante', FALSE, 'Renato Lima'),
	(4, 'Francês do Zero', 750.00, 'Introdução à língua francesa com foco em pronúncia e frases básicas.', 22.00, 'Iniciante', TRUE, 'Renata Carvalho'),
	(5, 'Meditação e Mindfulness', 49.90, 'Aprenda técnicas de respiração, foco e controle da ansiedade.', 15.00, 'Iniciante', FALSE, 'Marina Duarte');

SELECT * FROM tb_cursos;

-- Faça um SELECT que retorne todes os cursos cujo valor seja maior do que R$ 500,00.
SELECT nome AS "Nome do Curso", CONCAT('R$ ', FORMAT(valor, 2, 'pt_BR')) AS "Valor do Curso", duracao_horas AS "Duração", nivel AS "Nível", IF(promo_gratuito, "Sim", "Não") AS "Promoção Black Friday Aplicada", instrutor FROM tb_cursos WHERE valor >= 500;

-- Faça um SELECT que retorne todes os cursos cujo valor esteja no intervalo R$ 600,00 e R$ 1000,00.
SELECT nome AS "Nome do Curso", CONCAT('R$ ', FORMAT(valor, 2, 'pt_BR')) AS "Valor do Curso", duracao_horas AS "Duração", nivel AS "Nível", IF(promo_gratuito, "Sim", "Não") AS "Promoção Black Friday Aplicada", instrutor FROM tb_cursos WHERE valor BETWEEN 600 AND 1000;

-- Faça um SELECT utilizando o operador LIKE, buscando todes os cursos que possuam a letra J no atributo nome.
SELECT nome AS "Nome do Curso", CONCAT('R$ ', FORMAT(valor, 2, 'pt_BR')) AS "Valor do Curso", duracao_horas AS "Duração", nivel AS "Nível", IF(promo_gratuito, "Sim", "Não") AS "Promoção Black Friday Aplicada", instrutor FROM tb_cursos WHERE nome LIKE "%J%";

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_cursos com os dados da tabela tb_categorias.
SELECT c1.nome AS "Nome do Curso", CONCAT('R$ ', FORMAT(c1.valor, 2, 'pt_BR')) AS "Valor do Curso", c1.duracao_horas AS "Duração", c1.nivel AS "Nível", IF(c1.promo_gratuito, "Sim", "Não") AS "Promoção Black Friday Aplicada", c1.instrutor AS "Instrutor", c2.nome AS "Categoria" FROM tb_cursos c1 INNER JOIN tb_categorias c2 ON c1.categoria_id = c2.id;

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_cursos com os dados da tabela tb_categorias, 
-- onde traga apenas os produtos que pertençam a uma categoria específica (Exemplo: Todes os cursos que pertencem a categoria Java).
SELECT c1.nome AS "Nome do Curso", CONCAT('R$ ', FORMAT(c1.valor, 2, 'pt_BR')) AS "Valor do Curso", c1.nivel AS "Nível", IF(c1.promo_gratuito, "Sim", "Não") AS "Promoção Black Friday Aplicada", c1.instrutor AS "Instrutor", c2.nome AS "Categoria", c2.coordenador_categoria AS "Coordenadora da Categoria" FROM tb_cursos c1 INNER JOIN tb_categorias c2 ON c1.categoria_id = c2.id WHERE c2.coordenador_categoria LIKE "Rosana%";
