CREATE DATABASE star;

USE star;

CREATE TABLE exercitos (
    id      INT PRIMARY KEY,
    nome    VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE tipo_tropas (
    id      INT PRIMARY KEY,
    nome    VARCHAR(50) NOT NULL UNIQUE,
    forca   INT NOT NULL
);

CREATE TABLE frentes (
    id      INT PRIMARY KEY,
    nome    VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE situacao_tropas (
    id      INT PRIMARY KEY,
    nome    VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE tropas (
    id                  INT PRIMARY KEY,
    nome                VARCHAR(50) NOT NULL UNIQUE,
    exercito_id         INT NOT NULL,
    tipo_tropa_id       INT NOT NULL,
    frente_id           INT NOT NULL,
    situacao_tropa_id   INT NOT NULL,
    FOREIGN KEY (exercito_id)           REFERENCES exercitos(id),
    FOREIGN KEY (tipo_tropa_id)         REFERENCES tipo_tropas(id),
    FOREIGN KEY (frente_id)             REFERENCES frentes(id),
    FOREIGN KEY (situacao_tropa_id)     REFERENCES situacao_tropas(id)
);



INSERT INTO exercitos (id, nome) 
VALUES 
    (1, 'Republica'),
    (2, 'Federacao');

INSERT INTO tipo_tropas (id, nome, forca) 
VALUES 
    (1, 'clones', 2),
    (2, 'jedy', 100),
    (3, 'droids', 5);    


INSERT INTO frentes (id, nome) 
VALUES 
    (1, 'colinas'),
    (2, 'planicies');

INSERT INTO situacao_tropas (id, nome) 
VALUES 
    (1, 'ativa'),
    (2, 'inativa');

INSERT INTO tropas (id, nome, exercito_id, tipo_tropa_id, frente_id, situacao_tropa_id) 
VALUES 
    ( 1, 'T456', 1, 1, 1, 1),
    ( 2, 'T123', 1, 1, 1, 1),
    ( 3, 'T476', 1, 1, 1, 1),
    ( 4, 'T325', 1, 1, 1, 1),
    ( 5, 'T541', 1, 1, 1, 2),
    ( 6, 'T784', 1, 1, 1, 2),
    ( 7, 'T254', 1, 1, 1, 1),
    ( 8, 'T654', 1, 1, 1, 1),
    ( 9, 'T555', 1, 1, 2, 1),
    (10, 'T658', 1, 1, 2, 1),
    (11, 'T222', 1, 1, 2, 1),
    (12, 'T545', 1, 1, 2, 1),
    (13, 'T985', 1, 1, 2, 2),
    (14, 'T747', 1, 1, 2, 2),
    (15, 'T457', 1, 1, 2, 2),
    (16, 'T651', 1, 1, 2, 2),
    (17, 'T435', 1, 1, 2, 2),
    (18, 'T781', 1, 1, 2, 2),
    (19, 'Asoka', 1, 2, 1, 1),
    (20, 'Anakin', 1, 2, 2, 1),
    (21, 'D123', 2, 3, 1, 1),
    (22, 'D124', 2, 3, 1, 1),
    (23, 'D125', 2, 3, 1, 1),
    (24, 'D234', 2, 3, 1, 1),
    (25, 'D345', 2, 3, 1, 2),
    (26, 'D567', 2, 3, 2, 1),
    (27, 'D543', 2, 3, 2, 2),
    (28, 'D213', 2, 3, 2, 1),
    (29, 'D854', 2, 3, 2, 1),
    (30, 'D863', 2, 3, 2, 1);