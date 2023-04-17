## Desenvolver um sistema de gerenciamento empresarial em MySQL.

<details><summary>Objetivo</summary>

---

O objetivo dessa avaliação é medir seus conhecimentos de lógica de programação, das
tecnologias requeridas, cuidando no atendimento dos requisitos de uma tarefa e a capacidade
de aprendizado de novas tecnologias.

Desafio 1
Desenvolver um sistema de gerenciamento empresarial em MySQL.
Requisitos.

- Todas as Regras de Negócio, presentes no Anexo 1, devem ser seguidas;
- O banco de dados utilizado deve ser MySQL;
- É necessário o envio da modelagem do esquema do banco de dados;
- É necessário o desenvolvimento de procedures que realizem o CRUD a partir de uma
  estrutura JSON;
- Toda os artefatos (código, arquivos de configuração, desenho da arquitetura...)
  desenvolvidos precisam estar disponíveis em um repositório de versionamento de
  código acessível pelo time de avaliadores;
  Desejáveis
- Implementação em contêineres Docker (versão 19.03.6 ou superior);
- Implementação automatizada via Docker-Compose;
- Desenvolvimento de Testes;
- Presença de Documentação;
  Critérios de Avaliação
- Atendimento dos requisitos e Regras de Negócios;
- Atendimentos dos desejáveis;
- Clareza e coerência do código;
- Desempenho da solução;
- Criatividade;
  Observações
- Os requisitos são requisitos funcionais e não funcionais da solução, mas a criatividade
  pode ser exercitada e é encorajada. A inclusão de outras funcionalidades é
  encorajada.

</details>

---

<details><summary>Requisitos de Ambiente</summary>

- Windows11
- WSL2 Ubuntu-20.04
- - libmysqlclient-dev
- Docker Engine Version: 23.0.3
- Docker-Compose version 1.25.0
- MySQL 8.0.32
- Python 3.8.10
- - mysqlclient-2.1.1
- - mysql_connector_python-8.0.32
- - djangorestframework-3.14
- - Django 4.0.6

---

</details>

<details><summary>Modelagem do esquema do banco de dados</summary>

- A modelagem foi realizada utilizando a plataforma <a href=" https://app.diagrams.net/"> https://app.diagrams.net/ </a>. Para visualizar o modelo, você pode utilizar a extensão Drawio Preview no VS Code ou importar o arquivo "database_schema_modeling.drawio" presente na pasta "/docs" deste repositório.

- Imagem do diagrama gerada pelo DBeaver:

- - <details><summary><a>Expandir imagem <a></summary>

    ![Diagrama_Empresa.png](/docs/Diagrama_Empresa.png)

    </details>

