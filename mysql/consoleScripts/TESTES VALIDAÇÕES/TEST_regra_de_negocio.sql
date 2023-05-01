--  Anexo 1  Regras de Negócio
--  Banco de dados chamado Empresa cujo objetivo é registrar os departamentos, funcionários e projetos desenvolvidos pela companhia
-- Banco de dados criado via docker-compose.yml presente nesse repositório 

-- Primeiro siga as instruções do readme.md disponível na raiz do projeto
-- Então com todas as tabelas, triggers e procedures criadas siga para o teste 


--  Teste 1 
-- 	  1.1 A empresa é organizada em Departamentos
-- 	  1.2 Cada departamento possui um nome único

                CREATE TABLE Departamento (
                ID_Departamento INT(4) AUTO_INCREMENT PRIMARY KEY,
                Nome_Departamento VARCHAR(40) UNIQUE NOT NULL
                )
   -- Resultado Teste 1
--      1.1 A empresa é organizada em Departamentos, então temos a tabela departamento a qual seu id é usado como chave para outras tabelas.
--      1.2 O Nome está com parâmetro UNIQUE para garantir que não seja gravado dados iguais 

#
#
#

-- Teste 2 
-- 	2.1 Um departamento possui diversos funcionários;
-- 	2.2 Cada funcionário possui Nome, CPF e RG únicos;
-- 	2.3 Cada funcionário também possui as seguintes informações:
-- 	  Sexo;
-- 	  Data de Nascimento;
-- 	  Informação se possui Habilitação;
-- 	  Valor do salário;
-- 	  Carga Horária Semanal;

--  Resultado teste 2 
      Tabela criada:
            CREATE TABLE Funcionario (
              ID_Funcionario INT(6) AUTO_INCREMENT PRIMARY KEY,
              Nome_Funcionario VARCHAR(42) UNIQUE NOT NULL,
              CPF_Funcionario VARCHAR(13) UNIQUE,
              RG_Funcionario VARCHAR(12) UNIQUE,
              Sexo_Funcionario VARCHAR(12),
              Data_Nascimento_Funcionario DATE,
              Possui_Habilitacao_Funcionario BOOLEAN,
              Salario_Funcionario VARCHAR(12),
              Carga_Horaria_Semanal_Funcionario VARCHAR(12),
              ID_Departamento INT(6),
              FOREIGN KEY (ID_Departamento) REFERENCES Departamento(ID_Departamento)
            );

    -- 2.1 Tabela criada com relacionamento (1:N) um para muitos. 1 Funcionario tem  sempre apenas 1 departamento, e a tabela departamento pode ter muitos funcionarios, por isso 
    --       a chave estrangeira: FOREIGN KEY (ID_Departamento) REFERENCES Departamento(ID_Departamento)
    -- 2.2  Cada funcionário possui Nome, CPF e RG únicos. O  parametro UNIQUE não permite gravar dados iguais no campo aplicado.
    -- 2.3 A Tabela possuiu os campos solicitados 

#
#
#

--  Teste 3 
--    3.1 Um departamento possui diversos projetos; 
--    3.2 Cada projeto possui um nome único em seu departamento;   
--    3.3 Cada projeto também possui as seguintes informações:
--      Quantidade de horas necessárias para conclusão do projeto;
--      Data do prazo estimado;
--      Quantidade de horas realizadas;
--      Data do último cálculo de horas;
--      Cada projeto possui um supervisor que é um funcionário; 
             CREATE TABLE Projeto (
              ID_Projeto INT(4) AUTO_INCREMENT PRIMARY KEY,
              Nome_Projeto VARCHAR(40) NOT NULL,
              Quantidade_Horas_Necessarias INT(4),
              Prazo_Estimado INT(4),
              Quantidade_Horas_Realizadas INT(4),
              Data_Ultimo_Calculo_Horas DATE,
              ID_Departamento INT(4),
              Carga_Horaria_Supervisao INT(4),
              ID_Funcionario_Supervisor INT(4),
              FOREIGN KEY (ID_Funcionario_Supervisor) REFERENCES Funcionario(ID_Funcionario),
              FOREIGN KEY (ID_Departamento) REFERENCES Departamento(ID_Departamento),
              FOREIGN KEY (ID_Funcionario_Supervisor) REFERENCES Funcionario(ID_Funcionario),
              CONSTRAINT UQ_Nome_Projeto_Departamento UNIQUE (ID_Departamento, Nome_Projeto)
            );

