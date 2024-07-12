CREATE SCHEMA vendas;

CREATE TABLE vendas.Cliente (
	ID_Cliente SERIAL PRIMARY KEY,
	Nome VARCHAR(255) NOT NULL,
	CPF VARCHAR(100) UNIQUE NOT NULL,
	Data_Nascimento DATE NOT NULL,
	UF CHAR(2) NOT NULL
);

CREATE TABLE vendas.Categoria(
	ID_Categoria SERIAL PRIMARY KEY,
	Nome_Categoria VARCHAR(255) NOT NULL
);

CREATE TABLE vendas.Promocao(
	ID_Promocao SERIAL PRIMARY KEY,
	Desconto INT
	
);

CREATE TABLE vendas.Produto(
	ID_Produto SERIAL PRIMARY KEY,
	Nome_Produto VARCHAR(100) NOT NULL,
	Preco FLOAT(2) NOT NULL,
	ID_Categoria INT REFERENCES vendas.Categoria(ID_Categoria) ON DELETE CASCADE	
);

CREATE TABLE vendas.Canal_Venda(
	ID_Local SERIAL PRIMARY KEY,
	Local VARCHAR(255) NOT NULL
);


CREATE TABLE vendas.Vendedor(
	ID_Vendedor SERIAL PRIMARY KEY,
	Nome_Vendedor VARCHAR(255) NOT NULL,
	Cod_Vendedor SERIAL UNIQUE NOT NULL,
	ID_Local INT REFERENCES vendas.Canal_Venda(ID_Local) ON DELETE CASCADE
);

CREATE TABLE vendas.Engajamento(
	ID_Engajamento SERIAL PRIMARY KEY,
	Visualizacoes INT,
	Comentarios INT,
	Curtidas INT,
	Compartilhamentos INT,
	ID_Local INT REFERENCES vendas.Canal_Venda(ID_Local) ON DELETE CASCADE,
	ID_Produto INT REFERENCES vendas.Produto(ID_Produto) ON DELETE CASCADE
);

CREATE TABLE vendas.Met_Pagamento(
	ID_Pagamento SERIAL PRIMARY KEY,
	Tipo VARCHAR(100)
);

CREATE TABLE vendas.Transacao_Venda(
	ID_Transacao SERIAL PRIMARY KEY,
	Data_venda DATE NOT NULL,
	Feedback INT,
	ID_Cliente INT REFERENCES vendas.Cliente(ID_Cliente) ON DELETE CASCADE,
	ID_Pagamento INT REFERENCES vendas.Met_Pagamento(ID_Pagamento) ON DELETE CASCADE,
	ID_Local INT REFERENCES vendas.Canal_Venda(ID_Local) ON DELETE CASCADE,
	ID_Promocao INT REFERENCES vendas.Promocao(ID_Promocao) ON DELETE CASCADE,
	ID_Vendedor INT REFERENCES vendas.Vendedor(ID_Vendedor) ON DELETE CASCADE
);

CREATE TABLE vendas.Prod_Transacao(
	Quantidade INT NOT NULL,
	ID_Produto INT REFERENCES vendas.Produto(ID_Produto) ON DELETE CASCADE,
	ID_Transacao INT REFERENCES vendas.Transacao_Venda(ID_Transacao) ON DELETE CASCADE
);

CREATE TABLE vendas.Estoque(
	ID_Estoque SERIAL PRIMARY KEY,
	Quantidade_Disp INT NOT NULL CHECK (Quantidade_Disp > 0),
	ID_Produto INT REFERENCES vendas.Produto(ID_Produto) ON DELETE CASCADE
);