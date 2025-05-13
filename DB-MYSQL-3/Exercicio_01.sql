CREATE DATABASE db_colaboradoresrh;

USE db_colaboradoresrh;

CREATE TABLE tb_colaboradores (
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255),
    dtnascimento DATE,
    cargo VARCHAR(255),
    salario DECIMAL(8 , 2 ),
    PRIMARY KEY (id)
);

INSERT INTO tb_colaboradores (nome, dtnascimento, cargo, salario)
VALUES 
("Cassandra Vegas", "1995-12-10", "Gerente de Contas a Pagar", 12000.70),
("Eduardo Ramos", "1988-03-15", "Analista de Sistemas", 8500.00),
("Juliana Mendes", "1992-07-22", "Coordenadora de RH", 9800.50),
("Roberto Lima", "1985-11-03", "Gerente de Projetos", 13500.00),
("Amanda Torres", "1990-04-18", "Desenvolvedora Full Stack", 9600.75),
("Felipe Martins", "1996-01-09", "Designer UX/UI", 7200.30),
("Patrícia Souza", "1993-10-26", "Analista de Marketing", 6900.20),
("Lucas Barros", "1989-06-12", "Administrador de Banco de Dados", 9100.00),
("Camila Rocha", "1997-02-28", "Estagiária de TI", 1800.00),
("Renato Silveira", "1983-09-05", "Diretor Financeiro", 17000.90);

SELECT * FROM tb_colaboradores;

SELECT * FROM tb_colaboradores WHERE salario >= 2000;

SELECT * FROM tb_colaboradores WHERE salario <= 2000;

UPDATE tb_colaboradores SET salario = 2000 WHERE id = 2;

