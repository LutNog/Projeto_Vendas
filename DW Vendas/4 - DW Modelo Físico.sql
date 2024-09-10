4 - DW Modelo Físico


CREATE SCHEMA dw_vendas;

-- Criando tabelas dimensionais

CREATE TABLE dw_vendas.DIM_CLIENTE(
	ID_cliente INT PRIMARY KEY NOT NULL,
	Nome_cliente VARCHAR(255) NOT NULL,
	UF CHAR(2) NOT NULL		
);


CREATE TABLE dw_vendas.DIM_VENDEDOR(
	ID_vendedor INT PRIMARY KEY NOT NULL,
	Nome_vendedor VARCHAR(255) NOT NULL
);


CREATE TABLE dw_vendas.DIM_LOJA(
	ID_loja INT PRIMARY KEY NOT NULL,
	Local VARCHAR (255) NOT NULL
);


CREATE TABLE dw_vendas.DIM_PRODUTO(
	ID_produto INT PRIMARY KEY NOT NULL,
	Categoria VARCHAR(255) NOT NULL,
	Nome_produto VARCHAR(255) NOT NULL
);

-- Criando tabela fato

CREATE TABLE dw_vendas.FATO_TRASANCAO(
	ID_transacao INT PRIMARY KEY NOT NULL,
	Data_transacao DATE NOT NULL,
	Quantidade INT NOT NULL,
	Valor_total FLOAT NOT NULL,
	ID_cliente INT REFERENCES dw_vendas.DIM_CLIENTE(ID_cliente) ON DELETE CASCADE,
	ID_vendedor INT REFERENCES dw_vendas.DIM_VENDEDOR(ID_vendedor) ON DELETE CASCADE,
	ID_Loja INT REFERENCES dw_vendas.DIM_LOJA(ID_loja) ON DELETE CASCADE,
	ID_produto INT REFERENCES dw_vendas.DIM_PRODUTO(ID_produto) ON DELETE CASCADE
);

