CREATE VIEW dw_vendas_informacoes AS
WITH cte_transacao_vendas AS (
	SELECT tv.id_transacao,
	   	   tv.id_cliente,
	       tv.id_vendedor,
	       tv.id_local,
	       pt.id_produto,
	       c.nome AS nome_cliente,
	       c.uf,
	       tv.data_venda,
	       v.nome_vendedor,
	       cv.local,
	       pt.quantidade,
	       (prom.desconto/100) AS desconto
	FROM 
		db_loja.transacao_venda tv
	JOIN 
		db_loja.prod_transacao pt ON tv.id_transacao = pt.id_transacao
	JOIN 
		db_loja.promocao prom ON tv.id_promocao = prom.id_promocao
	JOIN 
		db_loja.cliente c ON tv.id_cliente = c.id_cliente
	JOIN
		db_loja.vendedor v ON tv.id_vendedor = v.id_vendedor
	JOIN 
		db_loja.canal_venda cv ON tv.id_local = cv.id_local
)
SELECT ctetv.id_transacao,
	   ctetv.id_cliente,
	   ctetv.id_vendedor,
	   ctetv.id_local AS id_loja,
	   ctetv.id_produto,
	   ctetv.nome_cliente,
	   ctetv.uf,
	   ctetv.data_venda AS data_transacao,
	   ctetv.nome_vendedor,
	   ctetv.local,
	   p.nome_produto,
	   ca.nome_categoria as categoria,
	   ctetv.quantidade,
	   (p.preco - (p.preco * ctetv.desconto)) * ctetv.quantidade AS valor_total
FROM cte_transacao_vendas ctetv
JOIN db_loja.produto p ON ctetv.id_produto = p.id_produto
JOIN db_loja.categoria ca ON ca.id_categoria = p.id_categoria;


SELECT * FROM dw_vendas_informacoes;

