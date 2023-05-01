## Desenvolvimento de um sistema de gerenciamento empresarial com API Rest, em Python e Django

<details><summary>Objetivo</summary>

- Todas as Regras de Negócio, presentes no Anexo 1, devem ser seguidas e desenvolvidas em Python e Django (versão 3.0 ou superior );
- Desenvolvimento da API Rest para realização do CRUD e demais atividades;
- Os programas e módulos necessários para a aplicação desenvolvida devem ser listados;
- Toda os artefatos (código, arquivos de configuração, desenho da arquitetura...) desenvolvidos precisam estar disponíveis em um repositório de versionamento de código acessível pelo time de avaliadores;

Desejáveis

- O banco de dados utilizado ser MySQL;
- Implementação em contêineres Docker (versão 19.03.6 ou superior);
- Implementação automatizada via Docker-Compose;
- Aplicação e banco de dados em ambientes separados;
- Desenvolvimento de Testes;
- Presença de Documentação;

Critérios de Avaliação

- Atendimento dos requisitos e Regras de Negócios;
- Atendimentos dos desejáveis;
- Clareza e coerência do código;
- Desempenho da solução;
- Criatividade;

Observações

- Os requisitos são requisitos funcionais e não funcionais da solução, mas a criatividade pode ser exercitada e é encorajada. A inclusão de outras funcionalidades é encorajada.
- Google, StackOverflow são seus amigos. Contudo, essa é uma atividade individual. Qualquer evidência de plágio ou cópia de artefatos online será motivo de exclusão do processo seletivo.

</details>

---

<details><summary>Requisitos de Ambiente</summary>

- Windows10/11
- - WSL2 Ubuntu-20.04
- - - Git
- - - Docker-Compose version 1.25.0
- - - Docker Engine Version: 23.0.3
- - - - MySQL 8.0.32
- - - Python 3.8.10
- - - mysqlclient-2.1.1
- - - mysql_connector_python-8.0.32
- - - shortuuid
- - - djangorestframework-3.14
- - - Django 4.0.6

    </details>

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

- <details><summary> Iniciar servidor Django</summary>

- navegue até a pasta `enterprise_management_MySQL/django/GerenciamentoEmpresarial` onde esta o arquivo `manage.py` e execute o seguinte comando:

      python3.8 manage.py runserver

- Isso vai iniciar o servidor em `http://127.0.0.1:8000/`, onde podemos fazer o CRUD
</details>
