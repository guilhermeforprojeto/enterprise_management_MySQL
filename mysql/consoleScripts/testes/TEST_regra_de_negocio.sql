--  Anexo 1  Regras de Negócio
--  Banco de dados chamado Empresa que tem como objetivo registrar os departamentos, funcionários e projetos desenvolvidos pela companhia; OK
    -- Banco de dados criado via docker-compose.yml  presente nesse repositorio 

-- 	A empresa é organizada em Departamentos; OK
-- 	Cada departamento possui um nome único;;  OK
                CREATE TABLE Departamento (
                ID_Departamento INT(4) AUTO_INCREMENT PRIMARY KEY,
                Nome_Departamento VARCHAR(40) UNIQUE NOT NULL
                )
-- 	Um departamento possui diversos funcionários;
-- 	Cada funcionário possui Nome, CPF e RG únicos;
-- 	Cada funcionário também possui as seguintes informações:
-- 	Sexo;
-- 	Data de Nascimento;
-- 	Informação se possui Habilitação;
-- 	Valor do salário;
-- 	Carga Horária Semanal;



-- 	Um departamento possui diversos projetos; 
-- 	Relacionamento (1:N)  ; OK
	
-- 	Cada projeto possui um nome único em seu departamento; 
-- 	CONSTRAINT UQ_Nome_Projeto_Departamento UNIQUE (ID_Departamento, Nome_Projeto)

		
-- 	Cada projeto também possui as seguintes informações:
-- 	Quantidade de horas necessárias para conclusão do projeto;
-- 	Data do prazo estimado;
-- 	Quantidade de horas realizadas;
-- 	Data do ultimo calculo de horas; OK

-- 	Cada projeto possui um supervisor que é um funcionário; 
-- 	FOREIGN KEY (ID_Funcionario_Supervisor) REFERENCES Funcionario(ID_Funcionario),


-- 	Um funcionário pode supervisionar diversos projetos, tendo a carga horária que sera  gasta supervisionando o projeto;
-- 	CONSTRAINT UC_Supervisor_Funcionario_Projeto UNIQUE(ID_Funcionario, ID_Projeto),
-- 	CONSTRAINT FK_Supervisor_Projeto FOREIGN KEY (ID_Projeto)
-- 	REFERENCES Projeto(ID_Projeto),
-- 	CONSTRAINT CHK_Carga_Horaria_Supervisao CHECK (Carga_Horaria_Supervisao > 0 OR Carga_Horaria_Supervisao IS NULL));
-- Relacionamento (N:N) ; OK 





-- 	Um funcionário pode trabalhar em diversos projetos, tendo a carga horária que é gasta em cada;
-- 	Relacionamento (N:N) ; OK 
-- Criei a tabela de associação entre os projetos e funcionarios



-- 	Os funcionários podem ser adicionados ou removidos de projetos a qualquer momento; OK


-- A soma das cargas horárias em que o funcionário supervisiona e trabalha em   projetos não pode ultrapassar a carga horária do funcionário; OK
-- 	carga horária do  supervisor em trabalha em  projeto,  não pode ultrapassa a carga horária do funcionário;



-- 	O cálculo da quantidade de horas realizadas no projeto é realizado baseado na quantidade de horas trabalhadas pelos funcionários e no número de semanas passadas desde o ultimo calculo;

  TRIGGER_atualiza_horas_realizadas.sql

-- -	O prazo estimado do projeto deve ser calculado com base na quantidade de horas gastas pelos funcionários e no número de horas restantes;

-- -	Os usuários do sistema podem solicitar que as quantidades de horas realizadas e os prazos estimados dos projetos sejam atualizados.
