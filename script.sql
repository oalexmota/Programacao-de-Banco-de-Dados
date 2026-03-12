-- 1) Criar BD e usar ele 

CREATE DATABASE escola;
USE escola;

-- 2) Criar as tabelas

-- Tabela de alunos
CREATE TABLE alunos (
	id_aluno INT PRIMARY KEY,
    nome VARCHAR(100),
    data_nascimento DATE,
    email VARCHAR(100)
);

-- Tabela de cursos
CREATE TABLE cursos (
	id_curso INT PRIMARY KEY,
    nome_curso VARCHAR(100),
    carga_horaria INT
);

-- Tabela de matrículas
CREATE TABLE matriculas (
	id_matricula INT PRIMARY KEY,
    id_aluno INT,
    id_curso INT,
    data_matricula DATE,
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

-- 3) Adicione uma coluna telefone na tabela alunos
ALTER TABLE alunos ADD telefone VARCHAR(20); 

-- 4) Modifique o tipo da coluna carga_horaria para SMALLINT
ALTER TABLE cursos MODIFY COLUMN carga_horaria SMALLINT;

-- 5) Exclua a tabela matriculas
DROP TABLE matriculas;

-- 6) Inserir Registros

-- 1) Inserir alunos
INSERT INTO alunos (id_aluno, nome, data_nascimento, email, telefone)
VALUES (1, 'Ana Souza', '2000-05-10', 'ana@email.com', '11999990000'),
		(2, 'Carlos Lima', '1999-11-22', 'carlos@email.com', '11988887777');

-- Inserir cursos
INSERT INTO cursos (id_curso, nome_curso, carga_horaria)
VALUES (101, 'Lógica de Programação', 60),
		(102, 'Banco de Dados', 80);

-- Inserir matrículas
INSERT INTO matriculas (id_matricula, id_aluno, id_curso, data_matricula)
VALUES (1001, 1, 101, '2024-03-10'),
		(1002, 2, 102, '2024-03-12');

-- 2) Atualizar o telefone de Ana Souza 
UPDATE alunos SET telefone = '11911112222' WHERE id_aluno = 1;

-- 3) Remova o curso de nome 'Lógica de Programação'
DELETE FROM cursos 
WHERE nome_curso = 'Lógica de Programação';

-- 4) Reinsira esse curso com ID 103 e carga horária 75
INSERT INTO cursos (id_curso, nome_curso, carga_horaria)
VALUES (103, 'Lógica de Programação', 75);

select * from cursos;