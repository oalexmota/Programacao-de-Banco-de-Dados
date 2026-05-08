CREATE DATABASE Oficina;
USE Oficina;

-- Criação das tabelas
CREATE TABLE Clientes(
	id_cliente INT PRIMARY KEY,
    nome VARCHAR(100),
    cidade VARCHAR(100)
);

CREATE TABLE Veiculos(
	id_veiculo INT PRIMARY KEY,
    modelo VARCHAR(100),
    ano INT,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes (id_cliente)
);

CREATE TABLE Mecanicos(
	id_mecanico INT PRIMARY KEY,
    nome VARCHAR(100),
    especialidade VARCHAR(100)
);

CREATE TABLE Servicos(
	id_servico INT PRIMARY KEY,
    descricao VARCHAR(100),
    preco_base DECIMAL
);

CREATE TABLE Ordens_Servico(
	id_os INT PRIMARY KEY,
    data_emissao DATE,
    valor_total DECIMAL,
    status VARCHAR(100),
    id_veiculo INT,
    FOREIGN KEY (id_veiculo) REFERENCES Veiculos (id_veiculo),
    id_mecanico INT,
    FOREIGN KEY (id_mecanico) REFERENCES Mecanicos (id_mecanico)
);

CREATE TABLE Itens_Servico(
	id_os INT,
    id_servico INT,
    quantidade INT,
    PRIMARY KEY(id_os, id_servico),
    FOREIGN KEY (id_os) REFERENCES Ordens_Servico (id_os),
    FOREIGN KEY (id_servico) REFERENCES Servicos (id_servico)
);

-- Inserções dos valores
INSERT INTO Clientes (id_cliente, nome, cidade) VALUES
(1, 'Carlos Silva', 'São Paulo'), (2, 'Ana Souza', 'Curitiba'), (3, 'Bruno Lima', 'São Paulo'), (4, 'Julia Costa', 'Santos'),
(5, 'Ricardo Oliveira', 'Belo Horizonte'), (6, 'Beatriz Santos', 'Rio de Janeiro'), (7, 'Fernando Alves', 'São Paulo'), (8, 'Mariana Rocha', 'Porto Alegre'),
(9, 'Lucas Mendes', 'Salvador'), (10, 'Camila Ferreira', 'Fortaleza'), (11, 'Gabriel Sousa', 'Brasília'), (12, 'Larissa Pereira', 'Recife'),
(13, 'Rafael Gomes', 'Manaus'), (14, 'Isabela Ribeiro', 'São Luís'), (15, 'Gustavo Martins', 'Natal'), (16, 'Letícia Carvalho', 'João Pessoa'),
(17, 'Daniel Almeida', 'Maceió'), (18, 'Amanda Rodrigues', 'Aracaju'), (19, 'Matheus Silva', 'Teresina'), (20, 'Vitoria Lima', 'Palmas'),
(21, 'Thiago Duarte', 'Campo Grande'), (22, 'Sofia Neves', 'Cuiabá'), (23, 'Enzo Lopes', 'Goiânia'), (24, 'Valentina Ramos', 'Belém'),
(25, 'João Paulo', 'Vitória'), (26, 'Maria Clara', 'Florianópolis'), (27, 'Pedro Henrique', 'São Paulo'), (28, 'Lorena Castro', 'Curitiba'),
(29, 'Felipe Cardoso', 'Londrina'), (30, 'Manuela Cunha', 'Joinville'), (31, 'Vinícius Rocha', 'Caxias do Sul'), (32, 'Alice Moreira', 'Pelotas'),
(33, 'Murilo Farias', 'Niterói'), (34, 'Eduarda Teixeira', 'Duque de Caxias'), (35, 'Samuel Vieira', 'Campinas'), (36, 'Giovanna Nogueira', 'Sorocaba'),
(37, 'Kaique Freitas', 'Ribeirão Preto'), (38, 'Yasmin Barros', 'São José dos Campos'), (39, 'Rodrigo Porto', 'Osasco'), (40, 'Bianca Meireles', 'Santo André'),
(41, 'Igor Azevedo', 'São Bernardo do Campo'), (42, 'Clara Batista', 'Uberlândia'), (43, 'Caio Nascimento', 'Juiz de Fora'), (44, 'Lívia Pires', 'Contagem'),
(45, 'Augusto Sales', 'Betim'), (46, 'Renata Guerra', 'Aparecida de Goiânia'), (47, 'Sérgio Campos', 'Anápolis'), (48, 'Patrícia Borges', 'Jundiaí'),
(49, 'Roberto Antunes', 'Piracicaba'), (50, 'Fernanda Lira', 'Bauru');

