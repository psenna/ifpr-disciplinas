# Subquery como filtro de uma nova consulta

## Primeiro problema

Vamos pensar que eu tenho um banco de dados com o nome dos alunos e as notas deles em uma prova. Como eu faço um select para retornar apenas os alunos que tiraram notas mensores que a média da turma?

Banco dos alunos: [alunos.sql](./sql/alunos.sql)

```
+----+--------+------+
| id | nome   | nota |
+----+--------+------+
|  1 | Joao   |   30 |
|  2 | Maria  |   60 |
|  3 | Jose   |   80 |
|  4 | Lucas  |   45 |
|  5 | Marcos |   25 |
+----+--------+------+
```

```

```

## Utilizando subqueries

Podemos colocar comandos de SQL dentro de outros comandos.

Anatomia do Select.

## Subquery como filtro de uma nova consulta

* Condição normal
* EXISTS
* IN


## Exemplos

No banco do avatar([avatar.sql](./sql/avatar.sql)), vamos tentar resolver os seguintes problemas sem utilizar Join:

* Mostrar as pessoas que não dominam nenhum elemento

```
SELECT p.nome 
	FROM pessoas AS p
	WHERE EXISTS(SELECT * FROM pessoa_elemento WHERE pessoa_id = p.id);
```

* Mostrar as pessoas que dominam algum elemento

```
SELECT p.nome 
	FROM pessoas AS p
	WHERE NOT EXISTS(SELECT * FROM pessoa_elemento WHERE pessoa_id = p.id);
```

* Mostrar as pessoas que são avatares (dominam os 4 elementos)
```
SELECT p.nome FROM pessoas p
WHERE 
(SELECT COUNT(*) FROM pessoa_elemento WHERE pessoa_id = p.id) = 4;
```

* Mostrar as pessoas que são de uma nação que comece com tribo
```
SELECT * FROM pessoas p
WHERE p.nacao_id IN (SELECT id FROM nacoes WHERE nome like 'tribo%');
```