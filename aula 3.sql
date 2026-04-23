CREATE DATABASE trigo;
USE trigo;

CREATE TABLE produtos(
	id_produtos INT PRIMARY KEY AUTO_INCREMENT,
    nome_produtos VARCHAR(100),
    qt_estoque INT NOT NULL
);

CREATE TABLE pedidos(
	id_pedidos INT PRIMARY KEY AUTO_INCREMENT,
    qt_vendida INT,
    data_venda DATETIME,
    id_produtos INT,
    FOREIGN KEY (id_produtos) REFERENCES produtos (id_produtos)
);

DELIMITER $$
CREATE TRIGGER tg_atualiza_estoque
AFTER INSERT ON pedidos
FOR EACH ROW
BEGIN
	-- Comando Update
    UPDATE produtos
    SET  qt_estoque = qt_estoque - NEW.qt_vendida
    WHERE id_produtos = NEW.id_produtos;
END $$


-- INSERT 
INSERT INTO produtos(nome_produtos, qt_estoque)
VALUES ('Pão', 10),	
		('Liguiça', 50),
        ('Maionese', 5);

INSERT INTO pedidos(qt_vendida, data_venda, id_produtos)
VALUES (2, '2024-12-31', 3),	
		(10, '2025-12-31', 2),
        (5, '2026-12-31', 1);
        
-- SELECT
SELECT *
FROM produtos;
        