## TESTE DESENVOLVEDOR BACK

### Desenvolver um sistema de gerenciamento empresarial em MySQL.

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
- Docker Engine Version: 23.0.3
- Docker-Compose version 1.25.0
- MySQL 8.0.32

---

</details>

---

<details><summary>Modelagem do esquema do banco de dados</summary>

- A modelagem foi realizada utilizando a plataforma <a href=" https://app.diagrams.net/"> https://app.diagrams.net/ </a>. Para visualizar o modelo, você pode utilizar a extensão Drawio Preview no VS Code ou importar o arquivo "database_schema_modeling.drawio" presente na pasta "/docs" deste repositório.

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
