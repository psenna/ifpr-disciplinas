CREATE DATABASE empresa3;

USE empresa3;

CREATE TABLE cidades (
    id      INT PRIMARY KEY,
    nome    VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE produtos (
    id      INT PRIMARY KEY,
    nome    VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE clientes (
    id                      INT PRIMARY KEY,
    nome                    VARCHAR(50) NOT NULL UNIQUE,
    cidade_id               INT NOT NULL,
    data_nascimento         DATE NOT NULL,
    FOREIGN KEY (cidade_id) REFERENCES cidades(id)
);

CREATE TABLE fornecedores (
    id                      INT PRIMARY KEY,
    nome                    VARCHAR(50) NOT NULL UNIQUE,
    cidade_id               INT NOT NULL,
    FOREIGN KEY (cidade_id) REFERENCES cidades(id)
);

CREATE TABLE vendas (
    id                      INT PRIMARY KEY,
    cliente_id              INT NOT NULL,
    produto_id              INT NOT NULL,
    valor_total             FLOAT NOT NULL,
    valor_pago              FLOAT NOT NULL DEFAULT 0,
    data_operacao           DATE NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

CREATE TABLE compras (
    id                      INT PRIMARY KEY,
    fornecedor_id              INT NOT NULL,
    produto_id              INT NOT NULL,
    valor_total             FLOAT NOT NULL,
    valor_pago              FLOAT NOT NULL DEFAULT 0,
    data_operacao           DATE NOT NULL,
    FOREIGN KEY (fornecedor_id) REFERENCES fornecedores(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
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

INSERT INTO produtos (id, nome) 
VALUES 
    (1, 'nave espacial'),
    (2, 'capsula'),
    (3, 'Facao'),
    (4, 'Barril'),
    (5, 'Cadeira'),
    (6, 'Notebook');

INSERT INTO clientes (id, nome, cidade_id, data_nascimento) 
VALUES 
    ( 1, 'Joao', 1, '1991-10-05'),
    ( 2, 'Ze', 1, '1999-10-08'),
    ( 3, 'Maria', 1, '2010-10-05'),
    ( 4, 'Bob esponja', 1, '1996-10-05'),
    ( 5, 'Goku', 2, '2005-10-05'),
    ( 6, 'Bulma', 2, '1999-10-05'),
    ( 7, 'Leia', 3, '2005-10-05'),
    ( 8, 'Luke', 3, '2003-10-05'),
    ( 9, 'Anakin', 3, '200-10-05'),
    (10, 'Tony Gordo', 4, '2012-10-05'),
    (11, 'Aldo o apache', 5, '1991-10-05'),
    (12, 'Hans Landa', 5, '1991-10-05');
    

INSERT INTO fornecedores (id, nome, cidade_id) 
VALUES 
    ( 1, 'Loja1', 1),
    ( 2, 'Loja2', 1),
    ( 3, 'Loja3', 1),
    ( 4, 'Loja4', 1),
    ( 5, 'Loja5', 2),
    ( 6, 'Loja6', 2);

INSERT INTO vendas (id, cliente_id, valor_total, valor_pago, data_operacao, produto_id) 
VALUES
    ( 1,  1, 100,  20, '2022-01-01', 1),
    ( 2,  2, 200, 120, '2022-02-01', 2),
    ( 3,  2, 300, 245, '2022-03-01', 2),
    ( 4,  5, 200, 200, '2022-04-01', 3),
    ( 5,  6, 100,  70, '2022-01-01', 1),
    ( 6,  5, 300,  80, '2022-02-01', 2),
    ( 7,  7, 200, 120, '2022-03-01', 6),
    ( 8,  5, 200,  20, '2022-04-01', 6),
    ( 9,  3, 300, 220, '2022-01-01', 2),
    (10,  3, 100,  90, '2022-02-01', 1),
    (11,  2, 200, 120, '2022-03-01', 2),
    (12,  1, 200, 145, '2022-04-01', 3),
    (13,  2, 300, 120, '2022-02-01', 3),
    (14,  4, 200, 150, '2022-02-01', 3),
    (15,  5, 200,  20, '2022-04-01', 2),
    (16,  3, 100,  50, '2022-02-01', 1),
    (17, 10, 100,  60, '2022-01-01', 5),
    (18, 11, 200,  70, '2022-02-01', 5),
    (19, 12, 100,  20, '2022-03-01', 2);

INSERT INTO compras (id, fornecedor_id, valor_total, valor_pago, data_operacao, produto_id) 
VALUES
    ( 1,  1, 100,  20, '2022-01-01', 1),
    ( 2,  2, 200, 120, '2022-02-01', 2),
    ( 3,  2, 300, 245, '2022-03-01', 2),
    ( 4,  5, 200, 200, '2022-04-01', 3),
    ( 5,  6, 100,  70, '2022-01-01', 4),
    ( 6,  5, 300,  80, '2022-02-01', 2),
    ( 7,  3, 200, 120, '2022-03-01', 6),
    ( 8,  5, 200,  20, '2022-04-01', 6),
    ( 9,  3, 300, 220, '2022-01-01', 2),
    (10,  3, 100,  90, '2022-02-01', 1),
    (11,  2, 200, 120, '2022-03-01', 2),
    (12,  1, 200, 145, '2022-04-01', 3),
    (13,  2, 300, 120, '2022-02-01', 4),
    (14,  4, 200, 150, '2022-02-01', 3),
    (15,  5, 200,  20, '2022-04-01', 2),
    (16,  3, 100,  50, '2022-02-01', 1),
    (17, 2, 100,  60, '2022-01-01', 5),
    (18, 1, 200,  70, '2022-02-01', 5),
    (19, 5, 100,  20, '2022-03-01', 2);
