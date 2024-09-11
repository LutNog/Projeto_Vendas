-- DB Modelo Físico Loja

CREATE SCHEMA db_loja;

CREATE TABLE db_loja.Cliente (
	ID_Cliente SERIAL PRIMARY KEY,
	Nome VARCHAR(255) NOT NULL,
	CPF VARCHAR(100) UNIQUE NOT NULL,
	Data_Nascimento DATE NOT NULL,
	UF CHAR(2) NOT NULL
);

CREATE TABLE db_loja.Categoria(
	ID_Categoria SERIAL PRIMARY KEY,
	Nome_Categoria VARCHAR(255) NOT NULL
);

CREATE TABLE db_loja.Promocao(
	ID_Promocao SERIAL PRIMARY KEY,
	Desconto INT
	
);

CREATE TABLE db_loja.Produto(
	ID_Produto SERIAL PRIMARY KEY,
	Nome_Produto VARCHAR(100) NOT NULL,
	Preco FLOAT(2) NOT NULL,
	ID_Categoria INT REFERENCES db_loja.Categoria(ID_Categoria) ON DELETE CASCADE	
);

CREATE TABLE db_loja.Canal_Venda(
	ID_Local SERIAL PRIMARY KEY,
	Local VARCHAR(255) NOT NULL
);


CREATE TABLE db_loja.Vendedor(
	ID_Vendedor SERIAL PRIMARY KEY,
	Nome_Vendedor VARCHAR(255) NOT NULL,
	Cod_Vendedor SERIAL UNIQUE NOT NULL,
	ID_Local INT REFERENCES db_loja.Canal_Venda(ID_Local) ON DELETE CASCADE
);

CREATE TABLE db_loja.Engajamento(
	ID_Engajamento SERIAL PRIMARY KEY,
	Visualizacoes INT,
	Comentarios INT,
	Curtidas INT,
	Compartilhamentos INT,
	ID_Local INT REFERENCES db_loja.Canal_Venda(ID_Local) ON DELETE CASCADE,
	ID_Produto INT REFERENCES db_loja.Produto(ID_Produto) ON DELETE CASCADE
);

CREATE TABLE db_loja.Met_Pagamento(
	ID_Pagamento SERIAL PRIMARY KEY,
	Tipo VARCHAR(100)
);

CREATE TABLE db_loja.Transacao_Venda(
	ID_Transacao SERIAL PRIMARY KEY,
	Data_venda DATE NOT NULL,
	Feedback INT,
	ID_Cliente INT REFERENCES db_loja.Cliente(ID_Cliente) ON DELETE CASCADE,
	ID_Pagamento INT REFERENCES db_loja.Met_Pagamento(ID_Pagamento) ON DELETE CASCADE,
	ID_Local INT REFERENCES db_loja.Canal_Venda(ID_Local) ON DELETE CASCADE,
	ID_Promocao INT REFERENCES db_loja.Promocao(ID_Promocao) ON DELETE CASCADE,
	ID_Vendedor INT REFERENCES db_loja.Vendedor(ID_Vendedor) ON DELETE CASCADE
);

CREATE TABLE db_loja.Prod_Transacao(
	Quantidade INT NOT NULL,
	ID_Produto INT REFERENCES db_loja.Produto(ID_Produto) ON DELETE CASCADE,
	ID_Transacao INT REFERENCES db_loja.Transacao_Venda(ID_Transacao) ON DELETE CASCADE
);

CREATE TABLE db_loja.Estoque(
	ID_Estoque SERIAL PRIMARY KEY,
	Quantidade_Disp INT NOT NULL CHECK (Quantidade_Disp > 0),
	ID_Produto INT REFERENCES db_loja.Produto(ID_Produto) ON DELETE CASCADE
);