CREATE DATABASE boliche;

USE boliche;

CREATE TABLE cidades (
    id      INT PRIMARY KEY,
    nome    VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE profissoes (
    id      INT PRIMARY KEY,
    nome    VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE clientes (
    id                      INT PRIMARY KEY,
    nome                    VARCHAR(50) NOT NULL UNIQUE,
    cidade_id               INT NOT NULL,
    profissao_id            INT,
    FOREIGN KEY (cidade_id) REFERENCES cidades(id),
    FOREIGN KEY (profissao_id) REFERENCES profissoes(id)
);

CREATE TABLE lanches (
    id      INT PRIMARY KEY,
    nome    VARCHAR(50) NOT NULL UNIQUE,
    preco   FLOAT NOT NULL
);

CREATE TABLE jogos (
    id              INT PRIMARY KEY,
    cliente_id      INT NOT NULL,
    lanche_id       INT,
    pontuacao       FLOAT NOT NULL,
    venceu          BOOLEAN NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (lanche_id) REFERENCES lanches(id)
);

INSERT INTO cidades (id, nome) 
VALUES 
    (1, 'Umuarama'),
    (2, 'Maringa'),
    (3, 'Londrina'),
    (4, 'Cascavel'),
    (5, 'Xambre'),
    (6, 'Toledo'),
    (7, 'Navirai'),
    (8, 'Mundo Novo'),
    (9, 'Nova Andradina'),
    (10, 'Cedro');

INSERT INTO profissoes (id, nome) 
VALUES 
    (1, 'Policial'),
    (2, 'Mineiro'),
    (3, 'Bombeiro'),
    (4, 'Eletricista'),
    (5, 'Professor');

INSERT INTO clientes (id, nome, cidade_id, profissao_id) 
VALUES 
    (1, 'Joao', 1, 1),
    (2, 'Mario', 2, 1),
    (3, 'Maria', 1, 4),
    (4, 'Jose', 3, 2),
    (5, 'Julia', 4, 5);

INSERT INTO lanches (id, nome, preco) 
VALUES 
    (1, 'rosquinha', 20),
    (2, 'x-tudo', 10),
    (3, 'hotdog', 5),
    (4, 'pizza', 30),
    (5, 'pao na chapa', 8);

INSERT INTO jogos (id, cliente_id, lanche_id, pontuacao, venceu) 
VALUES 
    (1, 1, 1, 100, TRUE),
    (2, 1, 2, 50, FALSE),
    (3, 2, 5, 60, TRUE),
    (4, 2, 3, 60, FALSE),
    (5, 3, 5, 60, TRUE),
    (6, 3, 1, 60, TRUE),
    (7, 4, 2, 60, FALSE),
    (8, 1, 2, 60, FALSE),
    (9, 2, 1, 60, TRUE);

