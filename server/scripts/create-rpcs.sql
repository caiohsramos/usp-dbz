
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
