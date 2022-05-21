# Subquery como uma nova coluna da consulta 

## Exemplos

No banco do avatar([avatar.sql](./sql/avatar.sql)), vamos tentar resolver os seguintes problemas sem utilizar Join:

* Mostrar quantas pessoas cada nação possui.
```
SELECT n.nome, 
	(SELECT COUNT(*) FROM pessoas as p where p.nacao_id = n.id) as 'count'
	FROM nacoes as n;
```

* Mostrar quantos elementos cada pessoa domina.

```
SELECT p.nome,
(SELECT COUNT(*) FROM pessoa_elemento WHERE pessoa_id = p.id) as quantidade
FROM pessoas as p;
```
* Mostrar o valor total das compras e das vendas de cada pessoa e sua balança comercial.

```
SELECT nome,
 total_vendas,
 total_compras,
 total_vendas - total_compras as balanco
 FROM (
SELECT p.nome,
	(SELECT COALESCE(SUM(c.valor), 0) 
	FROM comercio as c 
	WHERE c.vendedor_id = p.id) as total_vendas,
	(SELECT COALESCE(SUM(c.valor), 0) 
	FROM comercio as c 
	WHERE c.comprador_id = p.id) as total_compras
FROM pessoas as p) as asdsad;
```

* Mostrar o nome da pessoa e uma lista dos elementos que ela domina.

```
SELECT p.nome,
(SELECT GROUP_CONCAT(e.nome) FROM elementos as e
WHERE EXISTS (
	SELECT * 
	FROM pessoa_elemento as pe 
	WHERE pe.pessoa_id = p.id AND pe.elemento_id = e.id)
	) as elementos
FROM pessoas as p;
```