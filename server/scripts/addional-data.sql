-- Insere umas trilhas

INSERT INTO

public.trilhas(
    codigo_trilha,
    nome,
    descricao,
    minimo_disciplinas,
    minimo_modulos)
VALUES
    ('IA','Inteligencia Artificial','Trilha de Inteligencia artificial',0,0),
    ('SIST','Sistemas de Software','Trilha de Sistemas de Software',2,1),
    ('TEO','Teoria da Computacao','Trilha de teoria da computacao',4,2),
    ('DATA','Ciencia de Dados','Trilha de Ciencia de Dados',4,1);
--INSERE MODULO

WITH temp (cod,mindis,tr_cod) AS
(VALUES
    ('Des. Soft.',4,'SIST'),
    ('BD',2,'SIST'),
    ('Par e Dis',3,'SIST'),
    ('Intro IA',2,'IA'),
    ('Sistemas',2,'IA'),
    ('Teoria IA',1,'IA'),
    ('Obrig.',1, 'IA'),
    ('Algoritmos',2,'TEO'),
    ('Alg. 2',0,'TEO'),
    ('Otimizacao',2,'TEO'),
    ('Otim. 2',0,'TEO'),
    ('Mat discr',3,'TEO'),
    ('Mat discr2',0,'TEO'),
    ('Nucleo 1',5,'DATA'),
    ('Nucleo 2',1,'DATA'),
    ('Nucleo 3',1,'DATA')
)
INSERT INTO
    public.modulos(
        codigo_modulo,
        minimo_disciplinas,
        id_trilha)
SELECT temp.cod,temp.mindis,trilhas.id_trilha 
    FROM trilhas JOIN temp
        ON temp.tr_cod = trilhas.codigo_trilha;
-- LIMPA DISCIPLINAS 
--DELETE FROM public.disciplinas;
--INSERE DISCIPLINAS
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
    ('MAC0239',4,0,60,'1999-01-01','Introducao a Logica e verificacao de programas'),
    ('MAC0218',4,2,90,'1999-01-01','Tecnicas de programacao II'),
    ('MAC0332',4,0,60,'1999-01-01','Engenharia de Software'),
    ('MAC0413',4,0,60,'1999-01-01','Topicos avancados em POO'),
    ('MAC0426',4,0,60,'1999-01-01','Sistema de Bancos de Dados'),
    ('MAC0472',4,0,60,'1999-01-01','Laboratorio de Metodos Ageis'),
    ('MAC0439',4,0,60,'1999-01-01','Laboratorio de Banco de dados'),
    ('MAC0459',4,0,60,'1999-01-01','Ciencia e Engenhari de dados'),
    ('MAC0463',4,0,60,'1999-01-01','Computacao Movel'),
    ('MAC0344',4,2,90,'1999-01-01','Arquitetura de Computadores'),
    ('MAC0425',4,0,60,'1999-01-01','Inteligencia Artificial'),
    ('MAC0444',4,0,60,'1999-01-01','Sistemas Baseados em Conhecimento'),
    ('MAC0460',4,0,60,'1999-01-01','Aprendizagem Computacional'),
    ('MAC0414',4,0,60,'1999-01-01','Automatos Computabilidade e Complexidade'),
    ('MAT0359',4,0,60,'1999-01-01','Logica'),
    ('MAC0317',4,0,60,'1999-01-01','Introducao ao processamento de Sinais digitais'),
    ('MAC0219',4,2,90,'1999-01-01','Programacao Paralela e Concorrente'),
    ('MAE0221',6,0,90,'1999-01-01','Probabilidade I'),
    ('MAE0312',4,0,60,'1999-01-01','Introducao aos Processos Estocasticos'),
    ('MAE0228',4,0,60,'1999-01-01','Nocoes de Prob e Proc Estocasticos'),
    ('MAC0315',4,0,60,'1999-01-01','Otimizacao Linear'),
    ('MAC0325',4,0,60,'1999-01-01','Otimizacao Combinatoria'),
    ('MAC0328',4,0,60,'1999-01-01','Algoritmos em Grafos'),
    ('MAC0320',4,0,60,'1999-01-01','Introducao a Teoria dos Grafos'),
    ('MAT0206',6,0,90,'1999-01-01','Analise Real');

-- INSERE OBRIGATORIAS
WITH temp (cod,ano) AS
(VALUES
    ('MAC0101',to_date('2017-01-01','YYYY-MM-DD')),
    ('MAC0105',to_date('2017-01-01','YYYY-MM-DD')),
    ('MAC0110',to_date('2017-01-01','YYYY-MM-DD')),
    ('MAC0329',to_date('2017-01-01','YYYY-MM-DD')),
    ('MAT2453',to_date('2017-01-01','YYYY-MM-DD')),
    ('MAT0112',to_date('2017-01-01','YYYY-MM-DD')),
    ('MAC0239',to_date('2017-01-01','YYYY-MM-DD'))
)
INSERT INTO
    public.grade_obrigatoria(
        id_disciplina,
        ano_grade_obrigatoria)
