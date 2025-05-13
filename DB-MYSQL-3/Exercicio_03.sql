-- DROP DATABASE db_escola;

CREATE DATABASE db_escola;

USE db_escola;

CREATE TABLE tb_alunos (
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255),
    nota DECIMAL (4, 2),
    serie INT,
    dtnascimento DATE,
    PRIMARY KEY (id)
);

INSERT INTO tb_alunos (nome, nota, serie, dtnascimento)
VALUES
("Ana Beatriz Lima", 9.5, 9, "2009-03-15"),
("Carlos Eduardo Silva", 7.8, 8, "2010-07-22"),
("Mariana Soares", 8.2, 7, "2011-01-30"),
("Pedro Henrique Alves", 6.9, 9, "2009-09-05"),
("Isabela Martins", 9.9, 6, "2012-05-11"),
("João Victor Rocha", 5.7, 8, "2010-11-02"),
("Laura Ferreira", 8.7, 7, "2011-06-18"),
("Matheus Almeida", 7.3, 6, "2012-10-25"),
("Gabriela Costa", 10.0, 9, "2009-12-03"),
("Lucas Menezes", 6.5, 7, "2011-04-14");

SELECT * FROM tb_alunos;

SELECT * FROM tb_alunos WHERE nota >= 7.0;

SELECT * FROM tb_alunos WHERE nota <= 7.0;

UPDATE tb_alunos SET nota = 10 WHERE id = 1;
