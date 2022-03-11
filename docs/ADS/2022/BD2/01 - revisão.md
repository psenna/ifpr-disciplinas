# Revisão de SQL

Nessas primeiras aulas, vamos relembrar o SQL de BD1.

## Divisão do SQL

* DDL - Data Definition Language - Linguagem de Definição de Dados. São os comandos que interagem com os objetos do banco.
  * CREATE
  * ALTER
  * DROP

* DML - Data Manipulation Language - Linguagem de Manipulação de Dados. São os comandos que interagem com os dados dentro das tabelas.
  * INSERT
  * DELETE
  * UPDATE
  * SELECT

* DCL - Data Control Language - Linguagem de Controle de Dados. São os comandos para controlar a parte de segurança do banco de dados.
  * GRANT
  * REVOKE
  * DENY

* DTL - Data Transaction Language - Linguagem de Transação de Dados. São os comandos para controle de transação.
  * BEGIN TRANSACTION
  * COMMIT
  * ROLLBACK

## Logando no banco

Para logar no banco pelo terminal utilizamos o comando mysql:

```
mysql -u usuario -p
```

Se o banco não estiver na mesma máquina ou estiver em alguma porta diferente da padrão (3306) devemos utilizar os parâmetros -h (host) e -p (porta) para informar isso.

Se não passarmos o parâmetro -D (database) ele irá entrar no servidor sem acessar um banco específico.

Após logar no servidor, podemos ver os bancos instalados com o comando:

```
SHOW DATABASES;
```

Se nenhum banco tiver sido criado no servidor, existirão esses bancos:

```
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
```

Para criar um novo banco, utilizamos o comando **CREATE**:

```
create database ads;
```

Para utilizarmos um banco de dados, usamos o comando **USE**

```
USE ads;
```

## Criando tabelas

Para criar tabelas, utilizamos o comando **CREATE TABLE**

[Referência](https://www.w3schools.com/sql/sql_create_table.asp)

```
CREATE TABLE table_name (
   column1 datatype NOT NULL,
   column2 datatype DEFAULT 'aaaa',
   column3 datatype,
   ....,
   PRIMARY KEY (column1),
   FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);

```

### Tipos de dados

Usem essa referência para ver quais os tipos de dados disponíveis.

[Referência](https://www.w3schools.com/sql/sql_datatypes.asp)

### Tipo json

Alguns bancos suportam salvar e fazer operações em colunas json (alguns conseguem salvar o json de forma binária, outros salvam como texto). É uma opção interessante para salvar dados com formato ou tamanho incerto (ex: listas).

[Referência](https://dev.mysql.com/doc/refman/8.0/en/json.html)

Podemos criar a seguinte tabela:

```
CREATE TABLE alunos (
   id            INT PRIMARY KEY AUTO_INCREMENT,
   nome          VARCHAR(255) NOT NULL,
   outros_dados  JSON NOT NULL
);
```

Para vermos as colunas criadas nela, podemos utilizar o comando:

```
DESCRIBE alunos;
```

E devemos ter o seguinte resultado:

```
mysql> DESCRIBE alunos;
+--------------+--------------+------+-----+---------+----------------+
| Field        | Type         | Null | Key | Default | Extra          |
+--------------+--------------+------+-----+---------+----------------+
| id           | int          | NO   | PRI | NULL    | auto_increment |
| nome         | varchar(255) | NO   |     | NULL    |                |
| outros_dados | json         | NO   |     | NULL    |                |
+--------------+--------------+------+-----+---------+----------------+
```

## Inserindo dados

Para inserir dados no banco, utilizamos o comando **INSERT INTO**.

[Referência](https://www.w3schools.com/sql/sql_insert.asp)

Utilizando a tabela alunos, que acabamos de criar, como exemplo, vamos inserir um registro com o comando abaixo:

```
INSERT INTO alunos (nome, outros_dados) 
VALUES 
    ('pedro', '{"media_graduacao": 10, "experiencia": ["a", "b"]}');
```

Se selercionamos todos os  dados dessa tabela, vamos ter o seguinte resultado:

```
mysql> SELECT * FROM alunos;
+----+-------+----------------------------------------------------+
| id | nome  | outros_dados                                       |
+----+-------+----------------------------------------------------+
|  1 | pedro | {"experiencia": ["a", "b"], "media_graduacao": 10} |
+----+-------+----------------------------------------------------+
1 row in set (0.00 sec)
```

Se quiser inserir diversos registros no mesmo comando, basta separar as tuplas com os valores com virgulas:

```
INSERT INTO alunos (nome, outros_dados) 
VALUES 
    ('pedro', '{"media_graduacao": 10, "experiencia": ["a", "b"]}'),
    ('joão' , '{"media_graduacao": 10, "experiencia": ["a", "b"]}');
```

## Atualizando valores

***
**Nunca utilize o UPDATE sem o WHERE**
***

Para atualizar os dados, utilizamos o comando **UPDATE**

[Referência](https://www.w3schools.com/sql/sql_update.asp)

Vamos atualizar o nome do aluno com id 1:

```
UPDATE alunos
SET nome = 'Pedro Senna'
WHERE id = 1;
```

```
UPDATE alunos
SET outros_dados = JSON_SET(outros_dados, "$.experiencia", JSON_ARRAY('exp1','exp2'))
WHERE id = 1;
```