SELECT disciplinas.id_disciplina,temp.ano
    FROM disciplinas JOIN temp
        ON temp.cod = disciplinas.codigo_disciplina;

--INSERE OPTATIVA ELETIVAS
WITH temp (cod,ano, ele) AS
(VALUES
    ('MAC0218',to_date('2017-01-01','YYYY-MM-DD'),TRUE),
    ('MAC0332',to_date('2017-01-01','YYYY-MM-DD'),TRUE),
    ('MAC0413',to_date('2017-01-01','YYYY-MM-DD'),TRUE),
    ('MAC0426',to_date('2017-01-01','YYYY-MM-DD'),TRUE),
    ('MAC0472',to_date('2017-01-01','YYYY-MM-DD'),TRUE),
    ('MAC0439',to_date('2017-01-01','YYYY-MM-DD'),TRUE),
    ('MAC0459',to_date('2017-01-01','YYYY-MM-DD'),TRUE),
    ('MAC0463',to_date('2017-01-01','YYYY-MM-DD'),TRUE),
    ('MAC0344',to_date('2017-01-01','YYYY-MM-DD'),TRUE),
    ('MAC0425',to_date('2017-01-01','YYYY-MM-DD'),TRUE),
    ('MAC0444',to_date('2017-01-01','YYYY-MM-DD'),TRUE),
    ('MAC0460',to_date('2017-01-01','YYYY-MM-DD'),TRUE),
    ('MAC0414',to_date('2017-01-01','YYYY-MM-DD'),TRUE),
    ('MAT0359',to_date('2017-01-01','YYYY-MM-DD'),TRUE),
    ('MAC0317',to_date('2017-01-01','YYYY-MM-DD'),TRUE),
    ('MAC0219',to_date('2017-01-01','YYYY-MM-DD'),TRUE),
    ('MAE0221',to_date('2017-01-01','YYYY-MM-DD'),TRUE),
    ('MAE0312',to_date('2017-01-01','YYYY-MM-DD'),TRUE),
    ('MAE0228',to_date('2017-01-01','YYYY-MM-DD'),TRUE),
    ('MAC0315',to_date('2017-01-01','YYYY-MM-DD'),TRUE),
    ('MAC0325',to_date('2017-01-01','YYYY-MM-DD'),TRUE),
    ('MAC0328',to_date('2017-01-01','YYYY-MM-DD'),TRUE),
    ('MAC0320',to_date('2017-01-01','YYYY-MM-DD'),TRUE),
    ('MAT0206',to_date('2017-01-01','YYYY-MM-DD'),TRUE)
)
INSERT INTO
    public.grade_optativa(
        id_disciplina,
        ano_grade_optativa,
        eletiva)
SELECT disciplinas.id_disciplina,temp.ano,temp.ele
    FROM disciplinas JOIN temp
        ON temp.cod = disciplinas.codigo_disciplina;

