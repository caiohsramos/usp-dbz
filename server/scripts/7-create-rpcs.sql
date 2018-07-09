
-- RPCS
-- LISTA DE OBRIGATORIAS
CREATE OR REPLACE FUNCTION list_obrigatorias(ano integer) RETURNS SETOF disciplinas AS $$
SELECT disciplinas.* FROM disciplinas
NATURAL JOIN grade_obrigatoria 
WHERE EXTRACT (year FROM grade_obrigatoria.ano_grade_obrigatoria) = ano
$$ LANGUAGE SQL;

-- LISTA DE OBRIGATORIAS logado
CREATE OR REPLACE FUNCTION list_obrigatorias_log(id bigint) RETURNS TABLE (id_disciplina bigint, codigo_disciplina character(7), creditos_aula integer, nome varchar(280), ano_semestre numeric(5,1)) AS $$
 WITH temp(id_disciplina,codigo_disciplina, creditos_aula, nome) AS (
    SELECT dis.id_disciplina, dis.codigo_disciplina, dis.creditos_aula, dis.nome FROM 
        disciplinas AS  dis,
        grade_obrigatoria grade,
        alunos
    WHERE
        dis.id_disciplina = grade.id_disciplina AND
        grade.ano_grade_obrigatoria = alunos.turma_ingresso AND
        alunos.id_pessoa = id)
SELECT DISTINCT ON (temp.id_disciplina) temp.id_disciplina,temp.codigo_disciplina, temp.creditos_aula, temp.nome, plan.ano_semestre FROM
temp LEFT JOIN alunos_planejam_disciplinas AS plan ON temp.id_disciplina = plan.id_disciplina
ORDER BY temp.id_disciplina, plan.id_plano DESC
$$ LANGUAGE SQL;

--LISTA DE DISCIPLINAS PRA UM MODULO
CREATE OR REPLACE FUNCTION list_disciplinas_modulos(id integer, ano integer) RETURNS SETOF disciplinas AS $$
SELECT disciplinas.*  FROM
disciplinas NATURAL JOIN optativas_compoem_modulos
WHERE
id_modulo = id AND
EXTRACT (year FROM optativas_compoem_modulos.ano_grade_optativa) = ano
$$ LANGUAGE SQL;

 
--LISTA DE DISCIPLINAS PRA UM MODULO logado
CREATE OR REPLACE FUNCTION list_disciplinas_modulos_log(id bigint, u bigint ) RETURNS
TABLE (id_disciplina bigint,codigo_disciplina character(7), creditos_aula integer, nome varchar(280),ano_semestre numeric(5,1) ) AS $$
WITH temp (id_disciplina,codigo_disciplina, creditos_aula, nome) AS (
    SELECT dis.id_disciplina, dis.codigo_disciplina, dis.creditos_aula, dis.nome  FROM
        disciplinas AS dis,
        optativas_compoem_modulos AS opt,
        alunos
    WHERE
        opt.id_modulo = id AND
        dis.id_disciplina = opt.id_disciplina AND
        opt.ano_grade_optativa = alunos.turma_ingresso AND
        alunos.id_pessoa = u)
SELECT DISTINCT ON (temp.id_disciplina) temp.*, plan.ano_semestre FROM
temp LEFT JOIN alunos_planejam_disciplinas AS plan ON temp.id_disciplina = plan.id_disciplina
ORDER BY temp.id_disciplina, plan.id_plano DESC
$$ LANGUAGE SQL;
 
--CREDITOS OBRIGATORIOS TOTAL
CREATE OR REPLACE FUNCTION creditos_obrigatorios_total(id bigint)
 RETURNS bigint AS $$
 SELECT SUM(creditos_aula) FROM
 disciplinas NATURAL JOIN grade_obrigatoria,
 alunos 
 WHERE alunos.id_pessoa = id AND ano_grade_obrigatoria = alunos.turma_ingresso; $$ LANGUAGE SQL;

--CREDITOS OBRIGATORIOS CURSADOS
CREATE OR REPLACE FUNCTION creditos_obrigatorios_cursados(id bigint)
 RETURNS bigint AS $$
SELECT SUM(CASE WHEN nota >=5 THEN creditos_aula ELSE 0 END) FROM
    alunos_cursam_disciplinas
    JOIN professores_oferecem_disciplinas ON professores_oferecem_disciplinas.id_oferecimento = alunos_cursam_disciplinas.id_oferecimento
    JOIN grade_obrigatoria ON grade_obrigatoria.id_disciplina = professores_oferecem_disciplinas.id_disciplina
    JOIN disciplinas ON disciplinas.id_disciplina = grade_obrigatoria.id_disciplina
    JOIN alunos ON alunos.id_pessoa = id
