CREATE DATABASE escola;
USE escola;

CREATE TABLE ALUNO (
    id_aluno INT PRIMARY KEY,
    nome VARCHAR(100),
    matricula VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE PROFESSOR (
    id_professor INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE TURMA (
    id_turma INT PRIMARY KEY,
    periodo VARCHAR(20),
    semestre INT,
    ano INT
);

CREATE TABLE DISCIPLINA (
    id_disciplina INT PRIMARY KEY,
    nome VARCHAR(100),
    carga_horaria INT,
    id_professor INT,
    id_turma INT,
    FOREIGN KEY (id_professor) REFERENCES PROFESSOR(id_professor),
    FOREIGN KEY (id_turma) REFERENCES TURMA(id_turma)
);

CREATE TABLE MATRICULA (
    id_matricula INT PRIMARY KEY,
    id_aluno INT,
    id_disciplina INT,
    nota DECIMAL(5,2),
    frequencia DECIMAL(5,2),
    FOREIGN KEY (id_aluno) REFERENCES ALUNO(id_aluno),
    FOREIGN KEY (id_disciplina) REFERENCES DISCIPLINA(id_disciplina)
);

