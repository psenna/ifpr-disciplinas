SELECT p.nome AS 'Nome', COALESCE(vendas.valor_total, 0) AS 'Total_Vendas', COALESCE(compras.valor_total, 0) AS 'Total_Compras', COALESCE(vendas.valor_total, 0) - COALESCE(compras.valor_total, 0) AS 'Resultado'
    FROM pessoas AS p 
    LEFT JOIN (SELECT vendedor_id, SUM(c.valor) AS 'valor_total' FROM comercio AS c GROUP BY vendedor_id) AS vendas  ON p.id = vendas.vendedor_id
    LEFT JOIN (SELECT comprador_id, SUM(c.valor) AS 'valor_total' FROM comercio AS c GROUP BY comprador_id) AS compras ON p.id = compras.comprador_id;