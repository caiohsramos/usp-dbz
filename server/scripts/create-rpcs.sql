
-- RPCS
CREATE OR REPLACE FUNCTION list_obrigatorias() RETURNS SETOF disciplinas AS $$
SELECT disciplinas.* FROM disciplinas
NATURAL JOIN grade_obrigatoria ;
$$ LANGUAGE SQL;


CREATE OR REPLACE FUNCTION list_disciplinas_modulos(id integer) RETURNS SETOF disciplinas AS $$
SELECT disciplinas.*  FROM
disciplinas NATURAL JOIN optativas_compoem_modulos
WHERE
id_modulo = id
$$ LANGUAGE SQL;


CREATE OR REPLACE FUNCTION creditos_obrigatorios_total(ano date)
 RETURNS bigint AS $$
 SELECT SUM(creditos_aula) FROM
 disciplinas NATURAL JOIN grade_obrigatoria
 WHERE ano_grade_obrigatoria = ano $$ LANGUAGE SQL;

CREATE OR REPLACE FUNCTION creditos_obrigatorios_cursados(ano date, id bigint )
 RETURNS bigint AS $$
SELECT SUM(CASE nota >=5 THEN creditos_aula ELSE 0 END) FROM
    alunos_cursam_disciplinas
    JOIN professores_oferecem_disciplinas ON professores_oferecem_disciplinas.id_oferecimento = alunos_cursam_disciplinas.id_oferecimento
    JOIN grade_obrigatoria ON grade_obrigatoria.id_disciplina = professores_oferecem_disciplinas.id_disciplina
    JOIN disciplinas ON disciplinas.id_disciplina = grade_obrigatoria.id_disciplina
WHERE
    alunos_cursam_disciplinas.id_pessoa = id AND
    grade_obrigatoria.ano_grade_obrigatoria = ano; $$LANGUAGE SQL;

CREATE OR REPLACE FUNCTION nome_usuario(email varchar(256))
 RETURNS TABLE (nome varchar(256)) AS $$
 SELECT  pessoas.nome FROM
 auth.usuarios,
 pessoas_geram_usuarios,
 pessoas
 WHERE auth.usuarios.email_usuario = 'jef@ime.usp.br' AND
 auth.usuarios.id_usuario = pessoas_geram_usuarios.id_usuario AND 
 pessoas.id_pessoa = pessoas_geram_usuarios.id_pessoa
 $$ LANGUAGE SQL; 