INSERT INTO Veiculos (id_veiculo, modelo, ano, id_cliente) VALUES
(1, 'Celta', 2012, 1), (2, 'Jetta', 2020, 1), (3, 'Voyage', 2015, 2), (4, 'Tiida', 2013, 3), (5, 'Civic', 2018, 5),
(6, 'Corolla', 2021, 6), (7, 'HB20', 2019, 7), (8, 'Onix', 2022, 8), (9, 'Gol', 2010, 9), (10, 'Palio', 2014, 10),
(11, 'Uno', 2011, 11), (12, 'Argo', 2021, 12), (13, 'Cronos', 2020, 13), (14, 'Sandero', 2017, 14), (15, 'Logan', 2016, 15),
(16, 'Duster', 2019, 16), (17, 'Kwid', 2022, 17), (18, 'Cruze', 2018, 18), (19, 'Tracker', 2021, 19), (20, 'S10', 2015, 20),
(21, 'Hilux', 2020, 21), (22, 'Etios', 2016, 22), (23, 'Yaris', 2019, 23), (24, 'Polo', 2021, 24), (25, 'Virtus', 2022, 25),
(26, 'T-Cross', 2021, 26), (27, 'Nivus', 2022, 27), (28, 'Compass', 2020, 28), (29, 'Renegade', 2019, 29), (30, 'Commander', 2022, 30),
(31, 'EcoSport', 2018, 31), (32, 'Ka', 2019, 32), (33, 'Fiesta', 2015, 33), (34, 'Ranger', 2021, 34), (35, 'Fit', 2017, 35),
(36, 'City', 2020, 36), (37, 'HR-V', 2021, 37), (38, 'Sentra', 2016, 38), (39, 'Versa', 2021, 39), (40, 'Kicks', 2022, 40),
(41, 'Creta', 2021, 41), (42, 'Tucson', 2018, 42), (43, 'Peugeot 208', 2022, 43), (44, 'C3', 2021, 44), (45, 'Mobi', 2022, 45),
(46, 'Captur', 2020, 46), (47, 'Oroch', 2019, 47), (48, 'Spin', 2018, 48), (49, 'Fiorino', 2021, 49), (50, 'Saveiro', 2020, 50);

INSERT INTO Mecanicos (id_mecanico, nome, especialidade) VALUES
(1, 'Roberto', 'Motores'), (2, 'Marcos', 'Suspensão'), (3, 'Aline', 'Elétrica'), (4, 'Sérgio', 'Motores'),
(5, 'Cláudio', 'Freios'), (6, 'Fábio', 'Alinhamento'), (7, 'Paula', 'Injeção Eletrônica'), (8, 'Márcio', 'Suspensão'),
(9, 'Renato', 'Câmbio'), (10, 'Patrícia', 'Ar Condicionado'), (11, 'Jorge', 'Motores'), (12, 'Sônia', 'Elétrica'),
(13, 'Bruno', 'Pintura'), (14, 'Carlos', 'Lanternagem'), (15, 'Davi', 'Motores'), (16, 'Eduardo', 'Suspensão'),
(17, 'Flávia', 'Elétrica'), (18, 'Gilberto', 'Freios'), (19, 'Hugo', 'Motores'), (20, 'Ítalo', 'Injeção Eletrônica'),
(21, 'Jair', 'Câmbio'), (22, 'Kelly', 'Motores'), (23, 'Luís', 'Elétrica'), (24, 'Marta', 'Suspensão'), (25, 'Nilson', 'Freios'),
(26, 'Otávio', 'Motores'), (27, 'Pedro', 'Injeção Eletrônica'), (28, 'Quiteria', 'Elétrica'), (29, 'Ronaldo', 'Suspensão'), (30, 'Sandra', 'Ar Condicionado'),
(31, 'Tânia', 'Motores'), (32, 'Ubirajara', 'Câmbio'), (33, 'Vagner', 'Elétrica'), (34, 'Wanda', 'Suspensão'), (35, 'Xavier', 'Freios'),
(36, 'Yago', 'Motores'), (37, 'Zilda', 'Injeção Eletrônica'), (38, 'Arthur', 'Elétrica'), (39, 'Breno', 'Suspensão'), (40, 'Célia', 'Motores'),
(41, 'Diego', 'Câmbio'), (42, 'Eliane', 'Freios'), (43, 'Fagner', 'Elétrica'), (44, 'Gerson', 'Motores'), (45, 'Heloísa', 'Suspensão'),
(46, 'Ivan', 'Injeção Eletrônica'), (47, 'Jussara', 'Câmbio'), (48, 'Kleber', 'Motores'), (49, 'Lúcia', 'Freios'), (50, 'Mauro', 'Elétrica');

