CREATE DATABASE IF NOT EXISTS livraria;

USE livraria;

CREATE TABLE IF NOT EXISTS livros (

    id INT PRIMARY KEY AUTO_INCREMENT,
    nome_do_livro VARCHAR (50) NOT NULL,
    nome_do_autor VARCHAR (50) NOT NULL,
	sexo_do_autor VARCHAR (10) NOT NULL,
	numero_de_paginas INT (3) NOT NULL,
	nome_da_editora VARCHAR (50) NOT NULL,
    valor_do_livro DECIMAL(10, 2) NOT NULL,
    estado_da_editora CHAR (2) NOT NULL,
    ano_de_publicação INT (4) NOT NULL
);

INSERT INTO livros (nome_do_livro, nome_do_autor, sexo_do_autor, numero_de_paginas, nome_da_editora, valor_do_livro, estado_da_editora, ano_de_publicação) VALUES
    ('Cavaleiro real', 'Ana Cláudia', 'Feminino', 465, 'Atlas', 49.9, 'RJ', 2009),
    ('SQL para leigos', 'João Nunes', 'Masculino', 450, 'Addison', 98, 'SP', 2018),
    ('Receitas caseiras', 'Célia Tavares', 'Feminino', 210, 'Atlas', 45, 'RJ', 2008),
    ('Pessoas efetivas', 'Eduardo Santos', 'Masculino', 390, 'Beta', 78.99, 'RJ', 2018),
    ('Hábitos saudáveis', 'Eduardo Santos', 'Masculino', 630, 'Beta', 150.98, 'RJ', 2019),
    ('A Casa Marrom', 'Hermes Macedo', 'Masculino', 250, 'Bubba', 60, 'MG', 2016),
    ('Estácio Querido', 'Geraldo Francisco', 'Masculino', 310, 'Insígnia', 100, 'ES', 2015),
    ('Pra sempre amigas', 'Leda Silva', 'Feminino', 510, 'Insígnia', 78.98, 'ES', 2019),
    ('Copas Inesquecíveis', 'Marco Alcântara', 'Masculino', 200, 'Larson', 130.98, 'RS', 2018),
    ('O poder da mente', 'Clara Mafra', 'Feminino', 120, 'Continental', 56.58, 'RS', 2017);
    
UPDATE livros
SET
	nome_do_livro = 'Cavaleiro real',
    nome_do_autor = 'Ana Cláudia',
    sexo_do_autor = 'Feminino',
    numero_de_paginas = 450,
    nome_da_editora = 'Atlas',
    valor_do_livro = 49.9,
    estado_da_editora = 'RJ',
    ano_de_publicação = 2009
    
WHERE
	id = 1;
    
SELECT * FROM livros WHERE id = 1

