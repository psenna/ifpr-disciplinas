# Revisão de SQL: SELECT


Nessa aula vamos utilizar esse banco de dados: [avatar.sql](./sql/avatar.sql)


# Procurando os avatares

```
SELECT * FROM pessoas AS p 
    JOIN pessoa_elemento AS pe on p.id = pe.pessoa_id
    GROUP BY p.id 
    HAVING COUNT(elemento_id) = 4;
```


# Concatenando as respostas de uma agregação

```
SELECT p.nome, COALESCE(Group_CONCAT(e.nome), 'Nenhum') AS elementos 
    FROM pessoas as p 
    LEFT JOIN pessoa_elemento AS pe ON p.id = pe.pessoa_id 
    LEFT JOIN elementos AS e ON pe.elemento_id = e.id
    GROUP BY p.id;
```

```
+--------+--------------------+
| nome   | elementos          |
+--------+--------------------+
| Aang   | Fogo,Agua,Terra,Ar |
| Katara | Agua               |
| Sokka  | Nenhum             |
| Zuko   | Fogo               |
| Toph   | Terra              |
| Paku   | Agua               |
| Suki   | Nenhum             |
| Iron   | Fogo               |
| Hakoda | Nenhum             |
| Roku   | Fogo,Agua,Terra,Ar |
| kyoshi | Fogo,Agua,Terra,Ar |
+--------+--------------------+


```

# Atividades

1. Crie uma consulta para descobrir quais pessoas não dominam nenhum elemento.

2. Crie uma consulta para descobrir quantas pessoas não participaram de nenhuma transação comercial.

3. Crie uma consulta para descobrir quantas pessoas participaram de duas ou mais transações comerciais.

# Desafio "Boa de prova ;)"

1. Crie uma consulta para listar a "balança comercia" de cada uma das pessoas, mostrando o total do valor de compras, de vendas e a diferença entre eles. Como no exemplo abaixo.

```
+--------+--------------+---------------+-----------+
| Nome   | Total_Vendas | Total_Compras | Resultado |
+--------+--------------+---------------+-----------+
| Aang   |           25 |             0 |        25 |
| Hakoda |           59 |             0 |        59 |
| Iron   |            0 |             0 |         0 |
| Katara |           56 |            57 |        -1 |
| kyoshi |            0 |             0 |         0 |
| Paku   |            0 |            22 |       -22 |
| Roku   |            0 |             0 |         0 |
| Sokka  |          110 |             0 |       110 |
| Suki   |            0 |            10 |       -10 |
| Toph   |           22 |           115 |       -93 |
| Zuko   |           32 |           100 |       -68 |
+--------+--------------+---------------+-----------+
```