INSERT INTO Servicos (id_servico, descricao, preco_base) VALUES
(1, 'Troca de Óleo', 150.00), (2, 'Alinhamento', 80.00), (3, 'Revisão Elétrica', 200.00), (4, 'Troca de Pastilhas', 120.00),
(5, 'Balanceamento', 60.00), (6, 'Limpeza de Bicos', 180.00), (7, 'Carga de Gás AC', 150.00), (8, 'Troca de Filtro Ar', 50.00),
(9, 'Substituição Amortecedor', 450.00), (10, 'Reparo de Motor', 1500.00), (11, 'Troca de Embreagem', 800.00), (12, 'Sangria de Freio', 90.00),
(13, 'Troca de Velas', 110.00), (14, 'Ajuste de Farol', 40.00), (15, 'Troca de Bateria', 350.00), (16, 'Higienização Interna', 120.00),
(17, 'Troca de Correia Dentada', 600.00), (18, 'Cambagem', 100.00), (19, 'Reparo de Radiador', 250.00), (20, 'Troca de Pneu', 40.00),
(21, 'Polimento', 300.00), (22, 'Cristalização', 500.00), (23, 'Troca Fluido Freio', 130.00), (24, 'Limpeza Arrefecimento', 160.00), (25, 'Troca de Cabo Vela', 90.00),
(26, 'Pintura Parachoque', 400.00), (27, 'Martelinho de Ouro', 150.00), (28, 'Troca de Lâmpada', 20.00), (29, 'Revisão Geral', 450.00), (30, 'Troca Terminal Direção', 140.00),
(31, 'Troca de Pivô', 130.00), (32, 'Troca Bucha Bandeja', 110.00), (33, 'Alinhamento Farol', 50.00), (34, 'Escaneamento Injeção', 100.00), (35, 'Troca de Sensor ABS', 250.00),
(36, 'Reparo Alternador', 300.00), (37, 'Troca de Bobina', 280.00), (38, 'Troca de Junta Cabeçote', 900.00), (39, 'Retífica de Disco', 100.00), (40, 'Troca de Escapamento', 350.00),
(41, 'Solda Escapamento', 80.00), (42, 'Troca de Bomba Combustível', 380.00), (43, 'Troca de Boia Tanque', 150.00), (44, 'Regulagem de Válvulas', 200.00), (45, 'Troca de Coxim Motor', 220.00),
(46, 'Troca de Junta Homocinética', 280.00), (47, 'Troca de Rolamento Roda', 180.00), (48, 'Reparo de Vidro Elétrico', 120.00), (49, 'Reparo Trava Elétrica', 100.00), (50, 'Instalação de Som', 200.00);

