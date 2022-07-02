DROP database empire;

CREATE DATABASE empire;

USE empire;

CREATE TABLE usuarios (
    id          INT PRIMARY KEY AUTO_INCREMENT,
    nome        VARCHAR(50) NOT NULL
);

CREATE TABLE tipos_unidades (
    id              INT PRIMARY KEY AUTO_INCREMENT,
    nome            VARCHAR(50) NOT NULL
);

CREATE TABLE unidades (
    id                  INT PRIMARY KEY AUTO_INCREMENT,
    vida                INT DEFAULT 100,
    dano                INT DEFAULT 100,
    ativo               BOOLEAN DEFAULT true,
    tipo_unidade_id     INT NOT NULL,
    usuario_id          INT NOT NULL,
    FOREIGN KEY (tipo_unidade_id) REFERENCES tipos_unidades(id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE tipos_construcoes (
    id          INT PRIMARY KEY AUTO_INCREMENT,
    nome        VARCHAR(50) NOT NULL
);

CREATE TABLE construcoes (
    id                  INT PRIMARY KEY AUTO_INCREMENT,
    vida                INT DEFAULT 100,
    ativo               BOOLEAN DEFAULT true,
    tipo_construcao_id  INT NOT NULL,
    usuario_id          INT NOT NULL,
    FOREIGN KEY (tipo_construcao_id) REFERENCES tipos_construcoes(id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

INSERT INTO usuarios (nome)
VALUES
("Pedro"),
("Naruto"),
("Goku");

INSERT INTO tipos_unidades (nome)
VALUES
("cavaleiro"),
("arqueiro"),
("UNIDADE_TEST_arqueiro");

INSERT INTO tipos_construcoes (nome)
VALUES
("casa"),
("mercado"),
("TESTE_casa");

INSERT INTO unidades (tipo_unidade_id, usuario_id, dano)
VALUES
(1, 1, 7),
(2, 3, 25),
(3, 3, 8),
(1, 2, 8);

INSERT INTO construcoes (tipo_construcao_id, usuario_id, vida)
VALUES
(1, 1, 80),
(2, 3, 120),
(3, 3, 50),
(1, 2, 90);