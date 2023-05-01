## Sistema de Gerenciamento Empresarial em MySQL.

<details><summary>Objetivo</summary>

Desafio 1

Desenvolver um sistema de gerenciamento empresarial em MySQL.
Requisitos.

- Todas as Regras de Negócio, presentes no Anexo 1, devem ser seguidas;
- O banco de dados utilizado deve ser MySQL;
- É necessário o envio da modelagem do esquema do banco de dados;
- É necessário o desenvolvimento de procedures que realizem o CRUD a partir de uma
  estrutura JSON;
- Todos os artefatos (código, arquivos de configuração, desenho da arquitetura...)
  desenvolvidos precisam estár disponíveis em um repositório de versionamento de
  código acessível pelo time de avaliadores;
- Desejáveis
- - Implementação em contêineres Docker (versão 19.03.6 ou superior);
- - Implementação automatizada via Docker-Compose;
- - Desenvolvimento de Testes;
- - Presença de Documentação;
- Critérios de Avaliação
- - Atendimento dos requisitos e Regras de Negócios;
- - Atendimentos dos desejáveis;
- - Clareza e coerência do código;
- - Desempenho da solução;
- - Criatividade;
- - Observações:
- - - Os requisitos são requisitos funcionais e não funcionais da solução, mas a criatividade
      pode ser exercitada e é encorajada. A inclusão de outras funcionalidades é
      encorajada.

</details>

---

<details><summary>Requisitos de Ambiente</summary>

- Windows10/11
- - WSL2 Ubuntu-20.04
- - - Git
- - - Docker-Compose version 1.25.0
- - - Docker Engine Version: 23.0.3
- - - - MySQL 8.0.32

</details>

---

<details><summary>Iniciar Banco de dados MySQL com no docker usando docker-compose</summary>

### No terminal WSL2 execute os seguintes comandos:

-      git clone https://github.com/guilhermeforprojeto/enterprise_management_MySQL.git

Navegue até a pasta enterprise_management_MySQL:

-      cd enterprise_management_MySQL

Adicione o usuário atual (definido pela variável $USER) ao grupo docker no sistema operacional Linux.

-        sudo usermod -aG docker $USER

Verifique o status do docker, execute:

-      service docker status

- - Se a saída do terminal exibir \* Docker is not running, execute o comando abaixo com privilégios de superusuário (sudo). O comando solicitará a senha do usuário, digite:

- - -        sudo service docker start
- - - - Então vera a seguinte saida do terminal: \* Starting Docker: docker

Navegue até a pasta /docker onde comtém o arquivo `docker-compose.yml` com as configurações da imagem do mysql execute:

-     cd docker
-     docker-compose up -d --build
- -     Saida esperada do terminal:
        Creating network "docker_default" with the default driver
        Creating base-mysql ... done

- <details><summary>Curiosidade docker-compose</summary>
  - O comando docker-compose up -d --build é
  usado para construir e iniciar contêineres de aplicativos com Docker Compose.

  `up`: inicia e constrói os contêineres especificados no arquivo docker-compose.yml.

  `-d`: executa os contêineres em segundo plano (detached mode), ou seja, sem bloquear o terminal.

  `--build`: constrói imagens Docker a partir dos arquivos Dockerfile especificados em cada serviço listado no arquivo docker-compose.yml.
  O arquivo docker-compose.yml é um arquivo YAML que descreve como os contêineres do aplicativo são configurados, incluindo imagens, portas de contêiner e redes.

  O comando docker-compose up é geralmente usado no diretório onde o arquivo docker-compose.yml está localizado. Ele lê o arquivo docker-compose.yml e cria ou inicia os contêineres especificados nele. A opção -d é usada para iniciar os contêineres em segundo plano. A opção --build é usada para garantir que as imagens dos contêineres sejam reconstruídas sempre que houver alterações nos arquivos Dockerfile.

  Em resumo, o comando docker-compose up -d --build inicia e constrói os contêineres do aplicativo especificado no arquivo docker-compose.yml em segundo plano e garante que as imagens dos contêineres sejam sempre reconstruídas a partir dos arquivos Dockerfile.

</details>

---

<details><summary>Modelagem, Diagrama e Instruções SQL para o banco de dados Empresa </summary>

- A modelagem foi realizada utilizando a plataforma <a href=" https://app.diagrams.net/"> https://app.diagrams.net/ </a>. Para visualizar o modelo, você pode utilizar a extensão Drawio Preview no VS Code ou importar para app.diagrams.net o arquivo "database_schema_modeling.drawio" presente na pasta `"/docs/"` deste repositório.