INSERT INTO Ordens_Servico (id_os, data_emissao, valor_total, status, id_veiculo, id_mecanico) VALUES
(1, '2024-01-10', 300.00, 'Finalizado', 1, 1), (2, '2024-01-12', 150.00, 'Finalizado', 2, 1), (3, '2024-02-01', 80.00, 'Aberto', 3, 2),
(4, '2024-02-05', 450.00, 'Finalizado', 4, 3), (5, '2024-02-10', 120.00, 'Finalizado', 5, 4), (6, '2024-02-15', 180.00, 'Aberto', 6, 5),
(7, '2024-02-20', 250.00, 'Finalizado', 7, 6), (8, '2024-02-25', 1500.00, 'Aberto', 8, 7), (9, '2024-03-01', 90.00, 'Finalizado', 9, 8),
(10, '2024-03-05', 200.00, 'Finalizado', 10, 9), (11, '2024-03-10', 350.00, 'Aberto', 11, 10), (12, '2024-03-15', 600.00, 'Finalizado', 12, 11),
(13, '2024-03-20', 100.00, 'Finalizado', 13, 12), (14, '2024-03-25', 150.00, 'Aberto', 14, 13), (15, '2024-04-01', 400.00, 'Finalizado', 15, 14),
(16, '2024-04-05', 120.00, 'Finalizado', 16, 15), (17, '2024-04-10', 800.00, 'Aberto', 17, 16), (18, '2024-04-15', 50.00, 'Finalizado', 18, 17),
(19, '2024-04-20', 110.00, 'Finalizado', 19, 18), (20, '2024-04-25', 200.00, 'Aberto', 20, 19), (21, '2024-05-01', 150.00, 'Finalizado', 21, 20),
(22, '2024-05-05', 300.00, 'Finalizado', 22, 21), (23, '2024-05-10', 180.00, 'Aberto', 23, 22), (24, '2024-05-15', 450.00, 'Finalizado', 24, 23),
(25, '2024-05-20', 120.00, 'Finalizado', 25, 24), (26, '2024-05-25', 60.00, 'Aberto', 26, 25), (27, '2024-06-01', 250.00, 'Finalizado', 27, 26),
(28, '2024-06-05', 150.00, 'Finalizado', 28, 27), (29, '2024-06-10', 90.00, 'Aberto', 29, 28), (30, '2024-06-15', 200.00, 'Finalizado', 30, 29),
(31, '2024-01-20', 1200.00, 'Finalizado', 31, 30), (32, '2024-01-25', 350.00, 'Finalizado', 32, 31), (33, '2024-02-28', 150.00, 'Aberto', 33, 32),
(34, '2024-03-02', 400.00, 'Finalizado', 34, 33), (35, '2024-03-12', 110.00, 'Finalizado', 35, 34), (36, '2024-03-22', 250.00, 'Aberto', 36, 35),
(37, '2024-04-02', 600.00, 'Finalizado', 37, 36), (38, '2024-04-12', 300.00, 'Finalizado', 38, 37), (39, '2024-04-22', 150.00, 'Aberto', 39, 38),
(40, '2024-05-02', 90.00, 'Finalizado', 40, 39), (41, '2024-05-12', 200.00, 'Finalizado', 41, 40), (42, '2024-05-22', 350.00, 'Aberto', 42, 41),
(43, '2024-06-02', 400.00, 'Finalizado', 43, 42), (44, '2024-06-12', 120.00, 'Finalizado', 44, 43), (45, '2024-06-22', 800.00, 'Aberto', 45, 44),
(46, '2024-01-05', 50.00, 'Finalizado', 46, 45), (47, '2024-01-15', 110.00, 'Finalizado', 47, 46), (48, '2024-01-25', 200.00, 'Aberto', 48, 47),
(49, '2024-02-05', 150.00, 'Finalizado', 49, 48), (50, '2024-02-15', 300.00, 'Finalizado', 50, 49);

