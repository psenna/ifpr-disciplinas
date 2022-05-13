create DATABASE alunos;

use alunos;

CREATE TABLE alunos (
    id      INT PRIMARY KEY,
    nome    VARCHAR(50) NOT NULL,
    nota    FLOAT NOT NULL
);

INSERT INTO alunos (id, nome, nota) 
VALUES 
    (1, 'Joao', 30),
    (2, 'Maria', 60),
    (3, 'Jose', 80),
    (4, 'Lucas', 45),
    (5, 'Marcos', 25);