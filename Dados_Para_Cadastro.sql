-- Professores
INSERT INTO PROFESSOR (id_professor, nome, email) VALUES
(1, 'Marcos Rocha', 'marcos@faculdade.com'),
(2, 'Ana Souza', 'ana@faculdade.com'),
(3, 'Carlos Mendes', 'carlos@faculdade.com');

-- Turmas
INSERT INTO TURMA (id_turma, periodo, semestre, ano) VALUES
(1, 'Noturno', 1, 2026),
(2, 'Noturno', 2, 2026);

-- Disciplinas
INSERT INTO DISCIPLINA (id_disciplina, nome, carga_horaria, id_professor, id_turma) VALUES
(1, 'Banco de Dados', 60, 1, 1),
(2, 'Programação Orientada a Objetos', 80, 2, 1),
(3, 'Engenharia de Software', 60, 3, 2);

-- Alunos
INSERT INTO ALUNO (id_aluno, nome, matricula, email) VALUES
(1, 'João Silva', '2026001', 'joao@email.com'),
(2, 'Maria Oliveira', '2026002', 'maria@email.com'),
(3, 'Pedro Santos', '2026003', 'pedro@email.com'),
(4, 'Lucas Costa', '2026004', 'lucas@email.com');

-- Matrículas
INSERT INTO MATRICULA (id_matricula, id_aluno, id_disciplina, nota, frequencia) VALUES
(1, 1, 1, 8.5, 90),
(2, 1, 2, 7.0, 85),
(3, 2, 1, 9.0, 95),
(4, 3, 3, 6.5, 80),
(5, 4, 2, 8.0, 88),
(6, 2, 3, 7.5, 92);
