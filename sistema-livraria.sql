-- Criar o banco de dados
CREATE DATABASE Livraria;

-- Usar o banco de dados recém-criado
USE Livraria;

-- Criar a tabela Clientes
CREATE TABLE Clientes (
    ID INT PRIMARY KEY, -- Chave primária
    nomeCliente VARCHAR(255), -- Nome do cliente
    emailCliente VARCHAR(255) -- Email do cliente
);

-- Criar a tabela Compras
CREATE TABLE Compras (
    CompraID INT PRIMARY KEY, -- Chave primária
    ClienteID INT, -- Chave estrangeira
    NomeLivro VARCHAR(255), -- Nome do livro
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ID) -- Referencia Clientes.ID
);
SELECT * FROM Clientes
SELECT c.nomeCliente, cp.NomeLivro
FROM Clientes c
INNER JOIN Compras cp ON c.ID = cp.ClienteID;
