-- Inserido Dados Fixos na Tabela Categoria
INSERT INTO vendas.Categoria (Nome_Categoria) VALUES
('Informática'),
('Áudio e TV'),
('Comunicação');
--Visualizando a tabela
SELECT * FROM vendas.Categoria;


-- Inserido Dados Fixos na Tabela Promoção
INSERT INTO vendas.Promocao (Desconto) VALUES
(0),
(5),
(10);
--Visualizando a tabela
SELECT * FROM vendas.Promocao;


-- Inserido Dados Fixos na Tabela Produtos
INSERT INTO vendas.Produto (Nome_Produto, Preco, ID_Categoria) VALUES
('Notebook', 2550.00, 1),
('PC', 4100.20, 1),
('Smartphone', 3999.99, 3),
('Celular', 549.00, 3),
('Câmera', 2000.00, 2),
('Tablet', 1670.70, 3),
('TV', 4999.99, 2);
--Visualizando a tabela
SELECT * FROM vendas.Produto;


-- Inserido Dados Fixos na Tabela Produtos
INSERT INTO vendas.Canal_venda (Local) VALUES
('Site'),
('Amazon'),
('Loja01'),
('Loja02'),
('Loja03'),
('Loja04'),
('Loja05');
--Visualizando a tabela
SELECT * FROM vendas.Canal_venda;


-- Inserido Dados Fixos na Tabela Vendedor
INSERT INTO vendas.Vendedor (Nome_Vendedor, Id_Local) VALUES
('Venda Site', 1),
('Venda Amazon', 2),
('Vendedor01', 3),
('Vendedor02', 3),
('Vendedor03', 4),
('Vendedor04', 4),
('Vendedor05', 5),
('Vendedor06', 5),
('Vendedor07', 6),
('Vendedor08', 6),
('Vendedor09', 7),
('Vendedor10', 7);
--Visualizando a tabela
SELECT * FROM vendas.Vendedor;

-- Inserido Dados Fixos na Tabela Produtos
INSERT INTO vendas.Met_Pagamento (Tipo) VALUES
('PIX'),
('Crédito'),
('Débito'),
('Boleto');
--Visualizando a tabela
SELECT * FROM vendas.Met_Pagamento;


INSERT INTO vendas.Estoque (Quantidade_Disp, ID_Produto) VALUES
(2110,1),
(1501, 2),
(3079,3),
(205,4),
(1557,5),
(2017,6),
(4063,7);
--Visualizando a tabela
SELECT * FROM vendas.Estoque;