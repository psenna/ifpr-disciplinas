CREATE DATABASE empire;

USE empire;

CREATE TABLE usuarios (
    id          INT PRIMARY KEY AUTO_INCREMENT,
    nome        VARCHAR(50) NOT NULL,
    pago        BOOLEAN DEFAULT false 
);

CREATE TABLE tipos_unidades (
    id              INT PRIMARY KEY AUTO_INCREMENT,
    nome            VARCHAR(50) NOT NULL,
    custo_ouro      INT,
    custo_madeira   INT,
    dano_padrao     INT,
    vida_padrao     INT
);

CREATE TABLE unidade (
    id                  INT PRIMARY KEY AUTO_INCREMENT,
    vida                INT DEFAULT 100,
    dano                INT DEFAULT 100,
    ativo               BOOLEAN DEFAULT true,
    tipo_unidade_id     INT NOT NULL,
    usuario_id          INT NOT NULL,
    FOREIGN KEY (tipo_unidade_id) REFERENCES tipos_unidades(id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE tipos_recursos (
    id          INT PRIMARY KEY AUTO_INCREMENT,
    nome        VARCHAR(50) NOT NULL
);

CREATE TABLE recursos (
    id              INT PRIMARY KEY AUTO_INCREMENT,
    quantidade      INT NOT NULL,
    usuario_id      INT NOT NULL,
    tipo_recurso_id INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (tipo_recurso_id) REFERENCES tipos_recursos(id)
);

CREATE TABLE tipos_construcoes (
    id          INT PRIMARY KEY AUTO_INCREMENT,
    nome        VARCHAR(50) NOT NULL,
    custo_ouro      INT,
    custo_madeira   INT,
    vida_padrao     INT
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

