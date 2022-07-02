CREATE DATABASE empresa;

USE empresa;

CREATE TABLE cidades (
    id      INT PRIMARY KEY,
    nome    VARCHAR(50) NOT NULL UNIQUE
);


CREATE TABLE clientes (
    id                      INT PRIMARY KEY,
    nome                    VARCHAR(50) NOT NULL UNIQUE,
    cidade_id               INT NOT NULL,
    FOREIGN KEY (cidade_id) REFERENCES cidades(id)
);

CREATE TABLE vendas (
    id                      INT PRIMARY KEY,
    cliente_id              INT NOT NULL,
    valor_total             FLOAT NOT NULL,
    valor_pago              FLOAT NOT NULL DEFAULT 0,
    data_operacao           DATE NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE OR REPLACE VIEW clientes_relatorio
    AS
        SELECT cli.nome AS 'nome', 
            cid.nome AS 'cidade', 
            COUNT(ve.valor_total) AS 'venda', 
            COALESCE(SUM(valor_total), 0) AS 'valor_vendas',
            COALESCE(SUM(valor_total - valor_pago),0) AS 'valor_a_pagar'
        FROM
            clientes AS cli
            JOIN cidades AS cid ON cli.cidade_id = cid.id
            LEFT JOIN vendas AS ve ON ve.cliente_id = cli.id
        GROUP BY cli.id;

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

INSERT INTO clientes (id, nome, cidade_id) 
VALUES 
    ( 1, 'Joao', 1),
    ( 2, 'Ze', 1),
    ( 3, 'Maria', 1),
    ( 4, 'Bob esponja', 1),
    ( 5, 'Goku', 2),
    ( 6, 'Bulma', 2),
    ( 7, 'Leia', 3),
    ( 8, 'Luke', 3),
    ( 9, 'Anakin', 3),
    (10, 'Tony Gordo', 4),
    (11, 'Aldo o apache', 5),
    (12, 'Hans Landa', 5);
    

INSERT INTO vendas (id, cliente_id, valor_total, valor_pago, data_operacao) 
VALUES
    ( 1,  1, 100,  20, '2022-01-01'),
    ( 2,  2, 200, 120, '2022-02-01'),
    ( 3,  2, 300, 245, '2022-03-01'),
    ( 4,  5, 200, 200, '2022-04-01'),
    ( 5,  6, 100,  70, '2022-01-01'),
    ( 6,  5, 300,  80, '2022-02-01'),
    ( 7,  7, 200, 120, '2022-03-01'),
    ( 8,  5, 200,  20, '2022-04-01'),
    ( 9,  3, 300, 220, '2022-01-01'),
    (10,  3, 100,  90, '2022-02-01'),
    (11,  2, 200, 120, '2022-03-01'),
    (12,  1, 200, 145, '2022-04-01'),
    (13,  2, 300, 120, '2022-02-01'),
    (14,  4, 200, 150, '2022-02-01'),
    (15,  5, 200,  20, '2022-04-01'),
    (16,  3, 100,  50, '2022-02-01'),
    (17, 10, 100,  60, '2022-01-01'),
    (18, 11, 200,  70, '2022-02-01'),
    (19, 12, 100,  20, '2022-03-01');
