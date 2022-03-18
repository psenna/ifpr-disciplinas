CREATE TABLE elementos (
    id      INT PRIMARY KEY,
    nome    VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE nacoes (
    id                      INT PRIMARY KEY,
    nome                    VARCHAR(50) NOT NULL UNIQUE,
    elemento_principal_id   INT NOT NULL,
    FOREIGN KEY (elemento_principal_id) REFERENCES elementos(id)
);

CREATE TABLE pessoas (
    id                      INT PRIMARY KEY,
    nome                    VARCHAR(50) NOT NULL UNIQUE,
    nacao_id                INT NOT NULL,
    FOREIGN KEY (nacao_id) REFERENCES nacoes(id)
);

CREATE TABLE pessoa_elemento (
    pessoa_id               INT NOT NULL,
    elemento_id             INT NOT NULL,
    FOREIGN KEY (pessoa_id) REFERENCES pessoas(id),
    FOREIGN KEY (elemento_id) REFERENCES elementos(id),
    PRIMARY KEY (pessoa_id, elemento_id)
);

CREATE TABLE comercio  (
    id                      INT PRIMARY KEY,
    vendedor_id             INT NOT NULL,
    comprador_id            INT NOT NULL,
    produto                 VARCHAR(255),
    valor                   FLOAT,
    FOREIGN KEY (vendedor_id) REFERENCES pessoas(id),
    FOREIGN KEY (comprador_id) REFERENCES pessoas(id)
);

INSERT INTO elementos (id, nome) 
VALUES 
    (1, 'Fogo'),
    (2, 'Agua'),
    (3, 'Terra'),
    (4, 'Ar');

INSERT INTO nacoes (id, nome, elemento_principal_id)
VALUES 
    (1, 'Nacao do fogo', 1),
    (2, 'Tribo da agua do sul', 2),
    (3, 'Tribo da agua do norte', 2),
    (4, 'Reino da terra', 3),
    (5, 'Nomades do ar', 4);

INSERT INTO pessoas (id, nome, nacao_id) 
VALUES 
    (1, 'Aang', 5),
    (2, 'Katara', 2),
    (3, 'Sokka', 2),
    (4, 'Zuko', 1),
    (5, 'Toph', 4),
    (6, 'Paku', 3),
    (7, 'Suki', 4),
    (8, 'Iron', 1),
    (9, 'Hakoda', 2),
    (10, 'Roku', 1),
    (11, 'kyoshi', 4);

INSERT INTO pessoa_elemento (pessoa_id, elemento_id)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (1, 4),
    (2, 2),
    (4, 1),
    (5, 3),
    (6, 2),
    (8, 1),
    (10, 1),
    (10, 2),
    (10, 3),
    (10, 4),
    (11, 1),
    (11, 2),
    (11, 3),
    (11, 4);

INSERT INTO comercio (id, vendedor_id, comprador_id, produto, valor)
VALUES
    (1, 1, 2, "Repolho",  25.0),
    (2, 3, 4, "Repolho",  100.0),
    (3, 4, 2, "Repolho",  32.0),
    (4, 5, 6, "Repolho",  22.0),
    (5, 2, 5, "Repolho",  56.0),
    (6, 9, 5, "Repolho",  59.0),
    (7, 3, 7, "Repolho",  10.0);
    