- Imagem do diagrama gerada pelo DBeaver:

- - <details><summary><a>Expandir imagem <a></summary>

    ![Diagrama_Empresa.png](/docs/Diagrama_Empresa.png)

    </details>

- <details>
    <summary>Instruções  SQL</summary>

  Criar Tabelas

  As instruções estão presentes no arquivo

          /mysql/consoleScripts/QUERY/criar_tabelas.sql

  Criar Triggers

  Estão presentes na pasta

          /mysql/consoleScripts/TRIGGERS

  Criar Procedures

  Estão presentes na pasta

          /mysql/consoleScripts/PROCEDURES

    </details>
  </details>

---

#### Teste CRUD no Sistema de Gerenciamento Empresarial em MySQL:

- - ##### Certifique-se de criar o Banco, tabelas, triggers e as procedures apresentadas no tópico `> Modelagem, Diagrama e Instruções SQL para o banco de dados Empresa/Instruções SQL` para o sucesso deste teste.

<details><summary>Procedures que realizem o CRUD a partir de uma estrutura JSON</summary>

- Conecte-se ao banco de dados Empresa e execute as instruções SQL

#### Criando o CRUD (Create, Read, Update e Delete)

Aqui está um exemplo simples, para fazer o crud em formato json em todas as tabelas, pdoe conferir as Procedures presentes em `/mysql/consoleScripts/PROCEDURES `.
Nesse exemplo vamos usar a tabela Departamento por não depender de outra tabela para ser criada. Este exemplo foi feito após as instruções passadas.

- Conectado ao Banco empresa, siga as instruções SQL para fazer o CRUD em formato JSON
- Confirme se a Procedure que vamos testár está criada executando o comando a baixo:
- - `SHOW CREATE PROCEDURE 001proc_departamento_crud;`

  - - Conjunto de resultados esperado:

          |Procedure        |sql_mode                                                                                                             |Create     Procedure                                                                                                                                                                                                                                               |character_set_client|collation_connection|Database Collation|
            +-----------------+---------------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------+--------------------+------------------+
          |001proc_departamento_crud|ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION|CREATE DEFINER=`root`@`%` PROCEDURE `departamento_crud`(¶  IN json_str TEXT,¶  IN op VARCHAR(10)¶)¶BEGIN¶  IF op = 'insert' THEN¶    INSERT INTO Departamento(Nome_Departamento) VALUES(JSON_EXTRACT(json_str, '$.Nome_Departamento'));¶  ELSEIF op = 'update' |utf8mb4             |utf8mb4_0900_ai_ci  |utf8mb4_0900_ai_ci|

- Confirme se a tabela está limpa:

  - `SELECT * from Departamento;`

  - - Conjunto de resultados esperado: (Tabela Limpa)

          |ID_Departamento|Nome_Departamento|
          +---------------+-----------------+

<details><summary>C</summary>

CREATE

`CALL 001proc_departamento_crud('{"Nome_Departamento": "DBA"}', 'insert');`

Verifique se foi criado executando:

`SELECT * from Departamento;`

Conjunto de resultados esperado:

      |ID_Departamento|Nome_Departamento|
      +---------------+-----------------+
      |              1|"DBA"            |

  </details>

<details><summary>R</summary>
      READ

    Conjunto de resultados esperado:

    `CALL 001proc_departamento_crud('{"ID_Departamento": 1}', 'read');`

    Conjunto de resultados esperado:

        |ID_Departamento|Nome_Departamento|
        +---------------+-----------------+
        |              1|"DBA"            |

  </details>

<details><summary>U</summary>
      READ

    `CALL 001proc_departamento_crud('{"ID_Departamento": 1, "Nome_Departamento": "BACKEND"}', 'update');`

    Conjunto de resultados esperado:

        |ID_Departamento|Nome_Departamento|
        +---------------+-----------------+
        |              1|"BACKEND"        |

    Verifique se foi se foi atualizado executando:

    `SELECT * from Departamento;`

    Conjunto de resultados esperado:

        |ID_Departamento|Nome_Departamento|
        +---------------+-----------------+
        |              1|"BACKEND"        |

  </details>

 <details>
 <summary>D</summary>
      DELETE

    `CALL 001proc_departamento_crud('{"ID_Departamento": 1}', 'delete');`

    Verifique se foi se foi deletado executando:

    `SELECT * from Departamento;`

    Conjunto de resultados esperado:

        |ID_Departamento|Nome_Departamento|
        +---------------+-----------------+

  </details>
