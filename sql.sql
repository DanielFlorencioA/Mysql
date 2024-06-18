CREATE TABLE Produto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    Nome_produto VARCHAR(100) NOT NULL,
    Descricao_Produto TEXT,
    Preco NUMERIC (10, 2) NOT NULL,
    Estoque_produto INT NOT NULL
);

CREATE TABLE Usuário (
    id INT PRIMARY KEY AUTO_INCREMENT,
    Nome_usuario VARCHAR(100) NOT NULL,
    Endereço_usuario VARCHAR(100),
    Email_usuario VARCHAR(100),
    contato_usuario INT(20)
);

CREATE TABLE Funcionario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    Nome_funcionario VARCHAR(100) NOT NULL,
    Cargo_funcionario VARCHAR(100),
    Departamento_funcionario VARCHAR(100),
    Salario NUMERIC(10, 2)
);

CREATE TABLE Venda (
    id INT PRIMARY KEY AUTO_INCREMENT,
    Produto_id INT NOT NULL,
    Cliente_id INT NOT NULL,
    Funcionario_id INT NOT NULL,
    Quantidade INT NOT NULL,
    Data DATE NOT NULL,
    FOREIGN KEY (Produto_ID) REFERENCES Produto(ID),
    FOREIGN KEY (Cliente_ID) REFERENCES Cliente(ID),
    FOREIGN KEY (Funcionario_ID) REFERENCES Funcionario(ID)
);

-- Dados da tabela Produto
INSERT INTO Produto (Nome_produto, Descricao_produto, Preco_produto, Estoque_produto) VALUES
    ('Camiseta', 'Camiseta de algodão', 29.90, 50),
    ('Calça Jeans', 'Calça jeans masculina', 79.90, 30),
    ('Tênis', 'Tênis esportivo', 129.90, 20);

-- Dados da tabela Usuário
INSERT INTO Cliente (Nome_usuario, Endereco_usuario, Email_usuario, Telefone_usuario) VALUES
    ('João Silva', 'Rua A, 123', 'joao.silva@email.com', '(11) 98765-4321'),
    ('Maria Souza', 'Rua B, 456', 'maria.souza@email.com', '(21) 91234-5678'),
    ('Ana Oliveira', 'Av. C, 789', 'ana.oliveira@email.com', '(31) 94567-8901');

-- Dados da tabela Funcionario
INSERT INTO Funcionario (Nome_funcionario, Cargo_funcionario, Departamento_funcionario, Salario_funcionario) VALUES
    ('Pedro Almeida', 'Vendedor', 'Vendas', 2500.00),
    ('Luisa Santos', 'Gerente', 'Vendas', 4000.00),
    ('Carlos Pereira', 'Caixa', 'Financeiro', 2000.00);

-- Dados da tabela Venda
INSERT INTO Venda (Produto_ID, Cliente_ID, Funcionario_ID, Quantidade, Data) VALUES
    (1, 1, 1, 2, '2024-05-30'),
    (2, 2, 2, 1, '2024-05-29'),
    (3, 3, 3, 1, '2024-05-28');

-- 1. Listar todos os produtos com estoque abaixo de 10 unidades:
SELECT * FROM Produto WHERE Estoque < 10;

-- 2. Listar as vendas realizadas pelo funcionário com ID 1:
SELECT * FROM Venda WHERE Funcionario_ID = 1;

-- 3. Listar os Usuário que compraram o produto com ID 2:
SELECT Usuário.* FROM Usuário
JOIN Venda ON Usuário.ID = Venda.Usuário_ID
WHERE Venda.Produto_ID = 2;

-- 4. Calcular o total de vendas em '2024-05-30':
SELECT SUM(Produto.Preco * Venda.Quantidade) AS Total_Vendas
FROM Venda
JOIN Produto ON Venda.Produto_ID = Produto.ID
WHERE Venda.Data = '2024-05-30';

-- 5. Listar os produtos mais vendidos, em ordem decrescente de quantidade vendida:
SELECT Produto.Nome, SUM(Venda.Quantidade) AS Quantidade_Vendida
FROM Produto
JOIN Venda ON Produto.ID = Venda.Produto_ID
GROUP BY Produto.ID
ORDER BY Quantidade_Vendida DESC;