INSERT INTO Itens_Servico (id_os, id_servico, quantidade) VALUES
(1, 1, 1), (1, 2, 1), (2, 1, 1), (3, 2, 1), (4, 9, 1),
(5, 4, 1), (6, 6, 1), (7, 7, 1), (8, 10, 1), (9, 12, 1),
(10, 3, 1), (11, 15, 1), (12, 17, 1), (13, 18, 1), (14, 1, 1),
(15, 26, 1), (16, 16, 1), (17, 11, 1), (18, 28, 2), (19, 13, 1),
(20, 3, 1), (21, 7, 1), (22, 21, 1), (23, 6, 1), (24, 29, 1),
(25, 4, 1), (26, 5, 1), (27, 7, 1), (28, 1, 1), (29, 12, 1),
(30, 3, 1), (31, 38, 1), (32, 15, 1), (33, 1, 1), (34, 26, 1),
(35, 13, 1), (36, 35, 1), (37, 17, 1), (38, 21, 1), (39, 7, 1),
(40, 25, 1), (41, 3, 1), (42, 40, 1), (43, 26, 1), (44, 16, 1),
(45, 11, 1), (46, 14, 1), (47, 13, 1), (48, 3, 1), (49, 7, 1), (50, 21, 1);

-- Seleções
-- Desafio 1: Relatório de Frota por Cliente 
/* Apresente uma lista com o nome de todos os clientes e os modelos de seus veículos. 
Caso o cliente não tenha veículo cadastrado, o nome dele deve aparecer mesmo assim. */
SELECT C.nome AS 'Cliente', V.modelo AS 'Veículo'
FROM Clientes C
LEFT JOIN Veiculos V 
ON C.id_cliente = V.id_cliente
ORDER BY C.nome;

/*RESULTADO
Cliente,VeÃ­culo
Alice Moreira,Ka
Amanda Rodrigues,Cruze
Ana Souza,Voyage
Augusto Sales,Mobi
Beatriz Santos,Corolla
Bianca Meireles,Kicks
Bruno Lima,Tiida
Caio Nascimento,"Peugeot 208"
Camila Ferreira,Palio
Carlos Silva,Celta
Carlos Silva,Jetta
Clara Batista,Tucson
Daniel Almeida,Kwid
Eduarda Teixeira,Ranger
Enzo Lopes,Yaris
Felipe Cardoso,Renegade
Fernanda Lira,Saveiro
Fernando Alves,HB20
Gabriel Sousa,Uno
Giovanna Nogueira,City
Gustavo Martins,Logan
Igor Azevedo,Creta
Isabela Ribeiro,Sandero
JoÃ£o Paulo,Virtus
Julia Costa,NULL
Kaique Freitas,HR-V
Larissa Pereira,Argo
LetÃ­cia Carvalho,Duster
LÃ­via Pires,C3
Lorena Castro,Compass
Lucas Mendes,Gol
Manuela Cunha,Commander
Maria Clara,T-Cross
Mariana Rocha,Onix
Matheus Silva,Tracker
Murilo Farias,Fiesta
PatrÃ­cia Borges,Spin
Pedro Henrique,Nivus
Rafael Gomes,Cronos
Renata Guerra,Captur
Ricardo Oliveira,Civic
Roberto Antunes,Fiorino
Rodrigo Porto,Versa
Samuel Vieira,Fit
SÃ©rgio Campos,Oroch
Sofia Neves,Etios
Thiago Duarte,Hilux
Valentina Ramos,Polo
VinÃ­cius Rocha,EcoSport
Vitoria Lima,S10
Yasmin Barros,Sentra
*/

-- Desafio 2: Produtividade dos Mecânicos 
/*Quantas Ordens de Serviço cada mecânico realizou? 
Exiba o nome do mecânico e a contagem de OS. */
SELECT M.nome AS 'Mecânico', count(OS.id_os) AS 'Ordens de Serviços'
FROM Mecanicos M
LEFT JOIN Ordens_Servico OS
ON M.id_mecanico = OS.id_mecanico
GROUP BY M.nome
ORDER BY M.nome;

/*RESULTADO
MecÃ¢nico,"Ordens de ServiÃ§os"
Aline,1
Arthur,1
Breno,1
Bruno,1
Carlos,1
CÃ©lia,1
ClÃ¡udio,1
Davi,1
Diego,1
Eduardo,1
Eliane,1
FÃ¡bio,1
Fagner,1
FlÃ¡via,1
Gerson,1
Gilberto,1
HeloÃ­sa,1
Hugo,1
Ãtalo,1
Ivan,1
Jair,1
Jorge,1
Jussara,1
Kelly,1
Kleber,1
LÃºcia,1
LuÃ­s,1
MÃ¡rcio,1
Marcos,1
Marta,1
Mauro,0
Nilson,1
OtÃ¡vio,1
PatrÃ­cia,1
Paula,1
Pedro,1
Quiteria,1
Renato,1
Roberto,2
Ronaldo,1
Sandra,1
SÃ©rgio,1
SÃ´nia,1
TÃ¢nia,1
Ubirajara,1
Vagner,1
Wanda,1
Xavier,1
Yago,1
Zilda,1
*/

