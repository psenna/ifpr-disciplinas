CREATE DATABASE banco;

USE banco;

CREATE TABLE clientes (
    id          INT PRIMARY KEY AUTO_INCREMENT,
    nome        VARCHAR(50) NOT NULL,
    especial    BOOLEAN DEFAULT false 
);

CREATE TABLE contas (
    id                  INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id          INT NOT NULL,
    saldo               FLOAT,
    saldo_investimentos FLOAT,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE debitos (
    id          INT PRIMARY KEY AUTO_INCREMENT,
    conta_id    INT NOT NULL,
    valor       FLOAT NOT NULL,
    FOREIGN KEY (conta_id) REFERENCES contas(id)
);

CREATE TABLE creditos (
    id          INT PRIMARY KEY AUTO_INCREMENT,
    conta_id    INT NOT NULL,
    valor       FLOAT NOT NULL,
    FOREIGN KEY (conta_id) REFERENCES contas(id)
);

CREATE TABLE investimentos (
    id          INT PRIMARY KEY AUTO_INCREMENT,
    conta_id    INT NOT NULL,
    valor       FLOAT NOT NULL,
    FOREIGN KEY (conta_id) REFERENCES contas(id)
);

CREATE TABLE retiradas (
    id          INT PRIMARY KEY AUTO_INCREMENT,
    conta_id    INT NOT NULL,
    valor       FLOAT NOT NULL,
    FOREIGN KEY (conta_id) REFERENCES contas(id)
);

DELIMITER $

CREATE TRIGGER Tgr_Create_Conta AFTER INSERT
ON clientes
FOR EACH ROW
BEGIN
    INSERT INTO contas (cliente_id, saldo, saldo_investimentos)
    VALUES
    (NEW.id, 0, 0);
END$

DELIMITER ;