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
(0,'DESSOFT',4,1),
(1,'BD',2,1),
(2,'PARDIS',3,1),
(3,'INTRO',2,0);

