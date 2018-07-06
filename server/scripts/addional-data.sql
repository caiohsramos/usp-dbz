-- Insere umas trilhas

INSERT INTO

public.trilhas(
    id_trilha,
    codigo_trilha,
    nome,
    descricao,
    minimo_disciplinas,
    minimo_modulos)
VALUES
(0,'IA','Inteligencia Artificial','Trilha de Inteligencia artificial',0,0),
(1,'SIST','Sistemas de Software','Trilha de Sistemas de Software',2,1),
(2,'TEO','Teoria da Computacao','Trilha de teoria da computacao',4,2),
(3,'DATA','Ciencia de Dados','Trilha de Ciencia de Dados',4,1);

INSERT INTO

public.modulos(
    id_modulo,
    codigo_modulo,
    minimo_disciplinas,
    id_trilha)
VALUES
(0,'Des. Soft.',4,1),
(1,'BD',2,1),
(2,'Par e Dis',3,1),
(3,'Intro IA',2,0),
(4,'Sistemas',2,0),
(5,'Teoria IA',1,0),
(6,'Obrig.',1,0),
(7,'Algoritmos',2,2),
(8,'Alg. 2',0,2),
(9,'Otimizacao',2,2),
(10,'Otim. 2',0,2),
(11,'Mat discr',3,2),
(12,'Mat discr2',0,2),
(13,'Nucleo 1',5,3),
(14,'Nucleo 2',1,3),
(15,'Nucleo 3',1,3);

DELETE FROM public.disciplinas;

INSERT INTO

public.disciplinas(
    codigo_disciplina,
    creditos_aula,
    creditos_trabalho,
    carga_horaria,
    ativacao,
    nome)

VALUES
('MAC0101',2,0,30,'1999-01-01','Integracao na Universidade e na profissao'),
('MAC0105',4,0,60,'1999-01-01','Fundamentos da Matemática para a Computação'),
('MAC0110',4,0,60,'1999-01-01','Introducao a Computacao'),
('MAC0329',4,0,60,'1999-01-01','Algebra Booleana e Aplicações'),
('MAT2453',4,0,60,'1999-01-01','Calculo Diferencia e Integral I'),
('MAT0112',4,0,60,'1999-01-01','Vetores e Geometria'),
('MAC0239',4,0,60,'1999-01-01','Introducao a Logica e verificacao de programas');

CREATE VIEW obrigatorias AS
SELECT * FROM disciplinas
NATURAL JOIN grade_obrigatoria;

INSERT INTO
grade_obrigatoria(
    id_disciplina,
    ano_grade_obrigatoria)
VALUES
(10,'2017-01-01'),
(9,'2017-01-01');


CREATE FUNCTION list_obrigatorias() RETURNS SETOF disciplinas AS $$
SELECT disciplinas.* FROM disciplinas
NATURAL JOIN grade_obrigatoria ;
$$ LANGUAGE SQL;


CREATE FUNCTION list_disciplinas_modulos(id integer) RETURNS SETOF disciplinas AS $$
SELECT disciplinas.*  FROM
disciplinas NATURAL JOIN optativas_compoem_modulos
WHERE
id_modulo = id
$$ LANGUAGE SQL;
