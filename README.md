# av_marcao_15_04_2026

# Sistema de Gestão Acadêmica

## Descrição do Projeto

Este projeto foi desenvolvido como parte da avaliação da disciplina de **Programação em Banco de Dados**.

O objetivo é modelar e estruturar um banco de dados para uma instituição educacional, permitindo o gerenciamento eficiente de:

* Alunos
* Professores
* Disciplinas
* Turmas
* Matrículas

O sistema busca resolver problemas como:

* Redundância de dados
* Inconsistência de informações
* Dificuldade na geração de relatórios

---

## Modelagem Conceitual

O sistema é composto pelas seguintes entidades:

* Aluno**
* Professor
* Disciplina
* Turma
* Matrícula (entidade associativa)

### Relacionamentos

* Um aluno pode se matricular em várias disciplinas (**N:N**)
* Uma disciplina possui vários alunos (**N:N**)
* Uma disciplina é ministrada por um professor (**1:N**)
* Uma disciplina pertence a uma turma (**1:N**)

---

## Modelo Relacional

```sql
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
```

---

## Normalização

O banco foi estruturado seguindo as boas práticas de normalização:

* **1FN:** Dados atômicos e sem repetições
* **2FN:** Dependência total da chave primária
* **3FN:** Eliminação de dependências transitivas

---

## Consulta SQL

Exemplo de consulta para listagem de alunos por disciplina:

```sql
SELECT 
    a.nome AS aluno,
    d.nome AS disciplina,
    p.nome AS professor,
    m.nota,
    m.frequencia
FROM MATRICULA m
JOIN ALUNO a ON m.id_aluno = a.id_aluno
JOIN DISCIPLINA d ON m.id_disciplina = d.id_disciplina
JOIN PROFESSOR p ON d.id_professor = p.id_professor
ORDER BY d.nome, a.nome;
```

---

## Otimização

* Uso de chaves primárias (PK)
* Uso de chaves estrangeiras (FK)
* Criação de índices:

```sql
CREATE INDEX idx_aluno ON MATRICULA(id_aluno);
CREATE INDEX idx_disciplina ON MATRICULA(id_disciplina);
CREATE INDEX idx_professor ON DISCIPLINA(id_professor);
```

---

## Autor

**Nome:** Meteus Antonio Borges da Silva
**Curso:** Análise e Desenvolvimento de Sistemas
**Período:** 3º

---

## 📎 Observação

Este projeto foi desenvolvido para fins acadêmicos.