--  Resultado teste 3   
    -- 3.1 e 3.2 A chave estrangeira faz com que todos projeto tenha apenas 1 departamento, relacionamento (1:N) um para muitos FOREIGN KEY (ID_Departamento) REFERENCES Departamento(ID_Departamento),
    -- 3.3 Os campos solicitados foram criados na tabela 

#
#
#

--  Teste 4 
    --  4.1 Um funcionário pode supervisionar diversos projetos, tendo a carga horária que sera  gasta supervisionando o projeto;

          CREATE TABLE Supervisor (
            ID_Supervisor INT(4) AUTO_INCREMENT PRIMARY KEY,
            ID_Funcionario INT(4) NOT NULL,
            ID_Projeto INT(4) NOT NULL,
            Carga_Horaria_Supervisao INT(4) NOT NULL,
            FOREIGN KEY (ID_Funcionario) REFERENCES Funcionario(ID_Funcionario),
            FOREIGN KEY (ID_Projeto) REFERENCES Projeto(ID_Projeto), 
            CONSTRAINT UC_Supervisor_Funcionario_Projeto UNIQUE(ID_Funcionario, ID_Projeto),
            CONSTRAINT FK_Supervisor_Projeto FOREIGN KEY (ID_Projeto)
              REFERENCES Projeto(ID_Projeto),
              CONSTRAINT CHK_Carga_Horaria_Supervisao CHECK (Carga_Horaria_Supervisao > 0 OR Carga_Horaria_Supervisao IS NULL)
          );

--  Resultado teste 4 
      -- 4.1 Para checar se existe a carga horaria foi adicionado o CONSTRAINT CHK_Carga_Horaria_Supervisao CHECK (Carga_Horaria_Supervisao > 0 OR Carga_Horaria_Supervisao IS NULL)

#
#
#

--  Teste 5
--    5.1 Um funcionário pode trabalhar em diversos projetos, tendo a carga horária gasta em cada;
          CREATE TABLE Funcionario_Projeto (
            ID_Funcionario INT(4),
            ID_Projeto INT(4),
            Carga_Horaria INT(4),
            FOREIGN KEY (ID_Funcionario) REFERENCES Funcionario(ID_Funcionario),
            FOREIGN KEY (ID_Projeto) REFERENCES Projeto(ID_Projeto),
            CONSTRAINT PK_Funcionario_Projeto PRIMARY KEY (ID_Funcionario, ID_Projeto),
            CONSTRAINT CHK_Carga_Horaria CHECK (Carga_Horaria > 0)
          );

--  Resultado teste 5
      -- 5.1  CONSTRAINT Verifica se o projeto tem carga horaria  CONSTRAINT CHK_Carga_Horaria CHECK (Carga_Horaria > 0)

#
#
#

-- Teste 6
    -- 6.1 Os funcionários podem ser adicionados ou removidos de projetos a qualquer momento;

--  Resultado teste 6
    -- 6.1 Para isso por podemos criar atualizar e deletar da tabela de associação Funcionario_Projeto.
    -- o papel de dela é apenas ter  associação do funcionário e projeto não vai apagar o funcionário ou projeto em questão.

-- Teste 7   
   --  7.1 A soma das cargas horárias em que o funcionário supervisiona e trabalha em projetos não pode ultrapassar a carga horária do funcionário

#
#
#

--  Resultado teste 7
     -- 7.1  foi criado a trigger  001trg_carga_horaria_supervisao bloqueia caso ultrapassar a carga horária do funcionário e emite o alerta: A carga horária de supervisão do funcionário ultrapassa sua carga horária total;
    
#
#
#

--  Teste 8 
--    8.1 O cálculo da quantidade de horas realizadas no projeto é realizado baseado na quantidade de horas trabalhadas pelos funcionários e no número de semanas passadas desde o ultimo calculo;

--  Resultado teste 8
      -- 8.1  foi criar a Trigger 002trg_atualiza_horas_realizadas com essa solução 

#
#
#

--  Teste 9
    	-- 9.1 O prazo estimado do projeto deve ser calculado com base na quantidade de horas gastas pelos funcionários e no número de horas restantes;
 
--  Resultado teste 9
      -- 9.1  foi criada a Trigger 003trg_atualiza_prazo_estimado com essa solução 

#
#
#

--  Teste10 
      -- 10.1 Os usuários do sistema podem solicitar que as quantidades de horas realizadas e os prazos estimados dos projetos sejam atualizados.
 
 -- Resultado teste 10
      -- 10 .1   Ao atualizar  a quantidade de horas realizadas automaticamente o prazo vai ser atualizado pela trigger 003trg_atualiza_prazo_estimado