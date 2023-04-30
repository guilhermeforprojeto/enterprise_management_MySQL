
-- 1º Criar tabela Departamento

CREATE TABLE Departamento (
  ID_Departamento INT(4) AUTO_INCREMENT PRIMARY KEY,
  Nome_Departamento VARCHAR(40) UNIQUE NOT NULL
);
-- Ver tabela 
  SELECT * FROM Departamento
  
#

  
-- 2º Criar tabela Funcionario


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
-- Ver tabela 
  SELECT * FROM  Funcionario
  
#

-- 3º Criar tabela  Projeto
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

-- Ver tabela 
  SELECT * FROM  Projeto
  
#

-- 4º Criar tabela Funcionario_Projeto
CREATE TABLE Funcionario_Projeto (
  ID_Funcionario INT(4),
  ID_Projeto INT(4),
  Carga_Horaria INT(4),
  FOREIGN KEY (ID_Funcionario) REFERENCES Funcionario(ID_Funcionario),
  FOREIGN KEY (ID_Projeto) REFERENCES Projeto(ID_Projeto),
  CONSTRAINT PK_Funcionario_Projeto PRIMARY KEY (ID_Funcionario, ID_Projeto),
  CONSTRAINT CHK_Carga_Horaria CHECK (Carga_Horaria > 0)
);

-- Ver tabela 
  SELECT * FROM Funcionario_Projeto
  
#

-- 5º Criar tabela Supervisor


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


-- Ver tabela 
  SELECT * FROM Supervisor