-- INSERE AS DISCIPLINAS NOS MODULOS
WITH temp (codigo_disciplina,ano_grade_optativa, codigo_modulo) AS
(VALUES
    ('MAC0218',to_date('2017-01-01','YYYY-MM-DD'),'Des. Soft.'),
    ('MAC0332',to_date('2017-01-01','YYYY-MM-DD'),'Des. Soft.'),
    ('MAC0413',to_date('2017-01-01','YYYY-MM-DD'),'Des. Soft.'),
    ('MAC0426',to_date('2017-01-01','YYYY-MM-DD'),'BD'),
    ('MAC0472',to_date('2017-01-01','YYYY-MM-DD'),'Des. Soft.'),
    ('MAC0439',to_date('2017-01-01','YYYY-MM-DD'),'BD'),
    ('MAC0459',to_date('2017-01-01','YYYY-MM-DD'),'BD'),
    ('MAC0463',to_date('2017-01-01','YYYY-MM-DD'),'Par e Dis'),
    ('MAC0344',to_date('2017-01-01','YYYY-MM-DD'),'Par e Dis'),
    ('MAC0425',to_date('2017-01-01','YYYY-MM-DD'),'Obrig.'),
    ('MAC0444',to_date('2017-01-01','YYYY-MM-DD'),'Intro IA'),
    ('MAC0460',to_date('2017-01-01','YYYY-MM-DD'),'Intro IA'),
    ('MAC0459',to_date('2017-01-01','YYYY-MM-DD'),'Intro IA'),
    ('MAC0414',to_date('2017-01-01','YYYY-MM-DD'),'Teoria IA'),
    ('MAT0359',to_date('2017-01-01','YYYY-MM-DD'),'Teoria IA'),
    ('MAC0317',to_date('2017-01-01','YYYY-MM-DD'),'Nucleo 1'),
    ('MAC0219',to_date('2017-01-01','YYYY-MM-DD'),'Nucleo 1'),
    ('MAE0221',to_date('2017-01-01','YYYY-MM-DD'),'Nucleo 1'),
    ('MAC0426',to_date('2017-01-01','YYYY-MM-DD'),'Nucleo 1'),
    ('MAC0460',to_date('2017-01-01','YYYY-MM-DD'),'Nucleo 1'),
    ('MAE0312',to_date('2017-01-01','YYYY-MM-DD'),'Nucleo 2'),
    ('MAE0228',to_date('2017-01-01','YYYY-MM-DD'),'Nucleo 2'),
    ('MAC0315',to_date('2017-01-01','YYYY-MM-DD'),'Nucleo 3'),
    ('MAC0325',to_date('2017-01-01','YYYY-MM-DD'),'Nucleo 3'),
    ('MAC0328',to_date('2017-01-01','YYYY-MM-DD'),'Algoritmos'),
    ('MAC0414',to_date('2017-01-01','YYYY-MM-DD'),'Algoritmos'),
    ('MAC0315',to_date('2017-01-01','YYYY-MM-DD'),'Otimizacao'),
    ('MAC0325',to_date('2017-01-01','YYYY-MM-DD'),'Otimizacao'),
    ('MAC0325',to_date('2017-01-01','YYYY-MM-DD'),'Otim. 2'),
    ('MAC0320',to_date('2017-01-01','YYYY-MM-DD'),'Mat discr'),
    ('MAT0206',to_date('2017-01-01','YYYY-MM-DD'),'Mat discr'),
    ('MAC0414',to_date('2017-01-01','YYYY-MM-DD'),'Mat discr2')
)
INSERT INTO
    public.optativas_compoem_modulos(
        id_disciplina,
        ano_grade_optativa,
        id_modulo)
SELECT grade_optativa.id_disciplina,temp.ano_grade_optativa,modulos.id_modulo
    FROM temp NATURAL JOIN disciplinas 
    JOIN grade_optativa ON disciplinas.id_disciplina = grade_optativa.id_disciplina
    NATURAL JOIN modulos;
--INSERE OFERECIMENTO DE DISCIPLINAS 
WITH temp (codigo_disciplina,ano_semestre,nome) AS
(VALUES
    ('MAC0101',2017.1,'Jef'),
    ('MAC0105',2017.1,'Jef'),
    ('MAC0110',2017.1,'Jef'),
    ('MAC0329',2017.2,'Jef'),
    ('MAT2453',2017.2,'Jef'),
    ('MAT0112',2017.2,'Jef'),
    ('MAC0239',2017.2,'Jef')
)
INSERT INTO
    public.professores_oferecem_disciplinas(
        id_pessoa,
        nusp_professor,
        id_disciplina,
        ano_semestre)
SELECT pessoas.id_pessoa,professores.nusp_professor,disciplinas.id_disciplina,temp.ano_semestre
    FROM temp JOIN disciplinas ON temp.codigo_disciplina = disciplinas.codigo_disciplina 
        JOIN pessoas ON pessoas.nome = temp.nome
        JOIN professores ON pessoas.id_pessoa = professores.id_pessoa;
-- INSERE CURSANDO 

WITH temp (codigo_disciplina,ano_semestre,nome,nota) AS
(VALUES
    ('MAC0101',2017.1,'Renato',6),
    ('MAC0105',2017.1,'Renato',6),
    ('MAC0110',2017.1,'Renato',3),
    ('MAC0329',2017.2,'Renato',6),
    ('MAT2453',2017.2,'Renato',3),
    ('MAT0112',2017.2,'Renato',null),
    ('MAC0239',2017.2,'Renato',null)
)
INSERT INTO
    public.alunos_cursam_disciplinas(
        id_pessoa,
        nusp_aluno,
        id_oferecimento,
        nota)
SELECT alunos.id_pessoa,alunos.nusp_aluno,professores_oferecem_disciplinas.id_oferecimento,temp.nota
    FROM temp JOIN disciplinas ON temp.codigo_disciplina = disciplinas.codigo_disciplina 
        JOIN pessoas ON pessoas.nome = temp.nome
        JOIN alunos ON pessoas.id_pessoa = alunos.id_pessoa
        JOIN professores_oferecem_disciplinas ON professores_oferecem_disciplinas.id_disciplina = disciplinas.id_disciplina AND professores_oferecem_disciplinas.ano_semestre = temp.ano_semestre; 