WHERE
    alunos_cursam_disciplinas.id_pessoa = alunos.id_pessoa AND
    grade_obrigatoria.ano_grade_obrigatoria = alunos.turma_ingresso; $$LANGUAGE SQL;
-- CREDITOS OBRIGATORIOS CURSANDO
CREATE OR REPLACE FUNCTION creditos_obrigatorios_cursando(id bigint )
 RETURNS bigint AS $$
SELECT SUM(CASE WHEN nota IS NULL THEN creditos_aula ELSE 0 END) FROM
    alunos_cursam_disciplinas
    JOIN professores_oferecem_disciplinas ON professores_oferecem_disciplinas.id_oferecimento = alunos_cursam_disciplinas.id_oferecimento
    JOIN grade_obrigatoria ON grade_obrigatoria.id_disciplina = professores_oferecem_disciplinas.id_disciplina
    JOIN disciplinas ON disciplinas.id_disciplina = grade_obrigatoria.id_disciplina
    JOIN alunos ON alunos.id_pessoa = id
WHERE
    alunos_cursam_disciplinas.id_pessoa = alunos.id_pessoa AND
    grade_obrigatoria.ano_grade_obrigatoria = alunos.turma_ingresso; $$LANGUAGE SQL;
--CREDITOS ELETIVOS CURSADOS
CREATE OR REPLACE FUNCTION creditos_eletivos_cursados( id bigint )
 RETURNS bigint AS $$
SELECT SUM(CASE WHEN nota >=5 THEN creditos_aula ELSE 0 END) FROM
    alunos_cursam_disciplinas
   JOIN professores_oferecem_disciplinas ON professores_oferecem_disciplinas.id_oferecimento = alunos_cursam_disciplinas.id_oferecimento
    JOIN grade_optativa ON grade_optativa.id_disciplina = professores_oferecem_disciplinas.id_disciplina
    JOIN disciplinas ON disciplinas.id_disciplina = grade_optativa.id_disciplina
    JOIN alunos ON alunos.id_pessoa = id
WHERE
    alunos_cursam_disciplinas.id_pessoa = alunos.id_pessoa AND
    grade_optativa.ano_grade_optativa = alunos.turma_ingresso AND 
    grade_optativa.eletiva IS TRUE; $$LANGUAGE SQL;

--CREDITOS ELETIVOS CURSANDO
CREATE OR REPLACE FUNCTION creditos_eletivos_cursando(id bigint )
 RETURNS bigint AS $$
SELECT SUM(CASE WHEN nota IS NULL  THEN creditos_aula ELSE 0 END) FROM
    alunos_cursam_disciplinas
    JOIN professores_oferecem_disciplinas ON professores_oferecem_disciplinas.id_oferecimento = alunos_cursam_disciplinas.id_oferecimento
    JOIN grade_optativa ON grade_optativa.id_disciplina = professores_oferecem_disciplinas.id_disciplina
    JOIN disciplinas ON disciplinas.id_disciplina = grade_optativa.id_disciplina
    JOIN alunos ON alunos.id_pessoa = id
WHERE
    alunos_cursam_disciplinas.id_pessoa = alunos.id_pessoa AND
    grade_optativa.ano_grade_optativa = alunos.turma_ingresso AND 
    grade_optativa.eletiva IS TRUE; $$LANGUAGE SQL;

--CREDITOS LIVRES CURSADOS
CREATE OR REPLACE FUNCTION creditos_livres_cursados( id bigint )
 RETURNS bigint AS $$
SELECT SUM(CASE WHEN nota >=5 THEN creditos_aula ELSE 0 END) FROM
    alunos_cursam_disciplinas
    JOIN professores_oferecem_disciplinas ON professores_oferecem_disciplinas.id_oferecimento = alunos_cursam_disciplinas.id_oferecimento
    JOIN grade_optativa ON grade_optativa.id_disciplina = professores_oferecem_disciplinas.id_disciplina
    JOIN disciplinas ON disciplinas.id_disciplina = grade_optativa.id_disciplina
    JOIN alunos ON alunos.id_pessoa = id
WHERE
    alunos_cursam_disciplinas.id_pessoa = alunos.id_pessoa AND
    grade_optativa.ano_grade_optativa = alunos.turma_ingresso AND 
    grade_optativa.eletiva = FALSE; $$LANGUAGE SQL;
--CREDITOS LIVRES CURSANDO
CREATE OR REPLACE FUNCTION creditos_livres_cursando(id bigint )
 RETURNS bigint AS $$
