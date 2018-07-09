# projeto-mac0350
## Integrantes do grupo
* Caio Henrique Silva Ramos - NUSP 9292991
* Igor Fratel Santana - NUSP 9793565
* Guilherme Feulo do Espirito Santo - NUSP 6431749

##Informações para a correção
* Os RPC's impmentados fora inseridos na pasta initdb para que sejam criados junto com o banco.
* na pasta server/scripts, existem um novos scripts SQL: additional-data, que povoa o banco de dados com disciplinas, e suas inserções e grade\_optativa e grade\_obrigatoria. O banco foi povoado com disciplinas cursadas e em curso para o usuario renatocf@ime.usp.br (senha: 12345).

* Os CRUDS para disciplinas estão na URL: /disciplinas
* Para cada aluno só há um unico plano, pois não era possível gerar mais de um plano no estado que o banco de dados esta implmentado.

This repository is a monorepo and requires [docker][1] and
[docker-compose][2] to run the services.

In order to setup the back-end services, open a shell and run:
```bash
cd server
docker-compose up
```

In order to setup the front-end services, open another shell and run:
```bash
cd client
docker-compose up
```

[1]: https://store.docker.com/search?type=edition&offering=community
[2]: https://docs.docker.com/compose/install/