-- Desafio 3: Faturamento por Cidade 
/*Qual o valor total de ordens de serviço gerado por clientes da cidade de 'São Paulo'? */
SELECT SUM(OS.valor_total) AS 'Valor total de O.S em SP'
FROM Ordens_Servico OS
JOIN Veiculos V 
ON V.id_veiculo = OS.id_veiculo
INNER JOIN Clientes C
ON C.id_cliente = V.id_cliente
WHERE C.cidade LIKE 'São Paulo';

/*RESULTADO
Valor total de O.S em SP
1400
*/
-- Desafio 4: Detalhamento de Serviços em Aberto
/*Liste o modelo do veículo, o nome do mecânico responsável e a descrição do 
serviço para todas as Ordens de Serviço que estejam com o status 'Aberto'. */
SELECT V.modelo AS 'Modelo Veículo', M.nome AS 'Mecânico Responsável', S.descricao AS 'Descrição'
FROM Itens_Servico I
JOIN Ordens_Servico OS
ON OS.id_os = I.id_os
JOIN Veiculos V
ON V.id_veiculo = OS.id_veiculo
JOIN Mecanicos M
ON M.id_mecanico = OS.id_mecanico
JOIN Servicos S
ON S.id_servico = I.id_servico
WHERE OS.status LIKE 'Aberto';

/*RESULTADO
Modelo VeÃ­culo,"MecÃ¢nico ResponsÃ¡vel",DescriÃ§Ã£o
Voyage,Marcos,Alinhamento
Corolla,ClÃ¡udio,"Limpeza de Bicos"
Onix,Paula,"Reparo de Motor"
Uno,PatrÃ­cia,"Troca de Bateria"
Sandero,Bruno,"Troca de Ã“leo"
Kwid,Eduardo,"Troca de Embreagem"
S10,Hugo,"RevisÃ£o ElÃ©trica"
Yaris,Kelly,"Limpeza de Bicos"
T-Cross,Nilson,Balanceamento
Renegade,Quiteria,"Sangria de Freio"
Fiesta,Ubirajara,"Troca de Ã“leo"
City,Xavier,"Troca de Sensor ABS"
Versa,Arthur,"Carga de GÃ¡s AC"
Tucson,Diego,"Troca de Escapamento"
Mobi,Gerson,"Troca de Embreagem"
Spin,Jussara,"RevisÃ£o ElÃ©trica"
*/

-- Desafio 5: Clientes VIP (Subconsulta) 
/*Liste os nomes dos clientes que gastaram em ordens de serviço um valor total 
acima da média de gastos de todos os clientes da oficina. */
SELECT C.nome AS 'Cliente', sum(OS.valor_total) AS 'Valor pago'
FROM Ordens_Servico OS 
JOIN Veiculos V
ON OS.id_veiculo = V.id_veiculo
JOIN Clientes C
ON V.id_cliente = C.id_cliente
WHERE OS.valor_total > (SELECT AVG(OS.valor_total)
						FROM Ordens_Servico OS)
GROUP BY C.nome;

/* RESULTADO
Cliente,"Valor pago"
Alice Moreira,350
Augusto Sales,800
Bruno Lima,450
Caio Nascimento,400
Carlos Silva,300
Clara Batista,350
Daniel Almeida,800
Eduarda Teixeira,400
Fernanda Lira,300
Gabriel Sousa,350
Gustavo Martins,400
Kaique Freitas,600
Larissa Pereira,600
Mariana Rocha,1500
Sofia Neves,300
Valentina Ramos,450
VinÃ­cius Rocha,1200
Yasmin Barros,300
*/