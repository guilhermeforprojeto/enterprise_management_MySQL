-- -	Cada departamento possui um nome único; 
-- -	Um departamento possui diversos funcionários;
-- Relacionamento (1:N)
-- -	



CREATE TABLE Departamento (
  ID_Departamento INT(4) AUTO_INCREMENT PRIMARY KEY,
  Nome_Departamento VARCHAR(40) UNIQUE NOT NULL
);

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



-- teste insert projetos em departamentos diferentes k 
INSERT INTO Projeto (Nome_Projeto, ID_Departamento) VALUES
('SISTEMA ERP', 1),
('Landing Page', 1),
('SISTEMA ERP', 2),
('API REST CRUD', 2);


SELECT Nome_Projeto, ID_Departamento, ID_Projeto FROM  Projeto;

-- teste erro mesmo nome no mesmo departamento 
INSERT INTO Projeto (Nome_Projeto, ID_Departamento) VALUES
('SISTEMA ERPERRO', 1),
('SISTEMA ERPERRO', 1);

-- fim do teste



CREATE TABLE Funcionario (
  ID_Funcionario INT(4) AUTO_INCREMENT PRIMARY KEY,
  Nome_Funcionario VARCHAR(40) UNIQUE NOT NULL,
  CPF_Funcionario VARCHAR(11) UNIQUE,
  RG_Funcionario VARCHAR(9) UNIQUE,
  Sexo_Funcionario VARCHAR(9),
  Data_Nascimento_Funcionario DATE,
  Possui_Habilitacao_Funcionario BOOLEAN,
  Salario_Funcionario VARCHAR(9),
  Carga_Horaria_Semanal_Funcionario VARCHAR(9),
  ID_Departamento INT(4),
  FOREIGN KEY (ID_Departamento) REFERENCES Departamento(ID_Departamento)
);





CREATE TABLE Trabalho (
ID_Trabalho INT(4) AUTO_INCREMENT PRIMARY KEY,
ID_Funcionario INT(4),
ID_Projeto INT(4),
FOREIGN KEY  (ID_Funcionario) REFERENCES Funcionario(ID_Funcionario),
FOREIGN KEY (ID_Projeto) REFERENCES  Projeto(ID_Projeto),
Quantidade_Horas_Trabalhadas INT(4),
Data_Inicio_Trabalho DATE,
Data_Fim_Trabalho DATE,
UNIQUE KEY (ID_Funcionario, ID_Projeto)
);;


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