- - <details>
           <summary>Instruções  SQL</summary>
        <details> 
          <summary>Criar Tabelas</summary>
            ```
            CREATE TABLE Departamento (
              ID_Departamento INT(4) PRIMARY KEY,
              Nome_Departamento VARCHAR(40)
            );

            CREATE TABLE Funcionario (
              ID_Funcionario INT(4) PRIMARY KEY,
              Nome_Funcionario VARCHAR(40),
              CPF_Funcionario VARCHAR(11),
              RG_Funcionario VARCHAR(9),
              Sexo_Funcionario VARCHAR(9),
              Data_Nascimento_Funcionario DATE,
              Possui_Habilitacao_Funcionario BOOLEAN,
              Salario_Funcionario VARCHAR(9),
              Carga_Horaria_Semanal_Funcionario VARCHAR(9),
              ID_Departamento INT(4),
              FOREIGN KEY (ID_Departamento) REFERENCES Departamento(ID_Departamento)
            );



            CREATE TABLE Projeto (
              ID_Projeto INT(4) PRIMARY KEY,
              Nome_Projeto VARCHAR(40),
              Quantidade_Horas_Necessarias INT(4),
              Prazo_Estimado INT(4),
              Quantidade_Horas_Realizadas INT(4),
              Data_Ultimo_Calculo_Horas DATE,
              ID_Departamento INT(4),
              ID_Funcionario_Supervisor INT(4),
              FOREIGN KEY (ID_Departamento) REFERENCES Departamento(ID_Departamento),
              FOREIGN KEY (ID_Funcionario_Supervisor) REFERENCES Funcionario(ID_Funcionario)
            );

            CREATE TABLE Trabalho (
            ID_Trabalho INT(4) PRIMARY KEY,
            ID_Funcionario INT(4),
            ID_Projeto INT(4),
            FOREIGN KEY  (ID_Funcionario) REFERENCES Funcionario(ID_Funcionario),
            FOREIGN KEY (ID_Projeto) REFERENCES  Projeto(ID_Projeto),
            Quantidade_Horas_Trabalhadas INT(4),
            Data_Inicio_Trabalho DATE,
            Data_Fim_Trabalho DATE
            );

            CREATE TABLE Supervisao(
            ID_Supervisao INT(4) PRIMARY KEY,
            ID_Funcionario_Supervisor  INT(4),
            ID_Projeto  INT(4),
            FOREIGN KEY (ID_Funcionario_Supervisor) REFERENCES Funcionario(ID_Funcionario),
            FOREIGN KEY (ID_Projeto) REFERENCES  Projeto(ID_Projeto),
            Carga_Horaria_Semana_Supervisao  INT(4)
            );
            ```

      </details>
            </detais>
        <details>
        <summary>Criar Procedures</summary>
       
       ```
        CREATE PROCEDURE departamento_crud(
          IN json_str TEXT,
          IN op VARCHAR(10)
        )
        BEGIN
          IF op = 'insert' THEN
            INSERT INTO Departamento(Nome_Departamento) VALUES(JSON_EXTRACT(json_str, '$.Nome_Departamento'));
          ELSEIF op = 'update' THEN
            UPDATE Departamento SET Nome_Departamento = JSON_EXTRACT(json_str, '$.Nome_Departamento') WHERE ID_Departamento = JSON_EXTRACT(json_str, '$.ID_Departamento');
          ELSEIF op = 'delete' THEN
            DELETE FROM Departamento WHERE ID_Departamento = JSON_EXTRACT(json_str, '$.ID_Departamento');
          ELSEIF op = 'read' THEN
            SELECT * FROM Departamento WHERE ID_Departamento = JSON_EXTRACT(json_str, '$.ID_Departamento');
          END IF;
        END;

        SHOW CREATE PROCEDURE departamento_crud;


        CREATE PROCEDURE funcionario_crud (
          IN json_str TEXT,
          IN op VARCHAR(10)
        )
        BEGIN
          IF op = 'insert' THEN
            INSERT INTO Funcionario (
              ID_Funcionario,
              Nome_Funcionario,
              CPF_Funcionario,
              RG_Funcionario,
              Sexo_Funcionario,
              Data_Nascimento_Funcionario,
              Possui_Habilitacao_Funcionario,
              Salario_Funcionario,
              Carga_Horaria_Semanal_Funcionario,
              ID_Departamento
            )
            VALUES (
              JSON_EXTRACT(json_str, '$.ID_Funcionario'),
              JSON_EXTRACT(json_str, '$.Nome_Funcionario'),
              JSON_EXTRACT(json_str, '$.CPF_Funcionario'),
              JSON_EXTRACT(json_str, '$.RG_Funcionario'),
              JSON_EXTRACT(json_str, '$.Sexo_Funcionario'),
              JSON_EXTRACT(json_str, '$.Data_Nascimento_Funcionario'),
              JSON_EXTRACT(json_str, '$.Possui_Habilitacao_Funcionario'),
              JSON_EXTRACT(json_str, '$.Salario_Funcionario'),
              JSON_EXTRACT(json_str, '$.Carga_Horaria_Semanal_Funcionario'),
              JSON_EXTRACT(json_str, '$.ID_Departamento')
            );
          ELSEIF op = 'update' THEN
            UPDATE Funcionario
            SET
              Nome_Funcionario = JSON_EXTRACT(json_str, '$.Nome_Funcionario'),
              CPF_Funcionario = JSON_EXTRACT(json_str, '$.CPF_Funcionario'),
              RG_Funcionario = JSON_EXTRACT(json_str, '$.RG_Funcionario'),
              Sexo_Funcionario = JSON_EXTRACT(json_str, '$.Sexo_Funcionario'),
              Data_Nascimento_Funcionario = JSON_EXTRACT(json_str, '$.Data_Nascimento_Funcionario'),
              Possui_Habilitacao_Funcionario = JSON_EXTRACT(json_str, '$.Possui_Habilitacao_Funcionario'),
              Salario_Funcionario = JSON_EXTRACT(json_str, '$.Salario_Funcionario'),
              Carga_Horaria_Semanal_Funcionario = JSON_EXTRACT(json_str, '$.Carga_Horaria_Semanal_Funcionario'),
              ID_Departamento = JSON_EXTRACT(json_str, '$.ID_Departamento')
            WHERE ID_Funcionario = JSON_EXTRACT(json_str, '$.ID_Funcionario');
          ELSEIF op = 'delete' THEN
            DELETE FROM Funcionario WHERE ID_Funcionario = JSON_EXTRACT(json_str, '$.ID_Funcionario');
          ELSEIF op = 'select' THEN
            SELECT * FROM Funcionario WHERE ID_Funcionario = JSON_EXTRACT(json_str, '$.ID_Funcionario');
          END IF;
        END;

        SHOW CREATE PROCEDURE funcionario_crud




        CREATE PROCEDURE projeto_crud(
          IN json_str TEXT,
          IN op VARCHAR(10)
        )
        BEGIN
          IF op = 'insert' THEN
            INSERT INTO Projeto(Nome_Projeto, Data_Inicio, Data_Fim, Orcamento, ID_Departamento)
            VALUES(JSON_EXTRACT(json_str, '$.Nome_Projeto'), JSON_EXTRACT(json_str, '$.Data_Inicio'),
                  JSON_EXTRACT(json_str, '$.Data_Fim'), JSON_EXTRACT(json_str, '$.Orcamento'),
                  JSON_EXTRACT(json_str, '$.ID_Departamento'));
          ELSEIF op = 'update' THEN
            UPDATE Projeto SET Nome_Projeto = JSON_EXTRACT(json_str, '$.Nome_Projeto'),
                  Data_Inicio = JSON_EXTRACT(json_str, '$.Data_Inicio'),
                  Data_Fim = JSON_EXTRACT(json_str, '$.Data_Fim'),
                  Orcamento = JSON_EXTRACT(json_str, '$.Orcamento'),
                  ID_Departamento = JSON_EXTRACT(json_str, '$.ID_Departamento')
            WHERE ID_Projeto = JSON_EXTRACT(json_str, '$.ID_Projeto');
          ELSEIF op = 'delete' THEN
            DELETE FROM Projeto WHERE ID_Projeto = JSON_EXTRACT(json_str, '$.ID_Projeto');
          ELSEIF op = 'read' THEN
            SELECT * FROM Projeto WHERE ID_Projeto = JSON_EXTRACT(json_str, '$.ID_Projeto');
          END IF;
        END;

        SHOW CREATE PROCEDURE projeto_crud



        CREATE PROCEDURE trabalho_crud(
          IN json_str TEXT,
          IN op VARCHAR(10)
        )
        BEGIN
          IF op = 'insert' THEN
            INSERT INTO Trabalho(Titulo_Trabalho, Descricao_Trabalho, Data_Inicio_Trabalho, Data_Fim_Trabalho, Status_Trabalho, ID_Funcionario, ID_Projeto)
            VALUES(JSON_EXTRACT(json_str, '$.Titulo_Trabalho'), JSON_EXTRACT(json_str, '$.Descricao_Trabalho'), JSON_EXTRACT(json_str, '$.Data_Inicio_Trabalho'),
                  JSON_EXTRACT(json_str, '$.Data_Fim_Trabalho'), JSON_EXTRACT(json_str, '$.Status_Trabalho'), JSON_EXTRACT(json_str, '$.ID_Funcionario'),
                  JSON_EXTRACT(json_str, '$.ID_Projeto'));
          ELSEIF op = 'update' THEN
            UPDATE Trabalho SET Titulo_Trabalho = JSON_EXTRACT(json_str, '$.Titulo_Trabalho'), Descricao_Trabalho = JSON_EXTRACT(json_str, '$.Descricao_Trabalho'),
                  Data_Inicio_Trabalho = JSON_EXTRACT(json_str, '$.Data_Inicio_Trabalho'), Data_Fim_Trabalho = JSON_EXTRACT(json_str, '$.Data_Fim_Trabalho'),
                  Status_Trabalho = JSON_EXTRACT(json_str, '$.Status_Trabalho'), ID_Funcionario = JSON_EXTRACT(json_str, '$.ID_Funcionario'),
                  ID_Projeto = JSON_EXTRACT(json_str, '$.ID_Projeto')
            WHERE ID_Trabalho = JSON_EXTRACT(json_str, '$.ID_Trabalho');
          ELSEIF op = 'delete' THEN
            DELETE FROM Trabalho WHERE ID_Trabalho = JSON_EXTRACT(json_str, '$.ID_Trabalho');
          ELSEIF op = 'read' THEN
            SELECT * FROM Trabalho WHERE ID_Trabalho = JSON_EXTRACT(json_str, '$.ID_Trabalho');
          END IF;
        END;


        SHOW CREATE PROCEDURE trabalho_crud;




        CREATE TABLE Supervisao (
          ID_Supervisao INT(4) PRIMARY KEY,
          Data_Inicio_Supervisao DATE,
          Data_Fim_Supervisao DATE,
          ID_Projeto INT(4),
          ID_Funcionario INT(4),
          FOREIGN KEY (ID_Projeto) REFERENCES Projeto(ID_Projeto),
          FOREIGN KEY (ID_Funcionario) REFERENCES Funcionario(ID_Funcionario)
        );

        CREATE PROCEDURE supervisao_crud(
          IN json_str TEXT,
          IN op VARCHAR(10)
        )
        BEGIN
          IF op = 'insert' THEN
            INSERT INTO Supervisao(Data_Inicio_Supervisao, Data_Fim_Supervisao, ID_Projeto, ID_Funcionario)
            VALUES(JSON_EXTRACT(json_str, '$.Data_Inicio_Supervisao'), JSON_EXTRACT(json_str, '$.Data_Fim_Supervisao'),
                  JSON_EXTRACT(json_str, '$.ID_Projeto'), JSON_EXTRACT(json_str, '$.ID_Funcionario'));
          ELSEIF op = 'update' THEN
            UPDATE Supervisao SET Data_Inicio_Supervisao = JSON_EXTRACT(json_str, '$.Data_Inicio_Supervisao'),
            Data_Fim_Supervisao = JSON_EXTRACT(json_str, '$.Data_Fim_Supervisao'),
            ID_Projeto = JSON_EXTRACT(json_str, '$.ID_Projeto'),
            ID_Funcionario = JSON_EXTRACT(json_str, '$.ID_Funcionario')
            WHERE ID_Supervisao = JSON_EXTRACT(json_str, '$.ID_Supervisao');
          ELSEIF op = 'delete' THEN
            DELETE FROM Supervisao WHERE ID_Supervisao = JSON_EXTRACT(json_str, '$.ID_Supervisao');
          ELSEIF op = 'read' THEN
            SELECT * FROM Supervisao WHERE ID_Supervisao = JSON_EXTRACT(json_str, '$.ID_Supervisao');
          END IF;
        END;

        SHOW CREATE PROCEDURE supervisao_crud;



        ```

        </detais>

  </details>

<details><summary>Iniciar sistema de gerenciamento empresarial</summary>

## Com ambiente preparado

### No terminal:

Para não precisar usar o sudo nos comandos docker, execute:
`sudo usermod -aG docker $USER`

Verifique o status do docker, execute:

`service docker status`
Caso a saida do terminal seja `* Docker is not running` execute?:

` service docker start`

Dentro deste respositorio, na pasta /docker onde comtém o arquivo `docker-compose.yml` com as configurações da imagem do mysql execute:

`docker-compose up -d --build`

- Se tudo ocorreu bem você vera está mensagem:

- - `Starting some-mysql ... done`

---

</details>

<details><summary>Procedures que realizem o CRUD a partir de uma estrutura JSON</summary>

- Conecte-se ao banco de dados Empresa e execute as instruções SQL
- habilitar o suporte a JSON no MySQL. Isso pode ser feito executando o seguinte comando:
- - `SET @@global.validate_json_unicode = 0;`

Criando o CRUD (Create, Read, Update e Delete)

<details><summary>C</summary>
  </details>

  <details><summary>R</summary>
  </details>

  <details><summary>U</summary>
  </details>

  <details><summary>D</summary>
  </details>

</details>
