
-- RPCS
-- LISTA DE OBRIGATORIAS
CREATE OR REPLACE FUNCTION list_obrigatorias() RETURNS SETOF disciplinas AS $$
SELECT disciplinas.* FROM disciplinas
NATURAL JOIN grade_obrigatoria ;
$$ LANGUAGE SQL;

--LISTA DE DISCIPLINAS PRA UM MODULO
CREATE OR REPLACE FUNCTION list_disciplinas_modulos(id integer) RETURNS SETOF disciplinas AS $$
SELECT disciplinas.*  FROM
disciplinas NATURAL JOIN optativas_compoem_modulos
WHERE
id_modulo = id
$$ LANGUAGE SQL;

--CREDITOS OBRIGATORIOS TOTAL
CREATE OR REPLACE FUNCTION creditos_obrigatorios_total(ano date)
 RETURNS bigint AS $$
 SELECT SUM(creditos_aula) FROM
 disciplinas NATURAL JOIN grade_obrigatoria
 WHERE ano_grade_obrigatoria = ano $$ LANGUAGE SQL;

--CREDITOS OBRIGATORIOS CURSADOS
CREATE OR REPLACE FUNCTION creditos_obrigatorios_cursados(ano date, id bigint )
 RETURNS bigint AS $$
SELECT SUM(CASE WHEN nota >=5 THEN creditos_aula ELSE 0 END) FROM
    alunos_cursam_disciplinas
    JOIN professores_oferecem_disciplinas ON professores_oferecem_disciplinas.id_oferecimento = alunos_cursam_disciplinas.id_oferecimento
    JOIN grade_obrigatoria ON grade_obrigatoria.id_disciplina = professores_oferecem_disciplinas.id_disciplina
    JOIN disciplinas ON disciplinas.id_disciplina = grade_obrigatoria.id_disciplina
WHERE
    alunos_cursam_disciplinas.id_pessoa = id AND
    grade_obrigatoria.ano_grade_obrigatoria = ano; $$LANGUAGE SQL;
-- CREDITOS OBRIGATORIOS CURSANDO
CREATE OR REPLACE FUNCTION creditos_obrigatorios_cursando(ano date, id bigint )
 RETURNS bigint AS $$
SELECT SUM(CASE WHEN nota IS NULL THEN creditos_aula ELSE 0 END) FROM
    alunos_cursam_disciplinas
    JOIN professores_oferecem_disciplinas ON professores_oferecem_disciplinas.id_oferecimento = alunos_cursam_disciplinas.id_oferecimento
    JOIN grade_obrigatoria ON grade_obrigatoria.id_disciplina = professores_oferecem_disciplinas.id_disciplina
    JOIN disciplinas ON disciplinas.id_disciplina = grade_obrigatoria.id_disciplina
WHERE
    alunos_cursam_disciplinas.id_pessoa = id AND
    grade_obrigatoria.ano_grade_obrigatoria = ano; $$LANGUAGE SQL;
--CREDITOS ELETIVOS CURSADOS
CREATE OR REPLACE FUNCTION creditos_eletivos_cursados(ano date, id bigint )
 RETURNS bigint AS $$
SELECT SUM(CASE WHEN nota >=5 THEN creditos_aula ELSE 0 END) FROM
    alunos_cursam_disciplinas
   JOIN professores_oferecem_disciplinas ON professores_oferecem_disciplinas.id_oferecimento = alunos_cursam_disciplinas.id_oferecimento
    JOIN grade_optativa ON grade_optativa.id_disciplina = professores_oferecem_disciplinas.id_disciplina
    JOIN disciplinas ON disciplinas.id_disciplina = grade_optativa.id_disciplina
WHERE
    alunos_cursam_disciplinas.id_pessoa = id AND
    grade_optativa.ano_grade_optativa = ano AND
    grade_optativa.eletiva IS TRUE; $$LANGUAGE SQL;

--CREDITOS ELETIVOS CURSANDO
CREATE OR REPLACE FUNCTION creditos_eletivos_cursando(ano date, id bigint )
 RETURNS bigint AS $$
SELECT SUM(CASE WHEN nota IS NULL  THEN creditos_aula ELSE 0 END) FROM
    alunos_cursam_disciplinas
    JOIN professores_oferecem_disciplinas ON professores_oferecem_disciplinas.id_oferecimento = alunos_cursam_disciplinas.id_oferecimento
    JOIN grade_optativa ON grade_optativa.id_disciplina = professores_oferecem_disciplinas.id_disciplina
    JOIN disciplinas ON disciplinas.id_disciplina = grade_optativa.id_disciplina
WHERE
    alunos_cursam_disciplinas.id_pessoa = id AND
    grade_optativa.ano_grade_optativa = ano AND
    grade_optativa.eletiva IS TRUE; $$LANGUAGE SQL;

--CREDITOS LIVRES CURSADOS
CREATE OR REPLACE FUNCTION creditos_livres_cursados(ano date, id bigint )
 RETURNS bigint AS $$
SELECT SUM(CASE WHEN nota >=5 THEN creditos_aula ELSE 0 END) FROM
    alunos_cursam_disciplinas
    JOIN professores_oferecem_disciplinas ON professores_oferecem_disciplinas.id_oferecimento = alunos_cursam_disciplinas.id_oferecimento
    JOIN grade_optativa ON grade_optativa.id_disciplina = professores_oferecem_disciplinas.id_disciplina
    JOIN disciplinas ON disciplinas.id_disciplina = grade_optativa.id_disciplina
WHERE
    alunos_cursam_disciplinas.id_pessoa = id AND
    grade_optativa.ano_grade_optativa = ano AND
    grade_optativa.eletiva = FALSE; $$LANGUAGE SQL;
--CREDITOS LIVRES CURSADOS
CREATE OR REPLACE FUNCTION creditos_livres_cursando(ano date, id bigint )
 RETURNS bigint AS $$
SELECT SUM(CASE WHEN nota IS NULL THEN creditos_aula ELSE 0 END) FROM
    alunos_cursam_disciplinas
    JOIN professores_oferecem_disciplinas ON professores_oferecem_disciplinas.id_oferecimento = alunos_cursam_disciplinas.id_oferecimento
    JOIN grade_optativa ON grade_optativa.id_disciplina = professores_oferecem_disciplinas.id_disciplina
    JOIN disciplinas ON disciplinas.id_disciplina = grade_optativa.id_disciplina
WHERE
    alunos_cursam_disciplinas.id_pessoa = id AND
    grade_optativa.ano_grade_optativa = ano AND
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