SELECT SUM(CASE WHEN nota IS NULL THEN creditos_aula ELSE 0 END) FROM
    alunos_cursam_disciplinas
    JOIN professores_oferecem_disciplinas ON professores_oferecem_disciplinas.id_oferecimento = alunos_cursam_disciplinas.id_oferecimento
    JOIN grade_optativa ON grade_optativa.id_disciplina = professores_oferecem_disciplinas.id_disciplina
    JOIN disciplinas ON disciplinas.id_disciplina = grade_optativa.id_disciplina
    JOIN alunos ON alunos.id_pessoa = id
WHERE
    alunos_cursam_disciplinas.id_pessoa = alunos.id_pessoa AND
    grade_optativa.ano_grade_optativa = alunos.turma_ingresso AND 
    grade_optativa.eletiva = FALSE; $$LANGUAGE SQL;

-- NOME DO USUARIO
CREATE OR REPLACE FUNCTION nome_usuario(email varchar(256))
 RETURNS TABLE (nome varchar(256)) AS $$
 SELECT  pessoas.nome FROM
 auth.usuarios,
 pessoas_geram_usuarios,
 pessoas
 WHERE auth.usuarios.email_usuario = email AND
 auth.usuarios.id_usuario = pessoas_geram_usuarios.id_usuario AND 
 pessoas.id_pessoa = pessoas_geram_usuarios.id_pessoa
 $$ LANGUAGE SQL; 
-- ID DO USUARIO
CREATE OR REPLACE FUNCTION id_pessoa(email varchar(256))
 RETURNS TABLE (id bigint) AS $$
 SELECT  pessoas_geram_usuarios.id_pessoa FROM
 auth.usuarios,
 pessoas_geram_usuarios
 WHERE auth.usuarios.email_usuario = email AND
 auth.usuarios.id_usuario = pessoas_geram_usuarios.id_usuario  
 $$ LANGUAGE SQL;


-- ANO INGRESSO 
CREATE OR REPLACE FUNCTION ingresso(id bigint)
 RETURNS double precision  AS $$
 SELECT  EXTRACT (year FROM alunos.turma_ingresso)  FROM
 alunos
  WHERE alunos.id_pessoa = id;  
 $$ LANGUAGE SQL;



--DISCIPLINA CURSADA
CREATE OR REPLACE FUNCTION is_cursada(id_disc bigint, id_pess bigint)
 RETURNS BOOLEAN AS $$
SELECT CASE WHEN alunos_cursam_disciplinas.nota >=5 THEN TRUE ELSE FALSE END  FROM
                    alunos_cursam_disciplinas,
                    professores_oferecem_disciplinas,
                    alunos
            WHERE  professores_oferecem_disciplinas.id_disciplina = id_disc AND
                   professores_oferecem_disciplinas.id_oferecimento = alunos_cursam_disciplinas.id_oferecimento AND
                   alunos.id_pessoa = alunos_cursam_disciplinas.id_pessoa AND
                   alunos.nusp_aluno = alunos_cursam_disciplinas.nusp_aluno AND
                   alunos.id_pessoa = id_pess
 $$ LANGUAGE SQL;
--DISCIPLINA em curso 
CREATE OR REPLACE FUNCTION is_cursando(id_disc bigint, id_pess bigint)
 RETURNS BOOLEAN AS $$
SELECT CASE WHEN alunos_cursam_disciplinas.nota IS NULL THEN TRUE ELSE FALSE END  FROM
                    alunos_cursam_disciplinas,
                    professores_oferecem_disciplinas,
                    alunos
            WHERE  professores_oferecem_disciplinas.id_disciplina = id_disc AND
                   professores_oferecem_disciplinas.id_oferecimento = alunos_cursam_disciplinas.id_oferecimento AND
                   alunos.id_pessoa = alunos_cursam_disciplinas.id_pessoa AND
                   alunos.nusp_aluno = alunos_cursam_disciplinas.nusp_aluno AND
                   alunos.id_pessoa = id_pess
 $$ LANGUAGE SQL;
-- SALVA PLANO
CREATE OR REPLACE FUNCTION salva_plano(id_disciplina bigint , id_pessoa bigint, ano_semestre numeric(5,1))
  RETURNS VOID AS $$
        WITH temp(id_dis, id_pess, ano) AS (VALUES (id_disciplina,id_pessoa,ano_semestre))
        INSERT INTO alunos_planejam_disciplinas(
                        id_pessoa,
                        nusp_aluno,
                        id_disciplina,
                        ano_semestre)
        SELECT alunos.id_pessoa,alunos.nusp_aluno,temp.id_dis,temp.ano FROM
               alunos,
               temp
        WHERE alunos.id_pessoa = temp.id_pess;
 $$ LANGUAGE SQL;
